<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>alxsy</title>
  <style>
  @import url("default.css");
  </style>
  <!--<link rel="stylesheet" type="text/css" href="default.css">-->
</head>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bootstrap.datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
  
  
  <script src="./js/jquery.min.js"></script>

  <body>
  <!--  <form method="get" action="./php/test2.php">-->
    
<input type="text" id="tp" name="tp" placeholder="cadastrar">
<input type="submit" value="adcionar" id="add" name='add'><br>
<input type="text" id="bp" name="bp" placeholder="Pesquisar">
<input type="submit" value="consultar" id="cons" name="cons">
 <!--   </form>  -->
  <p id="text">
    text
  </p>
<script> 
 $(document).ready(function(){  

  $("input:submit").click(function(){
    //val(""),text(""),empty(),clear()
    var nomea=$("#tp").val();
    var nomep=$("#bp").val();
    var bt=$(this).val();
    $.post('./php/test2.php',{nomea:nomea,nomep:nomep,bt:bt},function(data){
     $("#text").html(data); 
    });
  $("#bp").val("");
   $("#tp").val("");
  });

   
   
   
   
 
  $( "#tp" ).keypress(function() {
  if ( event.which == 13 || event.keyCode == 13 ) {
  var tipo = $("#tp").val();
        $("#tp").val("");
           $.ajax({  
                url:"./php/add.php",  
                method:"POST",                                                            //       <---------  
                data:{tag:tipo},                                                             //           script ajax
                success:function(data){  
                     $('#text').html('dado inserido '+ tipo);  
                  alert('insert success');
                }  
           });  
}
  
  
  });

  
  

  
  

  
  $("#bp").keyup(function(){
    var nm=$("#bp").val();
    $.post('add.php',{bsc:nm},function(data){
      alert(data);
     $("#text").html(data); 
    });
  });
 
 
 
 
 
 
 
 
 
 
 });  
  
 

  
 
  
 </script>  
</body>
</html>
