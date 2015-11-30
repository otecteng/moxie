<register>
    <style>
        .register_title{
            height: 40%;
            padding-top: 130px;
            text-align: center;
            vertical-align: middle;
            color: #d7d7d7;
            font-size: 50px;
        }
        .register_form{
            width: 80%;
            height: 50px;
            margin-left: 15%;
            vertical-align: middle;
        }
        .register_form_mobile{
            width: 60%;
            margin: 0px;
            padding: 0px;
            height: 100%;
            font-size: 20px;
            border: 0px;
        }
        .btn_register_form{
            width: 25%;
            height: 100%;
            margin: 0px;
            padding: 0px;
            vertical-align: top;
            font-size: 20px;
        }
    </style>
    <div class="register_title">让默写更有趣</div>

    <form onsubmit={ add }>
    <div class="register_form">
        <input class="register_form_mobile" placeholder="请输入手机号" id="mobile">
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