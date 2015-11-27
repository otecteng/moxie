<word>
    <nav_menu></nav_menu>
    <div name="idx">{opts.idx}</div>
    <div>{opts.date}</div>
    <div>{opts.word}</div>
    <div>
        <button onclick="{delete_words}">删除</button>
        <button onclick="{go_list}">返回列表</button>
        <button>默写</button>
    </div>
    <script>
        var self = this;
        delete_words(e){
            console.log("-------------------");
            console.log(opts.idx);
            userService.deleteWords(opts.idx,function (data) {
                riot.mount('#main','list');
            });
        }
    </script>
</word>
