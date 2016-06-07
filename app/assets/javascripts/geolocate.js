$(function() {
  if($('.geolocate').length > 0) {
    navigator.geolocation.getCurrentPosition(locationSuccess, locationFail);
    function locationSuccess(position) {
      var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
      document.cookie = "lat_lng=" + escape(cookie_val);
      window.setTimeout(function(){ window.location = "/index"; },500);
    }
    function locationFail() {}
  }
  if($('.index').length > 0) {
  }
  if($('.search').length > 0) {
    function prepareSearch() {
      if ($('#_vit').length == 1) {
        $('#app-info').remove()
        $('.footer').remove()
        $('#address-input').val($('.address').text().replace(/(\r\n|\n|\r)/gm,""));
        $('#submit-address-button').click();
        window.setTimeout(function() {
          $('body').html($('#location').html())
          address = $($('.address')[1]).text().replace(/(\r\n|\n|\r)/gm,"").replace(/\s+/g,' ').trim();
          if (address) {
            $('body').html('<div>Did you vote at <p>' +
                           $('body').html()+
                           '?</div>' +
                           '<p><a href="/vote?address=' +
                           + address +
                           '">Yes</a><br><a href="/">No</a></p>')
            $('#_vitModal').remove();
            $('#_vit').remove();
            $('#polling-location-info-close').remove();
            $('.polling-location-info').remove();
            $('img').remove();
          } else {
            alert("Not found")
            window.location = '/';
          }
        },600);
      }
    }

    vit.load({
      title: '',
      logo: '',
      subtitle: '',
      smallLogo: ''
    });

    window.setTimeout(function(){
      prepareSearch()
    },100);

    if(('#app-info').length > 0) {
      window.setTimeout(function(){
        prepareSearch()
      },1000);
    }

    window.setTimeout(function() {
      if($('#submit-address-button').length = 0) {
        location.reload()
      }
    }, 500);
  }
});
