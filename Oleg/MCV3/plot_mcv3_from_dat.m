% plot ic function

% clear all
close all
clc

addpath '../dat'

tbl1 = load('mcv3_3_1.dat');
tbl2 = load('mcv3_3_2.dat');
tbl3 = load('mcv3_3_3.dat');

x   = tbl1(:,1);
s1  = tbl1(:,2);
s2  = tbl2(:,2);
s3  = tbl3(:,2);

offset = 0.05;

figure,
plot(x, s1, x, s2, 'o')
xlim([min(x)-offset max(x)+offset])
ylim([min(s3)-offset max(s3)+offset])


figure,
LW = 'LineWidth';
lw = 1.1;
plot(x, s1, x, s2, '.', x, s3, 's', LW, lw)
xlim([min(x)-offset max(x)+offset])
ylim([min(s3)-offset max(s3)+offset])

