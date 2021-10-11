echo "provisioning VM..."
sudo apt update
sudo apt-get update

sudo apt-get install curl -y


# install docker and run
# install docker and run
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo systemctl start docker
sudo systemctl enable docker
docker --version
echo "docker installed and running..."

# create group 'docker' and add user 'vagrant' (the one I connect with) to it
sudo usermod -aG docker vagrant
echo "docker group created and 'vagrant' user added to it..."

# install docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo "docker compose installed..."

## install java jdk8
apt-get install openjdk-8-jdk -y
export JAVA_HOME=/usr/lib/jvm/openjdk-8-jdk
export PATH=$PATH:$JAVA_HOME/bin
java -version
echo "java installed.."

## install scala
wget www.scala-lang.org/files/archive/scala-2.13.6.deb
dpkg -i scala-2.13.6.deb
scala --version
echo "scala installed.."

## install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
apt-get update
apt-get install sbt
sbt --version
echo "sbt installed.."

## install spark
cd /opt
wget https://downloads.apache.org/spark/spark-3.1.1/spark-3.1.1-bin-hadoop2.7.tgz
tar -xvzf spark-3.1.1-bin-hadoop2.7.tgz
mv spark-3.1.1-bin-hadoop2.7 spark

echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> ~/.bashrc
echo 'export SPARK_HOME=/opt/spark' >> ~/.bashrc

echo "spark installed.."