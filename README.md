[wms.elte.hu](http://wms.elte.hu)
=================================

Az ELTE Térképtudományi és Geoinformatikai Tanszékének nyílt forrású térinformatikai szervere.

Függőségek
----------

* Ansible >= 2.2.0

Provisioning futtatása
----------------------

```sh
ansible-playbook -s ansible/main.yaml -i ansible/hosts -vv
```
