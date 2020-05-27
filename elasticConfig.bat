wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.7.0-windows-x86_64.zip -O elasticserch.zip
mkdir elasticsearch
tar -xf elasticserch.zip -C elasticsearch --strip-components 1
mkdir config
mkdir data
mkdir logs

set clusterCount=%1

set env=%2

echo clusterCount equals %clusterCount%
echo environment equals %env%

FOR /L %%A IN (1, 1, %clusterCount%) DO (
 xcopy elasticsearch\config\*.* config\cluster-%env%-%%A /h /i /c /k /e /r /y

 echo node.name: cluster-node-%env%-%%A >> config\cluster-%env%-%%A\elasticsearch.yml
 echo cluster.name: cluster-%env% >> config\cluster-%env%-%%A\elasticsearch.yml
 echo path.data: %CD%\data\cluster-%env%-%%A >> config\cluster-%env%-%%A\elasticsearch.yml
 echo path.logs: %CD%\data\cluster-%env%-%%A >> config\cluster-%env%-%%A\elasticsearch.yml
 echo http.port: 920%%A >> config\cluster-%env%-%%A\elasticsearch.yml
 echo transport.port: 930%%A >> config\cluster-%env%-%%A\elasticsearch.yml
 
 mkdir data\cluster-%env%-%%A 
 mkdir logs\cluster-%env%-%%A 

 start cmd /k "cd elasticsearch\bin & set ES_PATH_CONF=%CD%\config\cluster-%env%-%%A & elasticsearch"
 )




 
