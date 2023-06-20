<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id1=request.getParameter("id");
int id=Integer.parseInt(id1);
String fname=request.getParameter("fname");
String lname=request.getParameter("fname");
String mail=request.getParameter("email");
String pass=request.getParameter("password");

Connection con;

try{
	Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
	 String sql="select Id,Email from newregistration where Id='"+id+"' or Email='"+mail+"'";
	 PreparedStatement pst=con.prepareStatement(sql);
	 ResultSet rs=pst.executeQuery();
	 if(rs.next()){
		  if(rs.getInt("id")==id){
		 session.setAttribute("resp1", "id already exist");
		 response.sendRedirect("generateRegistrationForm.jsp");
		}
		  if(rs.getString("email").equalsIgnoreCase(mail)){
			 session.setAttribute("resp1", "email id already exist");
			 response.sendRedirect("generateRegistrationForm.jsp");
			}
		 
	 }
	 else{
	 
	 try{
	String sql2="insert into newregistration(Id,FirstName,LastName,Email,Password)values('"+id+"','"+fname+"','"+lname+"','"+mail+"','"+pass+"')";
	PreparedStatement pst1=con.prepareStatement(sql2);
	int i=pst1.executeUpdate();
	if(i!=0){
		session.setAttribute("resp2", "data submitted successfully");
		response.sendRedirect("generateRegistrationForm.jsp");
	}
	
}catch(Exception e){
	out.println(e);
}
	 }
}
	 catch(Exception e){
			out.println(e);
	 }
%>