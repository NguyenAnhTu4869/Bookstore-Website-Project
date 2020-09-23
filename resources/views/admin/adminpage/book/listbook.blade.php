@extends('admin.layout.adminmaster')
@section('content')
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Book
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
                                <th>Title</th>
                                <th>Author</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Price</th>
                                @if(Auth::user()->level > 1)
                                    <th>Delete</th>
                                @endif
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($book as $b)
                            <tr class="odd gradeX" align="center">
                                <td>{{$b->id}}</td>
                                <td>{{$b->name}}</td>
                                <td>{{$b->author}}</td>
                                <td>{{$b->amount}}</td>
                                <th>{{$b->product_type->name}}</th>
                                @if($b->promotion_price==0)
                                    <td>{{number_format($b->unit_price)}} VNĐ</td>
                                @else
                                    <td>{{number_format($b->promotion_price)}} VNĐ</td>
                                @endif
                                @if(Auth::user()->level > 1)
                                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/adminpage/book/delbook/{{$b->id}}"> Delete</a></td>
                                @endif
                                
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/adminpage/book/editbook/{{$b->id}}">Edit</a></td>
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