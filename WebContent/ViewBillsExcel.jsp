<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
<%-- <%@ page import="dbconn.DBConnection"%> --%>
<%@page contentType="text/html"%>

<HEAD> <link rel="stylesheet" style="text/css" href="cascadess.css"/>
</HEAD>
<BODY background="images/bg6.jpg">
<center><h2>List of bills</h2></center>
<%
	Connection con=null;;
	ResultSet rs=null;
	Statement stmt=null;
	try{			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
           //  DBConnection cc=new DBConnection();
			// con=cc.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from o_bill order by bill_status";
			rs = stmt.executeQuery(Query);
%>
<table align="center" border="2">
<tr><th >BILL_ID</th><th> BILL_AMOUNT </th><th>BILL_STATUS </th><th>BILL_DATE</th>
</tr>

<%		while(rs.next()){					%>
					
<tr align="center"><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
   </tr>

<%   	}       %>
</table>
<center>BILL_STATUS: &nbsp;&nbsp;&nbsp;1. Conform Bills &nbsp;&nbsp;&nbsp;  2. Error in Bills &nbsp;&nbsp;&nbsp;3. Cancel The Bills</center> 
<% con.close();}
		
   catch(Exception e){
%>
	<%=e%>
	
	<%   } %>
</BODY>


