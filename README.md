# 💻 Workstation Ansible playbook

This repository contains the Ansible playbook used for configuring an Arch linux machine.

## ✅ Requirements and connection

This playbook is intended to be run locally on machines with Ansible installed.
The playbook has been tested on an Arch linux installation with Ansible 11.2.0 installed.

## 🚀 Running the playbook

To run the playbook on your local machine use:

```bash
ansible-playbook playbook.yml
```

_Note that your sudo password will be requested in order to install packages._

## 📁 Project structure

This project aims to keep as much Ansible code as possible into distinct generic Ansible roles located in the [`/roles`](/roles) directory.
