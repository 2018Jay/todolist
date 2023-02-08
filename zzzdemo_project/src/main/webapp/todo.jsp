<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.getconection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<style>
.btn-group button{
float:left;
}
 body{
            background-image:url("https://tse4.mm.bing.net/th?id=OIP.2ihXpTEHupgYlOPRUTlFvwHaEo&pid=Api&P=0");
            background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
  
        }
  .myclass{
  
  color: white;
  }
        
</style>


  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Todo List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  </head>
  <body background: "https://images.search.yahoo.com/images/view;_ylt=Awr9_ov1sb9jILE2OyGJzbkF;_ylu=c2VjA3NyBHNsawNpbWcEb2lkA2UwMWRmNmRmNDdmYTc1YzRiZTc5M2RhYjNlZGFiMmI1BGdwb3MDMQRpdANiaW5n?back=https%3A%2F%2Fimages.search.yahoo.com%2Fsearch%2Fimages%3Fp%3Dback%2Bground%2Bimage%26ei%3DUTF-8%26type%3DE211US885G91710%26fr%3Dmcafee%26h%3D1080%26tt%3DDownload%2BJungle%2BHD%2BBackgrounds%2BFree%2B%257C%2BPixelsTalk.Net%26w%3D1920%26imgurl%3Dhttps%253A%252F%252Fwww.pixelstalk.net%252Fwp-content%252Fuploads%252F2016%252F06%252FJungle-HD-Images.jpg%26rurl%3Dhttp%253A%252F%252Fwww.pixelstalk.net%252Fdownload-jungle-hd-backgrounds-free%252F%26turl%3Dhttps%253A%252F%252Ftse1.mm.bing.net%252Fth%253Fid%253DOIP.OjNHJL6A-Lzw_jLJfFgtMwHaEK%2526pid%253DApi%2526rs%253D1%2526c%253D1%2526qlt%253D95%2526w%253D218%2526h%253D122%26tw%3D218.7%26th%3D122.7%26sigr%3DOn4ZhlFq99S4%26sigi%3DW7BysBYgenby%26sigt%3DwSwIvBsMzwHE%26sigit%3DU3UI_Now9h9z%26tab%3Dorganic%26ri%3D1&w=2560&h=1600&imgurl=www.wallpapers13.com%2Fwp-content%2Fuploads%2F2015%2F12%2FNature-Lake-Bled.-Desktop-background-image.jpg&rurl=http%3A%2F%2Fwww.wallpapers13.com%2Fnature-lake-bled-desktop-background-image%2F&size=2234.7KB&p=back+ground+image&oid=e01df6df47fa75c4be793dab3edab2b5&fr2=&fr=mcafee&tt=Nature+Lake+Bled.+Desktop+Background+Image+%3A+Wallpapers13.com&b=0&ni=75&no=1&ts=&tab=organic&sigr=j0VyGPAvh1yF&sigb=78hL_mYmluYr&sigi=CieOTTSkY8iK&sigt=WC9YxOxodi9c&.crumb=t/yM5RyT.eZ&fr=mcafee&type=E211US885G91710">
    <h1 class="myclass">Todo List</h1>
    <form action="todo.jsp" id='todo'>
  <div class="mb-3 myclass" style="padding-left: 60px;padding-right: 60px">
    <label for="exampleInputEmail1" class="form-label">Enter Your Task Hear</label>
    <textarea form='todo'class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="task"></textarea>
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3 " style="padding-left: 60px; padding-right: 60px">
    <label for="exampleInputPassword1" class="form-label">Enter DueDate</label>
    <input type="datetime-local" class="form-control" id="exampleInputPassword1" name="end_time">
  </div>
  <input type="hidden" placeholder="enter your task" name="start_time">
  <div class="mb-3 " style="padding-left: 60px; padding-right: 60px  ">
    <button type="submit" class="btn btn-primary" >Add</button>
  </div>
  
</form>
<jsp:useBean id="bean1" class="bean.todobean"></jsp:useBean>
<jsp:setProperty property="*" name="bean1"/>
<jsp:useBean id="dao1" class="dao.tododao"></jsp:useBean>
<%
dao1.insertdata(bean1);
Connection con=getconection.connectionprovider();
  PreparedStatement ps=con.prepareStatement("select * from todo");
  ResultSet rs=ps.executeQuery();
  
  rs.next();
 
  int count=1;
  
  
%>
 <div class="mb-3 " style="padding-left: 60px; padding-right: 60px  ">
<table class="table">
  <thead class='table-dark'>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Task</th>
      <th scope="col">Due Date</th>
      <th scope="col"style='width: 60px'></th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
   

  <%while(rs.next()){
	  String task=rs.getString(1);
	  String start=rs.getString(2);
	  String end=rs.getString(3);
	  out.println("<tr>");
	  out.println(" <th scope='row'>"+count+"</th>");
	  out.println(" <td style='width: 600px' class='text-justify text-break'>"+task+"</td>");
	  out.println("<td style='width: 300px;' >"+end+"</td>");
	  
	 
	  count++;
  out.println("<td style='width: 60px;margin-left:60px;padding-left:6px;border-color: yellow; border-bottom-width: 2px'><div class='btn-group ' role='group' aria-label='Basic example' ><form action='deletehandle' method='post'><input type='hidden' name='task' value='"+task+"'><input type='hidden' name='end_time' value='"+end+"'><button type='submit' class='btn btn-danger btn btn-secondary' name='delete' value='DELETE'>Delete</button></form>");
  out.println("<form action='updatejsp.jsp' ><input type='hidden' name='task' value='"+task+"'><input type='hidden' name='end_time' value='"+end+"'><button type='submit' style='margin-left:15px' class='btn btn-success btn btn-secondary' name='update' value='UPDATE'>Update</button></form></div></td></tr>");
}
  %>
  </div>
  </tbody>
</table>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  </body>
</html>