$(document).ready(function () {
    $(window).scroll(function () {
        if (this.scrollY > 28) {
            $(".navbar").addClass("sticky");
        }else {
            $(".navbar").removeClass("sticky");
        }
    });
    // toggle navbar menu
    $(".menu-btn").click(function () {
        $(".navbar .menu").toggleClass("active");
        $(".menu-btn i").toggleClass("active");
    });
})