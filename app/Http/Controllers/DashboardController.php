<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Str;
use App\Models\Network;
use App\Models\User;

class DashboardController extends Controller
{
    public function Index(){
    	if (Auth::user()->hasRole('user')) {

    		//return view('dashboard');
    		$pointCount = Network::where('parent_user_id',Auth::user()->id)->count();
    		$networkData = Network::with('user')->where('parent_user_id',Auth::user()->id)->get();
    		return view('affiliate_dashboard',compact(['pointCount','networkData']));

    	}
    	elseif (Auth::user()->hasRole('employee')) {

    		$pointCount = Network::where('parent_user_id',Auth::user()->id)->count();
    		$networkData = Network::with('user')->where('parent_user_id',Auth::user()->id)->get();
    		return view('affiliate_dashboard',compact(['pointCount','networkData']));

    	}elseif (Auth::user()->hasRole('admin')) {
    		$userData = User::where('is_approved',1)->latest()->get();
    		//$generalUser = User::where('role_id',3)->get();
    		$generalUser = DB::table('role_user')
    						->join('users','role_user.user_id','users.id')
    						->select('users.*')
    						->where('role_user.role_id', '=', 3)
    						->get();
    		return view('admin_dashboard',compact(['userData','generalUser']));

    	}else{
    		return redirect('/');
    	}
    	
    }
    public function loadReferralRegister(Request $request){
    	//dd($request->ref);
    	if (isset($request->ref)) {
    		
    		$refarral = $request->ref;
    		$userData = User::where('referral_code',$refarral)->get();

    		$c = count($userData);
            if ($c > 0) {
    			
    			return view('registerRefarral',compact(['refarral']));

    		} else {
    			return view('404');
    		}
    		
    	} else {
    		
    		return redirect('/');

    	}
    	

    }

    public function updateRole(Request $request){
    	$id = $request->id;
    	//dd($id);
    	DB::table('role_user')
				    ->where('user_id', $id)
				    ->update([
				        'role_id' => 2
				    ]);
		DB::table('users')
				    ->where('id', $id)
				    ->update([
				        'is_approved' => 1
				    ]);

		return redirect()->route('dashboard')->with('messages','User Updated Successfully!');

    }





}
