<%@ page import="java.sql.*"%>
<%
	String[] select=request.getParameterValues("checkboxname");
	if(select !=null && select.length !=0)
	{
		out.print("you have selected:");
		for(String s:select)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbjsp","root","");
				String sql="delete from adminregtable where id='"+s+"'";
				PreparedStatement pst=con.prepareStatement(sql);
				int a=pst.executeUpdate();
				if(a>0)
				{
					out.print("you have deleted:"+a+" records.");
				}
			}
			catch(Exception e)
			{
				out.print("Error:" +e);
			}
		}
	}
%>

