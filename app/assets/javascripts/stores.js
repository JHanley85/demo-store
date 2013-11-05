$(document).ready(function(){
    var script = document.createElement('script');
    script.src = "//cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.0.0/bootbox.min.js";
    document.getElementsByTagName('body')[0].appendChild(script);

}) ;

function easy_store(store,name,callback){
    var abs="//192.168.1.201:4000";
    var trigger="<button class='btn btn-primary btn-sm pull-right' id='store-modal'>Launch "+name+" Store</button>";
     var url=abs+"/stores/"+store+".js";
    $('#'+callback).append(trigger+"<script>$('#store-modal').click(function(){$.ajax({url:'"+url+"'});});</script>");
}
