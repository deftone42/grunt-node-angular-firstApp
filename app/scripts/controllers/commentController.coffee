App.controller 'commentController', ['$scope','ApiService', (scope,api) ->
	# ATTRIBUTES
	scope.commentData = {}
	scope.show = no

	# PUBLIC FUNCTIONS
	# Show all comment of an article
	scope.getComments = () ->
		api.getList('comment',scope.params.article_id).then (res) ->
			if res.status == 200
				scope.comments = res.data
	
	# when submitting the add form, send the text to the node API
	scope.createComment = ()->
		scope.commentData.article_id = scope.params.article_id
		api.post(scope.commentData,'comment').then (res) ->
			if res.status == 200
				scope.comments = res.data
				scope.commentData = {}

	scope.showComments = () ->
		scope.show = yes

	scope.getComments()
]