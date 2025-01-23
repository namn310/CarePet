@extends('Admin.Layout')
@section('content')
@if (session('success'))
<script>
    $.toast({
                          heading: 'Thông báo',
                          text: '{{ session('success') }}',
                          showHideTransition: 'slide',
                          icon: 'success',
                          position: 'bottom-right'
                          })
</script>
@endif
@if (session('error'))
<script>
    $.toast({
                          heading: 'Thông báo',
                          text: '{{ session('error') }}',
                          showHideTransition: 'slide',
                          icon: 'error',
                          position: 'bottom-right'
                          })
</script>
@endif
<style>
    .textdanger {
        font-size: 2vw;
        font-size: 2vh;

    }
</style>
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size:2vw;font-size:2vh">
            <li class="breadcrumb-item"><a href="{{ route('admin.staff') }}">Quản lý nhân viên</a></li>
            <li class="breadcrumb-item active" aria-current="page">Đăng ký lịch làm việc</li>
        </ol>
    </nav>
    <!-- End Page Title -->
    <form style="font-size:2vw;font-size:2vh" id="AddForm" class="row mt-4" method="post"
        action="{{ route('admin.createScheduleStaff') }}" enctype="multipart/form-data"
        style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
        @csrf
        @method('POST')
        <div class="form-group col-md-4">
            <label style="font-weight: bolder;" class="control-label">Nhân viên</label>
            <select class="form-select" name="ID_NV" required>
                @foreach ($listStaff as $row )
                <option value="{{ $row->id }}">{{ $row->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group col-md-4">
            <label style="font-weight: bolder;" class="control-label">Ca làm việc</label>
            <select class="form-select" name="CaLamViec" required>
                <option value="Ca sáng Part-time (7h-11h)">Ca sáng Part-time (7h-11h)</option>
                <option value="Ca chiều Part-time (13h-17h)">Ca chiều Part-time (13h-17h)</option>
                <option value="Ca sáng (7h-15h)">Ca sáng (7h-15h)</option>
                <option value="Ca chiều (14h-22h)">Ca chiều (14h-22h)</option>
            </select>
        </div>
        <div class="form-group col-md-4">
            <label style="font-weight: bolder;" class="control-label">Ngày làm việc</label>
            <input style="font-size:2vw;font-size:2vh" class="form-control" name="NgayLamViec" type="date" required>
        </div>
        <a style="text-decoration:none;color:white"> <button class="btn btn-success mt-4" type="submit" id="addbutton"
                style="width:10%;font-size:2vw;font-size:2vh">Đăng ký</button></a>
    </form>
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
@endsection