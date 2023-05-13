
mrcmd_func_openapi_gen_operations() {
  mrcore_import "${MRCMD_CURRENT_PLUGINS_DIR}/${MRCMD_CURRENT_PLUGIN_NAME}/lib/gen-service.sh"

  local commonSrc="${1:?}"
  local serviceSrc="${2:?}"
  local destFilePath="${3:?}"

  cat "${commonSrc}/head.yaml" > "${destFilePath}"

  echo -e "\nservers:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/servers.yaml" "${destFilePath}" 2

  echo -e "\ntags:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/tags.yaml" "${destFilePath}" 2

  echo -e "\n\npaths:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/paths.yaml" "${destFilePath}" 2

  echo -e "\n\ncomponents:" >> "${destFilePath}"
  #echo -e "\n\n  headers:" >> "${destFilePath}"
  #openapi_lib_add_string_to_end_file "${commonSrc}/components-headers.yaml" "${destFilePath}" 4

  echo -e "\n\n  parameters:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/components-parameters-operationToken.yaml" "${destFilePath}" 4

  echo -e "\n\n  schemas:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/components-schemas.yaml" "${destFilePath}" 4

  echo -e "\n\n  responses:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${serviceSrc}/components-responses.yaml" "${destFilePath}" 4

  echo -e "\n\n  securitySchemes:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/securitySchemes.yaml" "${destFilePath}" 4

  openapi_lib_remove_spaces "${destFilePath}"

  mrcore_echo_ok "File ${destFilePath} generated"
}
