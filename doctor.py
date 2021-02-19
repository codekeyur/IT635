import psycopg2
conn = psycopg2.connect(dbname="postgres", host="localhost",  user="keyurpatel", password="root")
cur = conn.cursor()

while True:
    print("Please enter Patient First Name: ")
    first_name = str(input())


    print("Please enter Patient Last Name: ")
    last_name = str(input())

    cur.execute ('''
       SELECT 
                DISTINCT CONCAT(p.first_name,' ',p.last_name) AS patient, 
                CONCAT(d.first_name,' ',d.last_name) AS Doctor,d.email,d.phone 
       FROM visit AS v
       JOIN doctor AS d ON d.doctor_id = v.doctor_id
       JOIN patient AS p ON p.patient_id = v.patient_id
       WHERE p.first_name=%s AND p.last_name= %s
      ''',(first_name,last_name));
    rows =  cur.fetchall()
   # print(f"Patient Visited : ", "\n", rows)

    row_count=len(rows)
    print('  Patient Name ', '          Doctor Name',         '                     Email','                   Contact'),
    print('-----------------------------------------------------------------------------------------------------------')
    i=0
    while i<row_count:
        print (rows[i][0],' '*(15-len(rows[i])),rows[i][1],' '*(18-len(rows[i][1])),rows[i][2],'   '*(25-len(rows[i][2])),rows[i][3] )
        i=i+2

   # for rows in row_count:
    #  print(rows[i][0],''*(22-len(rows[i])),rows[i][1],''*(22-len(rows[i][1])),rows[i][2],''*(12-len(rows[i][1])),rows[i][2])
conn.commit()
cur.close()
conn.close()

