package com.apichallenge;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiParam;



@Api(value="restAPIs", description="Project to design REST APIs")
@Path("restAPIs")
public class API {

	private static final Logger LOG = Logger.getLogger(API.class.getName());
	static final String ERR_MSG_GET_RANDOM_WORD = "Invalid input.Please enter atleast 2 words seperated by spaces";
	static final String ERR_MSG_FOR_RHYMING_WORD = "No rhyming words found.";
	static final String ERR_MSG_FOR_RECKLESS_SPEED = "Invalid input. Please enter a valid speed.";
	static final String OP_MSG_FOR_SPEED_CHECK_DEFAULT = "Your driving speed is safe.";
	static final String OP_MSG_FOR_RECKLESS_SPEED = "Reckless driving speed.";

	/**
	 * Method to test the connection
	 * @return String 
	 */
	@GET
	@Path("/testConnection")
	@Produces(MediaType.TEXT_PLAIN)
	@ApiOperation(value = "This method tests the connection!")
	public String testConnection(){
		return "Pinged!";
	}
		
	/**
	 * Method to return a random word from the set of words given as input separated by space
	 * @param inputString
	 * @return random word from the set of words
	 */
	@GET
	@Path("/getRandomWord/{words}")
	@Produces(MediaType.TEXT_PLAIN)
	@ApiOperation(value = "This method returns a random word from a set of words")
	public String getRandomWord( @ApiParam(value="words",required=true)@QueryParam("words") String inputString){
		LOG.info("Incoming input:" + inputString);
		Random random = new Random();
		ArrayList<String> setOfWords = new ArrayList<String>();
		setOfWords.addAll(Arrays.asList(inputString.trim()
				.replaceAll("\\s+"," ").split(" ")));
		if(setOfWords.size()<2){
			LOG.info(ERR_MSG_GET_RANDOM_WORD);
			return ERR_MSG_GET_RANDOM_WORD;
		}
		return setOfWords.get(random.nextInt(setOfWords.size()));
	}

	/**
	 * Method to return the rhyming words from CMU dictionary based on the word given as input
	 * @param word
	 * @return rhyming words
	 */
	@GET
	@Path("/getRhymingWords/{word}")
	@Produces(MediaType.TEXT_PLAIN)
	@ApiOperation(value = "This method returns the rhyming words from CMU dict")
	public String getRhymingWords( @ApiParam(value="word", required=true)@PathParam ("word") String word){
		ApplicationConfig config = new ApplicationConfig();
		LOG.info("Incoming input:" + word);
		Process process = null;
		String output = "[]";
		try {
			process = Runtime.getRuntime().exec(config.getPythonScriptNameForRhymingWord() + word);
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(process.getInputStream()));
			
			String temp="";
			while((temp=reader.readLine())!=null){
				output=temp;
			}
			reader.close();
		}
		catch(Exception e){
			LOG.log(Level.ALL, "Exception thrown", e);
		}
		return output.equals("[]")? ERR_MSG_FOR_RHYMING_WORD : output;
	}

	/**
	 * Method to determine if the speed given as input belongs to reckless driving or not
	 * based on the computation from the data model
	 * @param speed
	 * @return message if the speed is reckless or not
	 */
	@GET
	@Path("/isReckless/{speed}")
	@Produces(MediaType.TEXT_PLAIN)
	@ApiOperation(value = "This method determines if you are driving at a reckless speed")
	public String isReckless(@ApiParam(value="speed", required=true)@PathParam ("speed") String speed){
		ApplicationConfig config = new ApplicationConfig();
		LOG.info("Incoming speed:" + speed);
		String output = OP_MSG_FOR_SPEED_CHECK_DEFAULT;
		double inputSpeed=0.0;
		Process process = null;
		double threshold = 0;
		try {
			inputSpeed = Double.parseDouble(speed);
			process = Runtime.getRuntime().exec(config.getPythonScriptNameForSpeed());
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(process.getInputStream()));
			threshold = Double.parseDouble(reader.readLine());
			reader.close();
		}
		catch(NumberFormatException e){
			LOG.log(Level.SEVERE, ERR_MSG_FOR_RECKLESS_SPEED);
			output = ERR_MSG_FOR_RECKLESS_SPEED;
		}
		catch(Exception e){
			LOG.log(Level.ALL, "Exception thrown", e);
		}
		if(inputSpeed>threshold){
			output = OP_MSG_FOR_RECKLESS_SPEED;
		}
		return output;
	}
}