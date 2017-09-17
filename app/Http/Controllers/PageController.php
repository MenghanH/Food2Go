<?php

namespace App\Http\Controllers;
use App\Slide;
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
use App\File;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Post;
use Mail;
use App\Mail\SendMail;
class PageController extends Controller
{
    //homep-age
    public function getIndex(){
        $slide = Slide::all();
    	//return view('page.trangchu',['slide'=>$slide]);
        $new_product = Product::where('new',1)->paginate(4);
        $discount_product = Product::where('promotion_price','<>',0)->paginate(8);
        return view('page.Home',compact('slide','new_product','discount_product'));
    }
    //get each type of product
    public function getType($type){
        $sp_theoloai = Product::where('id_type',$type)->get();
        $other = Product::where('id_type','<>',$type)->paginate(3);
        $Type = ProductType::all();
        $productType = ProductType::where('id',$type)->first();
    	return view('page.Product_Type',compact('sp_theoloai','other','Type','productType'));
    }
    //product detail
    public function getChitiet(Request $req){
        $sanpham = Product::where('id',$req->id)->first();
        $sp_tuongtu = Product::where('id_type',$sanpham->id_type)->paginate(6);
    	return view('page.chitiet_sanpham',compact('sanpham','sp_tuongtu'));
    }
    //contact 
    public function getContact(){
        return view('page.contact');
    }
    public function postContact(){
    	Mail::send(new sendMail());
        return redirect()->back()->with('message','Sent SuccessFully');
    }
    
    // Introduction
    public function getGioiThieu(){
    	return view('page.gioithieu');
    }
    //Add to cart
    public function getAddtoCart(Request $req,$id){
        $product = Product::find($id);
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->add($product, $id);
        $req->session()->put('cart',$cart);
        return redirect()->back();
    }
    // Delete the cart
    public function getDelItemCart($id){
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        if(count($cart->items)>0){
            Session::put('cart',$cart);
        }
        else{
            Session::forget('cart');
        }
        return redirect()->back();
    }
    //Check out the order
    public function getCheckout(){
        return view('page.Order');
    }
    public function postCheckout(Request $req){
        $cart = Session::get('cart');

        $customer = new Customer;
        $customer->name = $req->name;
        $customer->gender = $req->gender;
        $customer->email = $req->email;
        $customer->address = $req->address;
        $customer->phone_number = $req->phone;
        $customer->note = $req->notes;
        $customer->save();

        $bill = new Bill;
        $bill->id_customer = $customer->id;
        $bill->date_order = date('Y-m-d');
        $bill->total = $cart->totalPrice;
        $bill->payment = $req->payment_method;
        $bill->note = $req->notes;
        $bill->save();

        foreach ($cart->items as $key => $value) {
            $bill_detail = new BillDetail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];
            $bill_detail->unit_price = ($value['price']/$value['qty']);
            $bill_detail->save();
        }
        Session::forget('cart');
        return redirect()->back()->with('message','Check out completed');
    }
    //User login
    public function getLogin(){
        return view('page.Login');
    }
    public function postLogin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:6|max:20'
            ],
            [
                'email.required'=>'Please enter the email',
                'email.email'=>'unavailable email',
                'password.required'=>'Please enter your password',
                'password.min'=>'password has at least 6 letters',
                'password.max'=>'Password no more 20 letters'
            ]
        );
        $credentials = array('email'=>$req->email,'password'=>$req->password);
        
      
            if(Auth::attempt($credentials)){

            return redirect('index')->with(['flag'=>'success','message'=>'success']);
            }
            else{
                return redirect()->back()->with(['flag'=>'danger','message'=>'Unsuccess']);
            }  
    }
    // User register new account
    public function getSignin(){
        return view('page.Signin');
    }
    public function postSignin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email|unique:users,email',
                'password'=>'required|min:6|max:20',
                'fullname'=>'required',
                're_password'=>'required|same:password'
            ],
            [
                'email.required'=>'Please enter the email',
                'email.email'=>'unavailable email',
                'email.unique'=>'Email already exist',
                'password.required'=>'Please enter your password',
                're_password.same'=>'password not match',
                'password.min'=>'password has at least 6 letters'
            ]);
        $user = new User();
        $user->full_name = $req->fullname;
        $user->email = $req->email;
        $user->password = Hash::make($req->password);
        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect('index')->with('message','Success signin');
    }
    // user logout   
    public function postLogout(Request $req){
        $req->session()->flush();
        Auth::logout();
         
        return redirect()->route('trang-chu');
    }
    // add new product (admin ID)
    public function getAdd(){
        return view('page.add-product');
    }
    public function postAdd(Request $req){
        
        $product = new Product();
        $product->name = $req->name;
        $product->id_type = $req->id_type;
        $product->description = $req->description;
        $product->unit_price = $req->unit_price;
        $product->promotion_price = $req->promotion_price;
        $product->unit = $req->unit;
        $product->new = $req->new;

        if(Input::hasFile('image')){
        $file = Input::file('image');
        $file->move(public_path(). '/', $file->getClientOriginalName());

        $product->image=$file->getClientOriginalName();
        
       }
       
       
        $product->save();
        return redirect('add-product')->with(['flag'=>'success','message'=>'Add success!!!!']);
    }
    //search follow key word and price
    public function Search(Request $req){
            $search = $req->search;
            $product = Product::where('name','like',"%$search%")
                               ->orwhere('unit_price','like',"%$search%")
                               ->get(); 
                               return view('page.search',['product'=>$product,'search'=>$search]);
    }
    //Delete product
    public function postDelete($id){
        $product =  Product::find($id);
        $product -> delete();
        return redirect('index');
    }
}
