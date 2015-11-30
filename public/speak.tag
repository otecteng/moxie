<speak>
    <div class="speak_menu">
        <button onclick="{go_menu}">首页</button>
        <button onclick="{speak}">朗读</button>
    </div>
    <div class="speak_words">{opts.words}</div>
    <div class="speak_now">speak workd now</div>
    <script>
        speak() {
            console.log(opts.words);
            words = opts.words.split(/[ ,，、。.]+/);
            console.log(words);
            var idx = 0;
            var timer = setInterval(function(){
                console.log("I am coming "+idx);
                console.log(words[idx]);
//                TTS.speak({text:words[idx],locale: 'zh-CN',}, function () {
//                        }, function (reason) {
//                            alert(reason);
//                        });
                TTS
                        .speak(words[idx], function () {

                        }, function (reason) {
                            alert(reason);
                        });
                idx = idx + 1;
                if(idx==words.length){
                    clearInterval(timer);
                }
            },4000);


        }

    </script>
</speak>