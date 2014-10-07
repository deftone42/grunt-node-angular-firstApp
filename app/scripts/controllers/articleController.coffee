App.controller 'articleController', ['$scope','$http','ApiService', (scope,$http,api) ->
	scope.articleData = {}
	scope.currentArticle = {}

	# PUBLIC FUNCTIONS
	# Show all articles
	scope.getArticles = () ->
		api.getList('article').then (res) ->
			scope.articles = res.data

	# when submitting the add form, send the text to the node API
	scope.createArticle = ()->
		api.post(scope.articleData,'article').then (res) ->
			scope.articles = res.data
			if res.status == 200
				scope.goHome()

	# delete a article after checking it
	scope.deleteArticle = (id)->
		api.delete(id,'article').then (res) ->
			scope.articles = res.data

	# Set the current article in the specific view
	scope.showArticle = (id) ->
		api.get(id,'article').then (res) ->
			console.log res
			if res.status == 200
				scope.currentArticle = res.data[0]
				scope.goToArticle id

	scope.getArticles()
]