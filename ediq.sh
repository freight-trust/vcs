#!/bin/bash
# ediq - cli client
# 2020.10.09
# SPDX-License-Identifier: Apache-2.0
# Copyright 2020 - FreightTrust and Clearing Corporation
# All Rights Reserved
# Copyright 2020 FreightTrust and Clearing Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o pipefail

echo -ne "==> Installing Freight Trust EDI Command Line Client..."
mkdir -p ~/.fr8
cd ~/.fr8 || exit
cat /dev/null > ~/.fr8/.xsef

sleep 1
wget https://freight-trust-bintray.s3-us-west-2.amazonaws.com/ediq.tar.gz
tar -zxvf ediq.tar.gz

sleep 1
echo -ne "ediq() { java -jar ~/.fr8/ediq/ediq.jar "$@"; }" >> ~/.bashrc
source ~/.bashrc || exit
echo -ne "EDIQ - Command Line Interface"
echo -ne "- `--epath`: "EPath" expression (same as XPath) to use for selection of nodes in the EDI input"
echo -ne "- `--format`: write each segment to the output on a separate line (optional) "
echo -ne "- `--schema-file`: path to a schema file to use when parsing the EDI input "

sleep 2
