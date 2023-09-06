# onion-ssh
SSH service that is published as a TOR hidden service for remote access purposes

# Server

```
docker compose up -d --build
```


Retrieve the `.onion` address after starting the stack.

```bash
docker compose exec tor_service cat /var/lib/tor/hidden_service/hostname
```

# Client

Create an `.env` file and add the variable `ONION_ADDRESS` with your specific hidden service address

Start the TOR proxy and build the client container

```
docker compose -f client.docker-compose.yml up -d --build
```

Wait a few seconds until the proxy has established a connection to the tor network. Check the logs if necessary.
Then try using the client to access your hidden SSH server.

### Example

Using the OpenSSH service as a jumphost. You first need to set `AllowTcpForwarding yes` inside `/etc/ssh/sshd_conf` within the `ssh_server` container. The configuration is persisted within a Docker volume by default.

```bash
docker compose -f client.docker-compose.yml run -it --rm ssh_client -J user@<hidden_service_hostname>.onion:2222 root@<internal_host>.local
```

After a few seconds you will be prompted to accept the SSH fingerprint
