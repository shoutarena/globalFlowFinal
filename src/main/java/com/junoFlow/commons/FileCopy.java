package com.junoFlow.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class FileCopy {

	private String filepath;
	
	/**파일 복사 관련 메서드*/
	public static String copyInto(MultipartFile upload, String path) {
		String filepathtemp = path + File.separator + upload.getOriginalFilename();
		try {
			byte bytes[]=upload.getBytes();
			File outFile = new File(path + File.separator + upload.getOriginalFilename());
			if(outFile.exists()) {
				filepathtemp = path + Calendar.getInstance().get(Calendar.YEAR) +
						(Calendar.getInstance().get(Calendar.MONTH)+1) +
						Calendar.getInstance().get(Calendar.DATE) +
						Calendar.getInstance().get(Calendar.YEAR) +
						Calendar.getInstance().get(Calendar.HOUR) + 
						Calendar.getInstance().get(Calendar.MINUTE) + 
						Calendar.getInstance().get(Calendar.SECOND) +
						upload.getOriginalFilename();
				File temp = new File(filepathtemp);
				outFile.renameTo(temp);
			}
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filepathtemp;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
