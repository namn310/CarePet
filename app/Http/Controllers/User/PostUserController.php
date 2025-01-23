<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Post;


class PostUserController extends Controller
{
    public function detail($id, $name)
    {
        $post = Post::where('id', '!=', $id)->paginate(4);
        $posts = DB::table('posts')->select('id', 'title', 'content', 'main_image')->where('id', $id)->first();
        return view('User.PostView')->with(['posts' => $posts, 'post' => $post]);
    }
}
