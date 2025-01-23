@extends('Admin.Layout')>
@section('content')
<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

$idUser = Auth::user()->id;
$role = DB::table('users')->select('role','id')->where('id',$idUser)->first();
$roleAccount = $role->role;
?>
<div class="pagetitle">
  <h1 style="font-size:2.5vw;font-size:2.5vh">Quản lý dịch vụ</h1>
  <!-- End Page Title -->
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
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
          @endif
          <div class="button-function d-flex justify-content-between mt-3 mb-4" style="width:70%">

            <button style="font-size:2vw;font-size:2vh" id="uploadfile" class="btn btn-success" type="button"
              title="Nhập"><a id="addnhanvien" href="{{ route('admin.serviceAddView') }}"><i class="fas fa-plus"></i>>
                Tạo mới dịch vụ</a></button>
          </div>
          <div class="search mt-4 mb-4 input-group" style="width:50%">
            <button class="input-group-text btn btn-success"><i class="fa-solid fa-magnifying-glass"></i></button>
            <input style="font-size:2vw;font-size:2vh" class="form-control" type="text" id="searchNV">
          </div>
          <table style="font-size:2vw;font-size:2vh"
            class="table table-hover table-bordered text-center table-responsive" cellpadding="0" cellspacing="0"
            border="0" id="sampleTable">
            <thead>
              <tr class="table-primary">
                <th>
                  ID danh mục
                </th>
                <th>
                  Tên dịch vụ
                </th>
                <th>
                  Thời gian tạo
                </th>
                @if ($roleAccount === 'admin')
                <th>
                  Tính năng
                </th>
                @endif

              </tr>
            </thead>
            <tbody id="table-nv">
              @foreach ($service as $row )
              <tr>
                <td>{{ $row->id }}</td>
                <td>{{ $row->name }}</td>
                <td>{{ $row->created_at }}</td>
                @if ($roleAccount === 'admin')
                <td>
                  <a> <button style="font-size:2vw;font-size:2vh" class="btn btn-danger" data-bs-toggle="modal"
                      data-bs-target="#delete-service{{ $row->id }}"><i class="fa-solid fa-x"></i></button></a>
                  <!-- Modal xóa -->
                  <div class="modal fade" id="delete-service{{ $row->id }}" tabindex="-1"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          Bạn có muốn xóa không ?
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                          <form action="{{ route('admin.deleteService',['id'=>$row->id]) }}" method="POST">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">Xóa</button>
                          </form>

                        </div>
                      </div>
                    </div>
                  </div>
                  {{-- Change --}}
                  <a href="{{ route('admin.change',['id'=>$row->id]) }}"> <button style="font-size:2vw;font-size:2vh"
                      class="btn btn-success"><i class="fas fa-edit"></i></button></a>
                </td>
                @endif

              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
      {{ $service->links('pagination::bootstrap-5') }}
    </div>
  </div>
</div>
@endsection