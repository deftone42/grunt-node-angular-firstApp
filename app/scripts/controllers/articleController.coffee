App.controller 'articleController', ['$scope','ApiService','$stateParams', (scope,api,$stateParams) ->
	# ATTRIBUTES
	scope.articleData = {}
	scope.currentArticle = {}
	scope.params = $stateParams

	# PUBLIC FUNCTIONS
	# Show all articles
	scope.getArticles = () ->
		api.getList('article').then (res) ->
			if res.status == 200
				scope.articles = res.data

	# when submitting the add form, send the text to the node API
	scope.createArticle = ()->
		api.post(scope.articleData,'article').then (res) ->
			scope.articles = res.data
			if res.status == 200
				scope.goHome()

	# delete a article after checking it
	scope.deleteArticle = (id)->
		api.delete('article',id).then (res) ->
			scope.articles = res.data

	# Set the current article in the specific view
	scope.showArticle = (id) ->
		api.get('article',id).then (res) ->
			if res.status == 200
				scope.currentArticle = res.data[0]

	scope.getArticles()
]