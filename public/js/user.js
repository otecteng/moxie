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
    }

    this.getWords = function(callback){
        this.get("http://"+server+"/users/words/",callback);
    }

    this.newWord = function(data,callback){
        this.post("http://"+server+"/users/words/",data,callback);
    }

    this.deleteWords = function(id,callback){
        this.post("http://"+server+"/users/words/delete",{mobile:"123456",id:id},callback);
    }

    this.checkUser = function(){
        return this.mobile;
    }

}