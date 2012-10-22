# Tracks controller to display tracks on a map
# Tracks documentation: http://wordsabout.it/mobile-devices/cloudconnect-user-documentation/cc-0004-tracks
App.tracksController = Em.Object.create({
  loadTracks: ->
    # ajax request to ask the apiv3
    $.ajax({
      # GET request (see documentation)
      url:  App.baseUrl('tracks'),
      dataType: 'jsonp',
      # QUERY STRING (see documentation)
      data: "&q=ret:(latitude,longitude,fields,asset)+asset:" + App.mapTracksView.asset,
      # display icon on a map on succes
      success: (data) ->
        if data.length <= 0
          window.alert "No track to display"
        else
          for track in data
            if track.latitude
              $('#map_canvas').gmap('addMarker', {
                    'position': new google.maps.LatLng(track.latitude / Math.pow(10, 5), track.longitude / Math.pow(10, 5)),
                    'bounds': true
              }).click ->
                # display fields from a track on click event
                str = "";
                $.each track.fields, (key, value) ->
                  str = str + key + ": "
                window.alert str
      # display the "error status" on error
      error: (xhr, ajaxOptions, thrownError) ->
        alert(xhr.status);
        alert(thrownError);
    })
});

# fields from the view to get the Asset to display
App.mapTracksView = Em.View.extend({
  name: 'Display Tracks',
  asset: '',
});
