{% from "aws_efs/map.jinja" import aws_efs with context %}

{{ aws_efs.nfs_pkg_name }}:
  pkg.installed: []
