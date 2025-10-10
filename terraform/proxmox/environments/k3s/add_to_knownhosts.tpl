#!/bin/bash

set -e

%{ for host, data in all_host_data ~}
ssh-copy-id -i ${data.ssh_key} -o StrictHostKeyChecking=no ${data.username}@${host}
%{ endfor ~}
