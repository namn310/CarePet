@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size:2vw;font-size:2vh">
            <li class="breadcrumb-item"><a href="{{ route('admin.category') }}">Quản lý danh mục</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thêm danh mục</li>
        </ol>
    </nav>
    @if (session('error'))
    <div class="alert alert-danger alert-dismissible" style="width:20%;position: absolute;right:20px;top:100px">
        <p>{{ session('error') }}</p>
        <button class="btn btn-close" data-bs-dismiss="alert"></button>
    </div>
    @endif
    <!-- End Page Title -->
    <form style="font-size:2vw;font-size:2vh" id="AddForm" method="post" class="AddForm row mt-4"
        action="{{ route('admin.createCat') }}" enctype="multipart/form-data"
        style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
        @csrf

        <div class="form-group col-md-4">
            <label style="font-weight: bolder;" class="control-label">Tên danh mục</label>
            <input style="font-size:2vw;font-size:2vh" class="form-control" id="nameDM" name="nameDM"
                onclick="checkName()" onchange="checkName()" type="text">
        </div>
        <button class="btn btn-success mt-4" type="submit" href="" id="addbutton"
            style="width:10%;font-size:2vw;font-size:2vh">Thêm</button>
    </form>
</div>
<script>
    function checkName() {
        var name_correct =
            /^[A-Za-z\sAÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬBCDĐEÈẺẼÉẸÊỀỂỄẾỆFGHIÌỈĨÍỊJKLMNOÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢPQRSTUÙỦŨÚỤƯỪỬỮỨỰVWXYỲỶỸÝỴZaàảãáạăằẳẵắặâầẩẫấậbcdđeèẻẽéẹêềểễếệfghiìỉĩíịjklmnoòỏõóọôồổỗốộơờởỡớợpqrstuùủũúụưừửữứựvwxyỳỷỹýỵz]+$/;
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