@extends('User.LayoutTrangChu')

@section('content')

<!-- contact form -->
<div style="margin-top:220px" class="p-5">
    <h2 style="font-size:3vw;font-size:3vh;text-align:center;font-weight:600" class="mb-3">{{ $posts->title }}</h2>
    <?php echo $posts->content; ?>
</div>
<div class="container mt-3">
    <h3 class="mb-4" style="color: #ea9e1e;text-align:center">Các bài viết khác</h3>
    {{-- Danh sách các bài viết --}}
    <div class="mb-3 d-flex justify-content-around flex-wrap">
        @foreach ($post as $row )
        <div class="item" style="max-width:500px">
            <div class="blog-image img-box"><a
                    href="{{ route('user.detailPost',['name'=>$row->title,'id'=>$row->id]) }}"
                    style="text-decoration:none;color:black">
                    <img style="max-height:200px;width:500px" class="img-fluid"
                        src="{{ asset('assets/image-post/'.$row->main_image) }}">
                </a>
            </div>
            <div class="blog-content text-left">
                <h3 class="blog-title" id="Article-591435759873">
                    <a href="{{ route('user.detailPost',['name'=>$row->title,'id'=>$row->id]) }}"
                        style="text-decoration:none;color:black">
                        {{ $row->title }}
                    </a>
                </h3>
                <p class="blog-info">
                    {{\Carbon\Carbon::parse($row->created_at)->format('d-m-Y') }}
                </p>
                <div class="blog-summary">
                    {{ $row->description }}
                </div>
                <a href="{{ route('user.detailPost',['name'=>$row->title,'id'=>$row->id]) }}"> Đọc thêm</a>
            </div>
        </div>
        @endforeach
    </div>
    <div class="d-flex justify-content-center">
        {{ $post->links('pagination::bootstrap-5') }}
    </div>

</div>
<!-- contact-form end-->

<script src="{{ asset('assets/js/script.js') }}"></script>
@endsection