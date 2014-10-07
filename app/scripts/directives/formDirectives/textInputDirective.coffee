App.directive "textInput", [ ->
  restrict: 'E'
  replace: true
  scope:
    model: '='
    type: '@'
  templateUrl: "/views/home/directives/formDirectives/textInputDirective.html"
  link: (scope, element, attrs) ->
    scope.placeholder = scope.type.substr(0, 1).toUpperCase() + scope.type.substr(1)

    scope.setInput = () ->
      target = $('#'+scope.type)
      scope.model = target.val()
]
