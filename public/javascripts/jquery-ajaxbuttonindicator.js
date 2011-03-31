/* JQuery_ajax_button_indicator */
(function( $ ){
	$.fn.ajaxbuttonindicator = function(options) {
		var settings = {
			'loader_img': 'loader.gif',
			'error_img': 'cross-circle.png',
			'complete_img': 'tick-circle.png'
		};
		
		var current_ajax = '';
		var request_finished = true;
		
		return this.each(function() {
			$(this).append('<span id="'+this.id+'-jabi_loader" style="display: none;"><img src="" id="'+this.id+'-jabi_loader-img" style="position: relative; top: -2px; left: 7px;"></span>');
			// Combine the options and settings arrays.
			if(options) { $.extend(settings, options); }
			$(this).bind("click", function() {
				current_ajax = this.id;
				request_finished = false;
				jabi_loading();
			});
			
			$(this).bind("ajaxSuccess", function() {
				if(!request_finished) {
					jabi_complete();
				}
				request_finished = true;
			});
			
			$(this).bind("ajaxError", function() {
				if(!request_finished) {
					jabi_error();
				}
				request_finished = true;
			});
			
		});
		
		function jabi_loading() { 
			$('#'+current_ajax+'-jabi_loader-img').css({width: '16px', height: '11px'});
			$('#'+current_ajax+'-jabi_loader-img').attr('src', settings.loader_img);
			$('#'+current_ajax+'-jabi_loader').show();
		}
		function jabi_complete() { 
			$('#'+current_ajax+'-jabi_loader-img').css({width: '16px', height: '16px', top: '0px'});
			$('#'+current_ajax+'-jabi_loader-img').attr('src', settings.complete_img);
			$('#'+current_ajax+'-jabi_loader').show();
		}
		function jabi_error() {
			$('#'+current_ajax+'-jabi_loader-img').css({width: '16px', height: '16px', top: '0px'});
			$('#'+current_ajax+'-jabi_loader-img').attr('src', settings.error_img);
			$('#'+current_ajax+'-jabi_loader').show();
		}

	};
})( jQuery );