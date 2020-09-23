@extends('admin.layout.adminmaster')
@section('content')
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">User
                            <small>List</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
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
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Username</th>
                                <th>Level</th>
                                <th>Email</th>
                                @if(Auth::user()->level > 1)
                                    <th>Delete</th>
                                    <th>Edit</th>
                                @endif
                                
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($user as $u)
                            <tr class="odd gradeX" align="center">
                                <td>{{$u->id}}</td>
                                <td>{{$u->full_name}}</td>
                                @if($u->level==0)
                                    <td>User</td>
                                @elseif($u->level==1)
                                    <td>Staff</td>
                                @else
                                    <td>Admin</td>
                                @endif
                                <td>{{$u->email}}</td>
                                @if(Auth::user()->level > 1)
                                    @if($u->level==0)
                                        <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/adminpage/user/deluser/{{$u->id}}">Delete</a></td>
                                    @else
                                        <td></td>
                                    @endif
                                    <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/adminpage/user/edituser/{{$u->id}}">Edit</a></td>
                                @endif

                                
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
@endsection