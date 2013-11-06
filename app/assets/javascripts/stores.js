document.write("<scr"+"ipt src=\'//cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.0.0/bootbox.min.js\'></scr"+"ipt>");

var abs="//192.168.1.201:4000";
document.write("<lin"+"k href=\'"+abs+"/assets/stores.css\'/>");
function easy_store(store,name,callback){

    var trigger="<button class='btn btn-primary btn-sm pull-right' id='store-modal'>Launch "+name+" Store</button>";
    var url=abs+"/stores/"+store+".js";
    $('#'+callback).append(trigger+"<script>$('#store-modal').click(function(){$.ajax({url:'"+url+"'});});</script>");
}
function append_frame(store,callback){
        var myFrame=document.createElement('iframe');
        myFrame.src=abs+'/stores/'+store;
        myFrame.id="SwagFrame";
        var trigger="<button class='btn btn-primary btn-sm pull-right' id='store-modal'>Launch Frame Store</button>";
        var url=abs+"/stores/"+store;
        $('#'+callback).append(trigger+"<script>$('#store-modal').click(bootbox.dialog({className: 'swag-modal', message: '<iframe style=\"width: 100%;height: 100%;\" src=\""+url+"\"></iframe>',title: 'Store',callback: $(this).id=\"swagModal\"}))</script>");
        $('.swag-modal')[0].attr("style",'width:100%;height:100%');
}

function swag_styles(){
    var style= document.createElement('style');
    style.href=abs+"/assets/stores.css";
    document.getElementsByTagName('head')[0].appendChild(style);
}

