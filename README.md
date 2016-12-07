----------
#Structure of database

#users
List of columns
|id|name|email_adress|pass_word|
|:-:|:-:|:-:|:-:|


- id
- name     (name)
 - null:false
- email_address (integer)
 - null:false, unique:true
- pass_word(integer)
 - null:false
- add_index:name, email

#messages
Associates with groups table, users table and group_users table.
List of columns
|id|body|image|group_id|user_id|group_users_id|
|:-:|:-:|:-:|:-:|:-:|:-:|



- id
- body     (text:)
- image    (string)
- group_id (integer)
    - foreign_key:true
- user_id  (integer)
    - foreign-key:true
- group_users_id (integer)
    - foreign_key:true

#groups
Associates with group_users and message table.
List of columns
|id|name|
|:-:|:-:|


  - id
  - name     (text)
    - null:false

#group_users
Assosiates with users table, groups table and groups_users table.
List of columns
|user_id|group_id|message_id|
|:-:|:-:|:-:|


  - user_id  (integer)
    - foreign_key:true
  - group_id (integer)
    - foreifn_key:true
  - message_id (integer)
    - foreign_key:true

