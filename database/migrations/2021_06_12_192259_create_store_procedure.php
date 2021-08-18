<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStoreProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      
        $store_procedure= "
        DROP procedure IF EXISTS `add_schedule`;
    
        CREATE PROCEDURE `add_schedule`(
            IN clientId int(3),
            IN eventName varchar(50),
            IN description varchar(100),
            IN first_date date,
            IN stime varchar(10),
            IN ltime varchar(10)   
            
        )
        BEGIN
         
            declare max_date date ;
            declare new_week int ;
            declare cur_date date ;
        
            set max_date = adddate(first_date, INTERVAL 90 day);
            set cur_date = first_date;
            set new_week = 1;
        
          while cur_date <= max_date do
            
            insert into schedules (cliendId,name,description,startdate,starttime,endtime) 
            values (clientId,eventName,description, cur_date,stime,ltime);
            set cur_date= adddate(cur_date, INTERVAL new_week week);
            set new_week =+ 1 ; 
            
          end while;
          
          commit;
        
        END;
        
        
        ";
        \DB::unprepared($store_procedure);

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('store_procedure');
    }
}
