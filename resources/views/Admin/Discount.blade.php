@extends('Admin.Layout')
@section('content')
<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

$idUser = Auth::user()->id;
$role = DB::table('users')->select('role','id')->where('id',$idUser)->first();
$roleAccount = $role->role;
?>
<div class="pagetitle">
    <h1 style="font-size:2.5vw;font-size:2.5vh">Quản lý chương trình khuyến mại</h1>
    <!-- End Page Title -->
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    @if (session('success'))
                    <script>
                        $.toast({
                                    heading: 'Success',
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
                                    heading: 'Error',
                                    text: '{{ session('error') }}',
                                    showHideTransition: 'slide',
                                    icon: 'error',
                                    position: 'bottom-right'
                                })
                    </script>
                    @endif
                    @if (session('notice'))
                    <script>
                        $.toast({
                                    heading: 'Success',
                                    text: '{{ session('notice') }}',
                                    showHideTransition: 'slide',
                                    icon: 'success',
                                    position: 'bottom-right'
                                })
                    </script>
                    @endif
                    <div class="button-function d-flex justify-content-between mt-3 mb-4" style="width:70%">
                        <button style="font-size:2vw;font-size:2vh" id="uploadfile" class="btn btn-success"
                            type="button" title="Nhập"><a id="addnhanvien" href="{{ route('admin.createDiscount') }}"><i
                                    class="fas fa-plus"></i>>
                                Tạo mới chương trình khuyến mại</a></button>
                    </div>
                    <div class="search mt-4 mb-4 input-group" style="width:50%">
                        <button style="font-size:2vw;font-size:2vh" class="input-group-text btn btn-success"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                        <input class="form-control" type="text" id="searchNV">
                    </div>
                    <table style="font-size:2vw;font-size:2vh" class="table table-hover table-bordered text-center"
                        cellpadding="0" cellspacing="0" border="0" id="sampleTable">
                        <thead>
                            <tr class="table-primary">
                                <th>
                                    Tên chương trình khuyến mại
                                </th>
                                <th>
                                    Giảm giá
                                </th>
                                <th>Sản phẩm áp dụng</th>
                                <th>
                                    Thời gian bắt đầu
                                </th>
                                <th>Thời gian kết thúc</th>
                                <th>
                                    Tình trạng
                                </th>
                                @if ($roleAccount === 'admin')
                                <th>
                                    Tính năng
                                </th>
                                @endif

                            </tr>
                        </thead>
                        <tbody id="table-nv">
                            @foreach ($discount as $row)
                            <tr>
                                <td>{{ $row->name }}</td>
                                <td>{{ $row->discount }}%</td>
                                <td>
                                    {{ $category->getCategoryName($row->idCat) }}
                                </td>
                                <td>{{
                                    \Carbon\Carbon::parse($row->time_start)->format('d-m-Y') }}</td>
                                <td>{{
                                    \Carbon\Carbon::parse($row->time_end)->format('d-m-Y') }}</td>
                                @if ($row->status == 2)
                                <td>
                                    <p class="text-secondary">Chương trình chưa diễn ra</p>
                                </td>
                                @elseif ($row->status == 1)
                                <td>
                                    <p class="text-success">Chương trình đang diễn ra</p>
                                </td>
                                @else
                                <td>
                                    <p class="text-danger">Chương trình đã kết thúc</p>
                                </td>
                                @endif
                                @if ($roleAccount === 'admin')
                                <td class="table-td-center">
                                    <button style="font-size:2vw;font-size:2vh" class="btn btn-danger btn-sm trash"
                                        data-bs-target="#delete{{ $row->id }}" data-bs-toggle="modal" type="button">
                                        <a style="color:white"> <i class="fas fa-trash-alt"></i></a>
                                    </button>
                                    <!-- Modal xóa -->
                                    <div class="modal fade" id="delete{{ $row->id }}" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo
                                                    </h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Bạn có muốn xóa chương trình này không ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary"
                                                        data-bs-dismiss="modal">Close</button>
                                                    <form
                                                        action="{{ route('admin.destroyDiscount', ['id' => $row->id]) }}"
                                                        method="POST">
                                                        @csrf
                                                        @method('DELETE')

                                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    {{-- button sửa danh mục --}}
                                    <button style="font-size:2vw;font-size:2vh" class="btn btn-success btn-sm edit"
                                        type="button" title="Sửa" id="show-emp" data-bs-toggle="modal"
                                        data-bs-target="#update">
                                        <a style="text-decoration:none;color:white"
                                            href="{{ route('admin.changeDiscount', ['id' => $row->id,'name'=>$row->name]) }}">
                                            <i class="fas fa-edit"></i></a>
                                    </button>
                                </td>
                                @endif

                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {{ $discount->links('pagination::bootstrap-5') }}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
            $("#searchNV").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#table-nv tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
</script>
@endsection