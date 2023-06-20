<%@ page import="java.sql.*"%>
<%    

            String uid=request.getParameter("Id");
			String ufirst=request.getParameter("FirstName");//FirstName
			String ulast=request.getParameter("LastName");//LastName
			String ugen=request.getParameter("gender");//gender
			//String[] ucourse=request.getParameterValues("Course");
			String[] ucourse = request.getParameterValues("course");
			String courses="";
			for(int i=0;i<ucourse.length;i++){
				courses+=ucourse[i]+" ";
			}
		    String uaddress=request.getParameter("Address");//fulladdress
			String ucities=request.getParameter("City");//city
			String ustate=request.getParameter("State");//dropdown
			String uphone=request.getParameter("Contact");//contact
			String udob=request.getParameter("Dob");//date
			String umail=request.getParameter("Email");//Email
			String  upass=request.getParameter("Password");//password
			
	try{
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
			String sql="update db_registration set FirstName='"+ufirst+"',LastName='"+ulast+"',Gender='"+ugen+"',Course='"+ucourse+"',Address='"+uaddress+"',City='"+ucities+"',State='"+ustate+"',Contact='"+uphone+"',Dob='"+udob+"',Email='"+umail+"',Password='"+upass+"'";
			PreparedStatement pst=con.prepareStatement(sql);
			int i = pst.executeUpdate();
		    if(i>0)
		     {
			session.setAttribute("sesupdate", "Record Updated Successfully...!!!");
			response.sendRedirect("1homepage.jsp");
		}
	}
	catch(Exception e)
	{
		 out.print("Exception" +e); 
	}
%>