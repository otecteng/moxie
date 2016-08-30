<menu>
  <div class='header'><h1>记账本</h1></div>
    <nav>
        <ul class="mainmenu">
            <li class="mainmenu_item" onclick={go_list}><img src="assets/css/images/ic_action_book.png" /><div>默写</div></li>
            <li class="mainmenu_item" onclick={go_new}><img src="assets/css/images/ic_action_add.png" /><div>订正</div></li>
        </ul>
    </nav>
    <div class="o_clear"></div>
    <script>
        go_list(e) {
            riot.mount('#main','list');
        }

        go_new(e) {
            riot.mount('#main','new');
        }
  </script>
</menu>
