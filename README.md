# [bash.infrash.com](https://infrash.github.io/bash/)

bash scripts: compare, load, status to create csv answer



## Typy kommend infrash

+ compare ( value from in and current infrastructure )
+ load ( from infrastructure )

## compare

values from in and current infrastructure

```bash
compare.sh
```


## load

load values from infrastructure

```bash
load.sh
```




## Automatyczne generowanie na podstawie pliku CSV

wszystkie dane są dostepne poprzez mikrousluge
lub na serwerze FTP

## START

### prepare input data

+ 1/domain-list.txt

```txt
example1.com
example2.com
example3.com
```

+ run script to create the in.csv file

```bash
create-input-csv.sh "domain,https_status" 1/domain-list.txt 1/in.csv
```

+ output of script: 1/in.csv

```csv
domain,https_status
example1.com
example2.com
example3.com
```

### load output data: out.csv  

```bash
load.sh 1/in.csv 1/out.csv 1/status.csv
```

### IN
dane wejsciowe



### STATUS OUT
status wykonyuwania, aktualizowany po kazdej iteracji

+ status.csv

```csv
domain,https_status
example1.com,done
example2.com,warning
example3.com,
```

### DATA OUT
Dane wyjsciowe

+ out.csv

```csv
domain,https_status
example1.com,200
example2.com,500
example3.com,200
```

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png 
example2.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png
example3.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png
```

Dane wyjsciowe mogą posłużyć do sprawdzenia stanu:

### DATA IN
Dane wejsciowe
```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```

### DATA OUT
Dane wyjsciowe
```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png 
example2.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png
example3.com,ns1.com,ns2.com,ns3.com,/home/user/example1.com.png
```
