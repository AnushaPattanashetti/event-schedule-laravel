<?php

namespace App\Http\Middleware;

use Closure;
use App\Http\Controllers;

class isLogin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(! $request->session()->get('user'))
        {
           return redirect()->route('login');
        }

       
        return $next($request);
    }
}
