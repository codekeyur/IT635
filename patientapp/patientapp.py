#!/usr/bin/python

import sys
from subprocess import *

################################################################################
# check python version
#if sys.version_info[:2] == (2,7):
#        pass
#else:
#    print '*' * 80
#    print 'Please install Python 2.7.x to run this script'
#    print '*' * 80
#exit(1)
################################################################################

import os
import os.path
import time
#import visit
#import disease
#import doctor


#class CallVisitPy(object):
#    def _init_(self,path='/home/patkey/IT635/patientapp/visit.py'):
#        self.path = path
#    def call_visit_file(self,path):
#       call(["python3", "{}".format(self.path)])





#class CallDiseasePy(object):
#    def _init_(self,path="/home/patkey/IT635/patientapp/disease.py"):
#        self.path = path
#    def call_disease_file(self):
#        call(["python3", "{}".format(self.path)])




#class CallDoctorPy(object):
#    def _init_(self,path="/home/patkey/IT635/patientapp/doctor.py"):
#        self.path = path
#    def call_doctor_file(self):
#        call(["python3", "{}".format(self.path)])




print("Please Select From The Following: ")

print("1) Patient Last Visits.")
print("2) No. Of Patients having same illness.")
print("3) Patient's Doctor.")
print("4) Patient Room No.")
option=int(input())

if option == 1:
    print("Please Wait While we Get the Details.")
    time.sleep(3)
    import visit
    print("Please Exit from application if you'va got the patient Detail." "\n" "Thank You")
 #   c=CallVisitPy()
 #   c.call_visit_file()
elif option == 2:
    print("Wait while we process your request.")
    time.sleep(3)
    import disease
#    d=CallDiseasePy()
#    d.call_disease_file()
elif option == 3:
    print("Wait while we get the details about doctor.")
    time.sleep(3)
    import doctor
#    e=CallDoctorPy()
#    e.call_doctor_file()
else:
    print("We are unable to process your request,Please Select the correct option from the menu.")
