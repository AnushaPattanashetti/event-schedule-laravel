<html>
    <head>
        <meta charset="utf-8">

        <link rel="icon" href="../favicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="./app.css" rel="stylesheet" >

        <!-- CSS bootstrap only  -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery CDN -->

        <script src="https://code.jquery.com/jquery-1.12.4.js"> </script>
        <!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
        <script src=" https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" ></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">

                <!-- // Add evo-calendar.css (default theme included) in the <head> tag -->
        <link rel="stylesheet" type="text/css" href="../sass/evo-calendar.css"/>
        <!-- // Themes? Add them right after the main css -->
        <link rel="stylesheet" type="text/css" href="../sass/evo-calender.midnight-blue.css"/>

        <!-- // Add evo-calendar.js before your closing <body> tag, right after jQuery (required) -->
        <script src="../js/evo-calendar.js"></script>


    <style>
        body{
            font-family:'Arial, Helvetica, sans-serif';
            
        }
        h1{padding: 20px;}

    </style>

    
    <title>
        Events Scheduler
    </title>

    </head>
    <body>
        <!-- Image and text -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
       
        <img src="../favicon.png" width="30" height="30" class="d-inline-block align-top" alt="logo">
            <a class="navbar-brand" href="./dashboard">Event Scheduler</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
<?php if(session()->get('user')): ?>

<ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="../logout">Logout</a>
      </li>
<?php else: ?>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="./login">Login</a>
      </li>

      <li class="nav-item ">
        <a class="nav-link" href="./signup">Signup</a>
      </li>
   
    </ul>
  </div>
<?php endif; ?>
</nav>
<div class="container">
<?php /**PATH C:\source\xampp9\htdocs\events\resources\views/header.blade.php ENDPATH**/ ?>