(function($){
	$.fn.extend({
		boxen: function(url, options){
			switch (typeof url) {
				case 'object' :
					options = url;
					break;
				case 'string' :
					options = $.extend({}, {
						url: url,
						urlAttribute: null
					}, options);
					break;
			}
			return this.click(function(e){
				$.Boxen.open(this, options);
				return false;
			});
		}
	});
	
	$.Boxen = {
		defaults: {
			urlParams: {},
			showTitleBar: true,
			showCloseButton: true,
			title: null,
			titleAttribute: 'title',
			closeButtonText: null,
			width: 600,
			height: 500,
			url: null,
			urlAttribute: 'href',
			overlayOpacity: 0.8,
			modal: false,
			postOpen: function(contentAreaElement) {},
			postClose: function() {}
		},
		bigIFrame: null,
		overlay: null,
		container: null,
		options: null,
		titleBar: null,
		closeButton: null,
		contentWindow: null,
		contentArea: null,
		ie6: false,
		setOptions: function(options){
			this.options = $.extend({}, this.defaults, options || {});
			return this;
		},
		getFullUrl: function(){
			var url = this.options.url;
			url += url.indexOf('?') == -1 ? '?' : '&';
			return url += $.param(this.options.urlParams);
		},
		init: function(){
			_this = this;
			this.isIE6 = $.browser.msie && parseInt($.browser.version) < 7;
			if ($.browser.opera) {
				 $.support.opacity = true;
			}
			
			$('#boxen_overlay, #boxen_container').remove();

			this.overlay = $('<div>').attr('id', 'boxen_overlay').css({
				opacity: this.options.overlayOpacity,
				display: 'none',
				position: 'absolute',
				top: 0,
				left: 0,
				zIndex: 10000
			});
			
			if (!this.options.modal) {
				this.overlay.click(function(e){
					$.Boxen.close();
					return false;
				});
			}
			
			this.container = $('<div>')
				.attr('id', 'boxen_container')
				.width(this.options.width)
				.height(this.options.height)
				.css({
					position: 'absolute',
					left: '50%',
					top: '50%',
					marginLeft: Math.round(this.options.width / -2) + 'px',
					marginTop: Math.round(this.options.height / -2) + 'px',
					display: 'none',
					zIndex: 10001
				});
			
			if (this.isIE6) {
				this.bigIFrame = $('<iframe>').attr('id', 'boxen_big_iframe')
		            .css({
						zIndex: 9999,
						position: 'absolute',
						top: 0,
						left: 0,
						opacity: 0
					}).appendTo('body');
					
				this._sizeOverlay();
				this._centreContent();
				$(window).bind('scroll.Boxen', function(e){
					_this._centreContent();
				}).bind('resize.Boxen', function(e){
					_this._sizeOverlay();
					_this._centreContent();
				});
			} else {
				this.overlay.css({
					position: 'fixed',
					width: '100%',
					height: '100%'
				});
				
				this.container.css('position', 'fixed');
			}
			
			this.overlay.appendTo('body');
			this.container.appendTo('body');
			
			this.contentWindow = $('<div>').attr('id', 'boxen_content').appendTo(this.container);
			
			if (this.options.showTitleBar) {
				this.titleBar = $('<div>').attr('id', 'boxen_titlebar').append(
					$('<span>').attr('id', 'boxen_title').html(this.options.title)
				).appendTo(this.contentWindow);
			} else {
				this.titleBar = null;
			}
			
			if (this.options.showCloseButton) {
				this.closeButton = $('<a>').attr({
					href: '#',
					id: 'boxen_close_button'
				}).click(function(e){
					$.Boxen.close();
					return false;
				}).appendTo(this.contentWindow);
				
				if (this.options.closeButtonText) {
					this.closeButton.append(
						$('<span>').html(this.options.closeButtonText)
					);
				}
			} else {
				this.closeButton = null;
			}
			
			this.contentArea = $('<div>').attr('id', 'boxen_content_area')
			                             .appendTo(this.contentWindow);
			return this;
		},
		show: function(callback){
			this.overlay.fadeIn('fast');
			this.container.fadeIn('fast', function(){
				var _this = $.Boxen;
				if (null !== _this.options.url) {
					var iFrame = $('<iframe>').attr({
						id: 'boxen_iframe_content_' + new Date().getTime(),
						width: _this.getContentAreaWidth(),
						height: _this.getContentAreaHeight(),
						frameborder: 0,
						src: _this.getFullUrl()
					}).appendTo(_this.contentArea);
				} else {
					_this.contentArea.width(_this.getContentAreaWidth()).height(_this.getContentAreaHeight());
				}
				_this.options.postOpen(_this.getContentAreaElement());
			});
			return this;
		},
		close: function(){
			try {
				if (this.isIE6) {
					$(window).unbind('scroll.Boxen').unbind('resize.Boxen');
					throw 'IE6';
				}
				this.container.fadeOut('fast', function(){
					$(this).remove();
				});
				this.overlay.fadeOut('fast', function(){
					$(this).remove();
				});
			} 
			catch (e) {
				$('#boxen_big_iframe, #boxen_overlay, #boxen_container').remove();
			}
			this.options.postClose();
			return this;
		},
		open: function(domElement, options){
			this.setOptions(options);
			this.options.title = this.options.titleAttribute && $(domElement).attr(this.options.titleAttribute) || this.options.title;
			this.options.url = this.options.urlAttribute && $(domElement).attr(this.options.urlAttribute) || this.options.url;
			this.init().show();
			return this;
		},
		_centreContent: function() {
			if (this.options.height < $(window).height()) {
				var topMargin = Math.round(this.options.height / -2) + $(document).scrollTop();
				this.container.css({
					marginTop: topMargin + 'px'
				});
			}
		},
		_sizeOverlay: function() {
			this.bigIFrame.css({
				width: ($(document).width() - 21) + 'px',
				height: ($(document).height() - 4) + 'px'
			});
			this.overlay.css({
				width: ($(document).width() - 21) + 'px',
				height: ($(document).height() - 4) + 'px'
			});
		},
		getContentAreaElement: function() {
			return this.contentArea.get(0);
		},
		getContentAreaHeight: function() {
			return this.titleBar ? this.options.height - this.titleBar.outerHeight() : this.options.height;
		},
		getContentAreaWidth: function() {
			return this.options.width;
		}
	};
})(jQuery);
