var UserService = function() {
    this.get = function(url,callback) {
        $.ajax({
            url: url ,
            contentType: "application/json; charset=utf-8",
            success: function(data) {
                callback(data);
            },failure: function (errMsg) {
                alert(errMsg);
            }
        });
    }
    this.post = function(url,data,callback){
        $.ajax({
            type: "POST",
            url: url ,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function(data) {
                callback(data);
            },failure: function (errMsg) {
                alert(errMsg);
            }
        });
    }

    this.initialize = function() {
    }

    this.register = function(mobile,callback){
        this.post("http://"+server+"/users/",{mobile:mobile},callback);
        this.mobile = mobile;
        localStorage.mobile = mobile;
    }

    this.getWords = function(callback){
        this.get("http://"+server+"/users/words/"+this.mobile,callback);
    }

    this.newWord = function(data,callback){
        data.mobile = "123456";
        this.post("http://"+server+"/users/words/",data,callback);
    }

    this.deleteWords = function(id,callback){
        var data = {mobile:"123456",id:id};
        this.post("http://"+server+"/users/words/delete",data,callback);
    }

    this.checkUser = function(){
        this.mobile = localStorage.mobile;
        return this.mobile;
    }

}