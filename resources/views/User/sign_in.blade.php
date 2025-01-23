<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Care</title>
    <link rel="shortcut icon" type="image/png" href="{{ asset('assets/img/PetCARE.png') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/css/user-responsive.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/user1.css') }}">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    {{-- toast message --}}
    <script src="
            https://cdn.jsdelivr.net/npm/jquery-toast-plugin@1.3.2/dist/jquery.toast.min.js
            "></script>
    <link href="
        https://cdn.jsdelivr.net/npm/jquery-toast-plugin@1.3.2/dist/jquery.toast.min.css
        " rel="stylesheet">
</head>


<body>
    @if (session('statusError'))
    <script>
        $.toast({
                heading: 'Thông báo',
                text: '{{ session('statusError') }}',
                showHideTransition: 'slide',
                icon: 'error',
                position: 'bottom-right'
            })
    </script>
    @endif
    @if (session('statusSuccess'))
    <script>
        $.toast({
                    heading: 'Thông báo',
                    text: '{{ session('statusSuccess') }}',
                    showHideTransition: 'slide',
                    icon: 'success',
                    position: 'bottom-right'
                })
    </script>
    @endif
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row border rounded-5 p-3 bg-white shadow box-area">
            <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                style="background:  #FFE4DA;">
                <div class="featured-image mb-3">
                    <img src="{{ asset('assets/img/PetCARE.png') }}" class="img-fluid mt-3" style="width:100%">
                </div>
            </div>
            <div class="col-md-6 right-box">
                <div class="row align-items-center text-center">
                    <div class="header-text mb-4">
                        <h3 style="font-family: 'Courier New', Courier, monospace;font-weight: 600;">Đăng Ký</h3>
                    </div>
                    <form id="loginForm" method="post" action="{{ route('user.registAccount') }}">
                        @csrf
                        @method('POST')
                        <div class="form-group mb-3">
                            <input type="username" name="name" class="form-control form-control-lg bg-light fs-6"
                                id="name" placeholder="Tên người dùng">
                            @error('name')
                            <p class="UsernameError text-danger text-start ps-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group mb-3">
                            <input name="email" class="form-control form-control-lg bg-light fs-6" id="email"
                                placeholder="Địa chỉ Email">
                            @error('email')
                            <p class="emailError text-danger text-start ps-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" name="phone" class="form-control form-control-lg bg-light fs-6"
                                id="phone" placeholder="Số điện thoại">
                            @error('phone')
                            <p class=" text-danger text-start ps-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" name="password" class="form-control form-control-lg bg-light fs-6"
                                id="password" placeholder="Mật Khẩu">
                            @error('password')
                            <p class="passwordError text-danger text-start ps-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" name="password_confirmation"
                                class="form-control form-control-lg bg-light fs-6" id="Repassword"
                                placeholder="Nhập lại mật khẩu">
                            @error('password_confirmation')
                            <p class="passwordError text-danger text-start ps-1">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="input-group mb-3">
                            <button class="btn btn-lg btn-warning w-100 fs-6" type="submit" name="dangky"
                                id="submit">Đăng Ký</button>
                        </div>
                    </form>
                    <div class="row">
                        <small>Bạn đã có tài khoản? <a href="{{ route('user.login') }}">Đăng Nhập</a></small>
                    </div>

                </div>
            </div>


        </div>
    </div>
    <script src="{{ asset('assets/js/regist_account.js') }}"></script>
</body>

</html>