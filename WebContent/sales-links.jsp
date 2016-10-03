<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
<html>
<head>
<title>Welcome to SALES PERSON</title>
</head>
<body background="images/bg6.jpg"><center><br><br><br><br>
<H2>WELCOME TO SALES PERSON</H2><table border=0 >
<tr><a href="change1.jsp" >Change Password</a><br><br><br>
<tr><a href="status_inventory.jsp">Status_Inventory</A><br><br><br>
<tr><a href="search_item.jsp">Searching_item</a><br><br><br>
<a href="items_details.jsp" target="_blank">produce_bill</A><br><br>
<tr><a href="Logout.jsp">logout</a><br><br><br><br>
</table></center>

</body>
</html>