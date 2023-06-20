<%@ page import="java.sql.*" %>
<%
	String sfullname = request.getParameter("fullname");
	String semail = request.getParameter("email");
	String susername = request.getParameter("username");
	String spassword = request.getParameter("password");
	String sCpassword = request.getParameter("cpassword");
	String sgender = request.getParameter("comboaction");
	String scity = request.getParameter("combocity");
	String susertype = request.getParameter("combotype");
	String sadd = request.getParameter("fulladdress");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql = "insert into adminregtable2 (fullname, email, username,password,confirmpassword,gender,city,usertype,address) values ('"+sfullname+"', '"+semail+"','"+susername+"', '"+spassword+"','"+sCpassword+"','"+sgender+"','"+scity+"', '"+susertype+"','"+sadd+"' )";
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();
		{
			session.setAttribute("sesSign", "Successfully Registartion...!!!");
			response.sendRedirect("2loginpage.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
%>
