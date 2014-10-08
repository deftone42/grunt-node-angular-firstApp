# Api service for calling to database and obtain a response, using promises
App.service 'ApiService', [ '$http', (http)->
    #Attributes
    apiConf = App.conf.api
    service = {}

    #PUBLIC FUNCTIONS
    service.getList = (model,id) ->
      if id?
        url = apiConf[model].route + id
      else
        url = apiConf[model].route

      promise = http.get(url)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise

    service.get = (model,id) ->
      promise = http.get(apiConf[model].route + id)
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

    service.delete = (model,id)->
      if id?
        url = apiConf[model].route + id
      else
        url = apiConf[model].route

      promise = http.delete(url)
        .success (data)->
          data
        .error (data)->
          console.log 'Error: ' + data

      promise


    service
]