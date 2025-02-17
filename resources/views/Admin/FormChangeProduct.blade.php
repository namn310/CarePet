@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size:2vw;font-size:2vh">
            <li class="breadcrumb-item"><a href="index.php?controller=product">Quản lý sản phẩm</a></li>
            <li class="breadcrumb-item active" aria-current="page">Sửa sản phẩm</li>
        </ol>
    </nav>
    <div style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
        <!-- End Page Title -->
        <form style="font-size:2vw;font-size:2vh" method="post" id="AddProForm"
            action="{{ route('admin.updateProduct',['id'=>$product->idPro,'name'=>$product->namePro]) }}"
            enctype="multipart/form-data" class="row mt-4">
            @csrf
            @method('PUT')
            <div class="form-group col-md-8">
                <label style="font-weight: bolder;" class="control-label">Tên sản phẩm</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" id="namepro"
                    value="{{ $product->namePro }}" name="namepro" onclick="checkName()" onchange="checkName()"
                    type="text" required>
            </div>
            <div class="form-check ms-3">
                <label style="font-weight: bolder;" class="form-check-label">Sản phẩm hot</label>
                @if ($product->hot>0)
                <input style="font-size:2vw;font-size:2vh" type="hidden" name="hotPro" value="0">
                <input style="font-size:2vw;font-size:2vh" type="checkbox" class="form-check-input" checked
                    name="hotPro" value="1">
                @else
                <input style="font-size:2vw;font-size:2vh" type="hidden" name="hotPro" value="0">
                <input style="font-size:2vw;font-size:2vh" type="checkbox" class="form-check-input" name="hotPro"
                    value="1">
                @endif
            </div>
            <div class="form-group col-md-4">
                <label style="font-weight: bolder;" class="control-label">Số lượng</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" value="{{ $product->count }}"
                    onclick="checkCount()" onchange="checkCount()" name="countpro" id="countpro" type="text" required>
            </div>
            <div class="form-group col-md-4">
                <label style="font-weight: bolder;" class="control-label mt-3">Giá bán(VND)</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" id="giabanpro"
                    value="{{ $product->cost }}" name="giabanpro" onclick="checkGiaBanPro()" onchange="checkGiaBanPro()"
                    type="text" required>
            </div>
            <div class="form-group  col-md-4">
                <label style="font-weight: bolder;" class="control-label mt-3">Giảm giá(%)</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" id="giavonpro" name="discount"
                    value="{{ $product->discount }}" onclick="checkGiaVonPro()" onchange="checkGiaVonPro()" type="text">
            </div>
            <div class="form-group col-md-3">
                <label style="font-weight: bolder;" class="control-label mt-3">Danh mục</label>
                <select style="font-size:2vw;font-size:2vh" class="form-control" onclick="checkDanhMuc()"
                    onchange="checkDanhMuc()" id="danhmucAddpro" name="danhmucAddpro" required>
                    <option>{{ $product->getCategory($product->idCat) }}</option>
                    @foreach ($category as $row )
                    <option>{{ $row->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group ">
                <label style="font-weight: bolder;" class="control-label mt-3">Mô tả sản phẩm</label>
                <textarea style="font-size:2vw;font-size:2vh" id="mota" name="mota"
                    class="form-control">{{ $product->description }} </textarea>
                <script type="text/javascript">
                    CKEDITOR.replace("mota");
                </script>
            </div>
            <div class="form-group col-md-12">
                <label style="font-weight: bolder;" class="control-label mt-3">Ảnh sản phẩm</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" multiple id="imagepro" name="imagepro[]"
                    style="width:30%" type="file">
                @foreach ($product->getAllImg($product->idPro) as $img )
                <img style="width:200px;height:200px;margin-top:20px"
                    src="{{ asset('assets/img-add-pro/'.$img->image) }}">
                @endforeach
            </div>
            <button class="btn btn-success mt-4 ms-2" type="submit" id="buttonAddPro"
                style="width:10%;font-size:2vw;font-size:2vh" name="addproduct">Cập nhật
            </button>
        </form>
    </div>
</div>
<script src="{{ asset('assets/js/ckeditor/ckeditor.js') }}"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/translations/vi.js"> </script>
<script src="{{ asset('assets/js/admin/addproduct.js') }}"></script>
<style>
    .ck-editor__editable_inline {
        min-height: 250px;
        max-height: 450px;
    }
</style>
<script>
    ClassicEditor.create(document.querySelector('#mota'), {
            language: 'vi'
        })
        .then(editor => {})
        .catch(error => {
            console.error(error)
        });
</script>
@endsection