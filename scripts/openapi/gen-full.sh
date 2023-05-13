
mrcmd_func_openapi_gen_full() {
  mrcore_import "${MRCMD_CURRENT_PLUGINS_DIR}/${MRCMD_CURRENT_PLUGIN_NAME}/lib/gen-service.sh"

  local commonSrc="${1:?}"
  local allServicesSrc="${2:?}"
  local destFilePath="${3:?}"

  cat "${commonSrc}/head.yaml" > "${destFilePath}"

  echo -e "\nservers:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/servers.yaml" "${destFilePath}" 2

  echo -e "\ntags:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/sessions/tags.yaml" "${destFilePath}" 2
  echo "" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/check/tags.yaml" "${destFilePath}" 2

  echo -e "\n\npaths:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/sessions/paths.yaml" "${destFilePath}" 2
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/check/paths.yaml" "${destFilePath}" 2

  echo -e "\n\ncomponents:" >> "${destFilePath}"
  echo -e "\n\n  headers:" >> "${destFilePath}"
  #openapi_lib_add_string_to_end_file "${commonSrc}/components-headers.yaml" "${destFilePath}" 4
  #echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-headers.yaml" "${destFilePath}" 4

  echo -e "\n\n  parameters:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/components-parameters-operationToken.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/sessions/components-parameters.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/check/components-parameters.yaml" "${destFilePath}" 4

  echo -e "\n\n  schemas:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-schemas-Account.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-schemas-CreateAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-schemas-AuthAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-schemas-AccessAccount.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/components-schemas-ChangeProtectedField.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/sessions/components-schemas.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/check/components-schemas.yaml" "${destFilePath}" 4

  echo -e "\n\n  responses:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/auth/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/change/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/operations/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/sessions/components-responses.yaml" "${destFilePath}" 4
  echo -e "\n" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${allServicesSrc}/check/components-responses.yaml" "${destFilePath}" 4

  echo -e "\n\n  securitySchemes:" >> "${destFilePath}"
  openapi_lib_add_string_to_end_file "${commonSrc}/securitySchemes.yaml" "${destFilePath}" 4

  openapi_lib_remove_spaces "${destFilePath}"

  mrcore_echo_ok "File ${destFilePath} generated"
}
