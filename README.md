# ollama-webui

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![AppVersion: 0.1.17](https://img.shields.io/badge/AppVersion-0.1.17-informational?style=flat-square)

ChatGPT-Style Web UI Client for Ollama 🦙

![Ollama Web UI Demo](https://github.com/ollama-webui/ollama-webui/blob/main/demo.gif?raw=true)

## TL;DR

```sh
helm repo add braveokafor https://braveokafor.github.io/helm-charts/
helm install ollama braveokafor/ollama-webui
```

#### OR: 

```sh
helm repo add braveokafor https://charts.braveokafor.com
helm install ollama braveokafor/ollama-webui
```

## Introduction

Deploy [Ollama WebUI](https://github.com/ollama-webui/ollama-webui) on Kubernetes easily with this Helm chart. 

It enables you to run a ChatGPT-style web UI client, with a variety of open-source large language models available at [ollama.ai/library](ollama.ai/library). 

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| braveokafor | <okaforbrave@gmail.com> | <https://www.linkedin.com/in/braveokafor/> |

## Source Code

* <https://github.com/jmorganca/ollama>
* <https://github.com/ollama-webui/ollama-webui>
* <https://github.com/braveokafor/ollama-webui-helm/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | 2.x.x |
| https://charts.bitnami.com/bitnami | mongodb | 14.x.x |

## Installing the Chart

To install the chart with the release name `ollama`:

```sh
helm install ollama ollama-webui/ollama-webui
```

The command deploys Ollama WebUI on the Kubernetes cluster in the default configuration. 

The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `ollama` deployment:

```sh
helm delete ollama
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.name                                          | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `namespaceOverride`      | String to fully override common.names.namespace                                         | `""`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |

### Ollama Environment parameters

| Name                 | Description                                                            | Value  |
| -------------------- | ---------------------------------------------------------------------- | ------ |
| `ollama.gpu.enabled` | Enable GPU on ollama containers                                        | `true` |
| `ollama.gpu.num`     | Number of GPU units to reserve on ollama containers (resources.limits) | `1`    |

### Ollama Image parameters

| Name                       | Description                                                                                                                                       | Value           |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| `ollama.image.registry`    | ollama image registry                                                                                                                             | `docker.io`     |
| `ollama.image.repository`  | ollama image repository                                                                                                                           | `ollama/ollama` |
| `ollama.image.digest`      | ollama image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`            |
| `ollama.image.pullPolicy`  | ollama image pull policy                                                                                                                          | `IfNotPresent`  |
| `ollama.image.pullSecrets` | ollama image pull secrets                                                                                                                         | `[]`            |
| `ollama.image.debug`       | Enable ollama image debug mode                                                                                                                    | `false`         |

### Ollama Deployment parameters

| Name                                                       | Description                                                                                                              | Value            |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| `ollama.replicaCount`                                      | Number of ollama replicas to deploy                                                                                      | `1`              |
| `ollama.containerPorts.http`                               | ollama HTTP container port                                                                                               | `11434`          |
| `ollama.livenessProbe.enabled`                             | Enable livenessProbe on ollama containers                                                                                | `true`           |
| `ollama.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                  | `30`             |
| `ollama.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                         | `10`             |
| `ollama.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                        | `5`              |
| `ollama.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                      | `6`              |
| `ollama.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                      | `1`              |
| `ollama.readinessProbe.enabled`                            | Enable readinessProbe on ollama containers                                                                               | `true`           |
| `ollama.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                 | `30`             |
| `ollama.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                        | `10`             |
| `ollama.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                       | `5`              |
| `ollama.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                     | `6`              |
| `ollama.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                     | `1`              |
| `ollama.startupProbe.enabled`                              | Enable startupProbe on ollama containers                                                                                 | `true`           |
| `ollama.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                   | `30`             |
| `ollama.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                          | `10`             |
| `ollama.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                         | `5`              |
| `ollama.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                       | `6`              |
| `ollama.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                       | `1`              |
| `ollama.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                      | `{}`             |
| `ollama.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                     | `{}`             |
| `ollama.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                       | `{}`             |
| `ollama.resources.requests.cpu`                            | The requested cpu for the ollama containers                                                                              | `2000m`          |
| `ollama.resources.requests.memory`                         | The requested memory for the ollama containers                                                                           | `4096Mi`         |
| `ollama.resources.limits.memory`                           | The memory limit for the ollama containers                                                                               | `8192Mi`         |
| `ollama.resources.limits.cpu`                              | The cpu limit for the ollama containers                                                                                  | `4000m`          |
| `ollama.podSecurityContext.enabled`                        | Enabled Kimai pods' Security Context                                                                                     | `false`          |
| `ollama.podSecurityContext.fsGroup`                        | Set Kimai pod's Security Context fsGroup                                                                                 | `1001`           |
| `ollama.podSecurityContext.seccompProfile.type`            | Set Kimai container's Security Context seccomp profile                                                                   | `RuntimeDefault` |
| `ollama.containerSecurityContext.enabled`                  | Enabled Kimai containers' Security Context                                                                               | `false`          |
| `ollama.containerSecurityContext.runAsUser`                | Set Kimai container's Security Context runAsUser                                                                         | `1001`           |
| `ollama.containerSecurityContext.runAsNonRoot`             | Set Kimai container's Security Context runAsNonRoot                                                                      | `true`           |
| `ollama.containerSecurityContext.allowPrivilegeEscalation` | Set Kimai container's privilege escalation                                                                               | `false`          |
| `ollama.containerSecurityContext.capabilities.drop`        | Set Kimai container's Security Context runAsNonRoot                                                                      | `["ALL"]`        |
| `ollama.existingConfigmap`                                 | The name of an existing ConfigMap with your custom configuration for ollama                                              | `nil`            |
| `ollama.command`                                           | Override default container command (useful when using custom images)                                                     | `[]`             |
| `ollama.args`                                              | Override default container args (useful when using custom images)                                                        | `[]`             |
| `ollama.hostAliases`                                       | ollama pods host aliases                                                                                                 | `[]`             |
| `ollama.deploymentAnnotations`                             | Annotations for ollama deployment                                                                                        | `{}`             |
| `ollama.podLabels`                                         | Extra labels for ollama pods                                                                                             | `{}`             |
| `ollama.podAnnotations`                                    | Annotations for ollama pods                                                                                              | `{}`             |
| `ollama.podAffinityPreset`                                 | Pod affinity preset. Ignored if `ollama.affinity` is set. Allowed values: `soft` or `hard`                               | `""`             |
| `ollama.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `ollama.affinity` is set. Allowed values: `soft` or `hard`                          | `soft`           |
| `ollama.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                          | `true`           |
| `ollama.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                           | `1`              |
| `ollama.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                           | `""`             |
| `ollama.autoscaling.enabled`                               | Enable autoscaling for ollama                                                                                            | `false`          |
| `ollama.autoscaling.minReplicas`                           | Minimum number of ollama replicas                                                                                        | `1`              |
| `ollama.autoscaling.maxReplicas`                           | Maximum number of ollama replicas                                                                                        | `11`             |
| `ollama.autoscaling.targetCPU`                             | Target CPU utilization percentage                                                                                        | `80`             |
| `ollama.autoscaling.targetMemory`                          | Target Memory utilization percentage                                                                                     | `80`             |
| `ollama.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `ollama.affinity` is set. Allowed values: `soft` or `hard`                         | `""`             |
| `ollama.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `ollama.affinity` is set                                                             | `""`             |
| `ollama.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `ollama.affinity` is set                                                          | `[]`             |
| `ollama.affinity`                                          | Affinity for ollama pods assignment                                                                                      | `{}`             |
| `ollama.nodeSelector`                                      | Node labels for ollama pods assignment                                                                                   | `{}`             |
| `ollama.tolerations`                                       | Tolerations for ollama pods assignment                                                                                   | `[]`             |
| `ollama.updateStrategy.type`                               | ollama statefulset strategy type                                                                                         | `RollingUpdate`  |
| `ollama.priorityClassName`                                 | ollama pods' priorityClassName                                                                                           | `""`             |
| `ollama.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`             |
| `ollama.schedulerName`                                     | Name of the k8s scheduler (other than default) for ollama pods                                                           | `""`             |
| `ollama.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`             |
| `ollama.lifecycleHooks`                                    | for the ollama container(s) to automate configuration before or after startup                                            | `{}`             |
| `ollama.extraEnvVars`                                      | Array with extra environment variables to add to ollama nodes                                                            | `[]`             |
| `ollama.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for ollama nodes                                                    | `""`             |
| `ollama.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for ollama nodes                                                       | `""`             |
| `ollama.extraVolumes`                                      | Optionally specify extra list of additional volumes for the ollama pod(s)                                                | `[]`             |
| `ollama.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the ollama container(s)                                     | `[]`             |
| `ollama.sidecars`                                          | Add additional sidecar containers to the ollama pod(s)                                                                   | `[]`             |
| `ollama.initContainers`                                    | Add additional init containers to the ollama pod(s)                                                                      | `[]`             |

### Ollama Traffic Exposure Parameters

| Name                                      | Description                                                                       | Value       |
| ----------------------------------------- | --------------------------------------------------------------------------------- | ----------- |
| `ollama.service.type`                     | ollama service type                                                               | `ClusterIP` |
| `ollama.service.ports.http`               | ollama service HTTP port                                                          | `11434`     |
| `ollama.service.nodePorts.http`           | Node port for HTTP                                                                | `""`        |
| `ollama.service.clusterIP`                | ollama service Cluster IP                                                         | `""`        |
| `ollama.service.loadBalancerIP`           | ollama service Load Balancer IP                                                   | `""`        |
| `ollama.service.loadBalancerSourceRanges` | ollama service Load Balancer sources                                              | `[]`        |
| `ollama.service.externalTrafficPolicy`    | ollama service external traffic policy                                            | `Cluster`   |
| `ollama.service.annotations`              | Additional custom annotations for ollama service                                  | `{}`        |
| `ollama.service.extraPorts`               | Extra ports to expose in ollama service (normally used with the `sidecars` value) | `[]`        |
| `ollama.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                  | `None`      |
| `ollama.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                       | `{}`        |

### Ollama Persistence Parameters

| Name                               | Description                                                                                             | Value               |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------- |
| `ollama.persistence.enabled`       | Enable persistence using Persistent Volume Claims                                                       | `true`              |
| `ollama.persistence.mountPath`     | Path to mount the volume at.                                                                            | `/root/.ollama`     |
| `ollama.persistence.subPath`       | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services | `""`                |
| `ollama.persistence.storageClass`  | Storage class of backing PVC                                                                            | `""`                |
| `ollama.persistence.annotations`   | Persistent Volume Claim annotations                                                                     | `{}`                |
| `ollama.persistence.accessModes`   | Persistent Volume Access Modes                                                                          | `["ReadWriteOnce"]` |
| `ollama.persistence.size`          | Size of data volume                                                                                     | `30Gi`              |
| `ollama.persistence.existingClaim` | The name of an existing PVC to use for persistence                                                      | `""`                |
| `ollama.persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC                                  | `{}`                |
| `ollama.persistence.dataSource`    | Custom PVC data source                                                                                  | `{}`                |

### Webui Environment parameters

| Name                 | Description    | Value        |
| -------------------- | -------------- | ------------ |
| `webui.JWTSecretKey` | JWT Secret Key | `SECRET_KEY` |

### Webui Image parameters

| Name                      | Description                                                                                                                                      | Value                       |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------- |
| `webui.image.registry`    | webui image registry                                                                                                                             | `ghcr.io`                   |
| `webui.image.repository`  | webui image repository                                                                                                                           | `ollama-webui/ollama-webui` |
| `webui.image.digest`      | webui image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                        |
| `webui.image.pullPolicy`  | webui image pull policy                                                                                                                          | `IfNotPresent`              |
| `webui.image.pullSecrets` | webui image pull secrets                                                                                                                         | `[]`                        |
| `webui.image.debug`       | Enable webui image debug mode                                                                                                                    | `false`                     |

### Webui Deployment parameters

| Name                                                      | Description                                                                                                              | Value            |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | ---------------- |
| `webui.replicaCount`                                      | Number of webui replicas to deploy                                                                                       | `1`              |
| `webui.containerPorts.http`                               | webui HTTP container port                                                                                                | `8080`           |
| `webui.livenessProbe.enabled`                             | Enable livenessProbe on webui containers                                                                                 | `true`           |
| `webui.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                  | `30`             |
| `webui.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                         | `10`             |
| `webui.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                        | `5`              |
| `webui.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                      | `6`              |
| `webui.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                      | `1`              |
| `webui.readinessProbe.enabled`                            | Enable readinessProbe on webui containers                                                                                | `true`           |
| `webui.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                 | `30`             |
| `webui.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                        | `10`             |
| `webui.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                       | `5`              |
| `webui.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                     | `6`              |
| `webui.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                     | `1`              |
| `webui.startupProbe.enabled`                              | Enable startupProbe on webui containers                                                                                  | `true`           |
| `webui.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                   | `30`             |
| `webui.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                          | `10`             |
| `webui.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                         | `5`              |
| `webui.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                       | `6`              |
| `webui.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                       | `1`              |
| `webui.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                      | `{}`             |
| `webui.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                     | `{}`             |
| `webui.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                       | `{}`             |
| `webui.resources.requests.cpu`                            | The requested cpu for the webui containers                                                                               | `100m`           |
| `webui.resources.requests.memory`                         | The requested memory for the webui containers                                                                            | `256Mi`          |
| `webui.resources.limits.memory`                           | The memory limit for the webui containers                                                                                | `512Mi`          |
| `webui.resources.limits.cpu`                              | The cpu limit for the webui containers                                                                                   | `200m`           |
| `webui.podSecurityContext.enabled`                        | Enabled Kimai pods' Security Context                                                                                     | `false`          |
| `webui.podSecurityContext.fsGroup`                        | Set Kimai pod's Security Context fsGroup                                                                                 | `1001`           |
| `webui.podSecurityContext.seccompProfile.type`            | Set Kimai container's Security Context seccomp profile                                                                   | `RuntimeDefault` |
| `webui.containerSecurityContext.enabled`                  | Enabled Kimai containers' Security Context                                                                               | `false`          |
| `webui.containerSecurityContext.runAsUser`                | Set Kimai container's Security Context runAsUser                                                                         | `1001`           |
| `webui.containerSecurityContext.runAsNonRoot`             | Set Kimai container's Security Context runAsNonRoot                                                                      | `true`           |
| `webui.containerSecurityContext.allowPrivilegeEscalation` | Set Kimai container's privilege escalation                                                                               | `false`          |
| `webui.containerSecurityContext.capabilities.drop`        | Set Kimai container's Security Context runAsNonRoot                                                                      | `["ALL"]`        |
| `webui.existingConfigmap`                                 | The name of an existing ConfigMap with your custom configuration for webui                                               | `nil`            |
| `webui.command`                                           | Override default container command (useful when using custom images)                                                     | `[]`             |
| `webui.args`                                              | Override default container args (useful when using custom images)                                                        | `[]`             |
| `webui.hostAliases`                                       | webui pods host aliases                                                                                                  | `[]`             |
| `webui.deploymentAnnotations`                             | Annotations for webui deployment                                                                                         | `{}`             |
| `webui.podLabels`                                         | Extra labels for webui pods                                                                                              | `{}`             |
| `webui.podAnnotations`                                    | Annotations for webui pods                                                                                               | `{}`             |
| `webui.podAffinityPreset`                                 | Pod affinity preset. Ignored if `webui.affinity` is set. Allowed values: `soft` or `hard`                                | `""`             |
| `webui.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `webui.affinity` is set. Allowed values: `soft` or `hard`                           | `soft`           |
| `webui.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                          | `true`           |
| `webui.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                           | `1`              |
| `webui.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                           | `""`             |
| `webui.autoscaling.enabled`                               | Enable autoscaling for webui                                                                                             | `false`          |
| `webui.autoscaling.minReplicas`                           | Minimum number of webui replicas                                                                                         | `1`              |
| `webui.autoscaling.maxReplicas`                           | Maximum number of webui replicas                                                                                         | `11`             |
| `webui.autoscaling.targetCPU`                             | Target CPU utilization percentage                                                                                        | `80`             |
| `webui.autoscaling.targetMemory`                          | Target Memory utilization percentage                                                                                     | `80`             |
| `webui.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `webui.affinity` is set. Allowed values: `soft` or `hard`                          | `""`             |
| `webui.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `webui.affinity` is set                                                              | `""`             |
| `webui.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `webui.affinity` is set                                                           | `[]`             |
| `webui.affinity`                                          | Affinity for webui pods assignment                                                                                       | `{}`             |
| `webui.nodeSelector`                                      | Node labels for webui pods assignment                                                                                    | `{}`             |
| `webui.tolerations`                                       | Tolerations for webui pods assignment                                                                                    | `[]`             |
| `webui.updateStrategy.type`                               | webui statefulset strategy type                                                                                          | `RollingUpdate`  |
| `webui.priorityClassName`                                 | webui pods' priorityClassName                                                                                            | `""`             |
| `webui.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`             |
| `webui.schedulerName`                                     | Name of the k8s scheduler (other than default) for webui pods                                                            | `""`             |
| `webui.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`             |
| `webui.lifecycleHooks`                                    | for the webui container(s) to automate configuration before or after startup                                             | `{}`             |
| `webui.extraEnvVars`                                      | Array with extra environment variables to add to webui nodes                                                             | `[]`             |
| `webui.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for webui nodes                                                     | `""`             |
| `webui.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for webui nodes                                                        | `""`             |
| `webui.extraVolumes`                                      | Optionally specify extra list of additional volumes for the webui pod(s)                                                 | `[]`             |
| `webui.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the webui container(s)                                      | `[]`             |
| `webui.sidecars`                                          | Add additional sidecar containers to the webui pod(s)                                                                    | `[]`             |
| `webui.initContainers`                                    | Add additional init containers to the webui pod(s)                                                                       | `[]`             |

### Webui Traffic Exposure Parameters

| Name                                          | Description                                                                      | Value       |
| --------------------------------------------- | -------------------------------------------------------------------------------- | ----------- |
| `webui.service.type`                          | webui service type                                                               | `ClusterIP` |
| `webui.service.ports.http`                    | webui service HTTP port                                                          | `80`        |
| `webui.service.nodePorts.http`                | Node port for HTTP                                                               | `""`        |
| `webui.service.clusterIP`                     | webui service Cluster IP                                                         | `""`        |
| `webui.service.loadBalancerIP`                | webui service Load Balancer IP                                                   | `""`        |
| `webui.service.loadBalancerSourceRanges`      | webui service Load Balancer sources                                              | `[]`        |
| `webui.service.externalTrafficPolicy`         | webui service external traffic policy                                            | `Cluster`   |
| `webui.service.annotations`                   | Additional custom annotations for webui service                                  | `{}`        |
| `webui.service.extraPorts`                    | Extra ports to expose in webui service (normally used with the `sidecars` value) | `[]`        |
| `webui.service.sessionAffinity`               | Control where client requests go, to the same pod or round-robin                 | `None`      |
| `webui.service.sessionAffinityConfig`         | Additional settings for the sessionAffinity                                      | `{}`        |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                             | `true`      |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                           | `""`        |
| `serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template)                 | `{}`        |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                   | `true`      |

### Ingress Parameters

| Name                       | Description                                                                                                                      | Value                    |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `ingress.enabled`          | Enable ingress record generation for Ollama WebUI                                                                                | `false`                  |
| `ingress.pathType`         | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`       | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.hostname`         | Default host for the ingress record                                                                                              | `ollama.local`           |
| `ingress.ingressClassName` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.path`             | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.annotations`      | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`              | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.selfSigned`       | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`       | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`       | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `ingress.extraRoutes`      | An array with additional hostname(s) and paths to be added to the ingress record                                                 | `[]`                     |
| `ingress.extraTls`         | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `ingress.secrets`          | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `ingress.extraRules`       | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Database Parameters

| Name                        | Description                                                               | Value     |
| --------------------------- | ------------------------------------------------------------------------- | --------- |
| `mongodb.enabled`           | Deploy a MongoDB server to satisfy the applications database requirements | `false`   |
| `mongodb.auth.enabled`      | Enable authentication                                                     | `true`    |
| `mongodb.auth.rootUser`     | MongoDB(&reg;) root user                                                  | `root`    |
| `mongodb.auth.rootPassword` | MongoDB(&reg;) root password                                              | `example` |

### Database Persistence parameters

| Name                               | Description                                                                                          | Value  |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------- | ------ |
| `mongodb.persistence.enabled`      | Enable persistence on MongoDB using PVC(s)                                                           | `true` |
| `mongodb.persistence.storageClass` | Persistent Volume storage class                                                                      | `""`   |
| `mongodb.persistence.accessModes`  | Persistent Volume access modes                                                                       | `[]`   |
| `mongodb.persistence.size`         | Persistent Volume size                                                                               | `4Gi`  |
| `mongodb.databaseUrl`              | Set this if databaseUrl differs from standalone MongoDB URL structure (e.g: when using StatefulSets) | `nil`  |

### External Database parameters

| Name                              | Description                                                                       | Value   |
| --------------------------------- | --------------------------------------------------------------------------------- | ------- |
| `externalDatabase.enabled`        | To use an external database set this to true and set mongodb.enabled to false     | `false` |
| `externalDatabase.databaseUrl`    | External Database Url string                                                      | `nil`   |
| `externalDatabase.existingSecret` | The name of an existing secret with database credentials. Evaluated as a template | `""`    |

## Configuration and installation details

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install ollama \
  --set ollama.gpu.enabled=true \
  --set mongodb.enabled=true \
    braveokafor/ollama-webui
```
The above command enables GPU support for Ollama.
Additionaly it installs a MongoDB deployment, and configures authentication for the WebUI.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example:

```console
helm install ollama -f values.yaml braveokafor/ollama-webui
```

Example fully configured `values.yaml`:

```yaml
ollama:
  gpu:
    enabled: "true"
    num: 2
  pdb:
    create: "true"
  autoscaling:
    enabled: false
  persistence:
    accessModes:
      - ReadWriteOnce
  nodeSelector:
    cloud.google.com/gke-spot: "true"
    cloud.google.com/gke-accelerator: "nvidia-tesla-t4"
  resources:
    requests:
      memory: 8192Mi
      cpu: 4000m

webui:
  nodeSelector:
    cloud.google.com/gke-spot: "true"

mongodb:
  enabled: true

ingress:
  enabled: true
  pathType: Prefix
  hostname: ollama.example.com
  annotations:
    kubernetes.io/ingress.global-static-ip-name: ollama
    kubernetes.io/ingress.class: gce
  extraRoutes:
    - name: api.ollama.example.com
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: ollama-ollama-webui-ollama
              port:
                name: http
```

### External database support

You may want to have Ollama WebUI connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. 

To achieve this, the chart allows you to specify credentials for an external database with the [`externalDatabase` parameter](#database-parameters). You should also disable the MongoDB installation with the `mongodb.enabled` option. Here is an example:

```console
mongodb.enabled=false
externalDatabase.enabled=true
externalDatabase.databaseUrl="mongodb://ollama:ollamaR00tPassw0rd@example-mongodb.ollama:27017/"
```

### Ingress

This chart provides support for Ingress resources. 
If an Ingress controller, such as [nginx-ingress](https://kubeapps.com/charts/stable/nginx-ingress) or [traefik](https://kubeapps.com/charts/stable/traefik) is installed on the cluster, that Ingress controller can be used to serve Ollama WebUI.

To enable Ingress integration, set `ingress.enabled` to `true`. 
The `ingress.hostname` property can be used to set the host name. 
The `ingress.tls` parameter can be used to add the TLS configuration for this host.

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management.
