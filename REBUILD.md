# Rebuilding omniroute

This repo holds the source only. Everything below is reproducible and is not
committed here.

## Dependencies

```bash
# No dependency manifest found — install what the README describes.
```

## Environment

Copy the decrypted secrets bundle and place `omniroute/.env`:

```bash
tar xzf secrets.tar.gz          # prompts for the age passphrase
cp secrets/omniroute/.env omniroute/.env
```

The manifest lists every variable this app expects. `.env.example` shows the shape
with empty values.

## Runtime

```bash
sudo systemctl start omniroute.service && sudo systemctl status omniroute.service
```

* No extra rebuild steps.
