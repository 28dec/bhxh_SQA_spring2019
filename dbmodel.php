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
		public function get_total_customer_paid($from_date, $to_date){
			$stmt = $this->pdo->prepare("call get_total_customer_paid(?,?)");
			$stmt->bindParam(1, $from_date);
			$stmt->bindParam(2, $to_date);
			if($stmt->execute()){
				$rps = $stmt->fetch();
				return $rps;
			} else {
				print_r($stmt->errorInfo());
			}
		}
	}
?>