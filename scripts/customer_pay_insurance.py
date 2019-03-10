import requests, mysql.connector, random, datetime
url = 'http://localhost/bhxh/controller.php'
db = mysql.connector.connect(
	host='localhost',
	user='root',
	passwd='1111',
	database='bhxh'
)
cursor = db.cursor()

def generate_employee_insurance_by_company_rid(id):
	query = "select `customer_code` from company_has_customer where `company_rid` = {}".format(id);
	cursor.execute(query)
	customers = cursor.fetchall()
	for customer in customers:
		try:
			cus_code = customer[0]
			cursor.execute("select `type_of_insurance` from customer where `code` = {} limit 1".format(cus_code))
			cus_type = cursor.fetchone()[0]
			print("cus_type = {}".format(cus_type))
			insert_insurance_record_query = "insert into Insurance (`customer_code`, `type_of_insurance`, `pay_date`, `money`) values('{}', '{}', '{}', '{}')".format(cus_code, cus_type, datetime.datetime.strptime('01/02/2019', '%d/%m/%Y'), '1' + str(random.randint(1, 9)) + '000000')
			print("insert_insurance_record_query = [{}]".format(insert_insurance_record_query))
			cursor.execute(insert_insurance_record_query)
			db.commit()
		except:
			print("exception raised")
			pass
	return

def generate_voluntary_customer_insurance():
	query = "select code, rid from customer where type_of_insurance = 'VOLUNTARY'"
	cursor.execute(query)
	result = cursor.fetchall()
	for customer in result:
		# try:
		cus_code = customer[0]
		cus_rid = customer[1]
		if (cus_rid % 2 == 0): continue
		insert_insurance_record_query = "insert into Insurance (`customer_code`, `type_of_insurance`, `pay_date`, `money`) values('{}', 'VOLUNTARY', '{}', '{}')".format(cus_code, datetime.datetime.strptime('01/02/2019', '%d/%m/%Y'), '1' + str(random.randint(1, 9)) + '000000')
		print("insert_insurance_record_query = [{}]".format(insert_insurance_record_query))
		cursor.execute(insert_insurance_record_query)
		db.commit()
		# except:
		# 	print("Exception raised")
		# 	pass
def main():
	# for i in range(2, 20):
	# 	if i % 4 == 0: continue
	# 	generate_employee_insurance_by_company_rid(i)

	generate_voluntary_customer_insurance()
	return

if __name__ == '__main__':
	main()