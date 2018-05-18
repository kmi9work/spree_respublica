do ->
  $(document).ready ->
    $.ajaxSetup headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

    geo_success = (position) ->
      check_select position.coords.latitude, position.coords.longitude

    geo_error = ->
      alert 'Geolocation API не поддерживается в вашем браузере.'

    check_select = (latitude, longitude) ->
      $.post '/geolocation_get', {
        latitude: latitude
        longitude: longitude
      }, (data, status) ->
        closest_id = data
        if $('#geolocation-select').val() != closest_id
          if confirm('Сменить магазин?')
            $('#geolocation-select').val closest_id
            $('#geolocation-select').change()

    $('#geolocation-select').change ->
      $.post '/geolocation_set', { id: $(this).val() }, (data, status) ->
        if status
          location.reload()

    geo_options = 
      enableHighAccuracy: true
      maximumAge: 30000
      timeout: 27000

    wpid = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options)

    
