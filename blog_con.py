from pymongo import MongoClient

mongo_client = MongoClient("localhost", 27017)
db = mongo_client.blog
post_coll = db.posts
user_coll = db.users
post_comment_coll = db.comments