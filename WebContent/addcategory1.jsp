<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>

<head>
<link rel="stylesheet" style="text/css" href="cascadess.css"/>
</head>
<body background="images/bg6.jpg">
<center><BR><BR>
<%! String cc ;%>
<%! String ct;%>
<% 
    cc= request.getParameter("cc");
    ct= request.getParameter("ct");
   System.out.println(cc+ct);
%>

<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
	stmt =  con.createStatement();

	String Query = "SELECT * from o_item_category where category_code=\'"+cc+"\'";
	System.out.println(Query);
	rs = stmt.executeQuery(Query);
		
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
if(rs.next())
{
%>
                             	<script>
	                         	for(i=1;i<=3;i++) document.write("<br>");
	                            </script>
		                        <H3 align="center"> Category Code/Category Type Exists</H3>
	                            <BR>
	                            <center>
		                        <A href="addcategory.jsp"> Back </A>
	                            </center>
<%
}
else{

String UpdateQuery = "Insert into o_item_category values(\'"+cc+"\',\'"+ct+"\')";
System.out.println(UpdateQuery);
int rowsAffected=stmt.executeUpdate(UpdateQuery);		
if(rowsAffected==1)
{
	
%>
	
	<script>
		for(i=1;i<=3;i++) document.write("<br>");
	</script>
		<H3 align="center">Category Added Successfully </H3>
	<BR>
<%
/* session.setAttribute("cname",ct);
session.setAttribute("ccode",cc); */
}
else
{
%>
	                         
							  <script>
		                      for(i=1;i<=3;i++) document.write("<br>");
	                          </script>
		                      <H3 align="center">Unable to create Category please try again </H3>
	                          <BR>
	                          <center><A href="admin_links.jsp"> Back </A></center>
<%
}
}
%>

</BODY>
</HTML>




