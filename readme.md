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

### Steps to setup dev, test and prod linking to image stream tags and adding a trigger

```javascript

Create "dev" project and follow the steps listed above

oc describe is/helloservice will provide the sha256 hash code

Tag the image stream for promoting to test
oc tag helloservice@sha256:9d2f60eeca4528cc69fc245be4ec69f5a517f023d193b7f15bdd36f6bbd263c9 dev/helloservice:promoteToTest

Create "test" project
oc new-project test

Provide rights for test project to pull a resource from dev project
oc policy add-role-to-group system:image-puller system:serviceaccounts:test -n dev

Deploy dev build in test project
oc new-app dev/helloservice:promoteToTest

creates the route
oc expose svc/helloservice

Adding automated triggers in dc to deploy dev promoted build in test
oc set triggers dc/helloservice --auto=true --containers="helloservice" --from-image="dev/helloservice:promoteToTest"

The above can be achieved through oc patch dc command


Testing these changes
1. Start build in dev with some changes
2. Test the deployed app from dev and test (dev will be updated but not test)
3. tag the build in dev to "promoteToTest"
4. test the deployed app in test, will be the same as dev now.


```
