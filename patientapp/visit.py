import psycopg2
import time
conn = psycopg2.connect(dbname="hospital_db", host="localhost",  user="keyurpatel", password="root")
cur = conn.cursor()

while True:
  first_name = input("Please enter Patient First Name: ")
  last_name = input("Please enter Patient Last Name: ")
  if ((first_name.islower() or first_name.upper()) or (last_name.islower() or last_name.isupper())):
     print("Please Enter Valid name with only First Character In Upper and Rest of In Lowercase.")
  else:
     print("Please wait We are Getting the information.")
     time.sleep(2)
     pass
  cur.execute ('''
           SELECT p.first_name,p.last_name,v.visit_date FROM patient AS p
           JOIN visit AS v ON p.patient_id=v.visit_id
           GROUP BY p.first_name,p.last_name,v.visit_date
           HAVING p.first_name=%s AND p.last_name=%s
         ''',(first_name,last_name));
  print("Database Not fouund")
  rows =  cur.fetchall() 
   # print(f"Patient Visited : ", "\n", rows)
  row_count=len(rows)
  print(' First name ', '             Last Name', '             Visit Date'),
  print('-----------------------------------------------------------------')
  i=0
  while i<row_count:
    print (rows[i][0],' '*(22-len(rows[i])),rows[i][1],' '*(22-len(rows[i][1])),rows[i][2])
    i=i+1

conn.commit()
cur.close()
conn.close()


