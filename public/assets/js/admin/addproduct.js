    function checkID() {
        var id = document.getElementById("idpro");
        var id_val = id.value;
        if (id_val == "") {
            id.classList.add("is-invalid");
            return false;
        } else {
            id.classList.remove("is-invalid");
            id.classList.add("is-valid");
            return true;
        }
    }
    function checkName() {
        var name_correct =
            /^[A-Za-z0-9\/@#$%^&*()\sAÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬBCDĐEÈẺẼÉẸÊỀỂỄẾỆFGHIÌỈĨÍỊJKLMNOÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢPQRSTUÙỦŨÚỤƯỪỬỮỨỰVWXYỲỶỸÝỴZaàảãáạăằẳẵắặâầẩẫấậbcdđeèẻẽéẹêềểễếệfghiìỉĩíịjklmnoòỏõóọôồổỗốộơờởỡớợpqrstuùủũúụưừửữứựvwxyỳỷỹýỵz]+$/;
        var name = document.getElementById("namepro");
        var name_val = document.getElementById("namepro").value;
        if (name_val == "" || name_correct.test(name_val) == false) {
            name.classList.add("is-invalid");
            return false;
        } else {
            name.classList.remove("is-invalid");
            name.classList.add("is-valid");
            return true;
        }
    }
    function checkCount() {
        var a = $("#countpro");
        var b = a.val();
        if (b <= 0) {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkCount() {
        var a = $("#countpro");
        var b = a.val();
        if (b <= 0 || !parseInt(b)) {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkGiaBanPro() {
        var a = $("#giabanpro");
        var b = a.val();
        if (b <= 0 || !parseInt(b)) {
            a.addClass("is-invalid");
            return false
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkGiaVonPro() {
        var a = $("#giavonpro");
        var b = a.val();
        if (b <= 0 || !parseInt(b)) {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkDanhMuc() {
        var a = $("#danhmucAddpro");
        var b = a.val();
        if (b === "Chọn danh mục") {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkTinhTrang() {
        var a = $("#tinhtrangAddpro");
        var b = a.val();
        if (b === "Chọn tình trạng") {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function checkImg() {
        var a = $("#imagepro");
        var b = a.val();
        if (b <= 0) {
            a.addClass("is-invalid");
            return false;
        } else {
            a.removeClass("is-invalid");
            a.addClass("is-valid");
            return true;
        }
    }

    function AddPro() {
        if (checkCount() == false || checkDanhMuc() == false || checkGiaBanPro() == false || checkGiaVonPro() == false || checkID() == false || checkImg() == false || checkName() == false || checkTinhTrang() == false) {
            alert("Vui lòng kiểm tra lại thông tin sản phẩm");
        } else {
            confirm("Thêm thành công !");

        }
    }
