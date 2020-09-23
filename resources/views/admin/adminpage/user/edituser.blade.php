@extends('admin.layout.adminmaster')
@section('content')
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">User
                            <small>Edit</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-7" style="padding-bottom:120px">
                    @if(count($errors)>0)
                        <div class="alert alert-danger">
                            @foreach($errors->all() as $err)
                            {{$err}}
                            @endforeach
                        </div>
                    @endif
                    @if(Session::has('thanhcong'))
                        <div class="alert alert-success">{{Session::get('thanhcong')}}</div>
                    @endif
                        <form action="" method="POST">
                            <input type="hidden" name="_token" value="{{csrf_token()}}">
                            <div class="form-group">
                                <label>Username</label>
                                <input class="form-control" name="name" value="{{$user->full_name}}"/>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" type="email" name="email" value="{{$user->email}}" />
                            </div>
                            @if( Auth::user()->level == 2 )
                            <div class="form-group">
                                <label>Level</label>
                                @if( $user->level == 2 )
                                <label class="radio-inline">
                                    <input name="level" value="2" checked="" type="radio">Admin
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="1" type="radio">Staff
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="0" type="radio">User
                                </label>
                                @elseif( $user->level == 1 )
                                <label class="radio-inline">
                                    <input name="level" value="2" type="radio">Admin
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="1" checked="" type="radio">Staff
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="0" type="radio">User
                                </label>
                                @else
                                <label class="radio-inline">
                                    <input name="level" value="2" type="radio">Admin
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="1" type="radio">Staff
                                </label>
                                <label class="radio-inline">
                                    <input name="level" value="0" checked="" type="radio">User
                                </label>
                                @endif
                            </div>
                            @endif
                            <div class="form-group">
                                <label>Phone</label>
                                <input class="form-control" type="tel" name="phone" value="{{$user->phone}}" />
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input class="form-control" name="address" value="{{$user->address}}" />
                            </div>
                            <button type="submit" class="btn btn-default">User Edit</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
@endsection