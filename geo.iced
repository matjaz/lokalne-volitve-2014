geocoder = require 'node-geocoder'
geo = geocoder.getGeocoder 'google'

data = require "./#{process.argv[2]}"


for obj in data when obj.Naslov and not obj.latitude?
  await do (obj) ->
    address = "#{obj.Naslov} #{obj.Pošta}"
    promise = geo.geocode address
    defered = defer x
    promise.then (res) ->
      res = res[0] if Array.isArray res
      obj.latitude  = res.latitude
      obj.longitude = res.longitude
      defered()
    promise.catch (err) ->
      console.error address, err
      defered()

console.log JSON.stringify data
