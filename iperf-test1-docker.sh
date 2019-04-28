#!/bin/sh
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 0
fi
arquivo=/tmp/hostfile/stdout.txt
HOST_IP=$1
tempo=30s
comando="iperf3 -u -b 8M -l $i -c $HOST_IP -t $tempo >>logTeste1.txt"
arquivo=/tmp/hostfile/logTeste1.txt
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
			echo "Comando: "$comando >> logTeste1.txt
			iperf3 -u -b 8M -l $i -c $HOST_IP -t $tempo >>$arquivo
		done
	done
done

