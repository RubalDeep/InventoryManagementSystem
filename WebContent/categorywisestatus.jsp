<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
<html><head> <link rel="stylesheet" style="text/css" href="cascadess.css"/>
</head>
<body background="images/bg6.jpg">
<%ResultSet rs=null;
Connection con=null;
Statement stmt=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
//DBConnection cc=new DBConnection();
			// con=cc.getConnection();
			
String str="select *from o_item order by category_code";
stmt=con.createStatement();
rs=stmt.executeQuery(str);
%>
<br><br>
<center><h2>Category Wise Status</h2></center><br>
<table align="center" border="2">
<tr align="center"><th >ITEM_CODE</th><th>ITEM_NAME </th><th>ITEM_PRICE</th><th>ITEM_QUANTITY</th><th>ITEM_QUALITY</th><th>CATEGORY</th>
</tr>

<%		while(rs.next()){					%>
					
<tr align="center"><td>
<%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
   <TD><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td></tr>

<%   	}       %>


<table><center><a href="generatereports.jsp"> BACK</a>
</body>
</html>