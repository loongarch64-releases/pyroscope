#!/bin/bash

set -euo pipefail

src="${1}"

rolldown_ver=$(sed -n 's/^[[:space:]]*rolldown: "npm:[^0-9]*\([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p; t q;b; :q q' "${src}/ui/yarn.lock")
lightningcss_ver=$(sed -n 's/^[[:space:]]*lightningcss: "npm:[^0-9]*\([0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p; t q;b; :q q' "${src}/ui/yarn.lock")

# rolldown 和 lightningcss 的 loongarch64 native binding
wget -O "${src}/ui/node_modules/rolldown/dist/shared/rolldown-binding.linux-loong64-gnu.node" "https://github.com/loongarch64-releases/rolldown/releases/download/v${rolldown_ver}/librolldown_binding.so"

wget -O "${src}/ui/node_modules/lightningcss/lightningcss.linux-loong64-gnu.node" "https://github.com/loongarch64-releases/lightningcss/releases/download/v${lightningcss_ver}/liblightningcss_node_gnu.so"
