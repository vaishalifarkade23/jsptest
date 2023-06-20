<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random" %>


<%
 String email=(String)session.getAttribute("email");
 //get otp from session
 int otp1=(Integer)session.getAttribute("sesotp");
//get otp from FORM
 String otpvalue=request.getParameter("nameotp");
 int enterotp=Integer.parseInt(otpvalue);

// int otp1=(Integer)session.getAttribute("sesotp");
 
//
if(otp1==enterotp)
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		String sql="insert into adminregtable (Email) values('"+email+"')";
		PreparedStatement pst=con.prepareStatement(sql);
		int i =pst.executeUpdate();
		
	    if( i>0)
		{
			session.setAttribute("sesreg","Successfully Registered!!");
		}
		
	}
	catch(Exception e){
		out.print("error" +e); 
		
	}
}
%>