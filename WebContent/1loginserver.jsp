<%@ page import="java.sql.*" %>
<%
	String lemail = request.getParameter("email");
	String lpassword = request.getParameter("password");
	String lusertype = request.getParameter("radioaction");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "select * from adminregtable where email = '"+lemail+"' and password = '"+lpassword+"' and usertype = '"+lusertype+"'";
		PreparedStatement pst =con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if(rs.next())
		{
			session.setAttribute("lemail", lemail);
			session.setAttribute("seslogin", "Login Successfully...!!!");
			response.sendRedirect("1homepage.jsp");
		}
		else
		{
			session.setAttribute("seslogin", "Wrong Credential...!!!");
			response.sendRedirect("1login.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>