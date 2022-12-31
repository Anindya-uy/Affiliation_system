<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

use Illuminate\Support\Str;
use App\Models\Network;
use Mail;
use Illuminate\Support\Facades\URL;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $refarral = null;
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $referralCode = Str::random(8);

        if(isset($request->referral_code)){
            $userData = User::where('referral_code',$request->referral_code)->get();
            $c = count($userData);
            if ($c > 0) {
                $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'referral_code' => $referralCode,
                'is_approved' => 1,
                ]);
                //$user_id = $user->id;
                //dd($user_id);

                Network::insert([
                    'referral_code' => $request->referral_code,
                    'user_id' => $user->id,
                    'parent_user_id' => $userData[0]['id'],

                ]);

                $user->attachRole('employee');

                $domain = URL::to('/');
                $url = $domain.'/referral-register?ref='.$referralCode;

                $data['url'] = $url;
                $data['name'] = $request->name;
                $data['email'] = $request->email;
                $data['password'] = $request->password;
                $data['title'] = 'Registration Link';

                Mail::send('registerMail',['data' => $data],function($message) use($data){
                    $message->to($data['email'])->subject($data['title']);
                });

                
                event(new Registered($user));

                Auth::login($user);
                return redirect(RouteServiceProvider::HOME);

            }else{
                return redirect()->back()->with('messages','Please Enter a valid Cupon.');
                //echo "Invalid Cupon";
            }

        }else{

            $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'referral_code' => $referralCode,
            'is_approved' => 0,
            ]);
            $user->attachRole('user');

            $domain = URL::to('/');
            $url = $domain.'/referral-register?ref='.$referralCode;

            event(new Registered($user));

            Auth::login($user);
            return redirect(RouteServiceProvider::HOME);
            //dd($user);
        }

        


        //return->back()->with('success','Your Registration has been Successfull!');

        //$user->attachRole('user');

        //event(new Registered($user));

        //Auth::login($user);

        //return redirect(RouteServiceProvider::HOME);
    }
}
