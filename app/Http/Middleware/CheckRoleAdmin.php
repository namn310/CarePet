<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CheckRoleAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        if (Auth::check()) {
            $id = Auth::user()->id;
            $QueryRoleUser = DB::table('users')->where('id', $id)->where('role', 'staff')->get();
            if ($QueryRoleUser->count() > 0) {
                return redirect(route('admin.home'));
            } else {
                return $next($request);
            }
        } else {
            return redirect(route('admin.login'));
        }
    }
}
