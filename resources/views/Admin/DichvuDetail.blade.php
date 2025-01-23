@extends('Admin.Layout')
@section('content')
<div class="pagetitle">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="font-size: 22px;">
            <li class="breadcrumb-item"><a href="index.php?controller=dichvu">Quản lý dịch vụ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Xem chi tiết</li>
        </ol>
    </nav>
</div><!-- End Page Title -->
<div class="container-fluid border border-primary rounded">
    <div class="p-4">
        <?php
        foreach ($data as $row) {
        ?>
            <div class="name d-inline-block">
                <span>
                    <b>ID dịch vụ: </b>
                    <i><?php echo $row->id_dichvu  ?></i>

                </span>
            </div>
            <div class="local mt-4 ">
                <span>
                    <b>Tên dịch vụ:</b>
                    <i><?php echo $row->ten_dichvu ?></i>

                </span>
            </div>
            <div class="phone mt-4">
                <span>
                    <b>Chi tiết</b>
                </span>
                <img class="img-fluid mt-3" src="../assets/img-dichvu/<?php echo $row->hinhanh ?>">
            </div>

        <?php } ?>
    </div>
</div>
@endsection