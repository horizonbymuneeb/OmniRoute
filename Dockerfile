# Thin wrapper so Openship can deploy Omniroute (a prebuilt third-party image).
#
# WHY THIS EXISTS: the upstream Omniroute app is distributed as a prebuilt
# container image (docker.io/diegosouzapw/omniroute). There is no way to build
# it from source here, and Openship's self-hosted builder only understands
# Dockerfile builds, so this repository previously had no Dockerfile and
# Openship had nothing to build. This file gives the builder a valid target
# while keeping the upstream image as the real payload.
#
# The upstream image's own ENTRYPOINT/CMD are inherited unchanged -- do NOT add
# a CMD here, and leave the project's start_command empty so the image's own
# entrypoint runs. Omniroute needs its own command, and overriding it breaks
# the app (the Next.js server never starts).
#
# RUNTIME NOTES:
#  - Listens on API_PORT 21139 and LIVE_WS_PORT 21143 (see the project env vars).
#  - Persists everything under DATA_DIR=/app/data (storage.sqlite + WAL,
#    call_logs/, cache/, logs/). Openship self-hosted cannot bind volumes, so
#    /app/data is seeded and kept in sync by the fleet-data-sync daemon.
#  - Upstream expects HOST=127.0.0.1 with its own host networking; under
#    Openship it must bind 0.0.0.0 so the proxy can reach it.
FROM docker.io/diegosouzapw/omniroute:latest
