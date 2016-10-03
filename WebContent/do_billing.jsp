  <html>
  <head><link rel="stylesheet" style="text/css" href="cascadess.css"/><title>Do billing jsp</title>
<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
</head>
<body background="images/bg6.jpg">
<%!double bill_amt;%>
<%! double price;%>
<%
Connection con=null;
 Statement stmt=null;
 Statement stmt1=null;
 ResultSet rs=null;

String billid=request.getParameter("bill_id");
String[] items=request.getParameterValues("item_code");

session.setAttribute("billid",billid);
session.setAttribute("items",items);
 try
{

   int j=0;
	/*Getting the connection variable from session*/
	

  	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
	stmt =  con.createStatement();
	stmt1 =  con.createStatement();

	String SelQ = "Select bill_id from o_bill where bill_id=\'"+billid+"\'";

	String selq1="select item_price from o_item where item_code=\'"+items[j]+"\'";
	String selq2="update o_item set item_quantity=item_quantity-1 where item_code=\'"+items[j]+"\'";
	String selq3="insert into o_item_backup values(\'"+items[j]+"\',"+price+","+1+",\'"+billid+"\')";
	//String selq4="update o_item_backup set item_quantity=item_quantity+1 where item_code=\'"+items[j]+"\'";
	//System.out.println("hello");
	String Query = "insert into o_bill values(\'"+billid+"\',"+0+","+1+",sysdate)";
	
	rs=stmt.executeQuery(SelQ);
	
if(rs.next()){%>
<script>
		for(i=1;i<=3;i++) document.write("<br>");
	</script>
	<H3 align="center">Sorry bill id is already exists in the databases</H3>
	<BR>
	<center>
		<A href="items_details.jsp"> Back </A>
	</center>
 <%}else{
		stmt1.executeUpdate(Query);
		RequestDispatcher rd=request.getRequestDispatcher("bill_details.jsp");
		rd.forward(request,response);
	
	}	
}
catch(Exception e)
{
	//System.out.println("Exception"+e);
}
%>

</body>
</html>