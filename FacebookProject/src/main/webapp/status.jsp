<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Status</title>
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.3.0/build/cssreset/reset-min.css">
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script>
<script src="/js/myjava.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".tab_content").hide(); //On page load hide all the contents of all tabs
	$("ul.tabs li:nth-child(3)").addClass("active").show(); //Default to the first tab
	$(".tab_content:nth-child(3)").show(); //Show the default tabs content
	//When the user clicks on the tab
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove the active class
		$(this).addClass("active"); //Add the active tab to the selected tab
		$(".tab_content").hide(); //Hide all other tab content
		var activeTab = $(this).find("a").attr("href"); //Get the href's attribute value (class) and fade in the corresponding tabs content
		$(activeTab).fadeIn(); //Fade the tab in
		return false;
	});
});
</script>
<style type="text/css">
/*-----------------------------------------------------------------------------------*/
/*	Setup
/*-----------------------------------------------------------------------------------*/
.topdiv
{
width:1366px;
height:43px;
bbackground-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAqCAMAAABFoMFOAAAAWlBMVEVOaaJDYJxCX5xBXptIZJ9MZ6E/XJpFYZ1KZqA9W5lGYp5HY55MaKFJZZ9LZqBEYZ1NaaJNaKJNaKFAXZtAXZpLZ6E+XJo+W5lJZaA9Wpk8Wpk8Wpg8WZg7WZj2xcGWAAAANElEQVR42lWGSQoAIBDDHCjo0f8/UxBxQDQuFwlpqgBZBq6+P+unVY1GnDgwqbD2zGz5e1lBdwvGGPE6OgAAAABJRU5ErkJggg==");
background-repeat: repeat-x;
background-size: auto auto;
background-position: 0px 0px;
background-color: #3A5795;
border-width: 0px 0px 1px;
border-style: none none solid;
}
.wrapper{
width:760px;
height:200px;
margin-left:auto;
margin-right:auto;
padding-top:33px;
}
.mainbody
{
width:1349px;
height:1628.07px;
background-color:#F2F2F6;
}
body, input{
background: white;
font-size: 11px;
font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
color: #333;
line-height: 1.28;
word-wrap:break-word;	
}
.wrapper{
width: 760px;
height:1628.07px;
margin-left:auto;
margin-right:auto;
padding-top:20px;
background-color:white;
}
.maincontent{
width:760px;
float:left;	
background-color:white;	
}
.sidebar{
	width:240px;
	float:right;
	margin-right:20px;
}
.tabHeader{
background-color: #F2F2F2;
border-top: solid 1px #E2E2E2;
padding: 4px 5px 5px;
margin-top:15px;
margin-bottom:10px;
}
a{
cursor: pointer;
color: #3B5998;
text-decoration: none;
}
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 19px; /*--Set height of tabs--*/
	border-bottom: 1px solid #E2E2E2;
	border-left: 1px solid #E2E2E2;
	width: 100%;
	margin-bottom:20px;
}
ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 18px; /*--Minus 1px from the height of  ul--*/
	line-height: 18px; /*--aligns text within the tab--*/
	border: 1px solid #E2E2E2;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #f2f2f2;
	margin-right:5px;
	min-width:90px;
	text-align:center;
	
}
ul.tabs li:first-child{ /*--Removes the left border from the first child of the list--*/
border-left:none;	
	
}
ul.tabs li:AFTER{ /*--Removes the left border from the first child of the list--*/
border-left:none;	
	
}
ul.tabs li a {
	text-decoration: none;
	color: #333333;
	display: block;
	font-size: 16px;
	padding-right:5px;
	padding-left:5px;
	outline: none;
}
ul.tabs li a:hover {
	background: #fff;
}
html ul.tabs li.active, html ul.tabs li.active a:hover  { /*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	border-bottom: 1px solid #fff; 
	color:#3B5998;
}
ul.tabs li.active a{
	color:#3B5998;	
}
.pmsg{
font-size: 13px;
line-height: 1.5em;
font-weight:bold;
margin-bottom:18px;
}
.line{
display:block;
width:100%;
height:1px;
background-color:#ccc;
margin-top:5px;
margin-bottom:5px;
}
</style>
</head>
<body>
<div class="topdiv">
</div>
<div style="height:2px;background"></div>
<div class="mainbody">
<div class="wrapper">
	<div class="maincontent">
        
        <ul class="tabs">
            <li><a href="/photo">&nbsp;Photos&nbsp;</a></li>
            <li><a href="/video">&nbsp;Videos&nbsp;</a></li>
            <li><a href="/status">&nbsp;Statuses&nbsp;</a></li>
            <li><a href="/hashtag">&nbsp;Hashtags&nbsp;</a></li>
		</ul>
	<c:forEach items="${feeds}" var="arr">
   <c:set var="likes" value="${arr.like}"/> 
    <c:set var="type" value="${arr.type}"/>
   
    	<c:if test="${type=='status'}">
		<span class="line"></span>
          <p class="pmsg"><a href="http://www.google.com" target="_blank">${arr.message}</a></p>
       <span class="line"></span>
         </c:if>    
    	</c:forEach>
    
    
</div><!--End Wrapper -->
</div>
</div>
</body>
</html>
