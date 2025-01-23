<?php
//class Admin
use App\Http\Controllers\BookingController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\User\AccountUserController;
use App\Http\Controllers\User\CartController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\VoucherController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\PostController;

//class user
use App\Http\Controllers\User\HomeUserController;
use App\Http\Controllers\User\ProductUserController;
use App\Http\Controllers\User\ServiceUserController;
use App\Http\Controllers\User\CommentController;
use App\Http\Controllers\User\checkOutController;
use App\Http\Controllers\User\BookingUserController;
use App\Http\Controllers\User\OrderUserController;
use App\Http\Controllers\User\VoucherUserController;
use App\Http\Controllers\User\PostUserController;

// VNPAY
use App\Http\Controllers\VNPAY\VNPAYController;
//Forgot pass
use App\Http\Controllers\Email\ForgetPasswordController;
use App\Http\Controllers\API\LoginGoogleController;

use Illuminate\Support\Facades\Route;
//     return view('User.test');
// });
// Route::get('test', [TestController::class, 'index'])->name('User.test');
// Route::post('test', [TestController::class, 'store'])->name('test.store');

//Login Google
Route::get('auth/google', [LoginGoogleController::class, 'redirectToGoogle'])->name('loginGoogle');
Route::get('auth/google/callback', [LoginGoogleController::class, 'handleGoogleCallback'])->name('callback');
//user view
Route::get('pdf', function () {
    return view('template.hoadon');
});
Route::group(['namespace' => 'User', 'prefix' => ''], function () {
    //phải đăng nhập mới được truy cập
    Route::middleware('checkLoginUser')->group(function () {
        //infor user
        Route::get('infor', [AccountUserController::class, 'inforUser'])->name('user.infor');
        Route::PUT('infor/{id}', [AccountUserController::class, 'updateInfor'])->name('user.updateInfor');
        //Change pass
        Route::get('changePass', [AccountUserController::class, 'changePassForm'])->name('user.changePassForm');
        Route::put('changePass', [AccountUserController::class, 'ChangePass'])->name('user.changePass');
        //log out
        Route::get('logout', [AccountUserController::class, 'logOut'])->name('user.logout');
        //booking
        Route::post('book', [BookingController::class, 'store'])->name('user.bookCreate');
        //cart checkout
        Route::post('cart/checkout', [CartController::class, 'confirmCheckOut'])->name('user.confirmCheckOut');
        //follow orrder
        Route::get('order', [OrderUserController::class, 'index'])->name('user.orderView');
        Route::put('order/updateBook/{id}', [BookingController::class, 'update'])->name('user.updateBooking');
        Route::get('order/destroyBook/{id}', [BookingController::class, 'destroy'])->name('user.destroyBook');
        Route::get('saveVoucher/{id}', [VoucherUserController::class, 'store'])->name('user.saveVoucher');
        // cart
        Route::post('cart/addPro/{id}', [CartController::class, 'add'])->name('user.add');
        Route::get('cart/destroy', [CartController::class, 'destroyCart'])->name('user.destroyCart');
        Route::post('cart/update', [CartController::class, 'update'])->name('user.cartupdate');
        Route::get('cart/delete/{id}', [CartController::class, 'delete'])->name('user.delete');
        Route::get('cart/voucher', [CartController::class, 'useVoucher'])->name('user.useVoucher');
        // thanh toán VN_PAY
        Route::get('vn_pay/index', function () {
            return view('VN_PAY.index');
        });
        Route::get('vn_pay/vnpay_create_payment', [VNPAYController::class, 'createPayment'])->name('vnpay.createPayment');
        Route::get('vn_pay/vnpay_ipn', [VNPAYController::class, 'vnpay_ipn'])->name('vnpay.vnpay_ipn');
        Route::get('vn_pay/vnpay_pay', function () {
            return view('VN_PAY.vnpay_pay');
        });
        Route::get('vn_pay/vnpay_querydr', function () {
            return view('VN_PAY.vnpay_querydr');
        });
        Route::get('vn_pay/vnpay_refund', function () {
            return view('VN_PAY.vnpay_refund');
        });
        Route::get('vn_pay/vnpay_return', [CartController::class, 'saveOrderVnpay'])->name('vnpay.saveOrderToDB');
        // hủy đơn hàng
        Route::get('orderUser/cancel/{id}', [OrderUserController::class, 'cancelOrder'])->name('user.deleteOrder');
    });
    // xem bài viết
    Route::get('post/{id}/{name}', [PostUserController::class, 'detail'])->name('user.detailPost');
    //forget pass
    Route::get('forgetPass', [ForgetPasswordController::class, 'index'])->name('user.forgetPass');
    Route::post('forgetPass', [ForgetPasswordController::class, 'forgetPass'])->name('user.sendEmail');
    Route::get('notification/{token}', [ForgetPasswordController::class, 'Notification'])->name('user.NotiForgetPass');
    Route::post('resetPass', [ForgetPasswordController::class, 'resetPassword'])->name('user.resetPass');

    Route::get('loginUser', [AccountUserController::class, 'index'])->name('user.login');
    // Route::post('login', [AccountUserController::class, 'login'])->name('user.checkAccount');
    Route::post('loginUser', [AccountUserController::class, 'loginCheck'])->name('user.checkLogin');

    Route::get('registerUser', [AccountUserController::class, 'registerForm'])->name('user.register');
    Route::post('registerUser', [AccountUserController::class, 'register'])->name('user.registAccount');

    Route::get('/', [HomeUserController::class, 'index'])->name('user.home');
    Route::get('about', function () {
        return view('User.about');
    })->name('user.about');
    Route::get('service', [ServiceUserController::class, 'index'])->name('user.service');
    //product
    Route::get('product/{id}', [ProductUserController::class, 'index'])->name('user.product');
    // Route::get('product/{id}', [ProductUserController::class, 'getProduct'])->name('user.getPro');
    Route::get('product/detail/{id}/{name}', [ProductUserController::class, 'getDetail'])->name('user.productDetail');
    Route::get('sort', [ProductUserController::class, 'Product'])->name('user.sortproduct');
    // Route::get('product/nam', [ProductUserController::class, 'SortProduct'])->name('user.sort');

    //comment
    Route::post('product/detail/{id}', [CommentController::class, 'store'])->name('user.comment');
    //booking
    Route::get('book', [BookingUserController::class, 'index'])->name('user.book');
    //contact
    Route::get('contact', function () {
        return view('User.contact');
    })->name('user.contact');
    //Cart
    Route::get('cart', [CartController::class, 'index'])->name('user.cart');
});
//admin view
Route::get('admin/login', function () {
    return view('Admin.pages-login');
})->name('admin.login');
//post đăng nhập
Route::post('login', [UserController::class, 'checkLogin'])->name('admin.checkLogin');
//post đăng ký tài khoản
Route::prefix('admin')->middleware('checkLogin::class')->group(function () {
    // GET
    //quản lý bài viết
    Route::get('post', [PostController::class, 'index'])->name('admin.posts');
    // view tạo mới bài viết
    Route::get('post/createView', [PostController::class, 'createView'])->name('admin.createposts');
    Route::post('post/createView', [PostController::class, 'create'])->name('admin.createPost');
    // post ảnh trong content bài viết
    Route::post('post/ImageInContent/upload', [PostController::class, 'uploadImageInContent'])->name('admin.uploadImageInContent');
    Route::delete('post/delete', [PostController::class, 'Delete'])->name('admin.deletePost');
    //view change post
    Route::get('post/changeView/{id}/{name}', [PostController::class, 'changePostView'])->name('admin.changePostView');
    Route::post('post/update', [PostController::class, 'update'])->name('admin.updatePost');

    // hiển thị lịch làm việc role staff
    //xem chi tiết bài viết
    Route::get('post/detail/{id}', [PostController::class, 'Detail'])->name('admin.detailposts');

    Route::get('ListSchedule', [ScheduleController::class, 'index'])->name('admin.ListScheduleRoleStaff');
    //profile
    Route::get('profile', [UserController::class, 'profile'])->name('admin.profile');
    //Home
    Route::get('', [HomeController::class, 'index'])->name('admin.home');
    //log out
    Route::get('logout', [UserController::class, 'logOut'])->name('admin.logout');
    //product
    Route::get('product', [ProductController::class, 'index'])->name('admin.product');
    //load view form thêm mới sản phẩm
    Route::get(
        'product/add',
        [ProductController::class, 'create']
    )->name('admin.addForm');
    Route::get('product/change/{id}/{name}', [ProductController::class, 'edit'])->name('admin.changeProductView');
    // đăng ký giờ làm việc
    //view đăng ký
    Route::get('staff/schedule/regist', [ScheduleController::class, 'create'])->name('admin.registerScheduleView');
    //category
    Route::get('category', [CategoryController::class, 'index'])->name('admin.category');
    Route::get('category/add', [CategoryController::class, 'create'])->name('admin.categoryForm');
    //service
    Route::get('service', [ServiceController::class, 'index'])->name('admin.service');
    Route::get(
        'service/add',
        [ServiceController::class, 'create']
    )->name('admin.serviceAddView');
    Route::get('service/change/{id}', [ServiceController::class, 'edit'])->name('admin.change');
    //order
    Route::get('order', [OrderController::class, 'index'])->name('admin.order');
    Route::get('order/detail/{id}', [OrderController::class, 'detail'])->name('admin.detail');
    Route::get('order/delivery/{id}', [OrderController::class, 'delivery'])->name('admin.delivery');
    //book
    Route::get('book', [BookingController::class, 'index'])->name('admin.book');
    Route::get('book/detail/{id}', [BookingController::class, 'detail'])->name('admin.bookDetail');
    Route::get('book/update/{id}', [BookingController::class, 'confirmBook'])->name('admin.bookConfirm');
    Route::get('book/cancel/{id}', [BookingController::class, 'UnConfirmBook'])->name('admin.bookUnConfirm');
    Route::get('book/complete/{id}', [BookingController::class, 'completeBooking'])->name('admin.bookComplete');
    Route::post('book/complete', [BookingController::class, 'completeBookingPost'])->name('admin.bookCompletePost');
    // xuất hóa đơn
    Route::get('book/invoice/{id}', [BookingController::class, 'InvoiceBooking'])->name('admin.bookInvoice');

    //banner
    Route::get('banner', [BannerController::class, 'index'])->name('admin.banner');
    Route::get('banner/create', [BannerController::class, 'create'])->name('admin.bannerCreate');
    //discount
    Route::get('discount', [DiscountController::class, 'index'])->name('admin.discount');
    //voucher
    Route::get('voucher', [VoucherController::class, 'index'])->name('admin.voucher');
    // view hóa đơn
    Route::post('order/detail/ExportinvoiceView', [OrderController::class, 'InvoiceView'])->name('admin.invoiceView');
    // xuất hóa đơn
    Route::post('order/detail/Exportinvoice', [OrderController::class, 'ExportInvoice'])->name('admin.exportInvoices');

    //POST
    //changepass
    Route::post('changePass', [UserController::class, 'changePass'])->name('admin.changePass');
    //updateProfile
    Route::post('updateProfile', [UserController::class, 'updateProfile'])->name('admin.updateProfile');
    Route::post('product/add', [ProductController::class, 'store'])->name('admin.createProduct');
    Route::put('product/change/{id}/{name}', [ProductController::class, 'update'])->name('admin.updateProduct');
    // xử lý đăng ký giờ làm việc
    Route::post('staff/schedule/create', [ScheduleController::class, 'createSchedule'])->name('admin.createScheduleStaff');
    // các chức năng của người quản trị
    Route::middleware('CheckRoleAdmin')->group(function () {
        //register
        Route::get('register', function () {
            return view('Admin.register');
        })->name('admin.regist');
        //customer
        Route::get('customer', [CustomerController::class, 'index'])->name('admin.customer');
        //staff
        Route::get('staff', [StaffController::class, 'index'])->name('admin.staff')->middleware('CheckRoleAdmin');
        Route::get('staff/create', [StaffController::class, 'create'])->name('admin.staffCreate');
        Route::post('staff/store', [StaffController::class, 'store'])->name('admin.staffStore');
        Route::get('satff/destroy/{id}', [StaffController::class, 'destroy'])->name('admin.staffDestroy');
        Route::get('staff/edit/{id}/{name}', [StaffController::class, 'edit'])->name('admin.staffEdit');
        Route::put('staff/edit/{id}/{name}', [StaffController::class, 'update'])->name('admin.staffUpdate');
        Route::post('register', [UserController::class, 'store'])->name('admin.register');
        // xác nhận lịch làm việc của nhân viên
        Route::post('staff/schedule/confirm', [ScheduleController::class, 'ConfirmSchedule'])->name('admin.confirmSchedule');
        Route::post('staff/schedule/update', [ScheduleController::class, 'updateSchedule'])->name('admin.updateSchedule');
        // lấy thông tin chi tiết lịch làm việc
        Route::get('staff/schedule/detail/{id}', [ScheduleController::class, 'getDetailSchedule'])->name('admin.detailSchedule');
        // xóa lịch làm việc
        Route::delete('staff/schedule/delete', [ScheduleController::class, 'deleteSchedule'])->name('admin.deleteSchedule');
        Route::delete('order/delete/{id}', [OrderController::class, 'destroy'])->name('admin.deleteOrder');
        Route::delete('category/delete/{id}', [CategoryController::class, 'destroy'])->name('admin.deleteCat');
        Route::delete('service/delete/{id}', [ServiceController::class, 'destroy'])->name('admin.deleteService');
        Route::delete('discount/delete/{id}', [DiscountController::class, 'destroy'])->name('admin.destroyDiscount');
        Route::delete('voucher/delete/{id}', [VoucherController::class, 'destroy'])->name('admin.destroyVoucher');
        Route::get('voucher/create', [VoucherController::class, 'create'])->name('admin.createVoucher');
        Route::get('voucher/change/{id}/{name}', [VoucherController::class, 'edit'])->name('admin.changeVoucher');
        Route::get('discount/create', [DiscountController::class, 'create'])->name('admin.createDiscount');
        Route::get('discount/change/{id}/{name}', [DiscountController::class, 'edit'])->name('admin.changeDiscount');
        Route::delete('product/delete/{id}', [ProductController::class, 'destroy'])->name('admin.deleteProduct');
        //Quan ly account
        Route::get('account', [UserController::class, 'index'])->name('admin.manageAccount');
        Route::get('account/{id}', [UserController::class, 'destroy'])->name('admin.destroy');
    });

    Route::post('category/add', [CategoryController::class, 'store'])->name('admin.createCat');
    Route::PUT('category/update/{id}', [CategoryController::class, 'update'])->name('admin.updateCat');
    Route::post('service/add', [ServiceController::class, 'store'])->name('admin.AddService');
    Route::post('service/change/{id}', [ServiceController::class, 'update'])->name('admin.updateService');
    Route::post('banner/create', [BannerController::class, 'store'])->name('admin.bannerStore');
    Route::post('discount/create', [DiscountController::class, 'store'])->name('admin.storeDiscount');
    Route::patch('discount/change/{id}/{name}', [DiscountController::class, 'update'])->name('admin.updateDiscount');
    Route::post('voucher/store', [VoucherController::class, 'store'])->name('admin.storeVoucher');
    Route::patch('voucher/change/{id}/{name}', [VoucherController::class, 'update'])->name('admin.updateVoucher');
});
/*Route::get('/', function () {
    return view('welcome');
});*/
