
function openapi_lib_add_string_to_end_file() {
  local sourceFilePath=${1:?}
  local destFilePath=${2:?}
  local indent=${3}

  mrcore_validate_file_required "${FUNCNAME[0]}::FROM" "${sourceFilePath}"
  mrcore_validate_file_required "${FUNCNAME[0]}::TO" "${destFilePath}"

  if [[ ${indent} -ge 1 ]]; then
    local indentStr
    local tmpFilePath

    indentStr=$(mrcore_lib_repeat_string " " ${indent})
    tmpFilePath="./$(date +%s%N | xargs printf %x)"

    if ! cat "${sourceFilePath}" >"${tmpFilePath}" ||
      ! sed -i "s/^/${indentStr}/" "${tmpFilePath}" ||
      ! cat "${tmpFilePath}" >>"${destFilePath}" ||
      ! rm "${tmpFilePath}"; then
      ${EXIT_ERROR}
    fi
  else
    if ! cat "${sourceFilePath}" >"${destFilePath}"; then
      ${EXIT_ERROR}
    fi
  fi
}

function openapi_lib_remove_spaces() {
  local destFilePath=${1:?}

  sed -i 's/[[:space:]]*$//' "${destFilePath}"
  sed -i '/^$/N;/\n$/D' "${destFilePath}"
}
