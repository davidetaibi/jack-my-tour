package develop.com.jackmytour.servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

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

/**
 * Servlet implementation class PdfGenerator
 */
@WebServlet("/pdfGenerator")
public class PdfGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("servus");
		HttpSession session = request.getSession(true);
		String location = session.getAttribute("location").toString();
		
		try {

	        ByteArrayOutputStream output = new ByteArrayOutputStream();
	        output = createPDF(location);

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
	            float scale = 0.5f; // alter this value to set the image size
	            contentStream.drawXObject(ximage, 100, 400, ximage.getWidth()*scale, ximage.getHeight()*scale);
	        } catch (FileNotFoundException fnfex) {
	            System.out.println("No image for you");
	        }

		// Define a text content stream using the selected font, moving the cursor and drawing the text "Hello World"
		contentStream.beginText();
		contentStream.setFont( font, 15 );
		contentStream.moveTextPositionByAmount( 100, 700 );
		contentStream.drawString("Hello Giuseppe, welcome to " + location + " by the Jack my tour team!");
		contentStream.endText();
		


		// Make sure that the content stream is closed:
		contentStream.close();
		
		document.save(output);
		document.close();

	    return output;
	}

}
