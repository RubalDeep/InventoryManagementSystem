<html>
<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>

<head><link rel="stylesheet" style="text/css" href="cascadess.css"/>
<title>
	To Search An Item.......
</title>
</head>
<body background="images/bg6.jpg">
<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String ItemName = request.getParameter("itemname");
try
{

	/*Getting the connection variable from session*/
    Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
	stmt =  con.createStatement();
	System.out.println("hello");
	String SelQ = "Select item_name from o_item where item_name like \'"+ItemName+"%"+"\'";
	System.out.println(SelQ);
	rs=stmt.executeQuery(SelQ);
	System.out.println(SelQ);
	boolean b=true;
	boolean c=false;%>
	<script>
		for(i=1;i<=3;i++) document.write("<br>");
	</script>
<%while(rs.next()){%>

<center><h3><ol><li><%=rs.getString(1)%></ol></h3></center>
	
	
	<% b=false;c=true;}%><br>
	<%if(c){%>
	<H3 align="center">Above Items are Related To Search  </H3>
	<BR>
	<center>
	<A href="search_item.html"> Back</A> 
	</center>
	<%}%>
	<%if(b){%>
   <script>
		for(i=1;i<=3;i++) document.write("<br>");
	</script>
		<H3 align="center">Sorry Items Are Not Available Related to Search </H3>
	<BR>
	<center>
	<A href="search_item.html"> Back</A> 
	</center>
   <%}%>


	
	<%
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>