package md.victordov.lab.servlets.errors;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ErrorHandler
 */

@WebServlet("/ErrorHandler")
public class ErrorHandler extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		String code = null, message = null, type = null, uri = null;
		Object codeObj, messageObj, typeObj;
		Throwable throwable;

		// Retrieve the three possible error attributes, some may be null
		codeObj = req.getAttribute("javax.servlet.error.status_code");
		messageObj = req.getAttribute("javax.servlet.error.message");
		typeObj = req.getAttribute("javax.servlet.error.exception_type");
		throwable = (Throwable) req
				.getAttribute("javax.servlet.error.exception");
		uri = (String) req.getAttribute("javax.servlet.error.request_uri");

		if (uri == null) {
			uri = req.getRequestURI(); // in case there's no URI given
		}

		// Convert the attributes to string values
		if (codeObj != null)
			code = codeObj.toString();
		if (messageObj != null)
			message = messageObj.toString();
		if (typeObj != null)
			type = typeObj.toString();

		// The error reason is either the status code or exception type
		String reason = (code != null ? code : type);

		out.println("<HTML>");
		out.println("<HEAD><TITLE>" + reason + ": " + message
				+ "</TITLE></HEAD>");
		out.println("<BODY>");
		out.println("<H1>" + reason + "</H1>");
		//out.println("<H2>" + message + "</H2>");
		out.println("<H2>");
		for(int i=0; i<message.length(); i++){
			out.println(message.charAt(i));
			if(message.charAt(i)=='\n'){
				out.println("<br />");
			}
		}
		out.println("</H2>");
		out.println("<PRE>");
		if (throwable != null) {
			throwable.printStackTrace(out);
		}
		out.println("</PRE>");
		out.println("<HR>");
		out.println("<I>Error accessing " + uri + "</I>");
		out.println("</BODY></HTML>");
	}
}