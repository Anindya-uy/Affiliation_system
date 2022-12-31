<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
            <span class="float-end text-success">*Points: {{ $pointCount*15 }}</span>
        </h2>
        
    </x-slot>
    <div class="pt-6 mx-auto">
        @if(session()->has('messages'))
        <div class=" alert alert-success text-white" id="message">
            {{ session()->get('messages'); }}
        </div>
        @endif
    </div>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    {{-- {{ __("You're logged in as an Employee!") }} --}}
                    @if(Auth::user()->hasRole('employee'))
                        <p>Hi <b>{{ Auth::user()->name }},</b> Welcome!&nbsp; Share your link to add more stuff and earn <b>points.</b></p>
                    @else
                        <p>Hi <b>{{ Auth::user()->name }},</b> Welcome!&nbsp; Please be patience untill approve your request as an <b>affiliate user!</b></p>

                    @endif
                </div>
            </div> 
            @if(Auth::user()->hasRole('employee'))
            <div class="m-4">
                <p class="text-info">{{ URL::to('/') }}/referral-register?ref={{ Auth::user()->referral_code }}</p>
                <h5 style="cursor: pointer;"  class="copy" data-code="{{ Auth::user()->referral_code }}"> <span class="fa fa-copy mr-2 mt-1"></span>Copy Refarral Link</h5>
            </div>

            <div class="mt-5">
                <h1 class="w-75 m-auto p-3 bg-success text-white text-center fs-4 fw-normal">My Network</h1>
                <table class="table table-striped table-bordered table-sm w-75 m-auto">
                    <thead class="text-center table-light">
                        <tr >
                          <th>Sl No.</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Registerd Date</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        @if( count($networkData) > 0)
                            @php 
                                $x = 1; 
                            @endphp

                            @foreach($networkData as $data)
                                <tr>
                                  <td>{{ $x++ }}</td>
                                  <td>{{ $data->user->name }}</td>
                                  <td>{{ $data->user->email }}</td>
                                  <td>{{ date('d-M-Y', strtotime($data->created_at));}}</td>
                                </tr>
                            @endforeach
                        
                        @else
                            <tr class="bg-danger text-white">
                                <th colspan="4"><p  class="py-1 fs-5 fw-normal">No Affiliated User Found!</p></th>
                            </tr>
                        
                        @endif
                    </tbody>
                </table>
            </div>
            @endif  
        </div>
    </div>

    <script>
        //alert('a');
        $(document).ready(function() {
            $('.copy').click(function() {
                $(this).parent().prepend('<span class="copied_text text-success">Copied</span>');

                var code = $(this).attr('data-code');
                var url = "{{ URL::to('/') }}/referral-register?ref="+code;

                var $temp = $("<input>");
                $("body").append($temp);
                $temp.val(url).select();
                document.execCommand("copy");
                $temp.remove();


                setTimeout(() => {
                    $('.copied_text').remove();
                }, 2000);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            
            setTimeout(() => {
                    $('#message').remove();
                }, 3000);
        });
    </script>
    
</x-app-layout>
