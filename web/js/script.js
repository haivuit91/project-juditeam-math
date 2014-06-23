/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkSearchNC(){
    title = document.getElementById("title").value;
    content = document.getElementById("content").value;
    hd = document.getElementById("huong_dan").value;
    bt = document.getElementById("bai_tap").value;
    kn = document.getElementById("kinh_nghiem").value;
    if(title ==='' && content==='' && hd==='' && kn ==='' && bt==='')
    {
       alert("Hãy nhập thông tin cần tìm");
       return false;
    }
    return true;
    
}
function previewImage(){
    var fileReader = new FileReader();
    fileReader.readAsDataURL(document.newtopic.file.files[0]);
    fileReader.onload = function (oFREvent) {
        document.getElementById("image").src = oFREvent.target.result;
    };
}
function checkSearchCB(){
    val = document.getElementById("key_search").value;
    if(val === ''){
         alert("Hãy nhập thông tin cần tìm");
         return false;
    }
    return true;
}

