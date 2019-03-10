<!DOCTYPE html>
<html>
<head>
	<title>He thong Bao hiem Xa hoi</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="js/main.js" type="text/javascript"></script>
</head>
<body>
	<div class="container border my-5">
		<div class="row my-2 py-2 text-center">
			<div class="col-4">
				<button id="btn_theodoidanhsach" data-toggle="modal" data-target="#popup_theodoidanhsach">Theo doi danh sach</button>
			</div>
			<div class="col-4">
				<button id="btn_xuatbaocao">Xuat bao cao</button>
			</div>
			<div class="col-4">
				<button id="btn_cauhinh">Cau hinh</button>
			</div>
		</div>
	</div>
	<div class="container">
		<h1>result1</h1>
		<div id="div_result_theodoidanhsach">
			<table id="result_theodoidanhsach" "></table>

		</div>
	</div>
	<div id="popup_theodoidanhsach" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					
				</div>
				<div class="modal-body">
					<!-- <form id="form_1218" method="post" action="#"> -->
						<input type="text" name="from_date" id = "from_date_theodoidanhsach">
						<input type="text" name="to_date" id = "to_date_theodoidanhsach">
						<input type="submit" name="submit" id = "submit_btn_theodoidanhsach">
					<!-- </form> -->
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>