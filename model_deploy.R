library("analogsea")
droplets()

droplet_name <- 'model-server'
# droplet_delete(droplet_name)

mydrop <- plumber::do_provision(name = droplet_name, region='ams3')

(running_droplets<-droplets())
(mydrop_ip <- running_droplets[[droplet_name]]$networks$v4[[1]]$ip_address)

plumber::do_deploy_api(droplet = mydrop,path = 'model',port = 8001 ,localPath = ".", forward = T)

# curl -X GET "http://178.128.240.218/model/predict?student=Yes&income=1500&balance=40000" -H  "accept: application/json"

command <- paste0('curl "http://', mydrop_ip, '/model/predict?student=Yes&balance=1500&income=40000"')
print(command)
system(command)



# droplet_delete(droplet_name)

