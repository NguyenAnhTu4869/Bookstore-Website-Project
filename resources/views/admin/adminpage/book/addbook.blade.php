@extends('admin.layout.adminmaster')
@section('content')
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Book
                            <small>Add</small>
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
                                <label>Name</label>
                                <input class="form-control" name="name" placeholder="Please Enter Book name" />
                            </div>
                            <div class="form-group">
                                <label>Type</label>
                                    <select class="form-control" id="sel" name="type">
                                        @foreach($type as $t)
                                        <option value="{{$t->id}}">{{$t->name}}</option>
                                        @endforeach
                                    </select>
                            </div>
                            <div class="form-group">
                                <label>Author</label>
                                <input class="form-control" name="author" placeholder="Please Enter Author name" />
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <input class="form-control" name="amount" type="number" min="1" placeholder="Please Enter Amount" />
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input class="form-control" name="price" type="number" min="1000" placeholder="Please Enter Price" />
                            </div>
                            <div class="form-group">
                                <label>Images</label>
                                <input type="file" name="image">
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <label class="radio-inline">
                                    <input name="new" value="1" checked="" type="radio">New
                                </label>
                                <label class="radio-inline">
                                    <input name="new" value="0" type="radio">Old
                                </label>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" rows="3" name="description"></textarea>
                            </div>
                            <button type="submit" class="btn btn-default">Book Add</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
@endsection
