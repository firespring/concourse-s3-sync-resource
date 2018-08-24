# Contributing

Pull requests are always appreciated.

To get started contributing, fork and clone the repo:

```
git clone git@github.com:your-username/concourse-s3-sync-resource.git
```

## Development

Requires [Docker](https://www.docker.com/).

1. Run `cp config.example.json config.json`.
1. Modify `config.json`.
  * See [the instructions for getting your AWS credentials](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html#cli-signup).
  * Exclude the `s3://` prefix/protocol for `bucket`.

1. Run `./test/out </full/path/to/dir>`.
1. Run `./test/in </full/path/to/dir>`.
1. Run `./test/check`.