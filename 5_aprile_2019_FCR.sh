#!/bin/sh
#File comandi ricorsivo che scrive il nome dei file creati sul file temporaneo il cui nome e' passato come terzo argomento

NC=     #variabile in cui salviamo il numero di caratteri del file corrente

cd $1 	#ci posizioniamo nella directory giusta

if test -f $2.txt -a -r $2.txt -a -w $2.txt 		#se esiste un file leggibile e scrivibile con il nome specificato (N.B. come fatto nel primo esempio di file comandi ricorsivo visto a lezione con la sola differenza che deve essere specificata, in questo caso, la presenza della estensione '.txt'!)
then
	#calcoliamo il numero di caratteri del file 
	NC=`wc -c < $2.txt`
     	echo $NC `pwd`/$2.txt >> $3 #NOTA BENE: su una stessa linea sono inseriti la lunghezza in caratteri e il nome assoluto del file: per il funzionamento del cat usato nel for del file comandi principale va benissimo; in questo modo, NON servira' dividere per due il conteggio delle linee!
fi

for i in *
do
        if test -d $i -a -x $i
        then
                #chiamata ricorsiva cui passiamo come primo parametro il nome assoluto del direttorio
                FCR.sh `pwd`/$i $2 $3
        fi
done
