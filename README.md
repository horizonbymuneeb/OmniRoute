# omniroute

Private repo for the **omniroute** service. Auto-generated from the live service on 2026-09-26.

## What it does

This app is 5 source files. Details below are read from the running service and the source, not from a template.

## Status

| | |
|---|---|
| Service | `omniroute.service` |
| State | **active** |
| Working dir | `/opt/apps/omniroute` |
| Public URL | _(not exposed publicly)_ |
| Source files | 5 |

## Running it

```bash
sudo systemctl start omniroute.service
sudo systemctl status omniroute.service
journalctl -u omniroute.service -f
```

## Configuration

No environment variables detected.

## HTTP surface

None found in the source.

## Dependencies

No dependency manifest found.

## Restore on a new host

See [`REBUILD.md`](REBUILD.md). Secrets and databases are not in this repository —
they are in the encrypted bundle described in the top-level `REPO-MANIFEST.md`.

```bash
tar xzf secrets.tar.gz        # prompts for the age passphrase
cp secrets/omniroute/.env .env   # then fill in or verify values
```
