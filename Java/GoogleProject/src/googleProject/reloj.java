package googleProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.SimpleTimeZone;

public class reloj extends HttpServlet{
	public void doGet(HttpServletRequest potorro, HttpServletResponse resp) throws IOException{
		SimpleDateFormat comoQuiera = new SimpleDateFormat("yyyy-dd hh:mm:ss.SSSSSS");
		comoQuiera.setTimeZone(new SimpleTimeZone(0,""));
		//resp.setContentType("test/html");
		//PrintWriter out = resp.getWriter();
		//out.println("<p>The time is: " + comoQuiera.format(new Date())+ "</p>");
		
		UserService userF = UserServiceFactory.getUserService();
		User user = userF.getCurrentUser();
		
		String loginURL = userF.createLoginURL("/clock");
		String logOut = userF.createLogoutURL("/clock");
		
		potorro.setAttribute("user", user);
		potorro.setAttribute("loginURL", loginURL);
		potorro.setAttribute("logOut", logOut);
		potorro.setAttribute("currentTime", comoQuiera.format(new Date()));
		
		resp.setContentType("text/html");
		
		RequestDispatcher asd = potorro.getRequestDispatcher("home.jsp");
		
		
	}
}
