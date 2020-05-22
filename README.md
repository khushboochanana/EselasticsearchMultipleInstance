
# ELASTICSEARCH  7.X Multiple Instance setup.
             
            
# Multiple Instance via elasticsearch ZIP
```
1.	Download Elasticsearch and unzip the folder.
2.	Set Environment Variable ES_HOME=/path/to/download/folder.
3.	Set Environment Variable ES_PATH_CONF=/default/config/path/of/downloaded/folder.
4.	Create a config folder having multiple clusters folder 
/new/config/cluster-1
/new/cofig/cluster-2
...
5.	Copy the default downloaded config folder data in each config cluster folder.
```
# To Run First instance
1.	Updte the following settings in  /new/config/cluster-1/elasticserarch.yml

           a.	node.name
           b.	cluster.name
           c.	path.data
           d.	path.logo
           e.	transaport.port
           f.	http.port

2.	Open cmd with following path 
             /downlaods/elasticsearch-7.7/bin/
             
3.	Set Environment Variable ES_PATH_CONF=/new/config/cluster-1.
4.	Run command 'elasticsearch' 
5.	To Run elasticsearch as daemon with given pid  'elasticsearch –d –p c_pid'.
```
To run other instance follow same steps by updating the Environment Variable ES_PATH_CONF=/config/cluster-2 
and elasticsearch.yml config file..


