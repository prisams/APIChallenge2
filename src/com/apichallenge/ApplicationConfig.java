package com.apichallenge;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Class to get the values from the settings.properies file
 * @author Priyanka Samanta
 * Date : 9th May 2017
 *
 */
public class ApplicationConfig {

	private static final Logger LOG = Logger.getLogger(ApplicationConfig.class.getName());
	Properties props = new Properties();
	public ApplicationConfig(){
		try {
			String home = System.getProperty("user.home");
			File f = new File(home+"/settings.properties");
			InputStream input = new FileInputStream(f);
			props.load(input);
		}
		catch (IOException e) {
			LOG.log(Level.SEVERE, "Exception thrown", e);
		}
	}
	/**
	 * Method to return the path of the Python executible
	 * @return
	 */
	public String getPythonexepath() {
		return props.getProperty("pythonexe") + " ";
	}

	/**
	 * Method to return the script that calls the CMU dictionary
	 * @return script path
	 */
	public String getPythonScriptNameForRhymingWord(){
		return getPythonexepath()+
				props.getProperty("pythonscriptrhyme") + " ";
	}

	/**
	 * Method to return the Script that runs the dataModel to determine  the threshold
	 * of reckless speed
	 * @return script path
	 */
	public String getPythonScriptNameForSpeed(){
		return getPythonexepath() +
				props.getProperty("pythonscriptthreshold") + " " +
				getFileNameToCreateSpeedModel();
	}

	/**
	 * Method to return the path of the data file
	 * @return Data file path
	 */
	public String getFileNameToCreateSpeedModel(){
                System.out.println("Adding a print statement");
		return props.getProperty("datafile");
	}
}
