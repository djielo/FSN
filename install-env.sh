NEO4J_HOME=/opt/neo4j

mkdir -p $NEO4J_HOME

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

#Neo4j
docker pull neo4j
docker run --name neo4j-enterprise -d -v $NEO4J_HOME/data:/data -v $NEO4J_HOME/logs:/logs -p 7474:7474 -p 7687:7687 neo4j:enterprise