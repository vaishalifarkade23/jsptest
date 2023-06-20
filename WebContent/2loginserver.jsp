<%@ page import="java.sql.*" %>
<%
	String lemail = request.getParameter("email");
	String lpassword = request.getParameter("password");
    String luser=request.getParameter("username");
	String lusertype = request.getParameter("radioaction");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from adminregtable2 where email = '"+lemail+"' and password = '"+lpassword+"' and usertype = '"+lusertype+"'";
		PreparedStatement pst =con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("lemail", lemail);
			session.setAttribute("seslogin", "Login Successfully...!!!");
		if(lusertype.equalsIgnoreCase("Admin"))
		{	
			response.sendRedirect("2homeadmin.jsp");
		}
		else
		{
			response.sendRedirect("2homestudent.jsp");
		}
	}
		else
		{
			session.setAttribute("seslogin", "Wrong Credential...!!!");
			response.sendRedirect("2login.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>