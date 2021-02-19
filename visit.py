import psycopg2

conn = psycopg2.connect(dbname="postgres", host="localhost",  user="keyurpatel", password="root")
cur = conn.cursor()

while True:
    print("Please enter Patient First Name: ")
    first_name = str(input())


    print("Please enter Patient Last Name: ")
    last_name = str(input())

    cur.execute ('''
           SELECT p.first_name,p.last_name,v.visit_date FROM patient AS p
           JOIN visit AS v ON p.patient_id=v.visit_id
           GROUP BY p.first_name,p.last_name,v.visit_date
           HAVING p.first_name=%s AND p.last_name=%s
       ''',(first_name,last_name));
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


