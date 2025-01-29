#!/usr/bin/env bash

# generates a list in the format $DISTRO/$PVE_VERSION
# for all proxmox versions
distro_list=$(curl -s http://download.proxmox.com/debian/pve/dists/ | grep -v "<h1>" | grep "<a" | sed -n 's/.*>\([^"]*\)\/<.*/\1/p')

while IFS= read -r distro; do
  # Skip empty lines just in case
  [[ -z "$distro" ]] && continue

  # skip proxmox 5
  [[ "$distro" = "stretch" ]] && continue

  # skip proxmox 4
  [[ "$distro" = "jessie" ]] && continue

    # Fetch all versions for the given distro
    version_list=$(curl -s http://download.proxmox.com/debian/pve/dists/$distro/pve-no-subscription/binary-amd64/ \
      | grep "proxmox-ve_" \
      | grep ".deb" \
      | sed -n 's/.*proxmox-ve_\([^"]*\)\.deb.*/\1/p' \
      | sed 's/_all//')

      while IFS= read -r version; do
        # Skip empty lines just in case
        [[ -z "$version" ]] && continue

      echo "$version/$distro"
      done <<< "$version_list"

done <<< "$distro_list"
