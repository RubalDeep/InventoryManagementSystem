<%@ page language="java" %>
<%@ page session="true" import="java.sql.*,java.io.*,java.util.*"%>
<% String uid=(String)session.getAttribute("user");
if(uid==null)
{%>
<jsp:forward page="login.jsp"/>
<%}%>
  <HTML>
  <HEAD>
  <link rel="stylesheet" style="text/css" href="cascadess.css"/>
  	</head>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
	function check(){
	var EmpName = document.AddEmpForm.EMPName.value;
	var EMPNO = document.AddEmpForm.EMPNO.value;
	var EmpEmailID = document.AddEmpForm.EmpEmailID.value;
	var CurrentLocation=document.AddEmpForm.CurrentLocation.value;
	var JDY=document.AddEmpForm.JoiningDateYYYY.value;
	var JDM=document.AddEmpForm.JoiningDateMM.value;
	var JDD=document.AddEmpForm.JoiningDateDD.value;
    var Role=document.AddEmpForm.Role.value;
	
	    if(EmpName=="")
		{
		alert("Employee name is mandatory");
		document.AddEmpForm.EMPName.focus();
		return false;
	    }
	else
	    {
		var ed=EmpName;
		var pattern = /^([a-zA-Z\.]+[a-zA-Z]{1,30})$/;
		if(!(pattern.test(ed))){
			alert("Please enter valid Name");
			document.AddEmpForm.EMPName.value="";
			document.AddEmpForm.EMPName.focus();
		return false;
		}
	}
	if(EMPNO==""){
		alert("Employee number is mandatory");
		document.AddEmpForm.EMPNO.focus();
		return false;
	}
	else{
	  	var ed=EMPNO;
		var pattern = /^([0-9]{1,6})$/;
		if(!(pattern.test(ed))){ 
			alert("Please enter numbers only");
			document.AddEmpForm.EMPNO.value="";
			document.AddEmpForm.EMPNO.focus();
	        return false;
		}

	}
	if(EmpEmailID==""){
		alert("EmailId is mandatory");
        document.AddEmpForm.EmpEmailID.focus();
		return false;
	}
	else
	{
	  	var ed=EmpEmailID;
		var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;
		if(!(pattern.test(ed))) {
			alert("Please enter valid email ID");
			document.AddEmpForm.EmpEmailID.value="";
			document.AddEmpForm.EmpEmailID.focus();
			return false;
		}
	}
	if(CurrentLocation=="NA"){
		alert("Current Location is mandatory");
		document.AddEmpForm.CurrentLocation.focus();
		return false;
	}
	if(JDY=="NA"){
		alert("Joining Year is mandatory");
		document.AddEmpForm.JoiningDateYYYY.focus();
		return false;
	}
	if(JDM=="NA"){
		alert("Joining Month is mandatory");
		document.AddEmpForm.JoiningDateMM.focus();
		return false;
	}
	
		if(JDD=="NA"){
		alert("Joining Day is mandatory");
		document.AddEmpForm.JoiningDateDD.focus();
		return false;
	}
  if(Role=="NA"){
		alert("Role is mandatory");
		document.AddEmpForm.JoiningDateDD.focus();
		return false;
	}
	}

	//-->
	</SCRIPT>
 
  <body background="images/bg6.jpg">
  <FORM NAME="AddEmpForm" onSubmit="return check()" action="AddEmployee.jsp">
   <CENTER>

   <TABLE BORDER="0" CELLSPACING="2"  CELLPADDING="2" >
	   <TR bgcolor="#808000" ALIGN="center">
	   <TH COLSPAN="2"> Add  new Employee Entry</TH>
	   </TR>
	   <TR><TD>&nbsp;
	   </TR>
	  
	    <TR bgcolor="gray" >
	   <TD>EMPName *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EMPName" SIZE="30" ></TD>
	   </TR>
	   <TR class=row_even >
	   <TD>EMPNO *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EMPNO" SIZE="30"></TD>
	   </TR>

	   <TR bgcolor="gray" >
	   <TD>MailID *</TD>
	   <TD><INPUT TYPE="TEXT" NAME="EmpEmailID" SIZE="30"></TD>
	   </TR>

	   <TR >
	   <TD>CurrentLocation*</TD>
	   <TD><select name="CurrentLocation">
				<option value="NA">Location</option>
							<option value="Alabama">Alabama</option>
							<option value="Alaska">Alaska</option>
							<option value="Arizona">Arizona</option>
							<option value="Arkansas">Arkansas</option>
							<option value="California">California</option>
							<option value="Louisiana">Louisiana</option>
							<option value="Ohio">Ohio</option>
							<option value="New Jersey">New Jersey</option>
							<option value="New Mexico">New Mexico</option>
							<option value="New York">New York</option>
							<option value="Ohio">Ohio</option>
							<option value="Texas">Texas</option>
							<option value="Virginia">Virginia</option>
							<option value="Washington">Washington</option>
							<option value="West Virginia">West Virginia</option>
							
					</select></TD>
	   </TR>

	   <TR bgcolor="gray" >
	   <TD>JoiningDate *</TD>
	   <TD><select  NAME="JoiningDateYYYY" >
	  <option>Year</option>
1980</option><option >1981</option><option >1982</option>
<option >1983</option><option >1984</option><option >1985</option><option >1986</option><option >1987</option>
<option >1988</option><option >1989</option><option >1990</option><option >1991</option><option >1992</option>
<option >1993</option><option >1994</option><option >1995</option><option >1996</option><option >1997</option>
<option >1998</option><option >1999</option><option >2000</option><option >2001</option><option >2002</option>
<option >2003</option><option >2004</option><option >2005</option><option >2006</option><option >2007</option>
<option >2008</option><option >2009</option><option >2010</option><option >2011</option><option >2012</option><option >2013</option><option >2014</option><option >2015</option>

	  </select>-
   	   <select name="JoiningDateMM">
	      <option value="NA">Month</option>
	      <option>jan</option>
		  <option>feb</option>
		  <option>mar</option>
		  <option>apr</option>
		 <option>may</option>
		 <option>jun</option>
		 <option>jul</option>
		 <option>aug</option>
		 <option>sep</option>
		 <option>oct</option>
		 <option>nov</option>
		 <option>dec</option>
		 </select> -
	    <select name="JoiningDateDD">
	      <option value="NA">Day</option>
		  <option>1</option>
		  <option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option></select>(YYYY-MON-DD)</TD>
	   </TR>
	   	<TR>
			<TD>Role *</TD>
			<TD>
				<select name="Role">
					<option value="NA">Role</option>
                    <option>SALES MANAGER</option>	   
					<option>INVENTORY MANAGER</option>
					<option>SALES PERSON</option>
					<option>ADMINISTRATOR</option>
		 
				</select>
			</TD>

		</TR>
		<TR  ALIGN="CENTER">
			<TD><INPUT TYPE="submit" VALUE="Add" ></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset"></TD>
		</TR>

   </TABLE>
   </CENTER>
   </FORM>
   </BODY> 
   </HTML>
