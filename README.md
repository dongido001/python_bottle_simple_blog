# Python Bottle Simple Blog

> This project demonstrates how to build a simple blog with Python Bottle framework.

## Requirement
Make sure you have the following installed on your system:

1. Python (This code should run on both python2.7 and python3)
2. [MongoDB](https://www.mongodb.com/)
3. [virtualenv](https://virtualenv.pypa.io/en/stable/installation/)

# How to Setup

1. Clone the repository:
```sh
$ clone https://github.com/dongido001/python_bottle_simple_blog.git
```

2. CD(change directory) to the project root folder:
```sh
$ cd bottle_blog
```

3. Create a virtual environment:
```sh
 $ virtualenv env
```

4. Activate the environment:
```sh
 $ source env/bin/activate
```

5. Install dependencies:
```sh
 $ pip install -r requirements.txt
```

6. Update your database information in `blog_con.py`

5. In `blog_con.py`, we used `blog` as our database. If you have maintained the same name, make sure to create a database with that name in MongoDB or with the desired name you choose.

7. Startup mongodb:
```sh
 $ mongod
``` 
> If you got permission error, try with `sudo` or use a user who have permission to run the command.

8. Run the server:
```sh
python index.py
```

9. Relax and use the blog :fire: