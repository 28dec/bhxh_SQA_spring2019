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
				$total_customer_paid = $db_model->get_total_customer_paid($_POST['from_date'], $_POST['to_date'])[0];
				echo '<table style="border:1px solid green;">';
					echo '<thead>';
						echo "<th>";
							echo "Nội dung";
						echo "</th>";
						echo "<th>";
							echo "Số lượng";
						echo "</th>";
						echo "<th>";
							echo "Đơn vị";
						echo "</th>";
					echo '</thead>';
					echo '<tbody>';
						echo '<tr>';
							echo '<td>';
								echo "Số khách hàng đã đóng đủ";
							echo '</td>';
							echo '<td>';
								echo $total_customer_paid;
							echo '</td>';
							echo '<td>';
								echo "Người";
							echo '</td>';
						echo '</tr>';
						echo '<tr>';
							echo '<td>';
								echo "Tổng số tiền đã thu";
							echo '</td>';
							echo '<td>';
								echo '_';
							echo '</td>';
							echo '<td>';
								echo "Người";
							echo '</td>';
						echo '</tr>';
						echo '<tr>';
							echo '<td>';
								echo "Số khách hàng chưa đóng đủ";
							echo '</td>';
							echo '<td>';
								echo '_';
							echo '</td>';
							echo '<td>';
								echo "Người";
							echo '</td>';
						echo '</tr>';
					echo '</tbody>';
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