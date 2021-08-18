<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\signup;
use Illuminate\Support\Facades\DB;


class loginController extends Controller
{
    
    
    public function signupCreate(Request $request){
        $signup = new signup();
        $signup->firstname = $request->firstname;
        $signup->lastname = $request->lastname;
        $signup->email = $request->email;
        $signup->password = $request->password;

        $signup->save();

        return redirect()->route("login");

    }
    public function checkLogin(Request $request){
        $query = DB::table("signups")
                ->select("id","firstname")
                ->where("email",$request->email)
                ->where("password",$request->password)
                ->get();

        if(count($query)>0){

            session(['user' => $query[0]->id]);
            session(['username' => $query[0]->firstname]);

            return redirect()->route("dashboard",["id"=>$query[0]->id]);
        }      
        else{
            session()->flash('message', 'Wrong Credentials, please enter valid details!');
            return redirect()->route('login');

        }        
        
        

    }
    public function logout(){
        session()->flush();
        return redirect()->route("login");
    }
}

