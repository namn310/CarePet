function addProductToCart(productId) {
    var CurrentCount = 1;
    var productId = productId;
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
            if (
                response.success &&
                response.success !== "" &&
                !response.error
            ) {
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
}

window.onload = function () {
    $(document).ready(function () {
        const buyButtons = document.querySelectorAll(".buy-btn");
        buyButtons.forEach((button) => {
            button.addEventListener("click", function () {
                const productId = this.getAttribute("data-id");
                addProductToCart(productId);
            });
        });
        $(".carouselHome").slick({
            slidesToShow: 6,
            slideToScroll: 6,
            dots: true,
            arrows: true,
            cssEase: "linear",
            accessibility: true,
            autoplay: true,
            autoplaySpeed: 600,
            responsive: [
                {
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 4,
                        dots: true,
                        arrows: true,
                        cssEase: "linear",
                        accessibility: true,
                        autoplay: true,
                        autoplaySpeed: 600,
                    },
                },

                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 3,
                        dots: true,
                        arrows: true,
                        cssEase: "linear",
                        accessibility: true,
                        autoplay: true,
                        autoplaySpeed: 600,
                    },
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        dots: true,
                        arrows: true,
                        cssEase: "linear",
                        accessibility: true,
                        autoplay: true,
                        autoplaySpeed: 600,
                    },
                },
            ],
        });

        // voucher
        $(".carouselVoucher").slick({
            slidesToShow: 4,
            slideToScroll: 4,
            dots: true,
            arrows: true,
            cssEase: "linear",
            accessibility: true,
            autoplay: true,
            autoplaySpeed: 600,
            responsive: [
                {
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 3,
                        dots: true,
                        arrows: true,
                        cssEase: "linear",
                        accessibility: true,
                        autoplay: true,
                        autoplaySpeed: 600,
                    },
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        dots: true,
                        arrows: true,
                        cssEase: "linear",
                        accessibility: true,
                        autoplay: true,
                        autoplaySpeed: 600,
                    },
                },
            ],
        });
    });
};
