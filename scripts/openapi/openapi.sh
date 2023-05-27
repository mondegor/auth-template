
function mrcmd_plugins_openapi_method_init() {
  readonly OPENAPI_NAME="User Authentication Service API"

  readonly OPENAPI_VARS=(
    "OPENAPI_SPEC_DIR"
    "OPENAPI_ASSEMBLY_DIR"
    "OPENAPI_SERVICE_FILE_POSTFIX"
  )

  # default values of array: OPENAPI_VARS
  readonly OPENAPI_VARS_DEFAULT=(
    "${APPX_DIR}/src"
    "${APPX_DIR}/assembly"
    "_openapi.yaml"
  )

  mrcore_dotenv_init_var_array OPENAPI_VARS[@] OPENAPI_VARS_DEFAULT[@]

  mrcore_validate_dir_required "Specification dir" "${OPENAPI_SPEC_DIR}"
  mrcore_validate_dir_required "Assembly dir" "${OPENAPI_ASSEMBLY_DIR}"
}

function mrcmd_plugins_openapi_method_config() {
  mrcore_dotenv_echo_var_array OPENAPI_VARS[@]
}

function mrcmd_plugins_openapi_method_export_config() {
  mrcore_dotenv_export_var_array OPENAPI_VARS[@]
}

function mrcmd_plugins_openapi_method_exec() {
  local currentCommand=${1:?}
  local commonSrc="${OPENAPI_SPEC_DIR}/common"

  case ${currentCommand} in

    gen-all)
      ./mrcmd openapi gen-full
      ./mrcmd openapi gen-auth
      ./mrcmd openapi gen-change
      ./mrcmd openapi gen-operations
      ./mrcmd openapi gen-sessions
      ./mrcmd openapi gen-check
      ;;

    gen-full)
      local allServicesSrc="${OPENAPI_SPEC_DIR}"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/full${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-full" "${commonSrc}" "${allServicesSrc}" "${destFilePath}"
      ;;

    gen-auth)
      local serviceSrc="${OPENAPI_SPEC_DIR}/auth"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/auth${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-auth" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    gen-change)
      local serviceSrc="${OPENAPI_SPEC_DIR}/change"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/change${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-change" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    gen-operations)
      local serviceSrc="${OPENAPI_SPEC_DIR}/operations"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/operations${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-operations" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    gen-sessions)
      local serviceSrc="${OPENAPI_SPEC_DIR}/sessions"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/sessions${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-sessions" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    gen-check)
      local serviceSrc="${OPENAPI_SPEC_DIR}/check"
      local destFilePath="${OPENAPI_ASSEMBLY_DIR}/check${OPENAPI_SERVICE_FILE_POSTFIX}"
      mrcmd_plugins_call_function "openapi/gen-check" "${commonSrc}" "${serviceSrc}" "${destFilePath}"
      ;;

    *)
      ${RETURN_FALSE}
      ;;

  esac
}

function mrcmd_plugins_openapi_method_help() {
  #markup:"------------------------------|||||||||||||||||||||||||||||||||||||||||||||"
  echo -e "    gen-all                   Build all services"
  echo -e "    gen-full                  Build service Full"
  echo -e "    gen-auth                  Build service Auth"
  echo -e "    gen-change                Build service Change"
  echo -e "    gen-operations            Build service Operations"
  echo -e "    gen-sessions              Build service Sessions"
  echo -e "    gen-check                 Build service Check"
}
