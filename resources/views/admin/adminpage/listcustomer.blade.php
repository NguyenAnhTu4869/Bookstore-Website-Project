@extends('admin.layout.adminmaster')
@section('content')
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Customer
                            <small>List</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($customer as $c)
                            <tr class="odd gradeX" align="center">
                                <td>{{$c->id}}</td>
                                <td>{{$c->name}}</td>
                                <td>{{$c->gender}}</td>
                                <td>{{$c->email}}</td>
                                <td>{{$c->address}}</td>
                                <td>{{$c->phone_number}}</td>
                                <td>{{$c->note}}</td>
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