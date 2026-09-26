#!/usr/bin/env bash
set -euo pipefail
NAME=omniroute
HTTP_PORT=21139
WS_PORT=21143
IMAGE="${OMNIROUTE_IMAGE:-docker.io/diegosouzapw/omniroute:latest}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="$ROOT/runtime/omniroute.env"

sudo podman rm -f "$NAME" >/dev/null 2>&1 || true
sudo podman volume exists omniroute-data || sudo podman volume create omniroute-data >/dev/null

exec sudo podman run -d \
  --name "$NAME" \
  --restart unless-stopped \
  --network host \
  --dns 1.1.1.1 \
  --dns 8.8.8.8 \
  --env-file "$ENV_FILE" \
  -e OMNIROUTE_CHAT_MAX_HEAVY_IN_FLIGHT=16 \
  -e OMNIROUTE_CHAT_ADMISSION_HEALTHY_HEADROOM=16 \
  -e RATE_LIMIT_MAX_WAIT_MS=180000 \
  -e NODE_OPTIONS=--max-old-space-size=4096 \
  -e OMNIROUTE_MEMORY_MB=4096 \
  -e MODEL_SYNC_INTERVAL_HOURS=1 \
  -e PORT="$HTTP_PORT" \
  -e DASHBOARD_PORT="$HTTP_PORT" \
  -e API_PORT="$HTTP_PORT" \
  -e LIVE_WS_PORT="$WS_PORT" \
  -e HOST=127.0.0.1 \
  -e HOSTNAME=127.0.0.1 \
  -e OMNIROUTE_BASE_URL="https://route.algofzco.com" \
  -e BASE_URL="https://route.algofzco.com" \
  -v omniroute-data:/app/data \
  -v /opt/apps/omniroute/patches/src_shared_0xd49oi._.js:/app/.build/next/server/chunks/src_shared_0xd49oi._.js:ro \
  -v /opt/apps/omniroute/patches/src_02tligt._.js:/app/.build/next/server/chunks/src_02tligt._.js:ro \
  -v /opt/apps/omniroute/patches/open-sse_0sifrof._.js:/app/.build/next/server/chunks/open-sse_0sifrof._.js:ro \
  -v /opt/apps/omniroute/patches/open-sse_0jdsfef._.js:/app/.build/next/server/chunks/open-sse_0jdsfef._.js:ro \
  --health-cmd "node healthcheck.mjs" \
  --health-interval 20s \
  --health-timeout 5s \
  --health-retries 8 \
  --health-start-period 30s \
  "$IMAGE"
