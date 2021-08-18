<!DOCTYPE HTML>
<?php echo $__env->make("header", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<div style="  padding: 25px 0px 50px 300px; ">
<div class="card " style="width:50%">
  <div class="card-header text-center ">
    <h2>Signup </h2>
  </div>
  <div class="card-body">
    <form action="./signup/create" method="POST">
    <?php echo csrf_field(); ?>
    <div class="form-group">
            <label for="firstname">First Name</label>
            <input type="text" class="form-control" name ="firstname" id="firstname" placeholder="Enter First name"/>
    </div>
    <div class="form-group">
            <label for="lastname">Last Name</label>
            <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Enter Last name"/>
    </div>
        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="Enter E-mail"/>
</div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name ="password" id="password" placeholder="Enter Password"/>
        </div>
            
   
  </div>
  <div class="card-footer">
      <div class="form-group" style="padding:20px,10px">      
        <input type="submit" name="submit" id="submit" class="btn btn-success" value="Signup" aria-describedby="helpId">
        
      </div>

    </form>
  </div>

</div>


<?php /**PATH C:\source\xampp9\htdocs\events\resources\views/signup.blade.php ENDPATH**/ ?>