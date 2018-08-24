# Concourse Resource to sync a directory to S3 [Concourse CI](http://concourse.ci)

## Usage

Include the following in your Pipeline YAML file, replacing the values in the angle brackets (`< >`):

```yaml
resource_types:
- name: <resource type name>
  type: docker-image
  source:
    repository: firespring/concourse-s3-sync-resource
resources:
- name: <resource name>
  type: <resource type name>
  source:
    access_key_id: {{aws-access-key}}
    secret_access_key: {{aws-secret-key}}
    directory: [<optional>, use to sync to a specific path of the resource instead of the default working directory]
    bucket: {{aws-bucket}}
    path: [<optional>, use to sync to a specific path of the bucket instead of root of bucket]
    options: [<optional, see note below>]
    region: <optional, see below>
jobs:
- name: <job name>
  plan:
  - <some Resource or Task that outputs files>
  - put: <resource name>
```

## AWS Credentials

The `access_key_id` and `secret_access_key` are optional and if not provided the EC2 Metadata service will be queried for role based credentials.

## Options

The `options` parameter is synonymous with the options that `aws cli` accepts for `sync`. Please see [S3 Sync Options](http://docs.aws.amazon.com/cli/latest/reference/s3/sync.html#options) and pay special attention to the [Use of Exclude and Include Filters](http://docs.aws.amazon.com/cli/latest/reference/s3/index.html#use-of-exclude-and-include-filters).

Given the following directory `test`:

```
test
├── results
│   ├── 1.json
│   └── 2.json
└── scripts
    └── bad.sh
```

we can upload _only_ the `results` subdirectory by using the following `options` in our task configuration:

```yaml
options:
- "--exclude '*'"
- "--include 'results/*'"
```

### Region
Interacting with some AWS regions (like London) requires AWS Signature Version
4. This options allows you to explicitly specify region where your bucket is
located (if this is set, AWS_DEFAULT_REGION env variable will be set accordingly).

```yaml
region: eu-west-2
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/firespring/concourse-s3-sync-resource.

For details on the pull request process please see our [contributing documentation](CONTRIBUTING.md)