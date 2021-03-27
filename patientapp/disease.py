import psycopg2

conn = psycopg2.connect(dbname="hospital_db", host="localhost",  user="keyurpatel", password="root")
cur = conn.cursor()

while True:
    print("Please Enter the Disease Name: ")
    disease_name = input()

    cur.execute ("""
             SELECT d.disease_name, CONCAT(p.first_name,' ', p.last_name) AS Patient, COUNT(*) FROM visit AS v
             JOIN  diagnosis AS da
             ON da.visit_id = v.visit_id
             JOIN diseases AS d
             ON da.disease_id=d.disease_id
             JOIN patient AS p
             ON p.patient_id=v.patient_id
             GROUP BY d.disease_name,p.first_name,p.last_name
             HAVING d.disease_name = '%s'
            """ % disease_name );
    rows =  cur.fetchall()
   # print(f"Patient Visited : ", "\n", rows)
    row_count=len(rows)
    print(' Disease Name ', '             Patient',         '        Total Patient'),
    print('------------------------------------------------------------------------------')
    i=0
    while i<row_count:
        print (rows[i][0],' '*(22-len(rows[i])),rows[i][1],' '*(22-len(rows[i][1])),rows[i][2])
        i=i+1


conn.commit()
cur.close()

