# bash
bash scripts: compare, load, status to create csv answer



## Typy kommend infrash

+ compare ( value from in and current infrastructure )
+ load ( from infrastructure )

## Automatyczne generowanie na podstawie pliku CSV

wszystkie dane są dostepne poprzez mikrousluge
lub na serwerze FTP

### IN
dane wejsciowe

```csv
domain,https_status,screenshot_png
example1.com
example2.com
example3.com
```

### STATUS OUT
status wykonyuwania, aktualizowany po kazdej iteracji
```csv
domain,https_status,screenshot_png
example1.com
example2.com
example3.com
```

### DATA OUT
Dane wyjsciowe
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
