package uniandes.tsdl.itdroid.helper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Paths;

import org.json.simple.JSONObject;

public class RIPHelper {

	public static String runRIPI18N(String language, String outputFolder, boolean translated, String extraPath, String apkLocation) throws IOException, InterruptedException{
		String decodedPath = Helper.getInstance().getCurrentDirectory();
		// Creates folder for decoded app
		File tempFolder = new File(Paths.get(decodedPath,outputFolder,(translated?"trnsResults":"noTrnsResults"),language).toAbsolutePath().toString());
		if(tempFolder.exists()) {
			tempFolder.delete();
		}
		tempFolder.mkdirs();
		String ripconfig = buildRIPConfig(apkLocation, outputFolder, tempFolder.getAbsolutePath(), "");
		ProcessBuilder pB = new ProcessBuilder(new String[]{"java","-jar",Paths.get(decodedPath,extraPath,"RIPi18n.jar").toAbsolutePath().toString(), ripconfig});
		Process ps = pB.start();
		System.out.println("Going through your app");

		BufferedReader reader = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		String line;
		while ((line = reader.readLine())!=null) {
			System.out.println(line);
		}

		ps.waitFor();
		Thread.sleep(5000);
		System.out.println("The app has been inspected");
		return tempFolder.getCanonicalPath();
	}

	public static String runRIPRR(String language, String outputFolder, boolean translated, String extraPath, String apkLocation, String resultPath) throws IOException, InterruptedException{
		String decodedPath = Helper.getInstance().getCurrentDirectory();
		// Creates folder for decoded app
		//		System.out.println(decodedPath);
		File tempFolder = new File(decodedPath+File.separator+outputFolder+File.separator+(translated?"trnsResults":"noTrnsResults")+File.separator+language);
		if(tempFolder.exists()) {
			tempFolder.delete();
		}
		tempFolder.mkdirs();
		String ripconfig = buildRIPConfig(apkLocation, outputFolder, tempFolder.getAbsolutePath(), resultPath+File.separator+"result.json");
		ProcessBuilder pB = new ProcessBuilder(
				new String[]{
						"java",
						"-jar",
						Paths.get(decodedPath,extraPath,"RIPRR.jar").toAbsolutePath().toString(),
						ripconfig
				}
				);
		Process ps = pB.start();
		System.out.println("Going through your app");
		BufferedReader reader = new BufferedReader(new InputStreamReader(ps.getInputStream()));
		String line;
		while ((line = reader.readLine())!=null) {
						System.out.println(line);
		}
		ps.waitFor();
		System.out.println("The app has been inspected");
		return tempFolder.getCanonicalPath();
	}

	private static String buildRIPConfig(String newApkPath, String ripConfig, String outputPath, String rrScript) {

		JSONObject ripconfig = new JSONObject();
		ripconfig.put("apkPath", newApkPath);
		ripconfig.put("outputFolder", outputPath);
		ripconfig.put("isHybrid", false);
		ripconfig.put("executionMode", "dfs");
		if(!rrScript.equals("")) {
			ripconfig.put("scriptPath", rrScript);
		}

		//Write JSON file
		try (FileWriter file = new FileWriter(ripConfig+File.separator+"rip_config.json")) {

			file.write(ripconfig.toJSONString());
			file.flush();
			
			return ripConfig+File.separator+"rip_config.json";

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
