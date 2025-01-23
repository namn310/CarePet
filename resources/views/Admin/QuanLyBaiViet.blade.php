@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <h1 style="font-size:2.5vw;font-size:2.5vh">Quản lý bài viết</h1>
    <!-- End Page Title -->
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
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
                    <div class="button-function d-flex justify-content-between mt-3 mb-4" style="width:70%">

                        <button style="font-size:2vw;font-size:2vh" id="uploadfile" class="btn btn-success"
                            type="button" title="Nhập"><a id="addnhanvien" href="{{ route('admin.createposts') }}"><i
                                    class="fas fa-plus"></i>>
                                Tạo bài viết mới</a></button>
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
                                    ID bài viết
                                </th>
                                <th>
                                    Tên bài viết
                                </th>
                                <th>
                                    Người tạo
                                </th>
                                <th>
                                    Tính năng
                                </th>
                            </tr>
                        </thead>
                        <tbody id="table-nv">
                            @foreach ( $posts as $row )
                            <tr>
                                <td>{{ $row->id }}</td>
                                <td><a style="text-decoration:none;color:black"
                                        href="{{ route('admin.detailposts',['id'=>$row->id]) }}">{{ $row->title }}</a>
                                </td>
                                <td>{{ $row->creater }}</td>
                                <td>
                                    <a> <button style="font-size:2vw;font-size:2vh" class="btn btn-danger"
                                            data-bs-toggle="modal" data-bs-target="#delete-post{{ $row->id }}"><i
                                                class="fa-solid fa-x"></i></button></a>
                                    <!-- Modal xóa -->
                                    <div class="modal fade" id="delete-post{{ $row->id }}" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Bạn có muốn xóa không ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary"
                                                        data-bs-dismiss="modal">Close</button>
                                                    <form action="{{ route('admin.deletePost') }}" method="POST">
                                                        @csrf
                                                        <input value="{{ $row->id }}" hidden name="IdPostDelete">
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Xóa</button>
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a style="text-decoration: none"
                                        href="{{ route('admin.changePostView',['id'=>$row->id,'name'=>$row->title]) }}">
                                        <button style="font-size:2vw;font-size:2vh" class="btn btn-primary"><i
                                                class="fa-solid fa-gear"></i></button></a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            {{ $posts->links('pagination::bootstrap-5') }}
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