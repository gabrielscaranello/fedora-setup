#! /bin/bash

APPS=(
  btop
  nvim
)

echo "Hiding desktop apps..."

if [ ! -d "${HOME}/.local/share/applications" ]; then
  mkdir -p "${HOME}/.local/share/applications"
fi

for app in "${APPS[@]}"; do
  default_location="/usr/share/applications/${app}.desktop"
  if [ -f "${default_location}" ]; then
    home_location="${HOME}/.local/share/applications/${app}.desktop"
    cp "${default_location}" "${home_location}"
    sed -i "s/NoDisplay=\(true\|false\)//g" "${home_location}" >/dev/null
    echo "NoDisplay=true" | tee -a "${home_location}" >/dev/null
  fi
done
