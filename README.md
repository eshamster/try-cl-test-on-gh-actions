![.github/workflows/main.yml](https://github.com/eshamster/try-cl-test-on-gh-actions/workflows/.github/workflows/main.yml/badge.svg?event=push)

# try-cl-test-on-gh-actions

A trial GitHub Action to test Common Lisp.

## Summary

This action tests Common Lisp project under the following conditions.

- Docker container: [eshamster/cl-base](https://hub.docker.com/repository/docker/eshamster/cl-base)
- Test library: [fukamachi/rove](https://github.com/fukamachi/rove)
- Common Lisp implementations
    - SBCL (`sbcl-bin`)
    - Clozure CL (`ccl-bin`)

## Usage

- inputs
    - `lisp`: A name of Common Lisp implementation. Currently, the followings can be used.
        - `sbcl-bin`
        - `ccl-bin`
    - `installTargets` [optional]: Comma separated installation targets that can be installed by `ros install`

e.g. Put `.github/workflows/xxx.yml` like the following to your Common Lisp project.

```yml
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        lisp: [sbcl-bin, ccl-bin]
    name: A job to test Common Lisp project
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Test step
      id: test
      uses: eshamster/try-cl-test-on-gh-actions@v0.3.0
      with:
        lisp: '${{ matrix.lisp }}'
        # optional
        installTargets: 'eshamster/ps-experiment,eshamster/cl-ps-ecs'
```

## License

These codes are licensed under CC0.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
