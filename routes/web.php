<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login');
});

Route::any("/login",function(){
    return view("login");
})->name("login");

Route::any('/signup',function(){
    return view("signup");
});

Route::any('/login/check',"loginController@checkLogin");
Route::post('/signup/create',"loginController@signupCreate");

Route::group(['middleware' => 'islogin'], function () {
Route::get("/dashboard/{id}","dashboardController@index")->name('dashboard');

Route::any("/logout","loginController@logout")->name("logout");
Route::post("/dashboard/createSchedule","dashboardController@createSchedule");

Route::any("/dashboard/{id}/getSchedules","dashboardController@getSchedules")->name("getSchedules");
});

// Route::any("")
