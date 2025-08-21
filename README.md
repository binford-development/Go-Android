# Go for Android (arm64)

This repo automates the process of building Go for Android (arm64-v8a) devices using GitHub Actions.
Support for cgo is included in this build.


## How it Works

- An "update" workflow is scheduled to check for new versions of Go once every week
- Detection of a new version will trigger the "build" workflow, and a new Go binary will be compiled
- Upon successful completion of the "build" workflow, the "release" workflow will publish the binary as
  a new release. Artifacts produced by successful builds will also be available for download in Actions


## Manual Build

Builds of Go-Android can also be sstarted manually.
To manually build a specific version of Go:

1. Go to "Actions" > "Build Go for Android"
2. Click "Run workflow"
3. Enter the version, e.g., `go1.22.2`

## Output

- Binaries produced by successful builds will appear under `go/pkg`
