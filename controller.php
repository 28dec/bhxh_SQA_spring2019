<?php
	require_once('dbmodel.php');
	$db_model = new db_model();
	if(!empty($_POST['command'])){
		$cmd = $_POST['command'];
		echo "" . $cmd . " -> ";
		switch ($cmd) {
			case 'create_company':
				$name = $_POST['name'];
				$province = $_POST['province'];
				$district = $_POST['district'];
				$ward = $_POST['ward'];
				$address_detail = $_POST['address_detail'];
				$area_insurance_level = $_POST['area_insurance_level'];
				$db_model->create_company($name, $province, $district, $ward, $address_detail, $area_insurance_level);
				break;
			case 'create_customer':
				$db_model->create_customer($_POST['id'], $_POST['code'], $_POST['full_name'], $_POST['job'], $_POST['date_of_birth'], $_POST['place_of_birth']);
				break;
			case 'add_customer_to_company':
				$db_model->add_customer_to_company($_POST['customer_code'], $_POST['company_id'], $_POST['from_date']);
				break;
			case 'system_report':
				echo "<table>";
					echo "<th>";
						
					echo "</th>";
				echo "</table>";
				break;
			default:
				# code...
				break;
		}
	} else {
		echo "no post data received!";
	}
?>