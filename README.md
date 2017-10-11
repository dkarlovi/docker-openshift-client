# Openshift Origin CLI client

## Usage

```bash
docker run --rm --env KUBECONFIG=/kube/config -it -v$HOME/.kube:/kube dkarlovi/openshift-client oc version
```
