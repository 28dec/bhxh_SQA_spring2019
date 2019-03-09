import requests, mysql.connector, random
url = 'http://localhost/bhxh/controller.php'
db = mysql.connector.connect(
	host='localhost',
	user='root',
	passwd='1111',
	database='bhxh'
)
cursor = db.cursor()

def req_cr_company(name, province, district, ward, address_detail, area):
	payload = {
		'command':'create_company',
		'name': name,
		'province': province,
		'district': district,
		'ward': ward,
		'address_detail': address_detail,
		'area_insurance_level':area
	}
	rps = requests.post(
		url = url,
		data = payload
	)
	print(rps.text)

def req_customer_workin_company(customer_code, company_rid, from_date):
	payload = {
		'command':'add_customer_to_company',
		'customer_code':customer_code,
		'company_id':company_rid,
		'from_date':from_date
	}
	print(payload)
	rps = requests.post(
		url = url,
		data = payload
	)
	print(rps.text)
	return

def main():
	#create company
	# for i in range(1, 20):
	# 	req_cr_company("cong ty " + str(i), "_", "_", "_", "_", random.choice([1, 2, 3, 4]))
	
	#add customer to company
	cursor.execute("select * from Customer")
	customers = cursor.fetchall()
	for customer in customers:
		month = random.randint(1, 12)
		if month < 10: month = '0' + str(month)
		month = str(month)
		from_date = month + '/' + str(random.randint(1995, 2017))
		c_id = customer[2]
		req_customer_workin_company(c_id, random.randint(1, 19), from_date)
	return

if __name__ == '__main__':
	main()