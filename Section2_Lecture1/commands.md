# Install Python 3.6.4 on CentOS 7 From a Repository

# Open a Terminal and add the repository to your Yum install.
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm

# Update Yum to finish adding the repository.
sudo yum update

# Download and install Python.
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip

# Check python version
python3.6 -V

# Install net-tools, tcpdump, nano
sudo yum install net-tools tcpdump nano