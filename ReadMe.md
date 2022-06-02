# DSB Helm Charts

Common components exposed through helm chart, if this is the first time you are deploying a given component remember to read the components values.yaml docs before deploying.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add dsb https://artifactory.azure.dsb.dk/artifactory/helm/
```

You can then run 

```
helm search repo dsb
```

to see the charts.

# Charts in repo:
Note this list is manually maintained.

## DSB Kong Controller
Kubernetes controller to implement the standard usage of Kong in DSB. This service is responsible for updating the Kong developer portal when new services are deployed.

Read the values file to see more settings:

```
helm show values dsb/dsb-kong-controller
```