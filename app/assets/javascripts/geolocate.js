navvigator.geolocation.getCurrentPosition(locationSuccess, locationFail);
function locationSuccess(position) {
  latitude = position.coords.latitude;
  longitude = position.coords.longitude;
  alert('yes')
}

function locationFail() {
  alert(‘Oops, could not find you.’);
}
