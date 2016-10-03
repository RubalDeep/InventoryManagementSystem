<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%> 
 <html>
 <head><link rel="sytlesheet" style="text/css" href="cascadess.css"/></head><body background="images/bg6.jpg">
 <h2><center><font color="white">Welcome to Inventory Manager</font></center></h2>
 <br><br><br> <a href="change1.jsp" target="display"><font color="white">CHANGE PASSWORD</font></A><br><br><br>
  <a href="checkstatusinventory.jsp" target="display"><font color="white">CHECK STATUS OF INVENTORY</font></a><br><br><br>
  <a href="generatereports.jsp" target="display"><font color="white">GENERATE REPORTS</font></a><br><br><br>
  <!-- <a href="simplebar.jsp" target="display">GRAPHS FOR ITEMS</a><br><br><br> -->
  <A HREF="Logout.jsp" target="_top"><font color="white">LOGOUT</font></A>
  </body></html>
 