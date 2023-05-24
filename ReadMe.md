# DSB Helm Charts

Common components exposed through helm chart, if this is the first time you are deploying a given component remember to read the components values.yaml docs before deploying.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add dsb https://DanskeStatsbaner.github.io/helm-charts/
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
Umbrella Chart that packages the Kong Ingress, statsd along with DSB specific configurations.

This chart assumes you have a cluster running with. Note - these are typically installed by the CCOE:
- [Azure Pod Identity](https://github.com/Azure/aad-pod-identity)
- [External DNS](https://github.com/kubernetes-sigs/external-dns)
- [Cert Manager](https://cert-manager.io/docs/)
- [Azure Secret CSI](https://github.com/Azure/secrets-store-csi-driver-provider-azure)

At a minimum you should set the following values:
- kong.deployment.admin.ingress.hostname = <env>.kong-admin.<cluster-name>.<domain>
- kong.podLabels.aadpodidbinding = id-aks-<cluster>-kong

You can do this with a minimal values file
```
kong:
    admin:
        ingress:
            tls: <name of the secret with the tls certificate>
            hostanme: "<env>.kong-admin.<cluster-name>.<domain>"
    podLabels:
        aadpodidbinding: "id-aks-<cluster>-kong"
```

Read the values file to see settings.

```
helm show values dsb/dsb-kong-ingress
```

## DSB Sentinel Dashboard
Lightweight tool to help developers work with the output of structured json logs. [(more here)](https://github.com/DanskeStatsbaner/tool-dsb-sentinel-dashboard)

Read the values file to see more settings:

```
helm show values dsb/dsb-sentinel-dashboard
```

## DSB Skooner Lite
Lightweight tool to help developers see their workloads in kubernetes. [(more here)](https://github.com/DanskeStatsbaner/tool-dsb-skooner-lite)

Read the values file to see more settings:

```
helm show values dsb/dsb-skooner-lite
```
