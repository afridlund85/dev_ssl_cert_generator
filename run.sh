#!/bin/bash

if [ ! -d all_certs ]
then
    mkdir all_certs
fi
if [ ! -f index.txt ]
then
    touch index.txt
fi
if [ ! -f serial ]
then
    echo '01' > serial
fi

echo Enter desired host name without www \(example.local\)
read -p 'dev host name: ' dev_host_name

cp templates/_example.cnf $dev_host_name.cnf
cp templates/_example.ext $dev_host_name.ext

sed -i -e "s/__example.local__/$dev_host_name/g" $dev_host_name.cnf
sed -i -e "s/__example.local__/$dev_host_name/g" $dev_host_name.ext

openssl req -new -out $dev_host_name.csr -config $dev_host_name.cnf
openssl ca -config ca/ca.cnf -out $dev_host_name.crt -extfile $dev_host_name.ext -in $dev_host_name.csr

rm $dev_host_name.cnf $dev_host_name.csr $dev_host_name.ext
mkdir $dev_host_name
mv $dev_host_name.* $dev_host_name/
