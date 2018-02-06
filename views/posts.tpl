% rebase('base.tpl', title='Page Title')

<br>
<div class="jumbotron jumbotron">
  <div class="container">
    <h3 class="text-center">Welcome to TechGist Blog!</h3><br>
    <p class="lead text-center">Read about the latest happening in the tech world...</p>
  </div>
</div>

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
        <a href="/post/{{post['_id']}}" class="btn btn-primary">View</a>
      </div>
    </div> <br>
%end