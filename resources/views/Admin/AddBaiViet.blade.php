@extends('Admin.Layout')
@section('content')
<script src="{{ asset('assets/js/ckeditor/ckeditor.js') }}"></script>
{{-- <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script> --}}
<script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/translations/vi.js"></script>
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
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size:2vw;font-size:2vh">
            <li class="breadcrumb-item"><a href="{{ route('admin.posts') }}">Quản lý bài viết</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thêm bài viết</li>
        </ol>
    </nav>
    <div style="background-color: white;padding:20px;border-radius:20px;box-shadow: 2px 2px 2px #FFCC99;">
        <!-- End Page Title -->
        <form style="font-size:2vw;font-size:2vh" method="post" id="AddProForm" action="{{ route('admin.createPost') }}"
            enctype="multipart/form-data" class="row mt-4">
            @csrf
            <div class="form-group col-md-4">
                <label style="font-weight: bolder;" class="control-label">Tiêu đề bài viết</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" id="namepro" name="title" type="text"
                    required>
            </div>
            <div class="form-group col-md-12">
                <label style="font-weight: bolder;" class="control-label mt-3">Ảnh bài viết</label>
                <input style="font-size:2vw;font-size:2vh" class="form-control" id="imagepro" name="mainImage"
                    style="width:30%" type="file" required>
                {{-- <span id="imagePreview"></span> --}}
            </div>
            <div class="form-group ">
                <label style="font-weight: bolder;" class="control-label mt-3">Nội dung bài viết</label>
                <textarea style="font-size:2vw;font-size:2vh" id="mota" name="mota" cols="80" rows="10"
                    class="form-control"> </textarea>
            </div>
            <div class="form-group ">
                <label style="font-weight: bolder;" class="control-label mt-3">Mô tả ngắn của bài viết</label>
                <textarea style="font-size:2vw;font-size:2vh" name="description" cols="80" rows="10"
                    class="form-control"> </textarea>
            </div>

            <button class="btn btn-success mt-4 ms-2" type="submit" id="buttonAddPro"
                style="width:10%;font-size:2vw;font-size:2vh" value="Thêm" name="addproduct"> Thêm
            </button>
        </form>

    </div>
</div>
<script src="{{ asset('assets/js/admin/addproduct.js') }}"></script>
<style>
    .ck-editor__editable_inline {
        min-height: 450px;
        max-height: 650px;
    }
</style>
{{-- <script>
    ClassicEditor.create(document.querySelector('#mota'), {
                language: 'vi',
                ckfinder: {
                    uploadUrl: `/admin/post/ImageInContent/upload?_token={{ csrf_token() }}`, // Đường dẫn API xử lý upload ảnh
                },
                filebrowserUploadMethod: 'form',
                // Phương thức upload (POST)
                on: {
                    fileUploadResponse: function(evt) {
                        evt.stop(); // Ngừng xử lý mặc định của CKEditor

                        const response = evt.data.fileLoader.xhr.responseText;
                        const jsonResponse = JSON.parse(response); // Chuyển đổi JSON từ phản hồi

                        if (jsonResponse.url) {
                            // Cập nhật lại thông tin trong CKEditor và hiển thị ảnh
                            const imageUrl = jsonResponse.url; // URL của ảnh đã upload
                            evt.data.fileLoader.response = jsonResponse;

                            // Chèn ảnh vào editor
                            const editor = evt.editor;
                            editor.model.change(writer => {
                                const imageElement = writer.createElement('image', {
                                    src: imageUrl,
                                });
                                editor.model.insertContent(imageElement, editor.model.document.selection);
                            });
                        } else {
                            alert('Lỗi upload: ' + jsonResponse.error.message);
                        }
                    }
                }
            })
            .then(editor => {
            })
            .catch(error => {
                console.error(error)
            });
</script> --}}
<script>
    ClassicEditor

            .create(document.querySelector('#mota'), {

                ckfinder: {

                    uploadUrl: '{{ route('admin.uploadImageInContent') . '?_token=' . csrf_token() }}',

                }

            })

            .catch(error => {



            });
</script>
@endsection