$(document).ready(function () {
    $(".timeTable").hide();
    $(".buttonTableStaff").click(function () {
        $(".tableStaff").show();
        $(".timeTable").hide();
    });
    $(".buttonTimeTable").click(function () {
        $(".timeTable").show();
        $(".tableStaff").hide();
    });
    $("#searchNV").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#table-nv tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
    $("#searchProduct").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#table-product tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
    // ajax lấy thông tin lịch làm làm việc chi tiết
    document.querySelectorAll(".editSchedule").forEach((btn) => {
        btn.addEventListener("click", async function () {
            var id = this.getAttribute("data-id-schedule");
            var idStaff = this.getAttribute("data-id-staff");
            const fetchdata = await fetch(`staff/schedule/detail/${id}`, {
                method: "GET",
            });
            const data = await fetchdata.json();
            console.log(data);
            const dataStaff = data.dataStaff;
            const dataSchedule = data.dataSchedule;
            // Tạo danh sách nhân viên
            const staffOptions = dataStaff
                .map(
                    (staff) => `
                <option value="${staff.id}" ${staff.id == idStaff ? "selected" : ""}>
                    ${staff.name}
                </option>`,
                )
                .join("");
            var dateString = dataSchedule.day;

            // Tách ngày, tháng, năm
            var parts = dateString.split("-");
            var newDateString = parts[2] + "-" + parts[1] + "-" + parts[0];
            // Tạo nội dung form
            const formContent = `
                        <div class="text-start">
                            <label style="font-weight: bolder;" class="control-label">Nhân viên</label>
                            <select class="form-select" name="ID_NV" required>
                                ${staffOptions}
                            </select>
                        </div>
                        <div class="text-start mt-2">
                            <label style="font-weight: bolder;" class="control-label">Ca làm việc</label>
                            <select class="form-select" name="CaLamViec" required>
                                <option value="Ca sáng Part-time (7h-11h)" ${dataSchedule.time === "Ca sáng Part-time (7h-11h)" ? "selected" : ""}>Ca sáng Part-time (7h-11h)</option>
                                <option value="Ca chiều Part-time (13h-17h)" ${dataSchedule.time === "Ca chiều Part-time (13h-17h)" ? "selected" : ""} >Ca chiều Part-time (13h-17h)</option>
                                <option value="Ca sáng (7h-15h)" ${dataSchedule.time === "Ca sáng (7h-15h)" ? "selected" : ""}>Ca sáng (7h-15h)</option>
                                <option value="Ca chiều (14h-22h)" ${dataSchedule.time === "Ca chiều (14h-22h)" ? "selected" : ""}>Ca chiều (14h-22h)</option>
                            </select>
                        </div>
                        <div class="text-start mt-2">
                            <label style="font-weight: bolder;" class="control-label">Ngày làm việc</label>
                            <input class="form-control" name="NgayLamViec" type="date" value='${newDateString}' required>
                        </div>
                    <input type="hidden" name="idSchedule" value="${id}">
            `;
            // Chèn nội dung vào modal
            document.getElementById("bodyEditScheduleModal").innerHTML =
                formContent;
        });
    });
});
