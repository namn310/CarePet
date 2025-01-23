<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Throwable;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::paginate(10);
        return view('Admin.QuanLyBaiViet', ['posts' => $posts]);
    }
    public function createView()
    {
        return view('Admin.AddBaiViet');
    }
    public function uploadImageInContent(Request $request)
    {
        // kiểm tra xem có upload file không
        if ($request->hasFile('upload')) {
            $originName = $request->file('upload')->getClientOriginalName();
            $fileName = pathinfo($originName, PATHINFO_FILENAME);
            $extension = $request->file('upload')->getClientOriginalExtension();
            $fileName = $fileName . '_' . time() . '.' . $extension;
            $request->file('upload')->move(public_path('uploads/image_content'), $fileName);
            $url = 'http://127.0.0.1:8000/uploads/image_content/' . $fileName;
            return response()->json(['fileName' => $fileName, 'uploaded' => 1, 'url' => $url]);
        } else {
            return response()->json(['error' => ['message' => 'Không thể upload ảnh.']], 400);
        }
    }
    public function create(Request $request)
    {
        $post = new Post();
        try {
            $idUser = Auth::user()->name;
            $post->title = $request->input('title');
            $post->content = $request->input('mota');
            $post->creater = $idUser;
            $post->description = mb_substr($request->input('description'), 0, 150, 'UTF-8');
            if (strlen($post->description) < strlen($request->input('description'))) {
                $post->description .= '...';  // Thêm dấu ba chấm nếu bị cắt.
            }
            $file = $request->file('mainImage');
            $validateFile = [
                'image/jpeg',   // JPEG
                'image/png',    // PNG
                'image/gif',    // GIF
                'image/svg+xml', // SVG
                'image/webp',   // WebP
                'image/bmp',    // BMP
                'image/tiff',   // TIFF
                'image/x-icon', // ICO
                'image/heic',   // HEIC
                'image/heif'    // HEIF
            ];
            if (!in_array($file->getMimeType(), $validateFile)) {
                return redirect(route('admin.createposts'))->with('error', 'File không đúng định dạng');
            } else {
                $extension = $file->getClientOriginalExtension(); //lay tep mo rong cua file
                $filename =  'mainImage' . time() . '.' . $extension;
                $file->move('assets/image-post/', $filename);
                $post->main_image = $filename;
                $post->save();
                return redirect(route('admin.createposts'))->with('success', 'Thêm bài viết mới thành công !');
            }
        } catch (Throwable $e) {
            return redirect(route('admin.createposts'))->with('error', 'Có lỗi xảy ra !');
        }
    }
    public function Detail($id)
    {
        $post = Post::find($id);
        // dd($post->content);
        return view('Admin.DetailPost', ['post' => $post]);
    }
    public function Delete(Request $request)
    {
        try {
            $id = $request->input('IdPostDelete');
            $post = Post::find($id);
            if (File::exists('assets/image-post/' . $post->main_image)) {
                File::delete('assets/image-post/' . $post->main_image);
            }
            $post->delete();
            return redirect(route('admin.posts'))->with('success', 'Thêm bài viết mới thành công !');
        } catch (Throwable) {
            return redirect(route('admin.posts'))->with('error', 'Có lỗi xảy ra !');
        }
    }
    public function changePostView($id)
    {
        $post = Post::find($id);
        return view('Admin.ChangePostView')->with(['post' => $post]);
    }
    public function update(Request $request)
    {
        try {
            $id = $request->input('IdPostUpdate');
            $post = Post::find($id);
            $post->title = $request->input('title');
            $post->content = $request->input('mota');
            $post->description = mb_substr($request->input('description'), 0, 150, 'UTF-8');
            if (strlen($post->description) < strlen($request->input('description'))) {
                $post->description .= '...';  // Thêm dấu ba chấm nếu bị cắt.
            }
            $file = $request->file('mainImage');
            if ($file !== null) {
                if (File::exists('assets/image-post/' . $post->main_image)) {
                    File::delete('assets/image-post/' . $post->main_image);
                }
                $validateFile = [
                    'image/jpeg',   // JPEG
                    'image/png',    // PNG
                    'image/gif',    // GIF
                    'image/svg+xml', // SVG
                    'image/webp',   // WebP
                    'image/bmp',    // BMP
                    'image/tiff',   // TIFF
                    'image/x-icon', // ICO
                    'image/heic',   // HEIC
                    'image/heif'    // HEIF
                ];
                if (!in_array($file->getMimeType(), $validateFile)) {
                    return redirect(route('admin.changePostView', ['id' => $id]))->with(['error', 'File không đúng định dạng', 'post' => $post]);
                } else {
                    $extension = $file->getClientOriginalExtension(); //lay tep mo rong cua file
                    $filename =  'mainImage' . time() . '.' . $extension;
                    $file->move('assets/image-post/', $filename);
                    $post->main_image = $filename;
                }
            }
            $post->save();
            return redirect(route('admin.posts'))->with('success', 'Cập nhật bài viết thành công thành công !');
        } catch (Throwable $e) {
            return redirect(route('admin.changePostView', ['id' => $id]))->with(['error', 'Có lỗi xảy ra !', 'post' => $post]);
        }
    }
}
