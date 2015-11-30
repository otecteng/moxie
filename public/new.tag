<new>
    <style>
        .score_title{
            width: 100%;
            font-size: 25px;
        }
        .score_list{
            list-style-type: none;
            padding: 0px;
        }
        .score_item{
            width: 25%;
            float: left;
            text-align: left;
            display: list-item;
            text-align: -webkit-match-parent;
            font-size: 20px;
            margin-bottom: 20px;
        }
        .input_new_words{
            border: 0px;
            padding: 0px;
            font-size: 40px;
            margin-bottom: 20px;
            width: 100%;
            height: 150px;
        }
        .btn{
            font-size: 30px;
            height: 40px;
            width: 100%;
            padding: 0px;
            margin-left: 1%;
        }
        .btn_cancle{
            margin-top: 20px;
        }
        .score_item img{
            width: 64px;
            height: 64px;

            vertical-align: middle;
        }
    </style>
    <nav_menu></nav_menu>
    <div class="score_title">今天的默写</div>
    <form onsubmit={ add }>
        <ul class="score_list">
            <li class="score_item" each={ items }>
                <input id="{k}" name="star" type="radio" value="{k}">
                <label for="{k}"><img src="{image}"></label>
            </li>
        </ul>
        <textarea class="input_new_words" placeholder="在这里输入今天的错字" name="words"></textarea>
<div>
    <button class="btn">添加</button>
    </div>
    </form>
    <script>
        var self = this;
        this.on('mount', function() {
            this.items = grades;
            this.update();
        });
        add(e){
            if(!$('[name="star"]:checked').val()){
                alert("请选择成绩");
                return false;
            }

            userService.newWord(
                    { mobile: '123456',star:$('[name="star"]:checked').val(),word:self.words.value,date:new Date()},
                    function(data) {
                        riot.mount('#main', 'list');
                    }
            );
        }
    </script>
</new>