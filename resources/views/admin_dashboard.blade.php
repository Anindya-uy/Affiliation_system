<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Admin Dashboard') }}
        </h2>
    </x-slot>
    <div class="p-6 mx-auto">
        @if(session()->has('messages'))
        <div class=" alert alert-success" id="message">
            {{ session()->get('messages'); }}
        </div>
        @endif
    </div>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    {{-- {{ __("You're logged in as an Admin!") }} --}}
                    <p>Hi <b>{{ Auth::user()->name }}</b>, Welcome! Please check Pending Requests.</p>
                </div>
            </div>
            <div class="mt-5">
                <h1 class="w-75 m-auto p-3 bg-warning text-dark text-center fs-4 fw-normal">Pending Affiliates Request</h1>
                <table class="table table-striped table-bordered table-sm w-75 m-auto">
                    <thead class="text-center table-light">
                        <tr >
                          <th>Sl No.</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Date</th>
                          <th>Permission</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                            
                            @foreach($generalUser as $key=>$data)
                                <tr>
                                  <td>{{ $key + 1 }}</td>
                                  <td>{{ $data->name }}</td>
                                  <td>{{ $data->email }}</td>
                                 {{-- <td>{{ $data->created_at->diffForHumans(); }}</td> --}}
                                  <td>{{ date('d-M-Y', strtotime($data->created_at));}}</td>
                                  <td>
                                    {{-- {{ dd($data->id) }} --}}
                                      <a href=" {{ route('updaterole',[$data->id]) }} " class="btn btn-info text-white "type=""><span class="fas fa-user-lock"></span></a>
                                  </td>
                                </tr>
                            @endforeach
                    </tbody>
                </table>
            </div>

            <div class="mt-5">
                <h1 class="w-75 m-auto p-3 bg-success text-white text-center fs-4 fw-normal">All Users</h1>
                <table class="table table-striped table-bordered w-75 m-auto">
                    <thead class="text-center table-light">
                        <tr >
                          <th>Sl No.</th>
                          <th>Name</th>
                          <th>Email</th>
                          <th>Refarral Code</th>
                          <th>Permission</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                            @php 
                                $x = 1; 
                            @endphp

                            @foreach($userData as $data)
                                <tr>
                                  <td>{{ $x++ }}</td>
                                  <td>{{ $data->name }}</td>
                                  <td>{{ $data->email }}</td>
                                  <td>{{ $data->referral_code }}</td>
                                  <td>
                                    {{-- {{ dd($data->is_approved) }} --}}
                                    @if($data->is_approved == 1)
                                      <button class="btn btn-success"type=""><span class="fa fa-check"></span></button>
                                    @else
                                        <button class="btn btn-info"type=""><span class="fa fa-lock"></span></button>
                                    @endif
                                  </td>
                                </tr>
                            @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            
            setTimeout(() => {
                    $('#message').remove();
                }, 3000);
        });
    </script>
</x-app-layout>