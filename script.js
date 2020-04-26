function showExtra(value) {
	var boulderDiv = document.getElementById('boulderDiv');
	var sportDiv = document.getElementById('sportDiv');
	var speedDiv = document.getElementById('speedDiv');
	var length = document.getElementById('length');
	var time = document.getElementById('speedTime');
	var attempts = document.getElementById('attempts');
	if(value == 0){
		boulderDiv.style.display = "none";
		sportDiv.style.display = "none";
		speedDiv.style.display = "none";
	}
	else if(value == "boulder") {
		boulderDiv.style.display = "block";
		sportDiv.style.display = "none";
		speedDiv.style.display = "none";
		length.required = false;
		time.required = false;
		attempts.required = false;
	} 
	else if(value == "sport"){
		sportDiv.style.display = "block";
		boulderDiv.style.display = "none";
		speedDiv.style.display = "none";
		length.required = true;
		time.required = false;
		attempts.required = false;
	}
	else if(value =="speed"){
		speedDiv.style.display="block";
		boulderDiv.style.display = "none";
		sportDiv.style.display="none";
		length.required = false;
		time.required = true;
		attempts.required = true;
	}
	else{
		boulderDiv.style.display = "none";
		sportDiv.style.display = "none";
		speedDiv.style.display="none";
		length.required = false;
		time.required = false;
		attempts.required = false;
	}
}
function timeCheck() {

	var time = document.getElementById('speedTime').value; 
	var speed = document.getElementById('duration').value;
	if(time < 00 || isNaN(time) ){
		alert("Time needs to be number with seconds and Miliseconds");
	}
	if(speed < 0 || isNaN(speed)){
		alert("Time needs to be in Minutes and Greater than 0");
	}
}
function checkValue() {
	var value = document.getElementById('typeWorkout');
	console.log(value);
	
	if(value == "none"){
		alert("Must select disipline");
	}
}

function showTable(value) {
	var table = document.getElementById('tableDiv');
	if(!value){
	table.style.display = "none";	
	}
	else{
		table.style.display = "block";
}
}
function enlargeImage(){
}












