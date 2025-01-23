@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size: 22px;">
            <li class="breadcrumb-item"><a href="{{ route('admin.posts') }}">Quản lý bài viết</a></li>
            <li class="breadcrumb-item active" aria-current="page">Xem chi tiết bài viết</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="container-fluid rounded">
    <h2 style="font-size:3vw;font-size:3vh;text-align:center;font-weight:600" class="mb-3">{{ $post->title }}</h2>
    <?php echo $post->content; ?>
</div>
@endsection