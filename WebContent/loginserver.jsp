<%@ page import="java.sql.*"%>

<% 

    String user=request.getParameter("username");
    String password=request.getParameter("pass");

try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
		String sql="select * from db_registration where FirstName='"+user+"' and Password='"+password+"'";
		PreparedStatement pst=con.prepareStatement(sql);
		ResultSet rs =pst.executeQuery();
		
	    if(rs.next())
		{
			session.setAttribute("sesuser",user);
			response.sendRedirect("Home.jsp");
			//out.print("Register Successfully");
		}
	    else
	    {
	    	session.setAttribute("sesuser","wrong credencial!!");
			response.sendRedirect("index.jsp");
	    }
		
	}
	catch(Exception e)
	{
   out.print("Exception" +e); 
	}

%>
  
  