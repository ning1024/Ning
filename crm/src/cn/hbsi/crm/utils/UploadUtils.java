package cn.hbsi.crm.utils;

import java.util.UUID;

public class UploadUtils {

	public static String getUuidFileName(String originFileName) {
		
		//获取源文件的后缀
		int index = originFileName.lastIndexOf("."); //最后一个点所在的索引
		
		String extension = originFileName.substring(index);
		
		//生成随机的字符串，作为文件名
		String fileName = UUID.randomUUID().toString().replace("-", "")+extension;
		
		//合成随机的文件名称
		return fileName;
	}
	
	public static void main(String[] args) {
		
		String name = getUuidFileName("image1.jpg");
		System.out.println(name);
	}
}
