@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size: 22px;">
            <li class="breadcrumb-item"><a href="{{ route('admin.book') }}">Danh sách lịch hẹn</a></li>
            <li class="breadcrumb-item active" aria-current="page">Hoàn thành lịch hẹn</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="container-fluid border border-primary rounded">
    @foreach ($book as $row)
    <div class="p-4">
        <div class="name d-inline-block">
            <span>
                <b class="me-3"> Tên khách hàng: <span class="text-danger">{{ $book1->getCus($row->idCus) }}</span> </b>
            </span>
        </div>
        <div class="phone mt-4">
            <span>
                <b class="me-3">Số điện thoại: <span class="text-danger">{{ $book1->getPhone($row->idCus) }}</span></b>
            </span>
        </div>
        <div class="namePet mt-4">
            <span>
                <b class="me-3">Tên Pet: <span class="text-danger">{{ $row->name }}</span></b>
            </span>
        </div>
        <div class="weight mt-4">
            <span>
                <b class="me-3">Cân nặng: <span class="text-danger">{{ $row->weight }}</span></b>
            </span>
        </div>
        <div class="nameService mt-4">
            <span>
                <b class="me-3">Tên dịch vụ: <span class="text-danger">{{ $row->name_service }}</span></b>
            </span>
        </div>
        <div class="goi mt-4">
            <span>
                <b class="me-3">Gói: <span class="text-danger">{{ $row->type }}</span></b>
            </span>
        </div>
        <div class="dateBook mt-4">
            <span>
                <b class="me-3">Ngày hẹn: <span class="text-danger">{{
                        \Carbon\Carbon::parse((int)$row->date)->format('d-m-Y H:i:s') }}</span></b>
            </span>
        </div>
        <div class="dateCre mt-4">
            <span>
                <b class="me-3">Ngày tạo: <span class="text-danger">{{
                        \Carbon\Carbon::parse($row->created_at)->format('d-m-Y H:i:s') }}</span></b>
            </span>
        </div>
        <div class="local mt-4 mb-2">
            @if ($row->status == 1)
            <button class="btn btn-success">Đã duyệt</button>
            @elseif ($row->status == 2)
            <button class="btn btn-success">Đã hoàn thành</button>
            @else
            <button class="btn btn-danger">Chưa duyệt</button>
            @endif
        </div>
        <form method="post" action="{{ route('admin.bookCompletePost') }}">
            @csrf
            <input value="{{ $row->id }}" name="IdBookComplete" hidden>
            <label><b>Nhập giá tiền dịch vụ</b></label>
            <input name="costBook" value="{{ $row->cost !== '' ? $row->cost : '' }}" type="text" class="form-control"
                required>
            <button class="btn btn-primary mt-2">Cập nhật</button>
        </form>
    </div>
    @endforeach
</div>
@endsection