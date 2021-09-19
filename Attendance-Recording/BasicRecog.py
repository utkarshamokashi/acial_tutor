import cv2
import numpy as np
import face_recognition as fr

# for loading image in face recognition
imgMe = fr.load_image_file('imagesBasic/me.jpg')
imgMe =cv2.cvtColor(imgMe, cv2.COLOR_BGR2RGB)
imgTest = fr.load_image_file('imagesBasic/test.jpeg')
imgTest =cv2.cvtColor(imgTest, cv2.COLOR_BGR2RGB)
# imgTest = fr.load_image_file('imagesBasic/aziz.jpg')
# imgTest =cv2.cvtColor(imgTest, cv2.COLOR_BGR2RGB)

# for resizing images
meSmall = cv2.resize(imgMe, (0,0), fx=0.5, fy=0.5) 
testSmall = cv2.resize(imgTest, (0,0), fx=0.5, fy=0.5) 

# FOR ORIGINAL IMG (me.jpg)
# for detecting face locations
faceLoc = fr.face_locations(meSmall)[0]
encodeMe = fr.face_encodings(meSmall)[0]
# for drawing a rectangle where the face has been deetected / for loacting the face location to us
cv2.rectangle(meSmall,(faceLoc[3],faceLoc[0]),(faceLoc[1],faceLoc[2]),(255,0,255),2)

# FOR TEST IMG (test.jpeg)
# for detecting face locations
faceLocTest = fr.face_locations(testSmall)[0]
encodeTest = fr.face_encodings(testSmall)[0]
# for drawing a rectangle where the face has been deetected / for loacting the face location to us
cv2.rectangle(testSmall,(faceLocTest[3],faceLocTest[0]),(faceLocTest[1],faceLocTest[2]),(255,0,255),2)

# for getting increasing precision
# we can calculate the distance b/w two images i.e how much two images are similar
# the lower the facedis the better the match is !!!
faceDis = fr.face_distance([encodeMe], encodeTest)

# code for comparing the faces
results = fr.compare_faces([encodeMe], encodeTest)
print(results,faceDis)

# for adding text on the images
cv2.putText(testSmall,f'{results} {round(faceDis[0],2)}',(50,50),cv2.FONT_HERSHEY_COMPLEX,1,(0,0,255),2)

# for showing images
cv2.imshow('Paras Kori', meSmall)
cv2.imshow('Paras Kori Test', testSmall)

cv2.waitKey(0)