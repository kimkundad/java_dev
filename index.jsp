<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>  
<%
Connection connect = null;
Statement s = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	connect =  DriverManager.getConnection("jdbc:mysql://localhost/javadb" +
			"?user=root&password=mysql");
	
	s = connect.createStatement();
	 
	String sql = "SELECT * FROM  users ORDER BY id  ASC";

	ResultSet rec = s.executeQuery(sql);
	

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">


    <title>Sticky Footer Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/bootstrap.min.css" TYPE="text/css" MEDIA=screen>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <!-- Custom styles for this template -->
	<link rel="stylesheet" href="./assets/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="./assets/sticky-footer.css"/>

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
   

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	@media screen and (min-width: 1280px){
    	.bg_grass_right {
			    position: absolute;
			    float: right;
			    right: 0;
			    bottom: 50%;
			    padding: 0;
			    z-index: 201;
			    max-width: 100%;
			    height: auto;
			    border: 0px;
			    vertical-align: middle;
			}
			
			.chuchuani {
			    position: absolute;
			    float: right;
			    right: 0;
			    bottom: 30px;
			    padding: 0;
			    z-index: 103;
			    height: auto;
			    border: 0px;
			    vertical-align: middle;
			    text-align: right;
			}
			.bg_flower_right {
			    position: absolute;
			    float: right;
			    right: 0;
			    bottom: 50%;
			    padding: 0;
			    z-index: 101;
			    max-width: 100%;
			    height: auto;
			    border: 0px;
			    vertical-align: middle;
			}
    	}
			.footer {
		    /* border-top: 1px #fbf1f1 solid; */
		   
		    background-color: #ffffff;
		}
		.footer{
		padding-top:60px;
		}
		
    </style>
  </head>

  <body>

    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h2>นักเรียน</h2> 
      
      </div>
     
      
      <table class="table">
		  <caption>รายชื่อรักเรียนทั้งหมด ปีการศึกษา 2560 <a style="float:right; margin-right:3px;" class="btn btn-success btn-xs" data-toggle="modal" data-target=".bs-example-modal" ><i class="fa fa-plus"></i> เพิ่มข้อมูล</a></caption>
		  
		    <!-- start model -->
		  		
		  		<div class="modal fade bs-example-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
				  <div class="modal-dialog" role="document">
				  
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="exampleModalLabel">เพิ่มรายชื่อนักเรียนใหม่</h4>
				      </div>
				      <div class="modal-body">
				        <form action="add_data.jsp" method="POST">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">ชื่อ-นามสกุล:</label>
				            <input type="text" class="form-control recipient_name" name="name">
				
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">อีเมล:</label>
				            <input type="text" class="form-control recipient_email" name="email">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">สาขาวิชา:</label>
				            <input type="text" class="form-control recipient_major" name="major">
				          </div>
				       
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
				        <button type="submit" class="btn btn-primary">แก้ไข</button>
				      </div>
				    </div>
				    </form>
				  </div>
				</div>
		  		
		  		<!-- endl model -->
		  		
		  		
		  <thead>
		  	<tr>
		  		<td>รหัส</td>
		  		<td>ชื่อ-นามสกุล</td>
		  		<td>อีเมล์</td>
		  		<td>สาขา</td>
		  		<td>จัดการ</td>
		  	</tr>
		  </thead>
		  
		  <tbody>
		  <%while((rec!=null) && (rec.next())) { %>
		  	<tr>
		  		<td>Archer-<%=rec.getString("id")%></td>
		  		<td><%=rec.getString("name")%></td>
		  		<td><%=rec.getString("Email")%></td>
		  		<td><%=rec.getString("provider")%></td>
		  		<td>
		  			<a style="float:left; margin-right:3px;" class="btn btn-primary btn-xs" href="" data-toggle="modal" data-target="#exampleModal" 
		  			data-whatever="<%=rec.getString("name")%>"
		  			data-whatemail="<%=rec.getString("email")%>"
		  			data-whateprovider="<%=rec.getString("provider")%>"
		  			data-whateid="<%=rec.getString("id")%>"
		  			><i class="fa fa-wrench"></i> </a>
		  			<form action="del_data.jsp" method="post" onsubmit="return(confirm('Do you want Delete'))">
		  			<input type="hidden" class="form-control recipient_id" value="<%=rec.getString("id")%>" name="id">
                            <button type="submit" class="btn btn-danger btn-xs" style="float:left;"><i class="fa fa-times "></i></button>
                          </form>
		  		</td>
		  		
		  	
		  		
		  	
		  	</tr>
		  
		  	<%}%>
		  	
		  </tbody>
	  </table>
	  <!-- start model -->
		  		
		  		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
				      </div>
				      <div class="modal-body">
				        <form action="edit_data.jsp" method="POST">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">ชื่อ-นามสกุล:</label>
				            <input type="text" class="form-control recipient_name" name="name">
				            <input type="hidden" class="form-control recipient_id" name="id">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">อีเมล:</label>
				            <input type="text" class="form-control recipient_email" name="email">
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">สาขาวิชา:</label>
				            <input type="text" class="form-control recipient_major" name="major">
				          </div>
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
				        <button type="submit" class="btn btn-primary">แก้ไข</button>
				      </div>
				      </form>
				    </div>
				  </div>
				</div>
		  		
		  		<!-- endl model -->
		  		
		  		
	  <%	
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
	  
    </div>
    
    

    <footer class="footer">
    <div class="bg_flower_right">
                <img src="assets/image/bg_flower_right.png" style="width: 350px;">
            </div>
    <div class="bg_grass_right">
                <img src="assets/image/bg_grass_right.png" style="width: 350px;">
            </div>
            
            <div class="chuchuani">
                <canvas id="AnimationChuchu" style="width: 200px;"></canvas>
                
            </div>
            
      <div class="container">
       
      

   
        
      </div>
    </footer>


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/sprite-animation-chuchu.js"></script>
    <script>
    $('#exampleModal').on('show.bs.modal', function (event) {
    	  var button = $(event.relatedTarget) // Button that triggered the modal whateprovider whateid
    	  var recipient = button.data('whatever') 
    	  var recipient_email = button.data('whatemail')
    	  var recipient_whateprovider = button.data('whateprovider')
    	  var recipient_whateid = button.data('whateid')
    	  
    	  var modal = $(this)
    	  modal.find('.modal-title').text('แก้ไขข้อมูล ' + recipient)
    	  modal.find('.modal-body input.recipient_name').val(recipient)
    	  modal.find('.modal-body input.recipient_email').val(recipient_email)
    	  modal.find('.modal-body input.recipient_major').val(recipient_whateprovider)
    	  modal.find('.modal-body input.recipient_id').val(recipient_whateid)
    	})
    </script>
  </body>
</html>