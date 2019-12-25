#!/bin/bash
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

meritous_CPU_MASK=03
meritous_EXE_NAME="meritous"
meritous_HOME_DIR="/media/fat/meritous"
#meritous_OPTIONS="--opl-driver=db --output-rate=48000"
meritous_LIB_PATH="$meritous_HOME_DIR/arm-linux-gnueabihf:$meritous_HOME_DIR/arm-linux-gnueabihf/pulseaudio"

echo "Setting Video mode..."
vmode -r 640 480 rgb16

echo "Setting library path..."
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$meritous_LIB_PATH"
echo $LD_LIBRARY_PATH
echo "Setting meritous HOME path..."
export HOME="$meritous_HOME_DIR"

cd $meritous_HOME_DIR
echo "Starting meritous..."
taskset $meritous_CPU_MASK $meritous_HOME_DIR/$meritous_EXE_NAME #$meritous_OPTIONS 



