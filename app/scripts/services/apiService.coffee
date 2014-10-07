App.service 'ApiService', [ '$http', (http)->
    #Attributes
    apiConf = App.conf.api
    service = {}

    #PUBLIC FUNCTIONS
    service.getList = (model) ->
      promise = http.post(apiConf[model].route, null)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise

    service.get = (id,model) ->
      promise = http.post(apiConf[model].route + id)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise

    service.post = (object,model) ->
      promise = http.post(apiConf[model].route, object)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise

    service.delete = (id,model)->
      promise = http.delete(apiConf[model].route + id)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise


    service
]