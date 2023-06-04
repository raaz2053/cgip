#Q1
#img=[1 0 1;0 1 0;1 0 1];
#imshow(img);
#imwrite(img,'output1.jpeg');
##########################################
##########################################

#Q2
#img_test=imread('C:/Users/User/Documents/test.png');
#img_test(207,193,:)=7;
#imshow(img_test);
#imwrite(img_test,'output2.png')
##########################################
##########################################

#Q3
#img_lenna=imread('C:/Users/User/Documents/Lenna.png');
#img_lenna_face=img_lenna([200:400],[200:370]);
#img_lenna_face(70,105)=7;
#imshow(img_lenna_face);
#imwrite(img_lenna_face,'output3.png')
##########################################
##########################################

#Q3 WITHOUT LOOSING COLORS
#img_lenna=imread('C:/Users/User/Documents/Lenna.png');
#img_lenna_face_r=img_lenna([200:400],[200:370],1);
#img_lenna_face_g=img_lenna([200:400],[200:370],2);
#img_lenna_face_b=img_lenna([200:400],[200:370],3);
#img_lenna_face=cat(3,img_lenna_face_r,img_lenna_face_g,img_lenna_face_b);
#img_lenna_face(70,105,:)=7;
#imshow(img_lenna_face);
#imwrite(img_lenna_face,'output4.png')



