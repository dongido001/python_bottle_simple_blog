from bottle import route, run, template, get, post, request, redirect, datetime, hook
from bson.json_util import dumps
from bson import ObjectId
import bottle
import beaker.middleware
import bson
from blog_con import user_coll, post_coll, post_comment_coll
from pymongo.errors import PyMongoError
from argon2 import PasswordHasher


ph = PasswordHasher() 

session_opts = {
    'session.type': 'file',
    'session.data_dir': './session/',
    'session.auto': True,
}

app = beaker.middleware.SessionMiddleware(bottle.app(), session_opts)


@route('/posts')
@route('/')
def index():
    posts = post_coll.find()
    return template('posts', dict(posts=posts))

@get('/admin/login')
def login():
    return template('admin/login')

@post('/admin/login')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if validate_login(username, password):
        request.session['username'] = username
        redirect("/admin/dashboard")
    else:
        return "<p>Login failed. please try</p>"

# Just a harded means to add new user - please remove this in production
@get('/admin/newAdmin')
def add_admin():
    newUser("dongido", "dongido", "test@gmail.com")
    
    redirect('/admin/login')

@get('/admin/dashboard')
def dashboard():
    if 'username' not in request.session:
        redirect('/admin/login')

    posts = post_coll.find()
    return template('admin/admin_dashboard', dict(posts=posts))

@get('/admin/add_post')
def add_post():
    if 'username' not in request.session:
        redirect('/admin/login')

    return template('admin/add_new_post', status=None)

@post('/admin/add_post')
def add_post():
    if 'username' not in request.session:
        redirect('/admin/login')

    title    = request.forms.get('title')
    content  = request.forms.get('content')
    date     = datetime.now()
    added_by = request.session['username']

    new_post = post_coll.insert({"title": title, "content": content, "added_by": added_by, "date": date})

    # return something to indicate the it has been added.
    status = None
    if new_post:
        status = "success"

    return template('admin/add_new_post', status=status)

@route('/post/<post_id>')
def index(post_id):
    post = post_coll.find_one({"_id": ObjectId(post_id)})
    comments = post_comment_coll.find({"post_id": ObjectId(post_id)})

    return template('single-post', comments=comments, post=post)

@get('/admin/post/update/<post_id>')
def index(post_id):
    if 'username' not in request.session:
        redirect('/admin/login')

    post = post_coll.find_one({"_id": ObjectId(post_id)})

    return template('admin/update_post', post=post, status=None)

@post('/admin/post/update/<post_id>')
def index(post_id):
    
    if 'username' not in request.session:
        redirect('/admin/login')

    title = request.forms.get('title')
    content = request.forms.get('content')

    update_post = post_coll.update_one({"_id": ObjectId(post_id)}, {"$set":{"title": title, "content": content}})
    post = post_coll.find_one({"_id": ObjectId(post_id)})
    
    # return something to indicate the it has been added.
    status = None
    if update_post:
        status = "success"

    return template('admin/update_post', post=post, status=status)

@route('/admin/post/delete/<post_id>')
def index(post_id):
    if 'username' not in request.session:
        redirect('/admin/login')

    post_coll.delete_one( {"_id": ObjectId(post_id)} )
    return template('admin/delete_post', post_id=post_id)

@post('/post/comment/<post_id>')
def index(post_id):
    
    name = request.forms.get('name')
    comment = request.forms.get('comment')

    post_comment_coll.insert_one(
        {
            "post_id": ObjectId(post_id),
            "name": name,
            "comment": comment,
            "date": datetime.now()
        }
    )

    redirect('/post/'+post_id)

@hook('before_request')
def setup_request():
    request.session = request.environ['beaker.session']


def validate_login(username, password):

    try:
        user = user_coll.find_one({'_id':username})
    except PyMongoError:
        raise EnvironmentError
        print("Unable to query database for user")

    if user == None:
        return False
    
    try:
        if ph.verify(user['password'], password):
            return  True
        return False
        
    except ValueError:
        return False


# creates a new admin user in the database

def newUser(username, password, email):
    password_hash = ph.hash(password)

    user = {'_id':username, 'password':password_hash}
    if (email != ""):
        user['email'] = email

        user_insert = user_coll.insert(user)

    return True

bottle.run(host='localhost', port=8181, debug=True, reloader=True, app=app) 