<register>
    <div class="score_title">用户注册</div>
    <form onsubmit={ add }>
        <input class="input_new_words" placeholder="请输入手机号" id="mobile">
        <div>
            <button class="btn">添加</button>
        </div>
    </form>
    add(e){
        console.log("start register");
        if(!self.mobile.value){
                alert("请输入手机号");
                return false;
        }
        userService.register(self.mobile.value,function(result){
            riot.mount('#main','menu');
        });
    }
</register>