# Steps to deploy this in minishift/openshift
```javascript

Creates image stream and build configuration from template
oc process -f build.yaml| oc create -f -

Starts the build, build strategy is docker
oc start-build bc/helloservice

follow the build logs
oc logs -f bc/helloservice

Creates deployment config, which in turn does a deployment and notifies the replication controller
Creates the service proxy as well
oc new-app --image-stream=helloservice

creates the route
oc expose svc/helloservice

```