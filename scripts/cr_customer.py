import requests, json, mysql.connector, random, string
from random import randint

db = mysql.connector.connect(
	host='localhost',
	user='root',
	passwd='1111',
	database='test_206'
)
cursor = db.cursor()
cursor.execute('select * from devvn_tinhthanhpho')
provinces = cursor.fetchall()
def req_create_customer(name, place_of_birth):
	url = 'http://localhost/bhxh/controller.php'
	jobs = ['Công nhân', 'Bảo vệ', 'Nhân viên', 'Trưởng phòng', 'Giám đốc']
	month = str(random.randint(1, 12))
	day = str(random.randint(10, 29))
	if len(month) == 1: month = '0'+month
	if len(day) == 1: day = '0'+day
	payload = {
		'command': 'create_customer',
		'id':'125' + str(random.randint(100000, 999999)),
		'code':''.join(random.choices(string.ascii_uppercase, k = 2)) + ''.join(random.choices(string.digits, k = 8)),
		'full_name':name,
		'job':random.choice(jobs),
		'date_of_birth': day + month + str(random.randint(1950, 2000)),
		'place_of_birth':place_of_birth
	}
	rps = requests.post(
		url = url,
		data = payload
	)
	print(rps.text)
def main():
	names = json.loads(requests.get(url = 'https://raw.githubusercontent.com/duyetdev/vietnamese-namedb/master/uit_member.json').text)
	for name in names:
		req_create_customer(name['full_name'], random.choice(provinces)[1])
		# break
if __name__ == '__main__':
	main()