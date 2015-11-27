<list>
    <style>
        .words_list{
            list-style-type: none;
            padding: 0px;
        }
        .words_item{
            width: 100%;
            text-align: left;
            /*display: list-item;*/
            line-height: 60px;
            text-align: -webkit-match-parent;
            height: 60px;
            font-size: 24px;
            background: #FBDDE9;
            display: inline-block;
            vertical-align: middle;
            margin-bottom: 2px;
        }
        .item_sel{
            float: left;
            vertical-align: middle;
        }
        .item_star{
            float: left;
            width: 10%;
            margin: 0px;
        }
        .item_star img{
            width: 32px;
            height: 32px;
            margin-left: 5px;
            vertical-align: middle;
        }
        .item_body{
            float: left;
            width: 55%;
        }
        .item_sel_c{
            float: left;
            line-height: 100%;
            vertical-align: middle;
            margin-top: 25px;
            margin-left: 10px;
            width: 30px;
            height: 100%;
        }
        input[type=checkbox]
        {
            /* Double-sized Checkboxes */
            -ms-transform: scale(2); /* IE */
            -moz-transform: scale(2); /* FF */
            -webkit-transform: scale(2); /* Safari and Chrome */
            -o-transform: scale(2); /* Opera */
            /*padding: 10px;*/
        }
    </style>
    <nav_menu></nav_menu>
    <span onclick={go_list}>删除</span>|
    <span onclick={go_speak}>Speak</span>|
    <span onclick={go_camera}>Camera</span>|

    <div class="words_block">
        <ul class="words_list">
            <li each={ items }>

                <div class="words_item">
                    <div class="item_sel_c">
                        <input class="item_sel" type="checkbox" value="{word}">
                    </div>
                <div class="item_star"><img src="{get_image_from_star(star)}"></div>
                <div class="item_body">&nbsp;{word}</div>
                <div class="item_date">{moment(date).format("MM-DD")}</div>
                </div>
            </li>
        </ul>
    </div>
    <script>
        var self = this;
        this.on('mount', function() {
            userService.getWords(function (data) {
                items = data;
                self.update();
            });
        });
        go_detail(e){
            e.item.idx = e.item.id;
            riot.mount('#main','word',e.item);
        }
        get_image_from_star(star){
            var images = [{k:"1",v:"优",image:"assets/css/images/cake.png"},
                {k:"2",v:"良",image:"assets/css/images/good.png"},
                {k:"3",v:"及格",image:"assets/css/images/not_bad.png"},
                {k:"4",v:"不及格",image:"assets/css/images/bad.png"}];
            var ret = "assets/css/images/bad.png";
            for(var i=0; i<images.length; i++){
                if(images[i].k==star){
                    ret = images[i].image;
                    break;
                }
            }
            return ret;
        }
        go_speak(e) {
            var words = $("input:checked").map(function() {
                return this.value;
            }).get();
            var to_speak = "";
            for(i = 0 ; i<words.length; i++){
                to_speak += words[i]+",";
            }
            riot.mount('#main','speak',{words:to_speak});
        }

    </script>
</list>