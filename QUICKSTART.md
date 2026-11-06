# Quick Start - ZDI-CAN-33367

## Compile

```bash
cd /tmp/33367
gcc -Wall -O2 runtime.c launcher.c exploit.c -o zerofrag -lssl -lcrypto
# Or: make
```

## Run

```bash
./zerofrag              # Show framework
./zerofrag --identify   # Identify system
./zerofrag --exploit    # Run exploit
```

## System Requirements

- gcc, libssl-dev, linux-headers
- NFQUEUE, XFRM/IPsec, ESP modules
- Root or CAP_NET_ADMIN

## Upload to GitHub

```bash
git init
git config user.name "Your Name"
git config user.email "your@email.com"
git add .
git commit -m "Initial commit: ZDI-CAN-33367"
git remote add origin https://github.com/ahamedr08/zdi-can-33367-poc.git
git push -u origin main
```

## References

- CVE: ZDI-CAN-33367
- CVSS: 7.8 (High)
- Vulnerability: skb_zerocopy() missing SKBFL_SHARED_FRAG flag
