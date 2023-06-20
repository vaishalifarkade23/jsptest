<%@ page import="java.sql.*" %>
<%
	String sfullname = request.getParameter("fullname");
	String semail = request.getParameter("email");
	String spassword = request.getParameter("password");
	String susertype = request.getParameter("comboaction");
	String sGender = request.getParameter("gender");
	int sgender = Integer.parseInt(sGender);
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
		String sql1="select email from adminregtable where email='"+semail+"'";
		PreparedStatement pst1 = con.prepareStatement(sql1);
		ResultSet rs=pst1.executeQuery();
		if(rs.next())
		{
			if(rs.getString("email").equalsIgnoreCase(semail))
			{
				session.setAttribute("resp1","email already Exist");
				response.sendRedirect("1signup.jsp");
			}
		}
		else
		{
		try
		{
		String sql = "insert into adminregtable (fullname, email, password, usertype, gender) values ('"+sfullname+"', '"+semail+"', '"+spassword+"', '"+susertype+"', '"+sgender+"')";
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();
		{
			session.setAttribute("sesSign", "Successfully Registartion...!!!");
			response.sendRedirect("1login.jsp");
		}
	}
	catch(Exception ex)
	{
		out.println("Exception : "+ex);
	}
		}
		
		 
	} catch(Exception ex){
		out.print("Exception" +ex);
	}
%>
