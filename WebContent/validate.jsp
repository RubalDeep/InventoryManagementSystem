<!--
     File : Validate.jsp

 -->

<HTML>

<%@ page language="java" import="java.sql.*,java.lang.*" session="true" %>
<head> <link rel="stylesheet" style="text/css" href="cascadess.css"/>
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
	</head>
	
	JSP Validation

<body background="images/bg6.jpg">

<BR><BR><BR>
<FONT>

<%! String user_id; %>
<%! String pass_word; %>
<%! int auth;  %>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

%>

<%-- Retrieve parameters from Session --%>


<% user_id = request.getParameter("uid");
   pass_word = request.getParameter("pwd");
  
  System.out.println("user_id = "+user_id+"\t"+"pass_word = "+pass_word);
 

%>

<%
try
{
	/*Connection to database is made with JDBC class driver*/
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","sarasu10");
	stmt =  con.createStatement();

	/*Retrives data from the database*/
	
	rs = stmt.executeQuery("SELECT * from o_login where userid='"+user_id+"' and password='"+pass_word+"'");
	System.out.println(rs);
			if(rs.next()){
	   		auth = rs.getInt(3);
			 session.setAttribute("user",user_id);
			  session.setAttribute("pwd",pass_word);
			System.out.println("auth"+auth);

			}else{%>

				 <jsp:forward page="login.jsp" />
			<%}
				

if(auth==0)		{       
%>
	<jsp:forward  page="admin_links.jsp"/>

<%     		}else  if(auth==1){   
%>
	<jsp:forward  page="sales-links.jsp"/>

<%          }else if(auth==2){  
%>
	<jsp:forward  page="sales_manager_links.jsp"/>

<%         }else  if(auth==3){ 
%>
	<jsp:forward  page="inventory-links.jsp"/>
<%         }else{
	
%>

	     <jsp:forward page="login.jsp" />

<% 	}
	       		
				session.setAttribute("connection",con);
				session.setAttribute("auth",new Integer(auth));

			
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</BODY>
</HTML>
