<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Throwable;

class ScheduleController extends Controller
{
    public function index()
    {
        $listStaff = DB::table('staff')->select('id', 'name')->get();
        $schedule = DB::table('schedule')
            ->join('staff', 'schedule.id_staff', '=', 'staff.id')
            ->select(
                'schedule.id as idSchedule',
                'schedule.time as TimeWork',
                'schedule.day as DayWord',
                'schedule.status as StatusSchedule',
                'staff.id as id',
                'staff.name as name',
            )
            ->orderBy('schedule.day', 'asc')
            ->paginate(10);
        return view("Admin.Schedule", ['listStaff' => $listStaff, 'schedule' => $schedule]);
    }
    public function create()
    {
        $listStaff = DB::table('staff')->select('id', 'name')->get();
        return view("Admin.createSchedule", ['listStaff' => $listStaff]);
    }
    public function createSchedule(Request $request)
    {
        try {
            $dateFormat = Carbon::parse($request->input('NgayLamViec'))->format('d-m-Y');
            $schedule = new Schedule();
            $schedule->time = $request->input('CaLamViec');
            $schedule->day = $dateFormat;
            $schedule->id_staff = $request->input('ID_NV');
            $schedule->status = 0;
            if ($schedule->time !== '' && $schedule->day !== '' && $schedule->idStaff !== '') {
                $schedule->save();
                return redirect(route('admin.registerScheduleView'))->with('success', 'Đăng ký lịch thành công');
            } else {
                return redirect(route('admin.registerScheduleView'))->with('error', 'Có lỗi xảy ra. Vui lòng thử lại sau ');
            }
        } catch (Throwable $e) {
            dd($e);
            return redirect(route('admin.registerScheduleView'))->with('error', 'Có lỗi xảy ra. Vui lòng thử lại sau ');
        }
    }
    public function deleteSchedule(Request $request)
    {
        try {
            $schedule = Schedule::find(
                $request->input('idSchedule')
            );
            if ($schedule !== null) {
                $schedule->delete();
                return redirect(route('admin.staff'))->with('success', 'Xóa lịch làm việc thành công !');
            } else {
                return redirect(route('admin.staff'))->with('error', 'Có lỗi xảy ra !');
            }
        } catch (Throwable $e) {
            return redirect(route('admin.staff'))->with('error', 'Có lỗi xảy ra !');
        }
    }
    public function updateSchedule(Request $request)
    {
        try {
            $id = $request->input('idSchedule');
            $schedule = Schedule::find($id);
            $dateFormat = Carbon::parse($request->input('NgayLamViec'))->format('d-m-Y');
            $schedule->id_staff = $request->input('ID_NV');
            $schedule->time = $request->input('CaLamViec');
            $schedule->day = $dateFormat;
            $schedule->save();
            return redirect(route('admin.staff'))->with('success', 'Thay đổi lịch làm việc thành công !');
        } catch (Throwable) {
            return redirect(route('admin.staff'))->with('error', 'Có lỗi xảy ra !');
        }
    }
    public function getDetailSchedule($id)
    {
        try {
            $schedule = Schedule::find($id);
            $listStaff = DB::table('staff')->select('id', 'name')->get();
            if ($schedule !== null) {
                return response()->json(['dataSchedule' => $schedule, 'dataStaff' => $listStaff]);
            } else {
                return response()->json(['data' => null, 'status' => 'error']);
            }
        } catch (Throwable $e) {
            return response()->json(['data' => null, 'status' => 'error']);
        }
    }
    public function ConfirmSchedule(Request $request)
    {
        try {
            $id = $request->input('idSchedule');

            $schedule = Schedule::find($id);
            $schedule->status = 1;
            $schedule->save();
            return redirect(route('admin.staff'))->with('success', 'Xác nhận lịch thành công !');
        } catch (Throwable $e) {
            return redirect(route('admin.staff'))->with('error', 'Có lỗi xảy ra !');
        }
    }
}
