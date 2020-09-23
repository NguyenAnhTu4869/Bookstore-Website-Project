<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductType;
use App\Cart;
use Session;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use Hash;
use Auth;

use Illuminate\Http\Request;

class AdminController extends Controller
{

    public function getListBook()
    {
        $book = Product::all();
        return view('admin.adminpage.book.listbook', ['book' => $book]);
    }

    public function getAddBook()
    {
        $type = ProductType::all();
        return view('admin.adminpage.book.addbook', ['type' => $type]);
    }

    public function postAddBook(Request $req)
    {
        $this->validate($req,
            [
                'name'=>'required|unique:products,name',
                'image'=>'required',
                'author'=>'required',
                'amount'=>'required',
                'price'=>'required'
            ],
            [
                'name.required'=>'Please input book name',
                'name.unique'=>'This type is already in use',
                'image.required'=>'Please input image',
                'author.required'=>'Please input author name',
                'amount.required'=>'Please input amount',
                'price.required'=>'Please input price'
            ]);
        $book = new Product();
        $book->name = $req->name;
        $book->description = $req->description;
        $book->image = $req->image;
        $book->author = $req->author;
        $book->amount = $req->amount;
        $book->unit_price = $req->price;
        $book->new = $req->new;
        $book->id_type = $req->type;
        $book->save();
        return redirect()->back()->with('thanhcong','You have successfully created new book');
    }

    public function getEditBook($id)
    {
        $book = Product::find($id);
        $type = ProductType::all();
        return view('admin.adminpage.book.editbook', ['book' => $book, 'type'=> $type]);
    }

    public function postEditBook(Request $req, $id)
    {
        $this->validate($req,
            [
                'name'=>'required',
                'image'=>'required',
                'author'=>'required',
                'amount'=>'required',
                'price'=>'required'
            ],
            [
                'name.required'=>'Please input book name',
                'image.required'=>'Please input image',
                'author.required'=>'Please input author name',
                'amount.required'=>'Please input amount',
                'price.required'=>'Please input price'
            ]);
        $book = Product::find($id);
        $book->name = $req->name;
        $book->description = $req->description;
        $book->image = $req->image;
        $book->author = $req->author;
        $book->amount = $req->amount;
        if($book->unit_price > $req->price)
        {
            $book->promotion_price = $req->price;            
        } else {
            $book->unit_price = $req->price;
            $book->promotion_price = 0;
        }
        $book->new = $req->new;
        $book->id_type = $req->type;
        $book->save();
        return redirect()->back()->with('thanhcong','You have successfully edit book');
    }

    public function getDelBook($id)
    {
        $book = Product::find($id);
        $book -> delete();
        return redirect('admin/adminpage/book/listbook')->with('thanhcong','You have successfully delete book');
    }

    public function getListType()
    {
        $type = ProductType::all();
        return view('admin.adminpage.booktype.listtype', ['type' => $type]);
    }

    public function getAddType()
    {
        return view('admin.adminpage.booktype.addtype');
    }

    public function postAddType(Request $req)
    {
        $this->validate($req,
            [
                'name'=>'required|unique:type_products,name',
                'image'=>'required',
            ],
            [
                'name.required'=>'Please input type name',
                'name.unique'=>'This type is already in use',
                'image.required'=>'Please input image',
            ]);
        $type = new ProductType();
        $type->name = $req->name;
        $type->description = $req->description;
        $type->image = $req->image;        
        $type->save();
        return redirect()->back()->with('thanhcong','You have successfully created new book type');
    }

    public function getEditType($id)
    {
        $type = ProductType::find($id);
        return view('admin.adminpage.booktype.edittype', ['type' => $type]);
    }

    public function postEditType(Request $req, $id)
    {
        $this->validate($req,
            [
                'name'=>'required',
                'image'=>'required',
            ],
            [
                'name.required'=>'Please input type name',
                'image.required'=>'Please input image',
            ]);
        $type = ProductType::find($id);
        $type->name = $req->name;
        $type->description = $req->description;
        $type->image = $req->image;        
        $type->save();

        return redirect()->back()->with('thanhcong','You have successfully edit type');
    }

    public function getDelType($id)
    {
        $type = ProductType::find($id);
        $type -> delete();
        return redirect('admin/adminpage/booktype/listtype')->with('thanhcong','You have successfully delete type');
    }    

    public function getListUser()
    {
        $user = User::all();
        return view('admin.adminpage.user.listuser', ['user' => $user]);
    }

    public function getAddUser()
    {
        return view('admin.adminpage.user.adduser');
    }

    public function postAddUser(Request $req)
    {
        $this->validate($req,
            [
                'name'=>'required',
                'email'=>'required|email|unique:users,email',
                'password'=>'required|min:6|max:20',
                're_password'=>'required|same:password',
                'phone'=>'required',
                'address'=>'required',
            ],
            [
                'email.required'=>'Please input email',
                'email.email'=>'Incorrect email format',
                'email.unique'=>'Email is already in use',
                'password.required'=>'Please input password',
                're_password.same'=>'The password is not the same',
                'password.min'=>'Password at least 6 characters',
                'password.max'=>'Password must not exceed 20 characters',
                'name.required'=>'Please input full name',
                'phone.required'=>'Please input phone number',
                'address.required'=>'Please input address'
            ]);
        $user = new User();
        $user->full_name = $req->name;
        $user->email = $req->email;
        $user->password = Hash::make($req->password);
        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect()->back()->with('thanhcong','You have successfully created new user');
    }

    public function getEditUser($id)
    {
        $user = User::find($id);
        return view('admin.adminpage.user.edituser', ['user' => $user]);
    }

    public function postEditUser(Request $req, $id)
    {
        $this->validate($req,
            [
                'name'=>'required',
                'email'=>'required|email',
                'phone'=>'required',
                'address'=>'required',
            ],
            [
                'email.required'=>'Please input email',
                'email.email'=>'Incorrect email format',
                'name.required'=>'Please input full name',
                'phone.required'=>'Please input phone number',
                'address.required'=>'Please input address'
            ]);
        $user = User::find($id);
        $user->full_name = $req->name;
        $user->email = $req->email;
        $user->level = $req->level;
        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect()->back()->with('thanhcong','You have successfully edit user');
    }

    public function getDelUser($id)
    {
        $user = User::find($id);
        $user -> delete();
        return redirect('admin/adminpage/user/listuser')->with('thanhcong','You have successfully delete user');
    }

    public function getListBill()
    {
        $bill = Bill::all();
        return view('admin.adminpage.bill.listbill', ['bill' => $bill]);
    }

    public function getListCustomer()
    {
        $customer = Customer::all();

        return view('admin.adminpage.listcustomer', ['customer' => $customer]);
    }

    public function getAdminLogin()
    {
        return view('admin.adminpage.adminlogin');
    }

    public function postAdminLogin(Request $req)
    {
        $this->validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:6|max:20'
            ],
            [
                'email.required'=>'Please input email',
                'email.email'=>'Incorrect email format',
                'password.required'=>'Pleas input password',
                'password.min'=>'Password at least 6 characters',
                'password.max'=>'Password must not exceed 20 characters'
            ]
        );
        $credentials = array('email'=>$req->email,'password'=>$req->password);
        $user = User::where([
                ['email','=',$req->email]
            ])->first();

        if($user){
            if(Auth::attempt($credentials)){
                return redirect('admin/adminpage/book/listbook');
            }
            else{
                return redirect()->back()->with('That bai','Login unsuccessful');
            }
        }
        else{
           return redirect()->back()->with('That bai', 'Account not activated'); 
        }
    }

    public function postAdminLogout(){
        Auth::logout();
        return redirect('admin/adminpage/adminlogin');
    }
}
