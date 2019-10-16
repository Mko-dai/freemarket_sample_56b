# README
​
## usersテーブル
|Column|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|frist_name|string|null: false|
|last_name_kana|string|null: false|
|frist_name_kana|string|null: false|
|selling_items|string|null: false|
|sold_items|string|null: false|
|trading_item|string|null: false|
|bought_items|string|null: false|
|balance|integer|null: false|
|point|integer|null: false|
|birthday|string|null: false|
|value|integer|null: true|
|phone_number|string|null: false|
|payment|string|null: false|
|identification|string|null: false|
|evaluation|integer||

### Association
- has_many :items
- has_many :likes
- has_one :address
- has_many :item_comments
- has_many :trading_comments

## addressテーブル
|Column|Type|Options|
|-----|----|-------|
|code|string|null: false|
|Prefectures|string|null: false|
|city|string|null: false|
|town|string|null: false|
|address_number|string|null: false|
|building|string||
|room_number|string||

### Association
- belongs_to :user
​
## item_commentsテーブル
|Column|Type|Options|
|-----|----|-------|
|body|text|null: false|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## trading_commentsテーブル
|Column|Type|Options|
|-----|----|-------|
|body|text|null: false|
|user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
​
## itemsテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null: false|
|description|string|null: false|
|image|string|
|price|integer|null: false|
|size|string|null: false|
|category_id|reference|null: false|
|brand_id|reference|null: false|
|status|string|null: false|
|ship_method|string|null: false|
|ship_fee|string|null: false|
|ship_person|string|null: false|
|ship_area|string|null: false|
|ship_days|string|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :likes
- has_many :item_comments
- has_many :trading_comments
​
## categoriesテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null: false|

### Association
- has_many :item, trough: items_categories

## brandsテーブル
|Column|Type|Options|
|-----|----|-------|
|name|string|null: false|

### Association
- has_many :items, trough: items_brands

## likesテーブル
|Column|Type|Options|
|-----|----|-------|
|user-id|integer|null: false|
|item-id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :item

## items_categoriesテーブル
|column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category

## items_brandsテーブル
|column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :brand