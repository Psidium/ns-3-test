#!/bin/sh
tempo=1s
comando="iperf -u -b 8M -l $i -c 192.168.0.115 -t $tempo >>logTeste1.txt"
arquivo=logTeste1.txt
echo "" > $arquivo
for k in 10B 8B
do
	for i in 128B 256B 512B 1024B 1280B
	do
		echo "\n##############################################" | tee -a $arquivo
		echo "#### Tamanho Datagrama:" $i "Largura de banda:" $k "####" $k | tee -a $arquivo
		for j in 1 2 3 4 5
		do
			echo "**************************************" >>$arquivo
			echo "Teste" $j "-> Tamanho Datagrama:" $i "Largura de banda:" $k | tee -a $arquivo
			echo "Comando: "$comando >>logTeste1.txt
			iperf -u -b 8M -l $i -c 192.168.0.115 -t $tempo >>$arquivo
		done
	done
done

