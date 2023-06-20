<%@ page import="java.sql.*"%>
<%

    int id=Integer.parseInt(request.getParameter("id"));


  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		String sql="delete from  db_registration where Id='"+id+"'";
		PreparedStatement pst=con.prepareStatement(sql);
		int i=pst.executeUpdate();
		 if( i>0)
			{
				session.setAttribute("sesdelete","Record Successfully Delete!! :");
				response.sendRedirect("Home.jsp");
		    }
	 }
  catch(Exception e)
  {
	  out.print("Exception" +e);
  }
%>