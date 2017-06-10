{% from "aws_efs/map.jinja" import aws_efs with context %}

{% for v in aws_efs.volumes %}
efs-share-{{ v.name }}:
  mount.mounted:
    - name: /mnt/efs-{{ v.name }}
    - device: {{ v.aws_host }}:/
    - fstype: nfs4
    - mkmnt: True
    - opts: nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2
    - require:
      - pkg: {{ aws_efs.nfs_pkg_name }}
{% endfor %}
