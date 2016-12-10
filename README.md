----------
#Structure of database
####制約
 - NOT NULL制約 = null false
 - 一意性制約      = unique true
 - 外部キー制約  = foreign_key true  


----------


#### Table間のアソシーション
 - users
  - has_many :groups, through, group_users table
  - has_many :groups_users
  - has_many :messages
 - messages
  - belongs_to :users
  - belongs_to :groups
 - groups
  - has_many :users, through, group_users table
  - has_many :group_users
  - has_many :messages
 - group_users
  - belongs_to :users
  - belongs_to :groups
 


----------


#users 
List of columns
| columns    | type        |restriction |
|:-----------|:------------|:-------------| 
| id         |             |           | 
| name       |text         |null :flase|
| email      |string       |null :false, unique :true|
| pass_word  |string       |null :false|
####nameとemailにindexを貼る。
#messages
List of columns 
| columns    | type        | restriction |
|:-----------|:------------|:------------|
| id         |             |             |
| text       | text        | null :false |
| image      | text        |             |
| users_id   |             |             |
| group_id   |             |             |
|created_at  |             |             |
####textとcreated_atにインデックスを貼る。
#groups
List of columns
| columns     | type        | restriction |
|:----------- |:------------|:------------|
| id          |             |             |
| group_name  | text        | null :false, unique :false |
| user_id     |             |             |
| message_id  |             |             |
####group_nameにインデックスを貼る。
#group_users
List of columns
| columns    | type        | restriction |
|:-----------|:------------|:------------|
|id          |             |             |
|group_id    |             |             |
|user_id     |             |             |
