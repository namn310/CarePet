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
    <h1 style="font-size:2.5vw;font-size:2.5vh">Quản lý sản phẩm</h1>
    <!-- End Page Title -->
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
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

                        <button style="font-size:2vw;font-size:2vh" id="uploadfile"
                            class="btn btn-success btn-sm nhap-tu-file" type="button" title="Nhập"><a
                                style="color:white" href="{{ route('admin.addForm') }}"><i class="fas fa-plus"></i>>
                                Tạo mới sản phẩm</a></button>
                    </div>
                    <div class="search mt-4 mb-4 input-group" style="width:50%">
                        <button style="font-size:2vw;font-size:2vh" class="input-group-text btn btn-success"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                        <input class="form-control" type="text" id="searchProduct">
                    </div>
                    <div class="table-responsive">
                        <table style="font-size:2vw;font-size:2vh" class="table table-hover table-bordered "
                            id="sampleTable">
                            <thead>
                                <tr class="table-success text-center">
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Tình trạng</th>
                                    <th>Giá tiền</th>
                                    <th>Giảm giá</th>
                                    <th>Hot</th>
                                    @if ($roleAccount === 'admin')
                                    <th>Chức năng</th>
                                    @endif

                                </tr>
                            </thead>
                            <tbody id="table-product">
                                @foreach ($product as $row)
                                <tr class="text-center">
                                    <td>{{ $row->idPro }}</td>
                                    <td>{{ $row->namePro }}</td>
                                    <td class="text-center"><img
                                            src="{{ asset('assets/img-add-pro/' . $row->getImgProduct($row->idPro)) }}"
                                            style="width:10vw;height:auto"></td>
                                    <td>{{ $row->count }}</td>

                                    @if ($row->count > 0)
                                    <td><button class="btn btn-success">Còn hàng</button></td>
                                    @else
                                    <td><button class="btn btn-danger">Hết hàng</button></td>
                                    @endif
                                    <td>{{ $row->cost }}</td>
                                    @if ($row->discount > 0)
                                    <td>{{ $row->discount }}%</td>
                                    @else
                                    <td></td>
                                    @endif
                                    @if ($row->hot > 0)
                                    <td><i class="fa-solid fa-check" style="color: #06e302;"></i></td>
                                    @else
                                    <td></td>
                                    @endif
                                    @if($roleAccount === 'admin')
                                    <td class="table-td-center">
                                        <a> <button style="font-size:2vw;font-size:2vh"
                                                class="btn btn-danger btn-sm trash" data-bs-toggle="modal"
                                                data-bs-target="#delete-product{{ $row->idPro }}" type="button"
                                                title="Xóa">
                                                <i class="fas fa-trash-alt"></i>
                                            </button></a>
                                        <button style="font-size:2vw;font-size:2vh" class="btn btn-success btn-sm edit"
                                            type="button" title="Sửa" id="show-emp">
                                            <a style="text-decoration:none;color:white"
                                                href="{{ route('admin.changeProductView', ['id' => $row->idPro,'name'=>$row->namePro]) }}"><i
                                                    class="fas fa-edit"></i> </a>
                                        </button>
                                        <!-- Modal xóa -->
                                        <div class="modal fade" id="delete-product{{ $row->idPro }}" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông
                                                            báo
                                                        </h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có muốn xóa không ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary"
                                                            data-bs-dismiss="modal">Close</button>
                                                        <form
                                                            action="{{ route('admin.deleteProduct', ['id' => $row->idPro]) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    @endif
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            {{ $product->links('pagination::bootstrap-5') }}
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
            $("#searchProduct").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#table-product tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
</script>
@endsection