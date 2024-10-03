## Create a NACL

```sh
aws ec2 create-network-acl \
--vpc-id vpc-0b2f486c3ebfd78da
```

## Add entry

```sh
aws ec2 create-network-acl-entry
--network-acl-id {acl-id} \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block {ip}/32 \
--rule-action deny
```