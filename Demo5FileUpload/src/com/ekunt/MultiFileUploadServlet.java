package com.ekunt;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * 上传存储多个文件
 * @author E-Kunt
 *
 */
@MultipartConfig(location="G:/java/J2EE/workspace/Demo5FileUpload/file")
@WebServlet("/MultiFileUploadServlet")
public class MultiFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MultiFileUploadServlet() {
        super();
    }
    
    //截取文件名
    public String getFileNameFromPart(Part part) {
    	String header = part.getHeader("Content-Disposition");
    	String fileName = header.substring(header.indexOf("filename=\"")+10,header.lastIndexOf("\""));
    	return fileName;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().write("error,it must be POST method!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ArrayList<Part> partList = (ArrayList<Part>) request.getParts();
		for(Part part : partList) {
			if(part.getName().startsWith("file")){
				String fileName = getFileNameFromPart(part);
				part.write(fileName);
			}
		}
		response.getWriter().write("upload succeed!");
	}

}
