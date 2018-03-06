window.onload = function(){
var gear = document.getElementById('edit_gear');
var edit = document.getElementById('job_edit_form');

gear.addEventListener('click', function(){
	if (edit.style.display==''){
	edit.style.display='block'
    } else {
		edit.style.display=''
	}
})
}