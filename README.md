Ce dépot contient les ressources utiles au MOOCzh, INALCO, 2015.

### Organisation des données
* ~/media/USB_PRO/... : semaine(s) en cours de travail
* ~/projects/MOOC/... : ressources long terme


### PDF flip
Nous utilison une commande unix via goshscript :

```
gs -o MOOCzh-mirrored-S1.pdf \
-sDEVICE=pdfwrite -dAutoRotatePages=/None -c "<</Install{720 0 translate -1 1 scale}>>setpagedevice" \
-f MOOCzh_S1.pdf
```

### PDF to jpg 
```
mkdir -p ./img ; convert MOOCzh-S1.pdf -density 400  -quality 100 -resize 2000x1500 ./img/MOOCzh-S1-%d.jpg
```
or
```
mogrify -path ./img2/ -format jpg -alpha off -density 400 -quality 100 -resize 2000x1500 -background white MOOCzh-S*.pdf
```

### Desktop recording
```
ffmpeg -f x11grab -r 25 -s 1280x720 -i :0.0 ~/tmp/out.mp4 # screen only
ffmpeg -f oss -i /dev/audio -f x11grab -s 1280x720 -r 25 -ab 11 -i :0.0 /tmp/out.mp4  # with audio
```
or 
```
Xaxis=$(xrandr -q | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr -q | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
ffmpeg -f x11grab -s $(($Xaxis))x$(($Yaxis)) -r 25 -i :0.0 -sameq ~/tmp/output.mp4
```
Notes:

 - 0.0 is your display.screen number of your X11 Server. You can get the
   number with `echo $DISPLAY`
 - -r = frames per second
 - -s = resolution# MOOCzh
