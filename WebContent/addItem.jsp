<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
<html>
<head>
<link rel="stylesheet" style="text/css" href="cascadess.css"/>
</head>

<body background="images/bg6.jpg">
<br><br>
<center><h2> Add Category Code/Category Name</h2>
<% String categoryName="",category_code=""; 
ArrayList<String> list = null;

	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
		stmt =  con.createStatement();

		String Query = "SELECT category_name from o_item_category" ;
		
		System.out.println(Query);
		rs = stmt.executeQuery(Query);
	     list = new ArrayList<String>();
		while(rs.next()){
		categoryName = rs.getString("CATEGORY_NAME");
		list.add(categoryName);
	//	category_code = "SELECT category_code from o_item_category where category_name='"+categoryName+"'";
		System.out.println("categoryName"+categoryName);
	//	System.out.println("category_code"+category_code);
		
		
		
		}
		
		category_code = "SELECT category_code from o_item_category where category_name='"+categoryName+"'";
		rs = stmt.executeQuery(category_code);
		while(rs.next()){
			category_code = rs.getString("category_code");
		}
		
		System.out.println("category_code"+category_code);
		 session.setAttribute("category_code",category_code);
	}
	catch(Exception e)
	{
		System.out.println("Exception"+e);
	}
	
%>
<form name"f1" action="addItem1.jsp" method="post">
<table border="0">
<tr><td>Add Item Code</td><td><input type="text" name="ic" size="8"></td></tr>
<tr><td>Add Item Name</td><td><input type="text" name="in" size="8"></td></tr>
<tr><td>Add Item Price</td><td><input type="text" name="ip" size="8"></td></tr>
<tr><td>Add Item Quantity</td><td><input type="text" name="iq" size="8"></td></tr>
<tr><td>Add Item Description</td><td><input type="text" name="id" size="8"></td></tr>
<tr><td>Choose Category Name</td><td><select name="categoryname">
		<%
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		
		
		%>		
				   <option value=<%=list.get(i)%>><%=list.get(i) %></option>
				   <%} %>
				</select></td></tr>
<tr><td><input type="submit" value="submit" ></td><td><input type="reset" value="clear"></td></tr>
</form>
</center>
</body>
</html>