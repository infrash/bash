# [bash.infrash.com](https://infrash.github.io/bash/)

bash scripts: compare, load, status to create csv answer



## Typy kommend infrash

+ compare ( value from in and current infrastructure )
+ load ( from infrastructure )

## compare

values from in and current infrastructure

```bash
./compare.sh
```


## load

load values from infrastructure

```bash
./load.sh
```


```bash
ls /media/tom/projects/apibash
ls /media/tom/projects/apibash/whois/registrar_domain/


cd /media/tom/projects/infrash/github/bash/

#cat /media/tom/projects/infrash/github/bash >> domain-list.txt
cat /media/tom/projects/apibash/whois/registrar_domain/aftermarket.pl.txt >> domain-list.txt
cat /media/tom/projects/apibash/whois/registrar_domain/strato.de.txt >> domain-list.txt
cat /media/tom/projects/apibash/whois/registrar_domain/regery.com.txt >> domain-list.txt
cat /media/tom/projects/apibash/whois/registrar_domain/namecheap.com.txt >> domain-list.txt
cat /media/tom/projects/apibash/whois/registrar_domain/cloudflare.com.txt >> domain-list.txt

cat /media/tom/projects/infrash/github/bash/2/domain-list.txt
./create-input-csv.sh "domain,https_status" "2/domain-list.txt" "2/in.csv"
./load.sh "2/in.csv" "2/out.csv" "2/status.csv"
libreoffice --calc 2/out.csv
./load/http_status_code.sh "https://autoinwigilacja.pl"
./load/http_status_code.sh "https://hybridmanager.de"

curl -L –max-redirs 10 "autoinwigilacja.pl"
curl -w "%{url_effective}\n" -I -L -s -S "autoinwigilacja.pl" -o /dev/null
curl -w "%{url_effective}\n" -I -L -s -S "https://www.autoinwigilacja.pl" -o /dev/null
curl -Ls -w %{url_effective} -o /dev/null https://www.autoinwigilacja.pl
curl -Ls -w %{url_effective} -o /dev/null https://www.hybridmanager.de
curl -s -o /dev/null -I -w "HTTP_CODE: %{http_code}\nREDIRECT_URL: %{redirect_url}\n" http://hybridmanager.de
```
-L, --location          Follow redirects (H)
-s, --silent            Silent mode (don't output anything)
-w, --write-out FORMAT  Use output FORMAT after completion
-o, --output FILE       Write to FILE instead of stdout

The five classes include:

    100s: Informational codes indicating that the request initiated by the browser is continuing.
    200s: Success codes returned when browser request was received, understood, and processed by the server.
    300s: Redirection codes returned when a new resource has been substituted for the requested resource.
    400s: Client error codes indicating that there was a problem with the request.
    500s: Server error codes indicating that the request was accepted, but that an error on the server prevented the fulfillment of the request.

cat 2/out.csv | grep 000
cat 2/out.csv | grep 000 > 2/error.txt

split csv to txt
```bash
./csv-to-txt.sh "domain" "2/out.csv" "1/in.txt"
```

Merge without duplicate columns
```bash
./merge-csv.sh "2/out.csv" "3/out.txt" "4/out.txt"
```

## Automatyczne generowanie na podstawie pliku CSV

wszystkie dane są dostepne poprzez mikrousluge
lub na serwerze FTP

## START

prepare input data
+ 1/domain-list.txt

```txt
example1.com
example2.com
example3.com
```

run script to create the input file 
+ 1/in.csv 

```bash
./create-input-csv.sh "domain,https_status" "1/domain-list.txt" "1/in.csv"
```

output of script:
+ 1/in.csv

```csv
domain,http_status_code
example1.com
example2.com
example3.com
```

### 1. Load status of domains

```bash
./load.sh "1/in.csv" "1/out.csv" "1/status.csv"
```

dane wejsciowe: 
+ 1/in.csv

```csv
domain,http_status_code
example1.com
example2.com
example3.com
```

status wykonywania, aktualizowany po każdej iteracji: 
+ 1/status.csv

```csv
domain,http_status_code
example1.com,done
example2.com,warning
example3.com,
```


Dane wyjściowe:
+ 1/out.csv

```csv
domain,http_status_code
example1.com,200
example2.com,500
example3.com,301
```

## 2. Load nameservers for domain list

Another example with checking nameservers

Dane wejsciowe:
+ 2/in.csv

```csv
domain,nameservers
example1.com
example2.com
example3.com
```

Dane wyjsciowe:
+ 2/out.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com 
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```


## 3. Load nameservers for domain list

Another example with making screenshots

Dane wejsciowe:
+ 3/in.csv

```csv
domain,nameservers
example1.com
example2.com
example3.com
```

Dane wyjsciowe:
+ 3/out.csv

```csv
domain,nameservers
example1.com,/home/user/example1.com.png 
example2.com,/home/user/example1.com.png
example3.com,/home/user/example1.com.png
```

## 4. Compare nameservers for domain list

Dane wyjsciowe mogą posłużyć do sprawdzenia stanu:

Dane wejsciowe:
+ 4/in.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```


Dane wyjsciowe:
+ 4/out.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com 
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```





### Installl curl

 In Debian/Ubuntu-based distros, use the following command to install cURL:

 sudo apt install curl

 In Arch-based distros:

 sudo pacman \-S curl

 In Fedora/CentOS/RHEL:

 sudo dnf install curl