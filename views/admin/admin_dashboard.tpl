% rebase('base.tpl', title='Page Title')

<br>
<div class="jumbotron jumbotron">
  <div class="container">
    <h3 class="text-center">Welcome to TechGist Blog!</h3><br>
    <p class="lead text-center">Read about the latest happening in the tech world...</p>
  </div>
</div>

<div class="lead">
	<a href="/admin/add_post" class="btn btn-primary">Add new post</a>
</div><br>

%if posts.count() < 1:
   <h3 class="text-center"> No blog post at the moment, check back later... </h3>
%end

%for post in posts:
    <div class="card">
      <div class="card-header">
        added on: {{post['date']}}
      </div>
      <div class="card-block" style="padding: 9px;">
        <h4 class="card-title">{{post['title']}}</h4>
        <p class="card-text">{{post['content']}}</p>
        <a href="/post/{{post['_id']}}" target="_blank" class="btn btn-primary">View</a>
        <a href="/admin/post/update/{{post['_id']}}" class="btn btn-info">Edit</a>
        <a href="/admin/post/delete/{{post['_id']}}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this post?')">Delete</a>
      </div>
    </div> <br>
%end