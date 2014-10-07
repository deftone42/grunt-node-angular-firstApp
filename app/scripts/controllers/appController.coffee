App.controller 'appController', ['$scope','$state', (scope,$state) ->
	scope.title = App.conf.title

	# PUBLIC FUNCTIONS
	scope.goHome = () ->
		$state.go('home')

	scope.goToArticle = (id) ->
		$state.go('getArticle', { 'article_id': id })
]