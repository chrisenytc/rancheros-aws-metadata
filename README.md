# RancherOS AWS Metadata

> A system service to add AWS metadata on RancherOS environment

```bash
           ,/         \,
          ((__,-"""-,__))
           `--)~   ~(--`
          .-'(       )`-,
          `~~`d\   /b`~~`
              |     |
              (6___6)
               `---`

      RancherOS AWS Metadata
```

[![Maintenance](https://img.shields.io/maintenance/yes/2018.svg)]()
[![License](https://img.shields.io/github/license/chrisenytc/rancheros-aws-metadata.svg)](https://github.com/chrisenytc/rancheros-aws-metadata/blob/master/LICENSE)
[![GitHub forks](https://img.shields.io/github/forks/chrisenytc/rancheros-aws-metadata.svg)](https://github.com/chrisenytc/rancheros-aws-metadata/network)
[![GitHub stars](https://img.shields.io/github/stars/chrisenytc/rancheros-aws-metadata.svg)](https://github.com/chrisenytc/rancheros-aws-metadata/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/chrisenytc/rancheros-aws-metadata.svg)](https://github.com/chrisenytc/rancheros-aws-metadata/issues)
[![Docker Pulls](https://img.shields.io/docker/pulls/chrisenytc/rancheros-aws-metadata.svg)](https://hub.docker.com/r/chrisenytc/rancheros-aws-metadata/)
[![Docker Stars](https://img.shields.io/docker/stars/chrisenytc/rancheros-aws-metadata.svg)](https://hub.docker.com/r/chrisenytc/rancheros-aws-metadata/)

[![Twitter Follow](https://img.shields.io/twitter/follow/chrisenytc.svg?style=social&label=Follow)](http://twitter.com/chrisenytc)
[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=Awesome%20https://github.com/chrisenytc/rancheros-aws-metadata%20via%20@chrisenytc)

## Supported tags and respective `Dockerfile` links

- [`1.0.0`](https://github.com/chrisenytc/rancheros-aws-metadata/blob/1.0.0/Dockerfile)

## How to use

Add this [cloud-init](http://cloudinit.readthedocs.io) config on your EC2 user-data or in your rancher configuration file.

```yaml
#cloud-config
rancher:
  services:
    aws-metadata:
      image: chrisenytc/rancheros-aws-metadata:1.0.0
      privileged: true
      labels:
        io.rancher.os.after: network
        io.rancher.os.scope: system
        io.rancher.os.reloadconfig: 'true'
        io.rancher.os.createonly: 'false'
        cron.schedule: "*/5 * * * *"
      volumes:
        - /usr/bin/ros:/bin/ros:ro
        - /var/lib/rancher/conf:/var/lib/rancher/conf:rw
```

### Environment list

  * `AWS_AVAILABILITY_ZONE`
  * `AWS_DEFAULT_REGION`
  * `AWS_IAM_ROLE`
  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`
  * `AWS_SECURITY_TOKEN`
  * `AWS_AMI_ID`
  * `AWS_AMI_LAUNCH_INDEX`
  * `AWS_AMI_MANIFEST_PATH`
  * `AWS_INSTANCE_ID`
  * `AWS_INSTANCE_TYPE`
  * `AWS_INSTANCE_ACTION`
  * `AWS_HOSTNAME`
  * `AWS_LOCAL_HOSTNAME`
  * `AWS_LOCAL_IPV4`
  * `AWS_PUBLIC_IPV4`
  * `AWS_MAC_ADDRESS`
  * `AWS_SECURITY_GROUPS`
  * `AWS_RESERVATION_ID`

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/chrisenytc/rancheros-aws-metadata](https://github.com/chrisenytc/rancheros-aws-metadata). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it [chrisenytc/rancheros-aws-metadata](https://github.com/chrisenytc/rancheros-aws-metadata/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Support
If you have any problem or suggestion please open an issue [here](https://github.com/chrisenytc/rancheros-aws-metadata/issues).

## License 

Check [here](LICENSE).