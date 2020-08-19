# OnePassword Random Root Password Changer

Use 1Password's CLI client to generate and apply random root passwords to Linux servers

## Requirements 

Requires a 1Password account, the 1Password cli tool (op) and Ansible

## Download 1Password cli tool

```sh
wget https://cache.agilebits.com/dist/1P/op/pkg/v1.5.0/op_linux_amd64_v1.5.0.zip
unzip op_linux_amd64_v1.5.0.zip
mv op /usr/local/bin/
```

## Create inventory file -> nodes

Create a list of servers in the nodes file, with one server name per line.

This gets used to create/update the 1Password credentials, as well as an inventory file for the Ansible-playbook that updates the password

## Login to 1Password using the cli

Like any of their clients, 2FA is supported.

Intially log in specifying subdomain and user account email:

```sh
op signin example.1password.com wendy_appleseed@example.com
```
Supply 

Afterwards you can use:

```sh
eval $(op signin YOUR_1PASSWORD_SUBDOMAIN)
```
to sign in again before executing scripts


# Creating, changing and updating the root password

## Create 1Password entries for servers

Run (create_root_pw.sh) after login into 1Password cli, this will create the passwords on 1Password using the server names as the item name, defaults to vault name = LinuxRootPasswords and username = root with randomized 16 charcter password

## Change Root passwords using Ansible

Run the Ansible-playbook


```sh
ansible-playbook -i nodes onepassword.yml
```

or if key based authentication is not configured yet:

```sh
ansible-playbook -i nodes onepassword.yml -u ANSIBLE_USER --ask-pass
```
## Update 1Password entries for servers (Change it, but keeps history of previous password)

Run (update_root_pw.sh) to change exisint passwords in 1Password, and then run the Ansbile-playbook again to apply the new password