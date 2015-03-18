# docker-bind9

To start the DNS server

```bash
sudo docker run -ti -p 127.0.1.5:53:53 -p 127.0.1.5:53:53/udp jimjh/bind9:latest
```

To query the DNS server

```bash
dig ns.purple.cow @127.0.1.5
```

To update the DNS server

```python
import dns.tsigkeyring
import dns.update
import dns.query
keyring = dns.tsigkeyring.from_text({'local-key': 'GIw1g5pldGZyJInJ0BQn6PyUckIDYNYz4R4nCFj7C5a+RIyDuFe+h92P yBdMnOxV3tL1MR967+hudwEX0yo93w=='})
update = dns.update.Update('purple.cow', keyring=keyring)
update.add('foo.purple.cow.', 300, 'A', '10.0.0.2')
dns.query.tcp(update, '127.0.1.5').rcode()
```

```bash
dig foo.purple.cow @127.0.1.5
```
