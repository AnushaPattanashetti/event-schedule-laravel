<!DOCTYPE HTML>
@include("header")

<div style="  padding: 25px 0px 50px 300px; ">
<div class="card " style="width:50%">
  <div class="card-header text-center ">
    <h2>Login </h2>
  </div>
    @if(Session::has('message'))
    <p class="alert {{ Session::get('alert-class', 'alert-danger') }}">{{ Session::get('message') }}</p>
    @endif
  <div class="card-body">
    <form action="./login/check" method="POST">
        @csrf
        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="Enter E-mail"/>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password"/>
        </div>
            
   
  </div>
  <div class="card-footer">
      <div class="form-group" style="padding:20px,10px">      
        <input type="submit" name="submit" id="submit" class="btn btn-primary" value="Login" aria-describedby="helpId">
        
      </div>

    </form>
  </div>

</div>

</div>


