<!DOCTYPE HTML>
<?php echo $__env->make("header", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<h1 >Dashboard</h1>
<h3 sytle="padding: '30px'"> Hi , <?php echo e(session()->get("username")); ?> </h3>

<div class="card-body">
    <form action="./createSchedule" method="POST">
        <?php echo csrf_field(); ?>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="Enter Name of Schedule"/>
        <div class="form-group">
            <label for="desc">Description</label>
            <input type="text" class="form-control" name="desc" id="desc" placeholder="Enter Description"/>
        </div>
        <div class="form-group">
            <label for="startdate">Start time</label>
            <input type="textarea" class="form-control" name="startdate" id="startdate" placeholder="Select Start date"/>
        </div>
        <div class="form-group">
            <label for="lastdate">Last time</label>
            <input type="text" class="form-control" name="lastdate" id="lastdate" placeholder="Select Last date"/>
        </div>

        <div class="form-group">
        <label for="day" class="form-label">Select Day</label>
        <input class="form-control" list="datalistOptions" name="day" id="day" placeholder="Type to hints...">
        <datalist id="datalistOptions">
        
        </datalist>
            
   
  </div>
  <div class="card-footer">
      <div class="form-group" style="padding:20px,10px">      
        <input type="submit" name="submit" id="submit" class="btn btn-primary" value="Schedule Event" aria-describedby="helpId"/>
        
      </div>

    </form>
  </div>
</div>

  <div id="calendar"></div>

  

  </body>
  
  <script>
      
        $( function() {
           
                $.ajax({
                url: "./<?php echo e(session()->get('user')); ?>/getSchedules",
                type: 'GET',
                // dataType: 'json', // added data type
                async: false,
                success: function(data) {
                    d = JSON.parse(data);
                                   
                 
                }
            });        
      
        // console.log(myEvents);
            
           
            // myEvents = [{"id":"1","name":"sha","description":"rat From: 20:48 to 20:55","date":"2021-06-12","type":"holiday"},{"id":"2","name":"sha","description":"rat From: 20:48 to 20:55","date":"2021-06-19","type":"holiday"},{"id":"3","name":"sha","description":"rat From: 20:48 to 20:55","date":"2021-06-26","type":"holiday"},{"id":"4","name":"sha","description":"rat From: 20:48 to 20:55","date":"2021-07-03","type":"holiday"}];
            

  

           

            $('#calendar').evoCalendar({
                theme: 'Royal Navy',
                calendarEvents: d,
            });
           
    
            $('#startdate').datetimepicker({
                format:'Y-m-d H:i',
            });
           
            $('#lastdate').datetimepicker({
                format:'Y-m-d H:i',
            });
        
        $options =" <option value='Monday'>";
        $options +="<option value='Tuesday'>";
        $options +="<option value='Wednesday'>";
        $options +="<option value='Thursday'>";
        $options +="<option value='Firday'>";
        $options +="<option value='Saturday'>";
        $options +="<option value='Sunday'>";

        $("#datalistOptions").html($options)

       

      
});
        </script>
     

<?php /**PATH G:\xampp\htdocs\event\resources\views/dashboard.blade.php ENDPATH**/ ?>