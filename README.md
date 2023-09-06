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

```bash
docker compose -f client.docker-compose.yml run -it ssh_client
```

After a few seconds you will be prompted to accept the SSH fingerprint
