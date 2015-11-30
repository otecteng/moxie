<register>
    <style>
        .score_title{
            height: 40%;
            padding-top: 180px;
            text-align: center;
            vertical-align: middle;
            color: #d7d7d7;
            font-size: 50px;
        }
        .register_form{
            width: 80%;
            height: 50px;
            margin-left: 15%;
            /*text-align: center;*/
            vertical-align: middle;

        }
        .input_new_words{
            width: 60%;
            margin-top: 0px;
            font-size: 20px;
        }
        .btn_register_form{
            width: 25%;
            height: 100%;
            margin-top: 0px;
            padding-top: 0px;
            vertical-align: top;
            font-size: 20px;
        }
    </style>
    <div class="score_title">让默写更有趣</div>

    <form onsubmit={ add }>
    <div class="register_form">
        <input class="input_new_words" placeholder="请输入手机号" id="mobile">
        <button class="btn_register_form">加入</button>
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