<%@ page import="java.sql.*" %>

<%
	//Get OTP from session
	int otpsession1 = (Integer) session.getAttribute("sesotp");
	//String otpsession = Integer.toString(otpsession1);

	// Get OTP from form
	String otpvalue = request.getParameter("Otp");
	int otpform = Integer.parseInt(otpvalue);
	
	//getattrribut of email
	String email=(String)session.getAttribute("email");
	
	if(otpsession1 == otpform)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp", "root", "");
			String sql = "update adminregtable set status = 1 where email = '"+email+"' and status=0";
			PreparedStatement pst = con.prepareStatement(sql);
			int i = pst.executeUpdate();
			if(i>0)
			{
				session.setAttribute("status", "Status is set successfully");
				response.sendRedirect("1login.jsp");
			}
			else
			{
				session.setAttribute("status", "Status is not set successfully");
				response.sendRedirect("1login.jsp");
			}
		}
		catch(Exception ex)
		{
			out.println("Exception : "+ex);
		}
	}
	
%>