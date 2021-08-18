<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\event;
use Illuminate\Support\Facades\DB;
use App\schedule;

class dashboardController extends Controller
{
    public function index(Request $request){
        return view("dashboard");
    }

    public function createSchedule(Request $request){

        $dates = explode(" ",$request->startdate);
        $endDates = explode(" ",$request->lastdate);
        $request_url = explode("/",url()->previous());
        $clientId = end($request_url);
    

        $events = new event();
        $events->cliendId=  $clientId;
        $events->name = $request->name;
        $events->description = $request->desc;
        $events->startdate = $dates[0];
        $events->starttime = $dates[1];
        $events->endtime = $endDates[1];
        
        $events->save();

        DB::select("call add_schedule('$clientId','$request->name','$request->desc','$dates[0]','$dates[1]','$endDates[1]')");


        return redirect()->route('dashboard',['id'=>$clientId]);
    }

    public function getSchedules(Request $request){
       
        
        $request_url = explode("/",url()->previous());
        $clientId = end($request_url);

        $query = DB::table('schedules')
                ->where('cliendId',$clientId)
                ->get();

              
        $events = array();
      
        for($i=0; $i<count($query);$i++){
           
            $events[$i]["id"] = "".$query[$i]->id."";
            $events[$i]["name"] = $query[$i]->name;
            $events[$i]["description"] = $query[$i]->description." From: ".$query[$i]->starttime." to ".$query[$i]->endtime;
            $events[$i]["date"]=$query[$i]->startdate;
            $events[$i]["type"] = 'holiday';
            
        }

        echo json_encode($events);
    



    }

    public function logout(){
        session()->flush();
        return redirect()->route("login");
    }

}
