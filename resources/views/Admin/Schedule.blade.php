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
    <h1 style="font-size:2.5vw;font-size:2.5vh" class="mb-3">Danh sách lịch làm việc</h1>
    <div>
        <button class="btn btn-success mb-2 mt-2"><a style="text-decoration: none;color:white"
                href="{{ route('admin.registerScheduleView') }}">Đăng ký lịch làm việc</a></button>
        <h2 class="text-center mt-2" style="font-size:4vw;font-size:4vh;font-weight:700">Danh sách lịch làm việc</h2>
        <table style="font-size:2vw;font-size:2vh" class="table table-hover table-bordered text-center" cellpadding="0"
            cellspacing="0" border="1" id="sampleTable">
            <thead>
                <tr class="table-primary" style="font-size:2vw;font-size:2vh">
                    <th>
                        Họ và tên
                    </th>
                    <th>
                        Ngày làm việc
                    </th>
                    <th>Ca làm việc</th>
                    <th>Trạng thái</th>
                    @if ($roleAccount === 'admin')
                    <th>
                        Tính năng
                    </th>
                    @endif

                </tr>
            </thead>
            <tbody id="table-nv">
                @foreach ($schedule as $row)
                <tr>
                    <td>{{ $row->name }}</td>
                    <td>{{ $row->DayWord }}</td>
                    <td>{{ $row->TimeWork }}</td>
                    @if ($row->StatusSchedule > 0)
                    <td class="text-success">Đã duyệt</td>
                    @else
                    <td class="text-danger">Chưa duyệt</td>
                    @endif
                    @if ($roleAccount == 'admin')
                    <td class="table-td-center">
                        {{-- button xóa --}}
                        <button style="font-size:2vw;font-size:2vh" class="btn btn-danger btn-sm trash"
                            data-bs-toggle="modal" data-bs-target="#delete{{ $row->id }}" type="button" title="Xóa">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                        <div class="modal fade" id="delete{{ $row->id }}" tabindex="-1"
                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo
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
                                        <form action="{{ route('admin.deleteSchedule') }}" method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <input value="{{ $row->idSchedule }}" name="idSchedule" hidden>
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{-- Button sửa --}}
                        <a><button style="font-size:2vw;font-size:2vh" class="btn btn-success btn-sm editSchedule"
                                data-id-schedule="{{ $row->idSchedule }}" data-id-staff="{{ $row->id }}" type="button"
                                title="Sửa" id="show-emp" data-bs-toggle="modal" data-bs-target="#editSchedule">
                                <i class="fas fa-edit"></i>
                            </button></a>
                        <div class="modal fade" id="editSchedule" tabindex="-1" aria-labelledby="exampleModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Lịch làm việc
                                        </h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{ route('admin.updateSchedule') }}" method="POST">
                                            @csrf
                                            <div id="bodyEditScheduleModal">

                                            </div>
                                            <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($row->StatusSchedule <= 0) {{-- button xác nhận --}} <button class="btn btn-primary btn-sm"
                            style="font-size:2vw;font-size:2vh" data-bs-toggle="modal"
                            data-bs-target="#confirm{{ $row->id }}"><a><i
                                    class="fa-solid fa-check-double"></i></a></button>
                            <div class="modal fade" id="confirm{{ $row->id }}" tabindex="-1"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo
                                            </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có muốn xác nhận lịch làm việc này không ?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger"
                                                data-bs-dismiss="modal">Close</button>
                                            <a style="text-decoration:none;color:white">
                                                <form action="{{ route('admin.confirmSchedule') }}" method="POST">
                                                    @csrf
                                                    @method('POST')
                                                    <input hidden name="idSchedule" value="{{ $row->idSchedule  }}">
                                                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                                                </form>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif

                    </td>
                    @endif

                </tr>
                @endforeach
            </tbody>
        </table>
        {{ $schedule->links('pagination::bootstrap-5') }}

    </div>
</div>
<script type="text/javascript">
    const toastTrigger = document.getElementById('liveToastBtn')
        const toastLiveExample = document.getElementById('liveToast')

        if (toastTrigger) {
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
            toastTrigger.addEventListener('click', () => {
                toastBootstrap.show()
            })
        }
</script>
<script src="{{ asset('assets/js/admin/schedule.js') }}"></script>@endsection