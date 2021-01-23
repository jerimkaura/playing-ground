$(document).ready(function () {
    $(window).scroll(function() {
        if(this.scrollY > 28){
            $('.navbar').addClass("sticky");
        }else{
             $(".navbar").removeClass("sticky");   
        }
    })
})