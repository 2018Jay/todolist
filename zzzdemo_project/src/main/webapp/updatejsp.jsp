<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
    <title>Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  </head>

<body>
<h1 class="myclass">Update Todo</h1>
<% 
String task=request.getParameter("task");
String end_time=request.getParameter("end_time");
session.setAttribute("task1", task);
session.setAttribute("end_time1", end_time);

%>


 <form action="updateservlet" id='update' method="post">
  <div class="mb-3 myclass" style="padding-left: 60px;padding-right: 60px">
    <label for="exampleInputEmail1" class="form-label">Enter Your Task Hear</label>
    <textarea form='update'class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="task"><%out.println(task);%></textarea>
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3 myclass" style="padding-left: 60px; padding-right: 60px">
    <label for="exampleInputPassword1" class="form-label">Enter DueDate</label>
    <input type="datetime-local" class="form-control" id="exampleInputPassword1" name="end_time" value="<%=end_time%>">
  </div>
  <input type="hidden" placeholder="enter your task" name="start_time">
  <div class="mb-3 myclass" style="padding-left: 60px; padding-right: 60px  ">
    <button type="submit" class="btn btn-primary" >Update</button>
  </div>
  
</form>

</body>
</html>