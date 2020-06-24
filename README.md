# Go command action

This action runs a go command with librdkafka support. This action action was motivated by a limitation of Github Action environment. 

## Inputs

### `cmd`

**Required** The Go command to run without the prefix (e.g. `"test ./.."`)

### `workDir`

**Optional** Path to the Go project directory (e.g. `"/go/src/github.com/org/repo"`)

## Example usage


```
uses: mshield-ai/github-action-go-librdkafka@v1
with:
  cmd: 'test -tags dynamic ./...'
  workDir: '/go/src/github.com/mshield-ai/aegis'
```