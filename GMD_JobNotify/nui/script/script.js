var slideTimeout;

window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.type == "MSGNotify") {
        document.body.style.display = event.data.enable ? "block" : "none";
        functionSlideDown();

        var Music = new Audio("../nui/media/" + item.Job + ".mp3");
        Music.volume = 0.5;
        Music.play();

        clearTimeout(slideTimeout);
        startTimer(item.timer);

        $(".job_name").html(item.jobName);
        $(".descripton_text").html(item.message);

        const progressBar = document.querySelector('.progress');
        progressBar.style.backgroundColor =  item.nuiColor;
        $(".notify_container").css("box-shadow", "0 0 5px 0 " + item.nuiColor);


        if (!item.cycleMuted) {
            slideTimeout = setTimeout(function() {
                functionSlideUp();
            }, item.timer);
        }
    }
});

function functionSlideDown() {
    const element = document.querySelector(".notify_container");
    element.style.top = "-210px";

    $(".notify_container").show();
    $(".notify_container").animate({ top: "0px" }, 500);
}

function functionSlideUp() {
    $(".notify_container").animate({ top: "-210px" }, 500, function() {
        $(".notify_container").hide();
    });
}

function startTimer(timer) {
    const progressBar = document.querySelector('.progress');
    const totalTime = timer;
    let startTime = Date.now();

    progressBar.style.animation = `progressAnimation ${totalTime}ms linear forwards`;
    
    function updateProgress() {
        let elapsedTime = Date.now() - startTime;
        let progress = (elapsedTime / totalTime) * 100;
        progressBar.style.width = `${100 - progress}%`;
    }

    let timerInterval = setInterval(updateProgress, 10);

    setTimeout(() => {
        clearInterval(timerInterval);
        progressBar.style.width = '0%';
    }, totalTime);
}