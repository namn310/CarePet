$(document).ready(function () {
    var listImage = document.querySelectorAll(".list-img");
    listImage.forEach((img) => {
        var a = $(img).attr("src");
        $(img).click(function () {
            $(".main-img-product").attr("src", a);
        });
    });
    $(".img-slide").slick({
        slidesToShow: 2,
        slidesToScroll: 1,
        infinite: true,
        arrows: true,
        centerMode: false,
        cssEase: "linear",
        accessibility: true,
        autoplay: true,
        autoplaySpeed: 900,
        vertical: true,
    });
    $(".img-slide-small").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        arrows: true,
        cssEase: "linear",
        accessibility: true,
        autoplay: true,
        autoplaySpeed: 900,
    });
    var CurrentCount = parseInt($(".number-quantity").val());
    $(".number-quantity").change(function () {
        CurrentCount = parseInt($(".number-quantity").val());
    });
    // tăng số lượng
    $("#buttonUp").click(function () {
        if (CurrentCount <= 1) {
            CurrentCount = 1;
        }
        CurrentCount += 1;
        $(".number-quantity").val(CurrentCount);
    });
    // giảm số lượng
    $("#buttonDown").click(function () {
        CurrentCount = CurrentCount - 1;
        if (CurrentCount <= 1) {
            $(".number-quantity").val("1");
        } else {
            $(".number-quantity").val(CurrentCount);
        }
    });
    $(".comment").hide();
    $("#comment").click(function () {
        $(".thongtinchitiet").hide();
        $(".comment").show();
    });
    $("#mota").click(function () {
        $(".thongtinchitiet").show();
        $(".comment").hide();
    });
    // comment
    $("#submitComment").click(function () {
        var commentTitle = $("#commentTitle").val();
        var userId = $("#idUserComment").val();
        var productId = $("#idProductComment").val();
        var url = "/product/detail/" + productId;
        console.log(commentTitle, userId, productId);
        $.ajax({
            url: url,
            type: "POST",
            data: {
                commentTitle: commentTitle,
                _token: $('meta[name="csrf-token"]').attr("content"),
            },
            success: function (response) {
                // thêm mới bình luận vào danh sách bình luận
                var newComment = `
                                <div class="d-flex mt-3 ms-5">
                                  <div
                                    style="margin-bottom:20px; box-shadow: 2px 2px 2px gray; margin-top:10px; background-color:#FFFFFF; border-radius:10px; width:60%">
                                    <span style="font-weight:bold; font-size:1.5vw; color:blue;font-size:1.5vh" class="user-name">${response.user_name}</span>
                                    <span style="font-weight:lighter; font-size:2vw;font-size:2vh" class="comment-time">${response.created_at}</span>
                                    <div style="margin-left:40px; font-size:2vw;font-size:2vh" class="noidung">${response.commentTitle}</div>
                                    <br>
                                  </div>
                                </div>
                                `;
                $(".list-comment").append(newComment);
                document.getElementById("commentTitle").value = "";
                // tự động tua xuống comment mới nhất
                const listComment = document.getElementById("list-comment");
                listComment.scrollTo({
                    top: listComment.scrollHeight,
                    behavior: "smooth", // Cuộn mượt
                });
            },
            error: function (response) {
                console.log(response);
            },
        });
    });
    $("#cartSucess").click(function () {
        var CurrentCount = parseInt($(".number-quantity").val());
        var productId = parseInt($("#idPro").text());
        var url = "/cart/addPro/" + productId;
        console.log(CurrentCount, productId, url);
        $.ajax({
            url: url,
            type: "POST",
            data: {
                idPro: productId,
                count: CurrentCount,
                _token: $('meta[name="csrf-token"]').attr("content"),
            },
            success: function (response) {
                // console.log(response)
                if (response.success && response.success !== "") {
                    $.toast({
                        heading: "Thông báo",
                        text: response.success,
                        showHideTransition: "slide",
                        icon: "success",
                        position: "bottom-right",
                    });
                } else if (response.error !== "") {
                    $.toast({
                        heading: "Thông báo",
                        text: response.error,
                        showHideTransition: "slide",
                        icon: "error",
                        position: "bottom-right",
                    });
                }
            },
            error: function () {
                console.log("có lỗi xảy ra");
            },
        });
    });
    const toastTrigger = document.getElementById("liveToastBtn");
    const toastLiveExample = document.getElementById("liveToast");

    if (toastTrigger) {
        const toastBootstrap =
            bootstrap.Toast.getOrCreateInstance(toastLiveExample);
        toastTrigger.addEventListener("click", () => {
            toastBootstrap.show();
        });
    }
});
