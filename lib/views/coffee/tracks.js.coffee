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
          i = 0
          for marker in marker_source
            map.removeLayer(marker_source[i++])
          i = 0
          for track in data
            if track.latitude
              lat = track.latitude / Math.pow(10, 5)
              lng = track.longitude / Math.pow(10, 5)
              marker_source[i] = L.marker([lat, lng]).addTo(map);
              # display fields from a track on click event
              str = "";
              $.each track.fields, (key, value) ->
                str = str + key + "<br />"
              marker_source[i++].bindPopup(str);
          map.setView([lat, lng], 13, true);
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
