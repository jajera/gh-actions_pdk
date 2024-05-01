#!/usr/bin/env bash

dirs=(./dist/*)

for dir in "${dirs[@]}"; do
  if [[ ("${dir}" == './dist/profile') || ("${dir}" == './dist/role') ]]; then
    continue # skip to next directory
  fi
  cd "${dir}"
  printf "${dir}\n"
  pdk test unit --verbose --puppet-version ${PUPPET_VERSION}
  if [[ $? -ne 0 ]]; then
    exit 1
  fi
  cd -
done

exit $?
