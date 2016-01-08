# make -f pdf2ready.mk WEEK=4 PDF=./filename.pdf
#---- DEFAULT VALUES (customizable):
WEEK=1
PDF=$(PDF)

#---- 
flip: imagify
	gs -o MOOCzh-mirrored-S$(WEEK).pdf \
	-sDEVICE=pdfwrite -dAutoRotatePages=/None -c "<</Install{720 0 translate -1 1 scale}>>setpagedevice" \
	-f MOOCzh-S$(WEEK).pdf
	mv MOOCzh-mirrored-S$(WEEK).pdf ./S$(WEEK)/MOOCzh-mirrored-S$(WEEK).pdf

# imagify2: init
#	convert MOOCzh-S$(WEEK).pdf -format jpf -alpha off -density 400 -quality 100 -resize 2000x1500 -background white ./S$(WEEK)/img2/MOOCzh-S$(WEEK)-%d.jpg 

imagify: init
	mogrify -path ./S$(WEEK)/img/ -format jpg -alpha off -density 400 -quality 100 -resize 2000x1500 -background white MOOCzh-S$(WEEK).pdf

init:
	mkdir -p ./S$(WEEK)/img
	cp MOOCzh-S$(WEEK).pdf ./S$(WEEK)/MOOCzh-S$(WEEK).pdf



