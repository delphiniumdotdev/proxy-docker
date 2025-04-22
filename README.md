Proxy is a simple Docker Compose file and config files for the automated [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) project. The containers being proxied must:
* have an environment variable with the 'VIRTUAL_HOST' directive in their Compose file.

```YAML
services:
 container-name:
  environment:
   - VIRTUAL_HOST=yourdomain.extension or ${variable_name}
```

* share at least one Docker network with the nginx-proxy container: by default, the Compose file creates a network called 'proxy' that is external to this container. Copy this network to the beginning of all proxied containers.

There are two config files, a production file 'network_custom.config' that limits file upload size for security, and, an internal configuration file that restricts access to proxied containers by ip address - this is intended for testing or secure implementations. The IP addresses will need to be modified per your implementation network. For public implementations delete the 'network_internal.conf' file and for internal implentations delete the 'network_custom.config' file.

## Automated ACME SSL certificate generation

The 'acme-companion' container will automatically create SSL certificates for properly configured proxied containers. The containers being proxied must:
* have an environment variable with the 'LETSENCRYPT_HOST' directive in their Compose file. This host should be identical to the 'VIRTUAL_HOST' environment variable.

```YAML
services:
 container-name:
  environment:
   - VIRTUAL_HOST=yourdomain.extension or ${variable_name}
   - LETSENCRYPT_HOST=yourdomain.extension or ${variable_name}
```

## Imported SSL certificates

Alternatively, if SSL certificates are externally generated a 'yourdomain.extension.crt' and 'yourdomain.extension.key' file need to be added to the 'certs' folder in the exact file naming convention described here.

## Imported SSL certificates

Externally generated SSL certificates: 'yourdomain.extension.crt' and 'yourdomain.extension.key' files need to be added to the 'certs' folder in the exact file naming convention described here.
