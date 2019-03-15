<?php 
	class db_model{
		private $user = 'root';
		private $pass = '1111';
		private $pdo;
		public function __construct(){
			$this->pdo = new PDO('mysql:host=localhost;dbname=bhxh', $this->user, $this->pass);
			$this->pdo->query("SET NAMES UTF8");
		}
		public function create_company($name, $province, $district, $ward, $address_detail, $area_insurance_level){
			$stmt = $this->pdo->prepare("call create_company(?,?,?,?,?,?)");
			$stmt->bindParam(1, $name);
			$stmt->bindParam(2, $province);
			$stmt->bindParam(3, $district);
			$stmt->bindParam(4, $ward);
			$stmt->bindParam(5, $address_detail);
			$stmt->bindParam(6, $area_insurance_level);
			$stmt->execute();
			$rps = $stmt->fetch();
			if($rps){
				echo $rps['result'];
			} else {
				print_r($stmt->errorInfo());
			}
		}
		public function create_customer($id, $code, $full_name, $job, $date_of_birth, $place_of_birth){
			$gender = '';
			$stmt = $this->pdo->prepare("call create_customer(?,?,?,?,?,?,?)");
			$stmt->bindParam(1, $id);
			$stmt->bindParam(2, $code);
			$stmt->bindParam(3, $full_name);
			$stmt->bindParam(4, $gender);
			$stmt->bindParam(5, $job);
			$stmt->bindParam(6, $date_of_birth);
			$stmt->bindParam(7, $place_of_birth);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				echo $rps['result'];
			} else {
				print_r($stmt->errorInfo());
			}
		}
		public function add_customer_to_company($customer_id, $company_id, $from_date){
			$stmt = $this->pdo->prepare("call customer_workin_company(?,?,?);");
			$stmt->bindParam(2, $customer_id);
			$stmt->bindParam(1, $company_id);
			$stmt->bindParam(3, $from_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				echo $rps['result'];
			} else {
				print_r($stmt->errorInfo());
			}
		}
		public function get_total_voluntary_customer_paid($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_voluntary_customer_paid(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_voluntary_customer_unpaid($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_voluntary_customer_unpaid(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_voluntary_paid_money($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_voluntary_paid_money(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_voluntary_unpaid_money($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_voluntary_unpaid_money(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_voluntary_customer($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_voluntary_customer(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_compulsory_customer($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_compulsory_customer(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function create_new_rule($min_age_to_participant_VSI, $company_CSI_percentage, $labor_CSI_percentage, $labor_VSI_percentage, $_1st_area_min_salary, $_2nd_area_min_salary, $_3rd_area_min_salary, $_4th_area_min_salary){
			$stmt = $this->pdo->prepare("call create_new_rule(?, ?, ?, ?, ?, ?, ?, ?);");
			$stmt->bindParam(1, $min_age_to_participant_VSI);
			$stmt->bindParam(2, $company_CSI_percentage);
			$stmt->bindParam(3, $labor_CSI_percentage);
			$stmt->bindParam(4, $labor_VSI_percentage);
			$stmt->bindParam(5, $_1st_area_min_salary);
			$stmt->bindParam(6, $_2nd_area_min_salary);
			$stmt->bindParam(7, $_3rd_area_min_salary);
			$stmt->bindParam(8, $_4th_area_min_salary);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function load_rule(){
			$stmt = $this->pdo->prepare("call load_rule();");
			if($stmt->execute()){
				$rps = $stmt->fetch();
				print(json_encode($rps));
			} else {
				print(json_encode(array('error'=>"load rule error")));
			}
		}
		public function get_total_company($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_company()");
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_compulsory_paid_money($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_compulsory_paid_money(?, ?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				return $stmt->fetch()[0];
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_paid_company($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_paid_company(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				return $stmt->fetchall();
			} else {
				return $stmt->errorInfo()[2];
			}
		}
		public function get_total_unpaid_company($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_unpaid_company(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				return $stmt->fetchall();
			} else {
				return $stmt->errorInfo()[2];
			}
		}
	}
?>