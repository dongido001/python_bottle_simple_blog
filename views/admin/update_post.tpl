% rebase('base.tpl', title='Page Title')

<div class="text-right"><br>
	<a href="/admin/dashboard" class="btn btn-primary">Back</a>
</div>

%if status is not None:
	<div class="alert alert-success" role="alert">
	  <strong>Post updated!</strong>.
	</div>
%end

<br><section class="container">
  <form method="POST">
  	<imput type="hidden" name="post_id" value="{{post['_id']}}">
	  <div class="form-group">
	    <label for="exampleInputEmail1">blog titile</label>
	    <input type="text" class="form-control" name="title" aria-describedby="emailHelp" placeholder="Post title" value="{{post['title']}}" name="title">
	  </div>

	  <div class="form-group">
	    <label for="exampleTextarea">Blog Content</label>
	    <textarea class="form-control" id="exampleTextarea" rows="6" name="content" >{{post['content']}}</textarea>
	  </div>
  
	  <button type="submit" class="btn btn-primary">Submit</button>
 </form> <br>
</section>