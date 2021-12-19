echo Installing Software...
sudo apt update -y
sudo apt install git qemu-system qemu-utils python3 python3-pip -y 
git clone https://github.com/foxlet/macOS-Simple-KVM.git
cd macOS-Simple-KVM
sudo python3  -m pip install click
./jumpstart.sh --mojave
echo "Downloading Mac OS Mojave Disk..." 
wget -q --show-progress --no-check-certificate -O MyDisk.qcow2 https://tinyurl.com/9v4p8d5c
cpus=$(lscpu | grep CPU\(s\) | head -1 | cut -f2 -d":" | awk '{$1=$1;print}')
availableRAMcommand="free -m | tail -2 | head -1 | awk '{print \$7}'"
availableRAM=$(echo $availableRAMcommand | bash)
HEADLESS=1 MEM=$availableRAM"M" CPUS=$cpus SYSTEM_DISK=MyDisk.qcow2 ./headless.sh
echo "All Done !!! Your Mac OS VM now Ready to use !!!"
echo "Open VNC Viewer and connect with port 5900"
echo "Your VM Specs: $availableRAMG
echo "User: Mojave-User"
echo "Pass: 123456"
