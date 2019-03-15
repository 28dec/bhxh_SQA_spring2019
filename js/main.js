$(document).on("click", "#submit_btn_theodoidanhsach", function(){
	// console.log("clicked")
	var payload_voluntary = {'command':'system_report', 'type':'voluntary', 'from_date':$("#from_date_theodoidanhsach").val(), 'to_date':$("#to_date_theodoidanhsach").val()}
	var payload_compulsory = {'command':'system_report', 'type':'compulsory', 'from_date':$("#from_date_theodoidanhsach").val(), 'to_date':$("#to_date_theodoidanhsach").val()}
	// console.log(payload_voluntary)
	// console.log(payload_compulsory)
	$('#div_result_theodoidanhsach_voluntary').load("controller.php", payload_voluntary)
	$('#div_result_theodoidanhsach_compulsory').load("controller.php", payload_compulsory)
})

$(document).on("click", "#btn_cauhinh", function(){
	console.log("#btn_cauhinh clicked")
	$(".input_in_setting_popup").map(function(){
		$(this).prop('disabled', true)
	})
	$("#btn_save_setting").prop('disabled', true)
	var payload = {'command':'load_rule'}
	$.post(url = 'controller.php', payload, function(rps){
		// console.log(rps)
		json = JSON.parse(rps)
		if(json.hasOwnProperty('error')){
			console.log("co loi :((")
			alert("Error 1056 occurred! can't load current Rule, contact m.me/bachvkhoa")
		} else {
			$('#input_min_age_to_participant_VSI').val(json['min_age_to_participant_VSI'])
			$('#input_company_CSI_percentage').val(json['company_CSI_percentage'])
			$('#input_labor_VSI_percentage').val(json['labor_VSI_percentage'])
			$('#input_labor_CSI_percentage').val(json['labor_CSI_percentage'])
			$('#input_1st_area_min_salary').val(json['1st_area_min_salary'])
			$('#input_2nd_area_min_salary').val(json['2nd_area_min_salary'])
			$('#input_3rd_area_min_salary').val(json['3rd_area_min_salary'])
			$('#input_4th_area_min_salary').val(json['4th_area_min_salary'])
		}
	})
}
)
$(document).on("click", ".btn_in_setting_popup", function(){
	console.log($(this).val() + " clicked!")
	if($(this).html() == 'EDIT'){
		$(this).html('DONE')
		$('#' + $(this).val()).prop('disabled', false)
	} else if($(this).html() == 'DONE'){
		$(this).html('EDIT')
		$("#btn_save_setting").prop('disabled', false)
		$('#' + $(this).val()).prop('disabled', true)
	} else {
		alert("Error code 903 occurred!\n please contact admin -> m.me/bachvkhoa")
	}
})
$(document).on("click", "#btn_save_setting", function(){
	console.log("#btn_save_setting clicked");
	var payload = {'command':'create_new_rule', 'min_age_to_participant_VSI':$('#input_min_age_to_participant_VSI').val() ,'company_CSI_percentage':$('#input_company_CSI_percentage').val() ,'labor_CSI_percentage':$('#input_labor_CSI_percentage').val() ,'labor_VSI_percentage':$('#input_labor_VSI_percentage').val() ,'1st_area_min_salary':$('#input_1st_area_min_salary').val() ,'2nd_area_min_salary':$('#input_2nd_area_min_salary').val() ,'3rd_area_min_salary':$('#input_3rd_area_min_salary').val() ,'4th_area_min_salary':$('#input_4th_area_min_salary').val()}
	console.log(payload)
	$.post(url="controller.php", payload, function(result){
		alert(result)
	})
})