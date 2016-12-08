----------
#Structure of database

#users
List of columns


- id
- name     (name)
 - null:false
- email_address (integer)
 - null:false, unique:true
- pass_word(integer)
 - null:false
- add_index:name, email

#messages
Associate with groups table, users table and group_users table.
List of columns



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
Associate with group_users table.
List of columns


  - id
  - name     (text)
    - null:false

#group_users
Assosiates with users table, groups table and groups_users table.
List of columns


  - user_id  (integer)
    - foreign_key:true
  - group_id (integer)
    - foreifn_key:true
  - message_id (integer)
    - foreign_key:true

