package helper;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileOperations {

	// To save file
	public void saveFile(InputStream io,String path)
	{
		try {
			byte[] data=new byte[io.available()];
			io.read(data);
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(data);
			fos.flush();
			fos.close();
			io.close();
		} catch (IOException e) {
			System.out.println("error in file saving");
			e.printStackTrace();
		}
	}
	
	// To cut String for 10 words
	public String get10Words(String Desc)
	{
		String[] obj=Desc.split(" ");
		if(obj.length>=25)
		{
			String res="";
			for(int i=0;i<=25;i++)
			{
				res=res+obj[i]+" ";
				i++;
			}
			return res+" ...";
		}
		else
		{
			return Desc+" ...";
		}		
	}
	
	
}
