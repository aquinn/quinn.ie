
var mp_protocol = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%3Cscript src='" + mp_protocol + "api.mixpanel.com/site_media/js/api/mixpanel.js' type='text/javascript'%3E%3C/script%3E"));

try {
    var mpmetrics = new MixpanelLib("b4da71d502cda2b2cc3616f3b5502c25");
} catch(err) {
    var null_fn = function () {};
    var mpmetrics = { 
        track: null_fn, 
        track_funnel: null_fn, 
        register: null_fn, 
        register_once: null_fn,
        register_funnel: null_fn,
        identify: null_fn
    };
}

var on_button_click = function() {
    // This sends us an event every time a user clicks the button
    mpmetrics.track("Send button clicked"); 
};
$("#submit").click(on_button_click);