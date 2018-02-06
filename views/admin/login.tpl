% rebase('base.tpl', title='Page Title')

<section class="Aligner" style="margin-top: 50px;">
	<form method="POST" action="/admin/login">
	  <div class="form-group">
	    <label for="formGroupExampleInput">Username/email</label>
	    <input type="text" class="form-control" name="username" placeholder="Username/password" required="">
	  </div>
	  <div class="form-group">
	    <label for="formGroupExampleInput2">Password</label>
	    <input type="password" class="form-control" placeholder="Password" name="password" required>
	  </div>

	    <button type="submit" class="block btn btn-primary">Sign in</button>
	</form>
</section>