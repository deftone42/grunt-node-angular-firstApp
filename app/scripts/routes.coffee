App.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
	
	$urlRouterProvider.otherwise '/'

	$stateProvider
		.state('home', {
			url: "/",
			templateUrl: 'views/home/home.html'
		})
		.state('postArticle', {
			url: '/article/post',
			templateUrl: 'views/home/article/post.html'
		})
		.state('getArticle', {
			url: '/article/get/:article_id',
			templateUrl: 'views/home/article/get.html'
		})

]