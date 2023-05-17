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
Kubernetes controller to implement the standard usage of Kong in DSB. This service is responsible for updating the Kong developer portal when new services are deployed. [(more here)](https://bitbucket.dsb.dk/projects/DOT/repos/dsb.kong.controller/browse)

Read the values file to see more settings:

```
helm show values dsb/dsb-kong-controller
```

## DSB Kong Ingress
<b>Not ready for use - currently has hardcoded values for Salescore.</b>

Umbrella Chart that packages the Kong Ingress, statsd along with DSB specific configurations.

This chart assumes you have a cluster running with. Note - these are typically installed by the CCOE:
- [Azure Pod Identity](https://github.com/Azure/aad-pod-identity)
- [External DNS](https://github.com/kubernetes-sigs/external-dns)
- [Cert Manager](https://cert-manager.io/docs/)
- [Azure Secret CSI](https://github.com/Azure/secrets-store-csi-driver-provider-azure)

At a minimum you should set the following values:
- kong.deployment.admin.ingress.hostname = <env>.kong-admin.<cluster-name>.azure.dsb.dk
- kong.podLabels.aadpodidbinding = id-aks-<cluster>-kong

You can do this with a minimal values file
```
kong:
    admin:
        ingress:
            tls: <name of the secret with the tls certificate>
            hostanme: "<env>.kong-admin.<cluster-name>.azure.dsb.dk"
    podLabels:
        aadpodidbinding: "id-aks-<cluster>-kong"
```

Read the values file to see more settings:

```
helm show values dsb/dsb-kong-ingress
```

## DSB Sentinel Dashboard
Lightweight tool to help developers work with the output of structured json logs. [(more here)](https://bitbucket.dsb.dk/projects/DOT/repos/dsb.sentinel.dashboard/browse)

Read the values file to see more settings:

```
helm show values dsb/dsb-sentinel-dashboard
```

## DSB Skooner Lite
Lightweight tool to help developers see their workloads in kubernetes. [(more here)](https://bitbucket.dsb.dk/projects/DOT/repos/dsb.skooner.lite/browse)

Read the values file to see more settings:

```
helm show values dsb/dsb-skooner-lite
```
