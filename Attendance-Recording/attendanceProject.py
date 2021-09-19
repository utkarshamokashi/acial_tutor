# The Main .py file haiving the code for attendance project
import cv2
import numpy as np
import face_recognition as fr
import os
from datetime import datetime

# IMPORTING IMGS
# 1st and 2nd Step
path = 'imagesAttendance'
images = []
classNames = []
myList = os.listdir(path)
# print(myList)
for cl in myList:
    curImage = cv2.imread(f'{path}/{cl}')
    images.append(curImage)
    classNames.append(os.path.splitext(cl)[0])
# print(classNames)
def findEncodings(images):
    encodeList = []
    for img in images:
        img =cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        imgSmall = cv2.resize(img, (0,0), fx=0.5, fy=0.5) 
        encode = fr.face_encodings(imgSmall)[0]
        encodeList.append(encode)
    return encodeList

# function for marking attendance
def markAttendace(name):
    with open('Attendance.csv','r+') as f:
        myAttendanceList = f.readlines()
        nameList = []
        for line in myAttendanceList:
            entry = line.split(',')
            nameList.append(entry[0])
        if name not in nameList:
            now = datetime.now()
            dtString = now.strftime('%H:%M:%S')
            f.writelines(f'\n{name},{dtString}')


markAttendace('s')

encodeListKnown = findEncodings(images)
# print(len(encodeListKnown))
print("Encoding Complete")

# initializing web cam
cap = cv2.VideoCapture(0)
while True:
    success, imgV = cap.read()
    imgS = cv2.resize(imgV,(0,0),None,0.25,0.25)
    imgS = cv2.cvtColor(imgS,cv2.COLOR_BGR2RGB)
    
    faceCurFrame = fr.face_locations(imgS)
    encodeCurFrame = fr.face_encodings(imgS, faceCurFrame)

# 3rd Step
# comparing faces with encodeListKnown and Cam faces
    for encodeFace, faceLoc in zip(encodeCurFrame, faceCurFrame):
        matches = fr.compare_faces(encodeListKnown, encodeFace)
        faceDis = fr.face_distance(encodeListKnown, encodeFace)
        matchIndex = np.argmin(faceDis)

        # wrting on img
        if matches[matchIndex]:
            name = classNames[matchIndex].upper()
            print(name)
            y1, x2, y2, x1 = faceLoc
            y1, x2, y2, x1 = y1*4, x2*4, y2*4, x1*4
            cv2.rectangle(imgV,(x1,y1),(x2,y2),(0,255,0),2)
            cv2.rectangle(imgV,(x1,y2-35),(x2,y2),cv2.FILLED)
            cv2.putText(imgV,name,(x1+6,y2-6),cv2.FONT_HERSHEY_COMPLEX,1,(255,255,255),2)
            markAttendace(name)

    cv2.imshow('WebCam', imgV)
    cv2.waitKey(1)