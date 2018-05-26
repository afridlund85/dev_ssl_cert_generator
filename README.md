# Self Signed SSL certificate for local development with CA

Create your own self signed ssl certificate for local web development.

Most of this comes from [Soarez](https://github.com/Soarez) 
and [this gist](https://gist.github.com/Soarez/9688998) with some tweaks.

## How to

### 1. Create certificate files

```
./run.sh
```

Choose a host name, answer `y` twice and your certificates will be generated in a
directory with the same name as the host name you picked.

### 2. Add them to your webserver config

Apache nginx etc

### 3. Add root ca to trusted

** -- ONLY NEED TO DO THIS ONCE -- **

Use the supplied root ca certificate in the ca directory `ca/ca.crt`.
Adding this to trusted will make all your future certificates work as well.

#### 3.1 Chrome

Settings -> advanced -> Secutiry -> HTTPS/SSL-certificates

* Klick the import button
* Browse to find the `ca/ca.crt` in this repo
* Certificate Store: Browse and choose `Trusted Root Certification Authorities`

Restart browser

## Create your own CA root certificate

If you want to create your own:

```
openssl genrsa -out ca.key 2048
openssl req -new -x509 -key ca.key -out ca.crt
```

replace the ones in the `ca`-directory

## Change settings

`ca/ca.cnf` contains all the settings
