<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css" TYPE="text/css" MEDIA=screen>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <!-- Custom styles for this template -->
	<link rel="stylesheet" href="./assets/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="./assets/sticky-footer.css"/>
    <link href="assets/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container">
</div>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
	String CusID = "";
	if(request.getParameter("CustomerID") != null) {
		CusID = request.getParameter("CustomerID");
	}
	
	Connection connect = null;
	Statement s = null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/javadb" +
				"?user=root&password=mysql&characterEncoding=utf-8");
		
		s = connect.createStatement();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String major = request.getParameter("major");

		
		String sql = "INSERT INTO users " +
				"(name,email,provider,create_at) " + 
				"VALUES ('" + name + "','" + email + "' " +
				",'" + major + "', now()) ";
         s.execute(sql);
        
         
        
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>


 <script src="assets/js/jquery.min.js"></script>
 <script src="assets/js/bootstrap.min.js"></script>
 <script src="assets/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
 
 <script type="text/javascript">
  swal("ยินดีด้วย!", "คุณได้ทำการเพิ่มนักเรียนใหม่สำเร็จ!", "success");
  
  var delayMillis = 2000; 

  setTimeout(function() {
    window.location = "index.jsp";
  }, delayMillis);
  
</script>

</body>
</html>


