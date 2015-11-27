<nav_menu>
    <div class="menu_bar">
        <span onclick={go_menu}>首页</span>|
        <span onclick={go_new}>订正</span> |
        <span onclick={go_list}>默写</span>|
    </div>
    go_list(e) {
        riot.mount('#main','list');
    }
    go_menu(e) {
        riot.mount('#main','menu');
    }
    go_new(e) {
        riot.mount('#main','new');
    }

</nav_menu>