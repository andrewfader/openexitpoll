navigator.geolocation.getCurrentPosition(locationSuccess, locationFail);
function locationSuccess(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

function locationFail() {
  alert('Oops, could not find you.');
}
