# ZDI-CAN-33367: Linux Kernel skb_zerocopy Local Privilege Escalation

![CVSS](https://img.shields.io/badge/CVSS-7.8%20HIGH-red)
![Type](https://img.shields.io/badge/Type-Local%20Privilege%20Escalation-orange)
![Kernel](https://img.shields.io/badge/Kernel-7.3%20rc1-blue)

> Trend Micro Zero Day Initiative Disclosure - October 21, 2026

## Vulnerability Summary

**CVE ID:** ZDI-CAN-33367  
**CVSS Score:** 7.8 (High)  
**Type:** Local Privilege Escalation  
**Affected:** Linux Kernel 7.3-rc1  
**Root Cause:** `skb_zerocopy()` fails to propagate `SKBFL_SHARED_FRAG` ownership marker

## The Bug

The kernel's `skb_zerocopy()` function transfers packet fragments but **loses critical ownership information**.

## Impact

An **unprivileged user** can **modify read-only files** through:
1. Splice-backed UDP packets
2. NFQUEUE interception
3. Lost ownership marker in `skb_zerocopy()`
4. In-place ESP decryption on file pages
5. File modification without write permission

## Attack Flow

```
Read-only File → Splice → NFQUEUE → Lost Flag → ESP Decryption → FILE MODIFIED
```

## Files

```
├── runtime.c           Main exploit
├── launcher.c          Launcher support
├── exploit.c           Attack code
├── launcher.h          Headers
├── profile.h           Config struct
├── unified.h           Helpers
├── README.md           This file
└── Makefile            Build config
```

## Compilation

```bash
gcc -Wall -O2 runtime.c launcher.c exploit.c -o zerofrag -lssl -lcrypto
# Or: make
```

## Usage

```bash
./zerofrag              # Show vulnerability details
./zerofrag --identify   # Identify vulnerable system
./zerofrag --exploit    # Run exploit
```

## Disclaimer

**For authorized security testing, defensive security research, and educational purposes only.**

---

For full details, see QUICKSTART.md
