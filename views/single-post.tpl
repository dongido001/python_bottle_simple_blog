% rebase('base.tpl', title='Page Title')

<div class="card mb-3">
  <img class="card-img-top" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22769%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20769%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160cfb69b74%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A38pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160cfb69b74%22%3E%3Crect%20width%3D%22769%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22266.21875%22%20y%3D%22107.4%22%3EImage%20cap%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Card image cap">
  <div class="card-block">
    <h4 class="card-title text-center"><u>{{post['title']}}</u></h4>
    <p class="card-text">{{post['content']}}</p>
    <p class="card-text"><small class="text-muted">added on: {{post['date']}}</small></p>
  </div>
    
    <hr>
       <h4 class="text-center"> Recent comments</h4>
    <hr>

	%for comment in comments:
	    <section class="container">
			<ul class="list-unstyled">
			  <li class="media">
			    <img class="d-flex mr-3" src="https://avatars.devrant.com/v-18_c-3_b-6_g-m_9-1_1-3_16-5_3-1_8-1_7-1_5-1_12-3_6-68_10-1_2-5_15-24_11-1_4-1.jpg" alt="Generic placeholder image">
			    <div class="media-body">
			      <h6 class="mt-0 mb-1">by: <b>{{comment['name']}}</b> | added on: 
			      	<b>{{comment['date']}}</b></h6><br>
			      {{comment['comment']}}
			    </div>
			  </li>
			</ul>
		</section>
	%end

    <hr>
       <h4 class="text-center"> Add comments</h4>
    <hr>

	<section class="container">
	  <form method="POST" action="/post/comment/{{post['_id']}}">
		  <div class="form-group">
		    <label>Name</label>
		    <input type="text" class="form-control" aria-describedby="emailHelp" placeholder="Name" name="name" required>
		  </div>

		  <div class="form-group">
		    <label>Comment</label>
		    <textarea class="form-control" rows="3" name="comment" required></textarea>
		  </div>

		  <button type="submit" class="btn btn-primary">Submit</button>
	 </form> <br>
	</section>

</div>