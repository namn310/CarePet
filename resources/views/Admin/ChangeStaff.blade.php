@extends('Admin.Layout')
@section('content')
@if (session('notice'))
<script>
  $.toast({
                          heading: 'Error',
                          text: '{{ session('notice') }}',
                          showHideTransition: 'slide',
                          icon: 'error',
                          position: 'bottom-right'
                          })
</script>
<style>
  .textdanger {
    font-size: 2vw;
    font-size: 2vh;

  }
</style>
@endif
<div class="pagetitle">
  <nav aria-label="breadcrumb">
    <ol style="font-size:2vw;font-size:2vh" class="breadcrumb">
      <li class="breadcrumb-item"><a href="{{ route('admin.staff') }}">Quản lý nhân viên</a></li>
      <li class="breadcrumb-item active" aria-current="page">Chi tiết nhân viên</li>
    </ol>
  </nav>
  @foreach ($staff as $row )
  <!-- End Page Title -->
  <form style="font-size:2vw;font-size:2vh" id="AddForm" class="row mt-4" method="post"
    action="{{ route('admin.staffUpdate',['id'=>$row->id,'name'=>$row->name]) }}" enctype="multipart/form-data"
    style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
    @csrf
    @method('PUT')
    <div class="form-group col-md-4">
      <label style="font-weight: bolder;" class="control-label">Họ và tên</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" id="nameNV" value="{{ $row->name }}" name="nameNV"
        type="text" required>
      @error('nameNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>
    <div class="form-group col-md-4">
      <label style="font-weight: bolder;" class="control-label">Địa chỉ email</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" id="emailNV" value="{{ $row->email }}"
        name="emailNV" type="text" required>
      @error('emailNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>
    <div class="form-group col-md-4">
      <label style="font-weight: bolder;" class="control-label mt-3">Địa chỉ thường trú</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" id="localNV" value="{{ $row->local }}"
        name="localNV" type="text" required>
      @error('localNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>
    <div class="form-group  col-md-4">
      <label style="font-weight: bolder;" class="control-label mt-3">Số điện thoại</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" id="phoneNV" value="{{ $row->phone }}"
        name="phoneNV" type="text" required>
      @error('phoneNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>

    <div class="form-group  col-md-3">
      <label style="font-weight: bolder;" style="font-weight: bolder;" class="control-label mt-3">Ngày tháng năm
        sinh</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" id="dateNV" value="{{ $row->date }}" name="dateNV"
        type="date" required>
      @error('dateNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>
    <div class="form-group col-md-3">
      <label style="font-weight: bolder;" class="control-label mt-3">Số CMND/CCCD</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" name="CMND" value="{{ $row->CMND }}" id="CMND"
        type="text" required>
      @error('CMND')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>

    <div class="form-group col-md-3">
      <label style="font-weight: bolder;" class="control-label mt-3">Giới tính</label>
      <select style="font-size:2vw;font-size:2vh" class="form-control" name="sex" id="sex" id="exampleSelect2" required>
        <option>{{ $row->sex }}</option>
        <option>Nam</option>
        <option>Nữ</option>
        <option>Khác</option>
      </select>
      @error('sex')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>

    <div class="form-group  col-md-3">
      <label style="font-weight: bolder;" class="control-label mt-3">Chức vụ</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" value="{{ $row->chucvu }}" name="chucvu" required>
      @error('chucvu')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>


    <div class="form-group col-md-12">
      <label style="font-weight: bolder;" class="control-label mt-3">Ảnh 3x4 nhân viên</label>
      <input style="font-size:2vw;font-size:2vh" class="form-control" style="width:50%" type="file" id="uploadImgNV"
        name="imgNV">
      <img class="img-fluid mt-2" style="max-width:200px" src="{{ asset('assets/img-nhanvien/'.$row->image) }}">
      @error('imgNV')
      <small class="text-danger">{{ $message }}</small>
      @enderror
    </div>

    <a style="text-decoration:none;color:white"> <button class="btn btn-success mt-4" type="submit" id="addbutton"
        style="width:10%;font-size:2vw;font-size:2vh">Cập nhật</button></a>
  </form>
  @endforeach
</div>
<script type="text/javascript">
  const toastTrigger = document.getElementById('liveToastBtn')
  const toastLiveExample = document.getElementById('liveToast')

  if (toastTrigger) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastTrigger.addEventListener('click', () => {
      toastBootstrap.show()
    })
  }
</script>

<script src="{{ asset('assets/js/admin/changeStaff.js') }}"></script>
@endsection