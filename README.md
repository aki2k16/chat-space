----------
#Structure of database
####制約
 - NOT NULL制約 = null false
 - 一意性制約      = unique true
 - 外部キー制約  = foreign_key true  
----------
#### Table間のアソシーション
 - users
  - has_many :groups, through, group_users
  - has_many :groups_users
  - has_many :messages
 - messages
  - belongs_to :user
  - belongs_to :group
 - groups
  - has_many :users, through, group_users
  - has_many :group_users
  - has_many :messages
 - groups_users
  - belongs_to :user
  - belongs_to :group
----------
#users
List of columns
|columns|type|restriction|
|:--- |:--- |:--- |
| name|text|null :flase|
| email      |string       |null :false, unique :true|
| pass_word  |string       |null :false|
####nameとemailにindexを貼る。
#messages

List of columns

| columns    | type        | restriction |
|:-----------|:------------|:------------|
| body       | text        | null :false |
| image      | text        |             |
| user_id    | references  | foreign_key :true |
| group_id   | references  | fireign_key :true |
|created_at  | inteegr     |             |
####textとcreated_atにインデックスを貼る。
#groups

List of columns
| columns     | type        | restriction |
|:----------- |:------------|:------------|
| group_name  | string      | null :false, unique :false|
####group_nameにインデックスを貼る。
#groups_users

List of columns
| columns    | type        | restriction |
|:-----------|:------------|:------------|
|group_id    | references  | foreign_key :true |
|user_id     | references  | foreign-key :true |

