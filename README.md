# Self Signed SSL certificate for local development with CA

Create your own self signed ssl certificate for local web development.

## How to

### 1. Create certificate files

```
./run.sh
```

Cose a domain, answer 'y' twice and your certificates will be generated in a
directory with the same name as the host name you picked.

### 2. Add them to your webserver config

Apache nginx etc

### 3. Add root ca to trusted

**ONLY NEED TO DO THIS ONCE**

Use the supplied root ca certificate in the ca directory `ca/ca.crt`.
Adding this to trusted will make all your future certificates work as well.

#### 3.1 Chrome

Settings -> advanced -> Secutiry -> HTTPS/SSL-certificates

* Klick the import button
* Browse to find the `ca/ca.crt` in this repo
* Certificate Store: Browse and choose `Trusted Root Certification Authorities`
