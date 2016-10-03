<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>

<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid =""; %>
<% uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
<head> <link rel="stylesheet" style="text/css" href="cascadess.css"/></head>
<body background="images/bg6.jpg"><center><BR><BR><FONT>

<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

	
	%>
	<head> <link rel="stylesheet" style="text/css" href="cascadess.css"/></head>
	<body background="images/bg6.jpg"><center><BR><BR><FONT>

	<%
	try
	{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
		stmt =  con.createStatement();
		String Query = "SELECT item_code,item_price,item_quantity from o_item_backup,o_bill where "+ "o_item_backup.bill_id=o_bill.bill_id and bill_status=3";
		System.out.println(Query);
		rs = stmt.executeQuery(Query);
		System.out.println("rs**"+rs);
	}
	catch(Exception e)
	{
		System.out.println("Exception"+e);
	}
	%>
	<table border=1>
	<tr><th>ITEM_CODE </Th><Th>ITEM_PRICE</Th> <Th>ITEM_QUANTITY</Th></TR><br>
	<%
	if(rs!=null)
	while(rs.next())
	{System.out.println("in while");
	%>
	                             	
	<TR align="center"><TD><%=rs.getString(1)%></TD><TD><%=rs.getString(2)%></TD><TD><%=rs.getString(3)%></TD></TR>
		                           
		                            
	<%
	}
	%>
	 </table>
	</BODY>
	</HTML>

<%

try{

	stmt =  con.createStatement();
	String Query = "SELECT item_code,item_price,item_quantity from o_item_backup,o_bill where "+ "o_item_backup.bill_id=o_bill.bill_id and bill_status=3";
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
	
%>
<table border=1>
<tr><th>ITEM_CODE </Th><Th>ITEM_PRICE</Th> <Th>ITEM_QUANTITY</Th></TR><br>
<%
if(rs!=null)
while(rs.next()){

%>
                             	
<TR align="center"><TD><%=rs.getString(1)%></TD><TD><%=rs.getString(2)%></TD><TD><%=rs.getString(3)%></TD></TR>
<%
}
%>	                    

 </table>
</BODY>
</HTML>




