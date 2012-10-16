# basic function number_to_human_size used by messages controller
window.number_to_human_size = (size) ->
  if(size < 1024)
    return size + ' bytes'
  else if(size < 1024.0 * 1024.0)
    return (size / 1024.0).toFixed(2) + ' KiB'
  else if(size < 1024.0 * 1024.0 * 1024.0)
    return (size / 1024.0 / 1024.0).toFixed(2) + ' MiB'
  else
    return (size / 1024.0 / 1024.0 / 1024.0).toFixed(2) + ' GiB'
window.number_to_human_size

# basic function display_date used by message controller
window.display_date = (date) ->
  return "n/a" if date == null

  month_name = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  date = date.split("T")
  dmy = date[0].split("-")
  date_tmp = date[1].split("+")
  hms = date_tmp[0].split(":")

  date = new Date(dmy[0], dmy[1], dmy[2], hms[0], hms[1], hms[2], 0)
  now = new Date(Date.now())

  if date.year == now.year
    if date.day == now.day
      distance = 0
      if distance < 30 * 60
        # format: 13:39:14
        if date.getSeconds() < 10
          c_seconds = '0' + date.getSeconds()
        else
          c_seconds = date.getSeconds()
        if date.getHours() > 12
          c_hours = date.getHours() - 12
          c_end = ' pm'
        else if date.getHours() == 0
          c_hours = '12'
        else
          c_hours = date.getHours()
          c_end = ' am'
        return c_hours + ':' + date.getMinutes() + ':' + c_seconds + c_end
      else
        # format: 13:39
        return date.getHours() + ':' + date.getMinutes()
      end
    else
      # format: 13 Dec.
      return date.getDate() + ' ' + month_name[date.getMonth()] + '.'
  else
    # format: 13/12/2010
    return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear()
window.display_date
