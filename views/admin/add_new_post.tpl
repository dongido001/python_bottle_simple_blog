% rebase('base.tpl', title='Page Title')

<div class="text-right"><br>
	<a href="/admin/dashboard" class="btn btn-primary">Back</a>
</div>

%if status is not None:
	<div class="alert alert-success" role="alert">
	  <strong>Post added!</strong>.
	</div>
%end

<section class="container" style="margin-top: 40px;">
  <form method="POST">
	  <div class="form-group">
	    <label for="exampleInputEmail1">blog titile</label>
	    <input type="text" class="form-control" name="title" aria-describedby="emailHelp" placeholder="Post title" required>
	  </div>

	  <div class="form-group">
	    <label for="exampleTextarea">Blog Content</label>
	    <textarea class="form-control" id="exampleTextarea" rows="6" name="content" required></textarea>
	  </div>

	  <button type="submit" class="btn btn-primary">Submit</button>
 </form> <br>
</section>