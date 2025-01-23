@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    @if (session('alert'))
    <script>
        $.toast({
                            heading: 'Success',
                            text: '{{ session('alert') }}',
                            showHideTransition: 'slide',
                            icon: 'success',
                            position: 'bottom-right'
                            })
    </script>
    {{-- <div class="alert alert-success alert-dismissible" style="width:20%;position: absolute;right:20px;bottom:30px">
        <p>{{ session('alert') }}</p>
        <button class="btn btn-close" data-bs-dismiss="alert"></button>
    </div> --}}
    @endif
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size: 22px;">
            <li class="breadcrumb-item"><a href="{{ route('admin.service') }}">Quản lý dịch vụ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thêm dịch vụ</li>
        </ol>
    </nav>

    <!-- End Page Title -->
    <form id="AddForm" method="post" class="AddForm row mt-4" action="{{ route('admin.AddService') }}"
        enctype="multipart/form-data"
        style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
        @csrf
        @method('POST')
        <div class="form-group ">
            <label style="font-weight: bolder;" class="control-label">Tên dịch vụ</label>
            <input class="form-control" id="nameDM" name="nameDM" onclick="checkName()" style="max-width:50%"
                onchange="checkName()" type="text">
        </div>

        <br>
        <div class="form-group mt-3">
            <label style="font-weight: bolder;" class="control-label">Ảnh dịch vụ</label>
            <input class="form-control" id="nameDM" name="hinhanh" onclick="checkName()" style="max-width:30%"
                onchange="checkName()" type="file">
        </div>

        <button class="btn btn-success mt-4" type="submit" href="" id="addbutton" style="width:10%">Thêm</button>
    </form>
</div>
<!-- ======= Footer ======= -->
<script>
    function checkName() {
        var name_correct =
            /^[A-Za-z-\sAÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬBCDĐEÈẺẼÉẸÊỀỂỄẾỆFGHIÌỈĨÍỊJKLMNOÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢPQRSTUÙỦŨÚỤƯỪỬỮỨỰVWXYỲỶỸÝỴZaàảãáạăằẳẵắặâầẩẫấậbcdđeèẻẽéẹêềểễếệfghiìỉĩíịjklmnoòỏõóọôồổỗốộơờởỡớợpqrstuùủũúụưừửữứựvwxyỳỷỹýỵz]+$/;
        var name = document.getElementById("nameDM");
        var name_val = document.getElementById("nameDM").value;
        if (name_val == "" || name_correct.test(name_val) == false) {
            name.classList.add("is-invalid");
            return false;
        } else {
            name.classList.remove("is-invalid");
            name.classList.add("is-valid");
            return true;
        }
    }
</script>
@endsection