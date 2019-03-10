$(document).on("click", "#submit_btn_theodoidanhsach", function(){
	// console.log("clicked")
	var payload = {'command':'system_report', 'from_date':$("#from_date_theodoidanhsach").val(), 'to_date':$("#to_date_theodoidanhsach").val()}
	console.log(payload)
	$('#div_result_theodoidanhsach').load("controller.php", payload)
})