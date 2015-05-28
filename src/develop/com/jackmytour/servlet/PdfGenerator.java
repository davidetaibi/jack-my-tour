package develop.com.jackmytour.servlet;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.lang.reflect.Type;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;












import org.apache.pdfbox.exceptions.COSVisitorException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.xobject.PDJpeg;
import org.apache.pdfbox.pdmodel.graphics.xobject.PDPixelMap;
import org.apache.pdfbox.pdmodel.graphics.xobject.PDXObjectImage;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import develop.com.jackmytour.core.Item;
import develop.com.jackmytour.core.Utils;

/**
 * Servlet implementation class PdfGenerator
 */
@WebServlet("/pdfGenerator")
public class PdfGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String location;
    private String from;
    private String to;
    HttpSession session;
    List<Day> trip = new ArrayList<Day>();
	
    public static class Day { 
    	String date;
    	List<Itemday> items = new ArrayList<Itemday>();
    	
    }
    
    public static class Itemday { 
    	String name;
    	String address;
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PdfGenerator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("servus da pdfGenerator");
		HttpSession session = request.getSession();
		location = session.getAttribute("location").toString();
		//from = (String) session.getAttribute("from");
        //to = (String)   session.getAttribute("to");
        
       
		this.trip = (List<Day>) session.getAttribute("trip");
		
		//while(this.trip == null) {}
		
		System.out.println(trip.size());
        
        for (Day w : trip) {
        	System.out.println(w);
        	List<Itemday> items = w.items;
        	Iterator<Itemday> iter = items.iterator(); 
            while(iter.hasNext()) { 
            	Itemday item = (Itemday) iter.next();
            	System.out.println(item.name);
            	System.out.println(item.address);
            }
        } 
     
      
        
		try {

	        ByteArrayOutputStream output = new ByteArrayOutputStream();
	        output = createPDF(location);
	        System.out.println("do u even create something??");

	        response.addHeader("Content-Type", "application/force-download"); 
	        response.addHeader("Content-Disposition", "attachment; filename=\"yourFile.pdf\"");
	        response.getOutputStream().write(output.toByteArray());

	    } catch (Exception ex) {            
	        ex.printStackTrace();
	    }  

	}
	
	public ByteArrayOutputStream createPDF(String location) throws IOException, COSVisitorException {
		ByteArrayOutputStream output = new ByteArrayOutputStream(); 
		
		// Create a document and add a page to it
		PDDocument document = new PDDocument();
		PDPage page = new PDPage();
		document.addPage( page );

		// Create a new font object selecting one of the PDF base fonts
		PDFont font = PDType1Font.HELVETICA_BOLD;

		// Start a new content stream which will "hold" the to be created content
		PDPageContentStream contentStream = new PDPageContentStream(document, page);
		

		try {
			BufferedImage awtImage = ImageIO.read(new File(this.getServletContext().getRealPath("/images/jackmytour.png")));
	        PDXObjectImage ximage = new PDPixelMap(document, awtImage);
	        float scale = 0.2f; // alter this value to set the image size
	        contentStream.drawXObject(ximage, 230, 700, ximage.getWidth()*scale, ximage.getHeight()*scale);
	    } catch (FileNotFoundException fnfex) {
	            System.out.println("No image for you");
	      }

	

		// Define a text content stream using the selected font, moving the cursor and drawing the text "Hello World"
		contentStream.beginText();
		contentStream.setFont( font, 15 );
		contentStream.moveTextPositionByAmount(50, 650);
		contentStream.drawString("Hello Giuseppe, welcome to " + location + " by the Jack my tour team!");
		contentStream.endText();
		
        //List<Date> dates= Utils.getDaysBetweenDatesPlusOne(from, to);
       	//int x = 50;
       	
		int y = 600;
		
		for (Day day : trip) {
			y = y - 50;
        	//System.out.println(w);
			contentStream.beginText();
			contentStream.setFont(font,15);
			contentStream.moveTextPositionByAmount(50, y);
			contentStream.drawString(day.date);
			contentStream.endText();
        	List<Itemday> items = day.items;
        	Iterator<Itemday> iter = items.iterator(); 
            int number = 1;
        	while(iter.hasNext()) {
            	y = y - 30;
            	contentStream.beginText();
    			contentStream.setFont(font,10);
    			contentStream.moveTextPositionByAmount(50, y);
    			contentStream.drawString(new Integer(number).toString());
    			contentStream.endText();
            	number++;
    			
            	Itemday item = (Itemday) iter.next();
            	y = y - 30;
            	contentStream.beginText();
    			contentStream.setFont(font,15);
    			contentStream.moveTextPositionByAmount(50, y);
    			contentStream.drawString(item.name);
    			contentStream.endText();
    			y = y - 35;
    			
            	contentStream.beginText();
    			contentStream.setFont(font,15);
    			contentStream.moveTextPositionByAmount(50, y);
    			contentStream.drawString("Address: "+item.address);
    			contentStream.endText();
            	
            }
        } 
		
		
		 try {
	            BufferedImage awtImage = ImageIO.read(new File(this.getServletContext().getRealPath("/images/jackmytour.png")));
	            PDXObjectImage ximage = new PDPixelMap(document, awtImage);
	            float scale = 0.1f; // alter this value to set the image size
	            contentStream.drawXObject(ximage, 0, 0, ximage.getWidth()*scale, ximage.getHeight()*scale);
	        } catch (FileNotFoundException fnfex) {
	            System.out.println("No image for you");
	        }


		// Make sure that the content stream is closed:
		contentStream.close();
		
		document.save(output);
		document.close();

	    return output;
	}

}