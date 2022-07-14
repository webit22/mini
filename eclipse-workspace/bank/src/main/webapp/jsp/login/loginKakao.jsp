<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Signin Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="/bank/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
    
    <script src="/bank/resources/js/myJS.js"></script>
    <script>
	function checkForm() {
		
		let f = document.loginForm
		
		if(isNull(f.id, "아이디를 입력하세요"))
			return false
		
		if(isNull(f.password, "패스워드를 입력하세요"))
			return false
		
		return true
	}
</script>
</head>

<body class="text-center">
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
  
	<form class="form-signin" style="background-color: grey">
  		<img class="mb-4" src="/bank/resources/images/blueberry.png" alt="" width="72" height="72">
  		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  		<label for="inputEmail" class="sr-only">Email address</label>
	  	<input type="email" id="inputEmail" class="form-control" 
	  			style="width: 300px;" 
	  			placeholder="Email address" required autofocus>
  		<label for="inputPassword" class="sr-only">Password</label>
  		<input type="password" id="inputPassword" class="form-control" 
  				style="width: 300px;" 
  				placeholder="Password" required>
  		
  		<div class="checkbox mb-3">
    		<label>
      			<input type="checkbox" value="remember-me"> Remember me
    		</label>
  		</div>
  		
  		<button class="btn btn-lg btn-primary btn-block" type="submit" >Sign in</button><br>
  
  		<!-- kakao login button -->
  		<a href="javascript:kakaoLogin();" >
			<img src="/bank/resources/images/kakao_login_button.png" style="width:200px;">
  		</a>
  
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
			/* kakao sdk 초기화 */
			window.Kakao.init('349cbf5c1fc4525e01f563ecf1b768df');
			
			/* SDK 초기화 여부를 판단 */
			console.log(Kakao.isInitialized());
			
			/* 추가 항목 동의 받기, 사용자 정보 가져오기 */ 
			function kakaoLogin(){
				window.Kakao.Auth.login({
					scope:'profile_nickname, profile_image, account_email',
					success: function(authObj){
						console.log(authObj);
						window.Kakao.API.request({
							url:'/v2/user/me',
							data: {
								property_keys: [  "kakao_account.profile_nickname"
												, "kakao_account.profile_image"
												, "kakao_account.account_email" ]
							},
							success: function(response) {
								console.log(response);
								document.write(response.profile_nickname);
								alert('login successful!');
								location.href="/bank/jsp/board/list.jsp";
							},
							fail: function(error){
								console.log(error);
							}
						});
					} 
				})
			}
			
		</script>
  	<p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
	</form>
</body>
</html>
