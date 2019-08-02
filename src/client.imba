let showmenu1 = false
let showmenu2 = false
let show_mobile_menu = false
let show_mobile_submenu = false

tag App

	def mount
		window:addEventListener('scroll', do render)

	def unmount
		window:removeEventListener('scroll')

	def show_sub_menu variant_of_submenu
		if variant_of_submenu == 1
			if showmenu1
				showmenu1 = false
			else
				showmenu1 = true
				showmenu2 = false
		else
			if showmenu2
				showmenu2 = false
			else
				showmenu2 = true
				showmenu1 = false

	def scroll
		# log "Scroll Y: ", window:scrollY;
		if window:scrollY > 160 && (showmenu1 || showmenu2 || show_mobile_submenu) && !show_mobile_menu
			showmenu1 = false
			showmenu2 = false
			show_mobile_submenu = false

	def navigation_grid_margin_top
		if show_mobile_menu
			return 0
		elif window:scrollY < 80
			-window:scrollY
		else return -80

	def navigation_opacity
		return window:scrollY == 0 || show_mobile_menu ? 1 : 1 - window:scrollY * 0.005

	def video_on_back_opacity
		return window:scrollY < 160 ? 0.33 : (window:scrollY - 54)*0.003

	def video_elem_play_link_opacity
		return window:scrollY < 160 ? 0 : (window:scrollY - 160)*0.003

	def post_nav_top
		return (window:scrollY < 80 || show_mobile_menu) ? -81 : 0

	def show_post_menu
		return (window:scrollY < 82 || show_mobile_menu) ? 0 : 1;

	def show_menu_on_phones
		show_mobile_menu = !show_mobile_menu
		showmenu1 = false
		showmenu2 = false
		show_mobile_submenu = false

	def for_link_back
		showmenu1 = false
		showmenu2 = false

	def for_mobile_submenu
		show_mobile_submenu = !show_mobile_submenu

	def post_submenu_top
		return window:scrollY < 64 ? 64-window:scrollY : 0

	def render

		<self :onscroll=scroll>
			<header>
				<nav.navigation_grid .nav_with_sub=showmenu1||showmenu2||show_mobile_menu||show_mobile_submenu css:margin-top=navigation_grid_margin_top css:opacity=navigation_opacity>
					<a.svgWrapper .showsvgWrapper=show_mobile_menu>
						<svg:svg viewBox="0 0 106 32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMid">
							<svg:path fill="#f36" d="M0 2v28c0 1.1.9 2 2 2h28c1.1 0 2-.9 2-2V2c0-1.1-.9-2-2-2H2C.9 0 0 .9 0 2z">
							<svg:path id="vision" fill="#f36" d="M61.7 23.5h2.9V11.4h-2.9v12.1zm26.8-12.4c-2 0-3.1 1-3.9 2.1v-1.9h-2.9v12.1h2.9v-6.9c0-1.9 1.2-3 2.8-3 1.7 0 2.7 1.1 2.7 3v6.9H93v-7.7c0-2.7-1.6-4.6-4.5-4.6zM73.2 21.4c-2.2 0-3.8-1.8-3.8-3.9 0-2.1 1.5-3.9 3.8-3.9s3.9 1.8 3.9 3.9c-.1 2.2-1.6 3.9-3.9 3.9zm0-10.3c-3.9 0-6.7 2.9-6.7 6.4 0 3.5 2.8 6.3 6.7 6.3 3.9 0 6.8-2.9 6.8-6.3-.1-3.5-2.9-6.4-6.8-6.4zm-35.8 9.2L34 11.4h-3.1l5.2 12.2h2.6l5.2-12.2h-3l-3.5 8.9zm18.4-3.9c-1.5-.5-2.8-.8-2.8-1.7 0-.7.6-1.2 1.8-1.2.5 0 1.2.1 1.8.3.1 0 .1 0 .2.1.5.1 1.7.3 2.7-1.2-1.3-.9-3.1-1.4-4.6-1.4-2.5 0-4.5 1.4-4.5 3.7 0 2.3 2.1 3.1 3.9 3.6 1.5.4 2.8.8 2.8 1.7 0 .8-.7 1.3-2 1.3-.8 0-1.7-.2-2.6-.6-.3-.1-1.6-.5-2.8 1 1.6 1.2 3.5 1.8 5.3 1.8 2.6 0 4.7-1.3 4.7-3.8.1-2.3-2-3.1-3.9-3.6zm-10.5 7.1h2.9V11.4h-2.9v12.1z">
							<svg:path fill="#FFF" d="M7.1 19.7c-.1.5-.2 1-.2 1.4 0 1.6.9 2.7 2.7 2.7 1.5 0 2.7-.9 3.6-2.4l-.5 2.3h3l1.7-7.2c.4-1.8 1.3-2.8 2.5-2.8 1 0 1.6.6 1.6 1.7 0 .3 0 .6-.1 1l-.9 3.3c-.1.5-.2.9-.2 1.4 0 1.6.9 2.7 2.7 2.7 1.6 0 2.8-1.1 3.5-3.6l-1.2-.5c-.6 1.7-1.1 2-1.5 2-.4 0-.6-.3-.6-.8 0-.3.1-.5.1-.9l.9-3.2c.2-.8.3-1.4.3-2 0-2.4-1.4-3.7-3.1-3.7-1.6 0-3.2 1.5-4 3l.6-2.8h-4.6l-.6 2.5H15l-1.3 5.5c-1 2.4-2.9 2.4-3.2 2.4-.4-.1-.6-.2-.6-.8 0-.3.1-.7.2-1.3l2-8.3H7l-.6 2.5h2.1l-1.4 5.9M10 6c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2z">
					<section.nav_flex .mob_nav_flex=show_mobile_menu>
						<a.nav_link> "Platform Tour"
						<a.nav_link .choosen=showmenu1 :tap=['show_sub_menu', 1]> "Design Education"
							<svg:svg.link_with_arrow .pressed_svg_of_link=showmenu1 xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
								<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
						<a.nav_link  .choosen=showmenu2 :tap=['show_sub_menu', 2]> "Design Community"
							<svg:svg.link_with_arrow .pressed_svg_of_link=showmenu2 xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
								<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
						<a.nav_link.zero_padding css:padding=0> "Enterprise"
						<div.sign .hide=showmenu1||showmenu2>
							<a.nav_link> "Sign in"
							<a.sign_up_free> "Sign up free"
					<div.menu_svg :tap.show_menu_on_phones>
						<a>
							<svg:svg .cross=show_mobile_menu id="burger-icon" xmlns="http://www.w3.org/2000/svg" version="1.1" x="0" y="0" viewBox="0 0 20 20" width="20" height="20" space="preserve">
								<svg:line id="line1" x1="0" y1="5" x2="20" y2="5" data-svg-origin="20 5" style="" transform="matrix(1,0,0,1,0,0)">
								<svg:line id="line2" x1="0" y1="15" x2="20" y2="15" data-svg-origin="20 15" style="" transform="matrix(1,0,0,1,0,0)">
					<hr.submenu_hr>
					<section.submenue_flex .submenue_flex_hidden=showmenu1||showmenu2||show_mobile_menu>
						<a.submenue_link style="color: rgb(255, 51, 102);0" > "Overview"
						<a.submenue_link > "Platform"
						<a.submenue_link > "Learn"
						<a.submenue_link > "New"

				<div.mob_post_nav_flex css:top=post_submenu_top .hide=show_mobile_menu .nav_with_sub=show_mobile_submenu :tap.for_mobile_submenu>
					<a.arrow_in_post_nav>
						<svg:svg .activated_post_mobile_nav=show_mobile_submenu xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
							<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
					<a.post_nav_download .animated_link_5=show_post_menu>
						<span.desktop-text> "Download studio"
						<span.mobile-text css:display="none"> "Download studio"

				<div.fall_down_submenu css:top=69+post_submenu_top .show_submenu=show_mobile_submenu>
					<a href="#"> "Overview"
					<a href="#"> "Platform"
					<a href="#"> "Learn"
					<a href="#"> "New"

				<div.for_fall_down_menu_wrapper .show_submenu=showmenu1>
					<div.fall_down_menu_grid>
						<a.for_mobile .link_back=show_mobile_menu :tap.for_link_back>
							<svg:svg width="15px" height="14px" viewBox="0 0 15 14" xmlns="http://www.w3.org/2000/svg">
								<svg:g id="arrow" stroke="none" stroke-width="1">
									<svg:path d="M15,5.8331803 L2.67898833,5.8331803 L7.24068927,1.43309052 C7.5725403,1.11308399 7.58254586,0.585573231 7.26236798,0.254733147 C6.94219011,-0.0761069365 6.41523068,-0.0861071406 6.08337966,0.233066038 L0.46942746,5.64984323 C0.17176209,5.90401508 0,6.27485598 0,6.66653064 C0,7.0582053 0.17176209,7.4290462 0.431072818,7.64821734 L6.08337966,13.0999952 C6.24513619,13.2558318 6.45358533,13.3333333 6.66203446,13.3333333 C6.88048916,13.3333333 7.09811006,13.2474982 7.26236798,13.0783281 C7.58254586,12.747488 7.5725403,12.2199773 7.24068927,11.8999708 L2.67732073,7.49988098 L15,7.49988098 L15,5.8331803 Z" id="path-1">
							<h4> "Design Education"
						<div.fall_down_menu_item.fall_down1 .showsubmenu=showmenu1>
							<a.inside_design_svg>
								<svg:svg x="0px" y="0px" viewBox="0 0 228.3 44.3" height="34" fill="#EBECED">
									<svg:g>
										<svg:path d="M20,41.2l-20-20h20V41.2c11,0,20-9,20-20s-9-20-20-20H0v20">
										<svg:polygon points="20,41.2 0,41.2 0,21.2">
									<svg:g>
										<svg:g>
											<svg:path d="M58.4,21.2H55v-20h3.4V21.2z">
											<svg:path d="M65.7,8.5c0.6-1.2,2.1-2.3,4.5-2.3c3.6,0,5.4,2.4,5.4,5.8v9.2h-3.4v-8.8c0-2-0.9-3.3-2.9-3.3c-2.1,0-3.4,1.3-3.4,3.6v8.5 h-3.4V6.6h3.1v1.9H65.7z">
											<svg:path d="M78.1,16.5h3.2c0.1,1.3,1.1,2.3,3.2,2.3c1.7,0,2.7-0.6,2.7-1.7c0-3.1-8.4-0.3-8.4-6.3c0-2.5,2.2-4.6,5.8-4.6 c4.2,0,5.6,2.9,5.8,4.8h-3.2c-0.1-1-0.9-2.1-2.6-2.1s-2.5,0.7-2.5,1.7c0,2.8,8.4,0.3,8.4,6.3c0,2.5-2,4.6-6.1,4.6 C80,21.5,78.3,19.2,78.1,16.5z">
											<svg:path d="M92.7,2.1c0-1.2,0.9-2.1,2.1-2.1s2.1,0.9,2.1,2.1S96,4.2,94.8,4.2C93.6,4.1,92.7,3.3,92.7,2.1z M93.1,6.6h3.4v14.6h-3.4 V6.6z">
											<svg:path d="M110.8,0.1h3.4v21.1H111v-2.1c-0.9,1.5-2.6,2.4-4.9,2.4c-4.3,0-6.8-3.5-6.8-7.6c0-4.2,2.5-7.7,6.8-7.7 c2.3,0,3.9,1,4.7,2.3C110.8,8.5,110.8,0.1,110.8,0.1z M106.8,9.2c-2.5,0-4.1,2-4.1,4.7c0,2.6,1.6,4.7,4.1,4.7 c2.6,0,4.1-2.1,4.1-4.7C110.9,11.2,109.4,9.2,106.8,9.2z">
											<svg:path d="M120.3,14.9c0.3,2.3,1.7,3.8,4.1,3.8c1.5,0,2.9-0.8,3.4-2.1h3.4c-0.9,2.9-3.5,5-6.9,5c-4.4,0-7.3-3.3-7.3-7.7 c0-4.3,2.9-7.6,7.3-7.6c4.3,0,7.2,3.3,7.2,7.6c0,0.5,0,1,0,1H120.3z M120.3,12.4h7.8c-0.3-2-1.7-3.4-3.9-3.4 C122.1,9,120.7,10.4,120.3,12.4z">
										<svg:g>
											<svg:path d="M140,21.2v-20h6.8c6.9,0,10.7,4.1,10.7,10s-3.8,10-10.7,10H140z M146.7,4.3h-3.3V18h3.3c4.9,0,7.2-2.7,7.2-6.8 S151.6,4.3,146.7,4.3z">
											<svg:path d="M163,14.9c0.3,2.3,1.7,3.8,4.1,3.8c1.5,0,2.9-0.8,3.4-2.1h3.4c-0.9,2.9-3.5,5-6.9,5c-4.4,0-7.3-3.3-7.3-7.7 c0-4.3,2.9-7.6,7.3-7.6c4.3,0,7.2,3.3,7.2,7.6c0,0.5,0,1,0,1H163z M163,12.4h7.8c-0.3-2-1.7-3.4-3.9-3.4 C164.8,9,163.3,10.4,163,12.4z">
											<svg:path d="M175.7,16.5h3.2c0.1,1.3,1.1,2.3,3.2,2.3c1.7,0,2.7-0.6,2.7-1.7c0-3.1-8.4-0.3-8.4-6.3c0-2.5,2.2-4.6,5.8-4.6 c4.2,0,5.6,2.9,5.8,4.8h-3.2c-0.1-1-0.9-2.1-2.6-2.1c-1.7,0-2.5,0.7-2.5,1.7c0,2.8,8.4,0.3,8.4,6.3c0,2.5-2,4.6-6.1,4.6 C177.6,21.5,175.9,19.2,175.7,16.5z">
											<svg:path d="M190.4,2.1c0-1.2,0.9-2.1,2.1-2.1c1.2,0,2.1,0.9,2.1,2.1s-0.9,2.1-2.1,2.1C191.2,4.1,190.4,3.3,190.4,2.1z M190.8,6.6h3.4 v14.6h-3.4V6.6z">
											<svg:path d="M208.6,6.6h3.1v14c0,3.9-2.5,6.8-7,6.8c-4.4,0-6.4-2.8-6.7-5.1h3.4c0.3,1.1,1.3,2.2,3.4,2.2c2.3,0,3.6-1.4,3.6-3.5v-2.3 c-0.8,1.3-2.4,2.3-4.6,2.3c-4.2,0-6.7-3.4-6.7-7.4s2.6-7.4,6.7-7.4c2.3,0,3.9,0.9,4.9,2.4L208.6,6.6L208.6,6.6z M204.4,9.2 c-2.4,0-4.1,1.9-4.1,4.4s1.6,4.4,4.1,4.4s4.1-1.9,4.1-4.4C208.4,11.1,206.8,9.2,204.4,9.2z">
											<svg:path d="M218.4,8.5c0.6-1.2,2.1-2.3,4.5-2.3c3.6,0,5.4,2.4,5.4,5.8v9.2H225v-8.8c0-2-0.9-3.3-2.9-3.3c-2.1,0-3.4,1.3-3.4,3.6v8.5 h-3.4V6.6h3.1L218.4,8.5L218.4,8.5z">
									<svg:g>
										<svg:g>
											<svg:path d="M55,41.2v-10h1.3v3.4l0,0c0.5-0.6,1.2-0.9,2-0.9c0.9,0,1.6,0.4,2.2,1.1c0.6,0.7,0.9,1.6,0.9,2.8s-0.3,2.1-0.9,2.8 s-1.3,1-2.3,1c-0.8,0-1.5-0.3-2.1-0.9l0,0v0.7H55z M56.3,36.7v1.9c0,0.4,0.2,0.8,0.5,1.1s0.8,0.5,1.3,0.5c0.7,0,1.2-0.2,1.5-0.7 s0.5-1.1,0.5-1.9c0-0.8-0.2-1.5-0.5-1.9c-0.4-0.5-0.9-0.7-1.5-0.7c-0.5,0-1,0.2-1.3,0.5S56.3,36.2,56.3,36.7z">
											<svg:path d="M63.5,44.3l1.4-3.6L62.2,34h1.4l2,5.2l2-5.2H69l-4.1,10.3H63.5z">
											<svg:path d="M74,41.2v-9.6h1.4v9.6H74z">
											<svg:path d="M77.9,41.2v-7.3h1.3v0.7l0,0c0.2-0.3,0.5-0.5,0.8-0.6c0.4-0.2,0.7-0.3,1.1-0.3c0.8,0,1.4,0.2,1.9,0.7s0.7,1.1,0.7,2v4.8	h-1.3v-4.4c0-1.2-0.5-1.9-1.5-1.9c-0.5,0-0.9,0.1-1.3,0.4c-0.3,0.3-0.5,0.7-0.5,1.2v4.7H77.9z">
											<svg:path d="M88.6,41.2l-3.4-9.6h1.5l2.7,7.7l0,0l2.6-7.7h1.4l-3.3,9.6H88.6z">
											<svg:path d="M94.6,32.6v-1.4H96v1.4H94.6z M94.6,41.2v-7.3h1.3v7.3H94.6z">
											<svg:path d="M97.8,38.8l1.2-0.3c0.1,1.2,0.8,1.8,1.9,1.8c0.5,0,0.9-0.1,1.2-0.3c0.3-0.2,0.4-0.4,0.4-0.8c0-0.3-0.1-0.6-0.4-0.7 c-0.3-0.2-0.8-0.4-1.7-0.6c-0.9-0.2-1.5-0.5-1.9-0.8s-0.6-0.7-0.6-1.3s0.2-1,0.7-1.5s1.1-0.6,1.9-0.6s1.5,0.2,1.9,0.6	c0.5,0.4,0.8,0.9,1,1.5l-1.1,0.3c-0.3-0.9-0.9-1.3-1.7-1.3c-0.4,0-0.8,0.1-1,0.3s-0.4,0.4-0.4,0.6c0,0.3,0.1,0.5,0.4,0.6 c0.2,0.1,0.8,0.3,1.7,0.6c0.9,0.3,1.5,0.6,1.9,0.9c0.3,0.3,0.5,0.8,0.5,1.4c0,0.6-0.2,1.1-0.7,1.5s-1.2,0.6-2.1,0.6 c-1,0-1.7-0.3-2.2-0.8C98.2,40.1,97.9,39.5,97.8,38.8z">
											<svg:path d="M105.6,32.6v-1.4h1.4v1.4H105.6z M105.6,41.2v-7.3h1.3v7.3H105.6z">
											<svg:path d="M112.2,41.4c-1,0-1.8-0.3-2.4-1s-0.9-1.6-0.9-2.8s0.3-2.1,1-2.8c0.6-0.7,1.4-1,2.4-1c0.9,0,1.7,0.3,2.3,1 c0.6,0.7,1,1.6,1,2.8s-0.3,2.1-0.9,2.8C113.9,41.1,113.1,41.4,112.2,41.4z M112.2,40.2c0.6,0,1.1-0.2,1.4-0.7 c0.4-0.5,0.5-1.1,0.5-1.9c0-0.8-0.2-1.5-0.5-1.9c-0.4-0.5-0.8-0.7-1.4-0.7s-1.1,0.2-1.5,0.7s-0.6,1.1-0.6,1.9 c0,0.8,0.2,1.5,0.6,1.9S111.6,40.2,112.2,40.2z">
											<svg:path d="M117.3,41.2v-7.3h1.3v0.7l0,0c0.2-0.3,0.5-0.5,0.8-0.6c0.4-0.2,0.7-0.3,1.1-0.3c0.8,0,1.4,0.2,1.9,0.7s0.7,1.1,0.7,2v4.8 h-1.3v-4.4c0-1.2-0.5-1.9-1.5-1.9c-0.5,0-0.9,0.1-1.3,0.4c-0.3,0.3-0.5,0.7-0.5,1.2v4.7H117.3z">
							<div.fall_down_menu_item_flex>
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#inside-design">
									"All Categories"
									<span> "Digital product design tips, news, and inspiration"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#design"> "Design"
									<span> "Posts from the best UX and digital product designers"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#design-chats"> "Design Chats"
									<span> "How the world’s smartest companies approach design"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#invision"> "On InVision"
									<span> "Product news and tips to accelerate your workflow"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#inspiration"> "Inspiration"
									<span> "Spark your next big idea—or improve the one you have"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#design-resources"> "Design Resources"
									<span> "Download UI kits, mockups, icons, and more—free!"
						<div.fall_down_menu_item.fall_down2 .showsubmenu=showmenu1>
							<a.inside_design_svg href="#www.designbetter.co">
								<svg:svg x="0px" y="0px" viewBox="0 0 266.4 44" height="34" >
									<svg:g>
										<svg:path fill="#EBECED" d="M55,40.9v-10h1.3v3.4l0,0c0.5-0.6,1.2-0.9,2-0.9c0.9,0,1.6,0.4,2.2,1.1c0.6,0.7,0.9,1.6,0.9,2.8 s-0.3,2.1-0.9,2.8s-1.3,1-2.3,1c-0.8,0-1.5-0.3-2.1-0.9l0,0v0.7C56.1,40.9,55,40.9,55,40.9z M56.3,36.4v1.9c0,0.4,0.2,0.8,0.5,1.1 s0.8,0.5,1.3,0.5c0.7,0,1.2-0.2,1.5-0.7s0.5-1.1,0.5-1.9c0-0.8-0.2-1.5-0.5-1.9c-0.4-0.5-0.9-0.7-1.5-0.7c-0.5,0-1,0.2-1.3,0.5 S56.3,35.9,56.3,36.4z">
										<svg:path fill="#EBECED" d="M63.5,44l1.4-3.6l-2.7-6.7h1.4l2,5.2l2-5.2H69L64.8,44H63.5z">
										<svg:path fill="#EBECED" d="M74,40.9v-9.6h1.4v9.6H74z">
										<svg:path fill="#EBECED" d="M77.9,40.9v-7.3h1.3v0.7l0,0c0.2-0.3,0.5-0.5,0.8-0.6c0.4-0.2,0.7-0.3,1.1-0.3c0.8,0,1.4,0.2,1.9,0.7 s0.7,1.1,0.7,2v4.7h-1.3v-4.4c0-1.2-0.5-1.9-1.5-1.9c-0.5,0-0.9,0.1-1.3,0.4c-0.3,0.3-0.5,0.7-0.5,1.2v4.6h-1.2V40.9z">
										<svg:path fill="#EBECED" d="M88.6,40.9l-3.4-9.6h1.5l2.7,7.7l0,0l2.6-7.7h1.4l-3.3,9.6H88.6z">
										<svg:path fill="#EBECED" d="M94.6,32.3v-1.4H96v1.4H94.6z M94.6,40.9v-7.3h1.3v7.3H94.6z">
										<svg:path fill="#EBECED" d="M97.8,38.5l1.2-0.3c0.1,1.2,0.8,1.8,1.9,1.8c0.5,0,0.9-0.1,1.2-0.3c0.3-0.2,0.4-0.4,0.4-0.8	c0-0.3-0.1-0.6-0.4-0.7c-0.3-0.2-0.8-0.4-1.7-0.6c-0.9-0.2-1.5-0.5-1.9-0.8s-0.6-0.7-0.6-1.3s0.2-1,0.7-1.5s1.1-0.6,1.9-0.6 s1.5,0.2,1.9,0.6c0.5,0.4,0.8,0.9,1,1.5l-1.1,0.3c-0.3-0.9-0.9-1.3-1.7-1.3c-0.4,0-0.8,0.1-1,0.3s-0.4,0.4-0.4,0.6 c0,0.3,0.1,0.5,0.4,0.6c0.2,0.1,0.8,0.3,1.7,0.6c0.9,0.3,1.5,0.6,1.9,0.9c0.3,0.3,0.5,0.8,0.5,1.4c0,0.6-0.2,1.1-0.7,1.5 s-1.2,0.6-2.1,0.6c-1,0-1.7-0.3-2.2-0.8C98.2,39.9,97.9,39.2,97.8,38.5z">
										<svg:path fill="#EBECED" d="M105.6,32.3v-1.4h1.4v1.4H105.6z M105.6,40.9v-7.3h1.3v7.3H105.6z">
										<svg:path fill="#EBECED" d="M112.2,41.1c-1,0-1.8-0.3-2.4-1c-0.6-0.7-0.9-1.6-0.9-2.8s0.3-2.1,1-2.8c0.6-0.7,1.4-1,2.4-1 c0.9,0,1.7,0.3,2.3,1s1,1.6,1,2.8s-0.3,2.1-0.9,2.8C113.9,40.8,113.1,41.1,112.2,41.1z M112.2,39.9c0.6,0,1.1-0.2,1.4-0.7 c0.4-0.5,0.5-1.1,0.5-1.9c0-0.8-0.2-1.5-0.5-1.9c-0.4-0.5-0.8-0.7-1.4-0.7c-0.6,0-1.1,0.2-1.5,0.7s-0.6,1.1-0.6,1.9 c0,0.8,0.2,1.5,0.6,1.9S111.6,39.9,112.2,39.9z">
										<svg:path fill="#EBECED" d="M117.3,40.9v-7.3h1.3v0.7l0,0c0.2-0.3,0.5-0.5,0.8-0.6c0.4-0.2,0.7-0.3,1.1-0.3c0.8,0,1.4,0.2,1.9,0.7 s0.7,1.1,0.7,2v4.7h-1.3v-4.4c0-1.2-0.5-1.9-1.5-1.9c-0.5,0-0.9,0.1-1.3,0.4c-0.3,0.3-0.5,0.7-0.5,1.2v4.6h-1.2V40.9z">
										<svg:g>
											<svg:rect x="106" fill="#EBECED" width="3.2" height="3.1">
											<svg:g>
												<svg:g>
													<svg:path fill="#EBECED" d="M71,15.2c0.5-1.3,0.7-2.7,0.7-4.4S71.5,7.7,71,6.4c-0.4-1.2-1.1-2.3-1.9-3.1s-1.8-1.4-3-1.8 C65,1.2,63.7,1,62.2,1H55v19.9h6.5c1.6,0,3-0.2,4.3-0.6c1.2-0.4,2.3-1.1,3.2-1.9C69.9,17.5,70.5,16.5,71,15.2z M68,13.9 c-0.2,0.9-0.6,1.7-1.2,2.3c-0.5,0.6-1.2,1.1-2.1,1.5c-0.8,0.3-1.9,0.5-3.1,0.5h-3.4V3.7h4c2.2,0,3.7,0.6,4.7,1.9 c0.9,1.3,1.4,3,1.4,5.3C68.4,12,68.2,13,68,13.9z">
													<svg:path fill="#EBECED" d="M87.9,16.6c-0.3,1.5-0.9,2.7-1.9,3.5s-2.5,1.3-4.5,1.3c-2.3,0-4.1-0.7-5.3-2c-1.2-1.3-1.8-3.2-1.8-5.7 c0-1.3,0.2-2.4,0.5-3.4s0.8-1.8,1.5-2.5c0.6-0.7,1.4-1.2,2.3-1.5s1.8-0.5,2.9-0.5s2.1,0.2,2.9,0.5s1.5,0.8,2.1,1.5 c0.5,0.6,0.9,1.4,1.2,2.3c0.3,0.9,0.4,1.8,0.4,2.9v1.4H77.6c0,1.3,0.4,2.4,1,3.2c0.6,0.8,1.6,1.2,2.9,1.2c1,0,1.8-0.2,2.3-0.6 s0.8-1,1-1.7L87.9,16.6L87.9,16.6z M85,12.2c0-1.2-0.3-2.2-0.8-2.8c-0.6-0.7-1.5-1-2.7-1s-2.1,0.4-2.7,1.1 c-0.6,0.7-1,1.6-1.1,2.8H85V12.2z">
													<svg:path fill="#EBECED" d="M93.3,16.4c0.1,0.5,0.2,0.9,0.4,1.2c0.2,0.3,0.5,0.6,0.8,0.7c0.3,0.2,0.7,0.3,1.1,0.4s0.9,0.1,1.3,0.1 c1.1,0,1.8-0.2,2.3-0.5s0.7-0.8,0.7-1.4c0-0.5-0.1-0.9-0.4-1.2c-0.3-0.3-0.9-0.6-1.8-0.7c-1.2-0.2-2.2-0.4-3.1-0.6 S93,14,92.4,13.6c-0.6-0.3-1.1-0.8-1.4-1.3s-0.5-1.2-0.5-2.1c0-0.7,0.1-1.3,0.5-1.8c0.3-0.6,0.7-1,1.3-1.4 c0.5-0.4,1.2-0.7,1.9-0.9c0.7-0.2,1.6-0.3,2.4-0.3c1.1,0,2.1,0.1,2.8,0.3c0.8,0.2,1.4,0.5,1.8,0.9c0.5,0.4,0.8,0.8,1.1,1.4 c0.2,0.5,0.4,1,0.6,1.6l-2.9,0.4c-0.2-0.7-0.6-1.3-1-1.6c-0.5-0.4-1.2-0.5-2.3-0.5c-0.6,0-1.1,0.1-1.5,0.2 c-0.4,0.1-0.7,0.3-0.9,0.4c-0.2,0.2-0.4,0.4-0.5,0.6c-0.1,0.2-0.1,0.4-0.1,0.6c0,0.3,0,0.6,0.1,0.8s0.2,0.4,0.4,0.5 c0.2,0.1,0.5,0.2,0.8,0.3s0.8,0.2,1.3,0.3l1.8,0.3c1,0.2,1.8,0.4,2.4,0.6c0.6,0.3,1.2,0.6,1.6,1s0.7,0.8,0.8,1.3 c0.1,0.5,0.2,1.1,0.2,1.7c0,1.3-0.5,2.4-1.5,3.2c-1,0.8-2.6,1.2-4.6,1.2c-0.8,0-1.7-0.1-2.4-0.2c-0.8-0.2-1.5-0.4-2.1-0.8s-1.1-0.9-1.5-1.5s-0.6-1.4-0.7-2.4C90.3,16.4,93.3,16.4,93.3,16.4z">
													<svg:path fill="#EBECED" d="M109.2,6.3V21H106V6.3H109.2z">
													<svg:path fill="#EBECED" d="M116,22c0.2,0.8,0.5,1.3,1,1.6c0.5,0.3,1.3,0.5,2.4,0.5c0.9,0,1.6-0.2,2.1-0.5s0.9-0.9,1.1-1.5 c0.2-0.7,0.4-1.7,0.4-2.9v-1c-0.5,0.8-1.2,1.3-2,1.7c-0.8,0.4-1.7,0.6-2.7,0.6c-2,0-3.5-0.6-4.6-1.9s-1.6-3.1-1.6-5.4 c0-2.2,0.6-4,1.7-5.4c1.2-1.4,2.7-2,4.7-2c1.8,0,3.3,0.7,4.5,2.2V6.3h3.1v12.5c0,2.8-0.5,4.9-1.6,6.1s-2.8,1.9-5.2,1.9 c-2.1,0-3.7-0.4-4.8-1.1s-1.7-1.9-1.9-3.5h3.4V22z M123.1,13.1c0-1.5-0.3-2.7-1-3.5c-0.6-0.8-1.6-1.2-2.8-1.2s-2.1,0.4-2.7,1.2 c-0.7,0.8-1,2-1,3.5s0.3,2.7,0.9,3.5c0.6,0.8,1.5,1.3,2.6,1.3c1.2,0,2.2-0.4,2.9-1.2c0.7-0.8,1-1.9,1-3.3v-0.3H123.1z">
													<svg:path fill="#EBECED" d="M132.9,6.3v2.1c0.7-0.9,1.4-1.6,2.2-2s1.7-0.6,2.6-0.6c3.3,0,4.9,1.8,4.9,5.4v9.7h-3.2v-9.2 c0-1.2-0.2-2-0.6-2.5c-0.4-0.5-1.1-0.7-1.9-0.7c-0.6,0-1.1,0.1-1.6,0.3s-0.9,0.5-1.2,0.8s-0.6,0.7-0.8,1.2 c-0.2,0.4-0.3,0.9-0.3,1.4v8.7h-3.2V6.3H132.9z">
													<svg:path fill="#EBECED" d="M160.9,17.3c0.3-0.7,0.4-1.5,0.4-2.3c0-0.4,0-0.9-0.1-1.3s-0.3-0.9-0.5-1.3c-0.2-0.4-0.6-0.8-1-1.1 c-0.4-0.4-0.9-0.7-1.6-0.9H158l0.1-0.1c1-0.5,1.7-1.1,2-1.8c0.4-0.7,0.6-1.5,0.6-2.3c0-0.7-0.1-1.4-0.3-2.1 c-0.2-0.6-0.6-1.2-1.1-1.7s-1.3-0.8-2.2-1.1s-2.1-0.4-3.6-0.4h-6.9v20h7.4c1.4,0,2.5-0.2,3.4-0.5s1.7-0.7,2.3-1.3 C160.3,18.7,160.7,18,160.9,17.3z M149.7,3.5h3.6c1.5,0,2.6,0.2,3.2,0.6c0.6,0.4,0.9,1.1,0.9,2.1c0,0.9-0.3,1.7-0.8,2.2 s-1.5,0.7-2.8,0.7h-4.1L149.7,3.5L149.7,3.5z M157.9,16.4c-0.1,0.4-0.4,0.8-0.7,1c-0.3,0.3-0.7,0.5-1.3,0.7 c-0.5,0.2-1.2,0.2-2,0.2h-4.1v-6.5h4.4c1.4,0,2.4,0.3,3,0.8c0.6,0.5,0.9,1.3,0.9,2.4C158.1,15.5,158,16,157.9,16.4z">
													<svg:path fill="#EBECED" d="M177.3,16.6c-0.3,1.5-0.9,2.7-1.9,3.5s-2.5,1.3-4.5,1.3c-2.3,0-4.1-0.7-5.3-2s-1.8-3.2-1.8-5.7 c0-1.3,0.2-2.4,0.5-3.4s0.8-1.8,1.5-2.5c0.6-0.7,1.4-1.2,2.3-1.5c0.9-0.3,1.8-0.5,2.9-0.5c1.1,0,2.1,0.2,2.9,0.5 c0.8,0.3,1.5,0.8,2.1,1.5c0.5,0.6,0.9,1.4,1.2,2.3c0.3,0.9,0.4,1.8,0.4,2.9v1.4h-10.5c0,1.3,0.4,2.4,1,3.2 c0.6,0.8,1.6,1.2,2.9,1.2c1,0,1.8-0.2,2.3-0.6s0.8-1,1-1.7L177.3,16.6L177.3,16.6z M174.3,12.2c0-1.2-0.3-2.2-0.8-2.8 c-0.6-0.7-1.5-1-2.7-1s-2.1,0.4-2.7,1.1c-0.6,0.7-1,1.6-1.1,2.8h7.3V12.2z">
													<svg:path fill="#EBECED" d="M178.9,8.8V6.3h2.3v-4h3.2v3.9h3.6v2.5h-3.6v7.7c0,0.8,0.2,1.3,0.5,1.6c0.3,0.3,0.8,0.5,1.4,0.5 c0.3,0,0.6,0,0.9-0.1c0.3,0,0.6-0.1,0.9-0.2l0.5,2.4c-0.9,0.3-1.9,0.5-2.9,0.5c-1.6,0-2.7-0.4-3.4-1.3c-0.6-0.8-1-2.1-1-3.8V8.6 h-2.4V8.8z">
													<svg:path fill="#EBECED" d="M189.7,8.8V6.3h2.3v-4h3.2v3.9h3.6v2.5h-3.6v7.7c0,0.8,0.2,1.3,0.5,1.6c0.3,0.3,0.8,0.5,1.4,0.5 c0.3,0,0.6,0,0.9-0.1c0.3,0,0.6-0.1,0.9-0.2l0.5,2.4c-0.9,0.3-1.9,0.5-2.9,0.5c-1.6,0-2.7-0.4-3.4-1.3c-0.6-0.8-1-2.1-1-3.8V8.6 h-2.4V8.8z">
													<svg:path fill="#EBECED" d="M214,16.6c-0.3,1.5-0.9,2.7-1.9,3.5s-2.5,1.3-4.5,1.3c-2.3,0-4.1-0.7-5.3-2s-1.8-3.2-1.8-5.7 c0-1.3,0.2-2.4,0.5-3.4s0.8-1.8,1.5-2.5c0.6-0.7,1.4-1.2,2.3-1.5c0.9-0.3,1.8-0.5,2.9-0.5c1.1,0,2.1,0.2,2.9,0.5 c0.8,0.3,1.5,0.8,2.1,1.5c0.5,0.6,0.9,1.4,1.2,2.3c0.3,0.9,0.4,1.8,0.4,2.9v1.4h-10.5c0,1.3,0.4,2.4,1,3.2 c0.6,0.8,1.6,1.2,2.9,1.2c1,0,1.8-0.2,2.3-0.6s0.8-1,1-1.7L214,16.6L214,16.6z M211.1,12.2c0-1.2-0.3-2.2-0.8-2.8 c-0.6-0.7-1.5-1-2.7-1s-2.1,0.4-2.7,1.1c-0.6,0.7-1,1.6-1.1,2.8h7.3V12.2z">
													<svg:path fill="#EBECED" d="M220.4,6.3v2.2c0.5-0.8,1.1-1.4,1.8-1.8c0.7-0.4,1.5-0.6,2.3-0.6c0.3,0,0.6,0,0.8,0s0.4,0,0.6,0.1l-0.4,2.9 C225.3,9,225.1,9,224.8,9c-0.2,0-0.5,0-0.8,0c-0.6,0-1.1,0.1-1.6,0.3s-0.8,0.5-1.1,0.8s-0.5,0.7-0.7,1.1 c-0.2,0.4-0.2,0.8-0.2,1.2V21h-3.2V6.3H220.4z">
													<svg:path fill="#EBECED" d="M229.4,17v3.9H226V17H229.4z">
													<svg:path fill="#EBECED" d="M248.6,17c0.4-0.9,0.6-1.8,0.7-2.8h-3.5c-0.1,0.7-0.3,1.3-0.5,1.8s-0.5,1-0.9,1.4s-0.9,0.7-1.4,0.9 c-0.6,0.2-1.2,0.3-2,0.3c-0.9,0-1.7-0.2-2.4-0.5c-0.7-0.3-1.3-0.9-1.8-1.5c-0.5-0.7-0.9-1.5-1.1-2.4c-0.3-0.9-0.4-2-0.4-3.2 s0.1-2.2,0.4-3.2c0.2-0.9,0.6-1.8,1.1-2.4c0.5-0.7,1.1-1.2,1.8-1.6c0.7-0.4,1.5-0.5,2.4-0.5c0.7,0,1.4,0.1,1.9,0.3 c0.5,0.2,1,0.5,1.4,0.9s0.7,0.8,0.9,1.4c0.2,0.5,0.4,1.1,0.6,1.8L249,7c-0.2-1-0.5-1.9-0.8-2.7c-0.4-0.8-0.9-1.5-1.5-2.1 s-1.4-1-2.3-1.4c-0.9-0.3-2-0.5-3.3-0.5s-2.6,0.2-3.7,0.7s-2.1,1.2-2.9,2.1c-0.8,0.9-1.4,2-1.9,3.3c-0.4,1.3-0.7,2.8-0.7,4.4 s0.2,3.1,0.6,4.4c0.4,1.3,1,2.4,1.8,3.3c0.8,0.9,1.7,1.6,2.9,2.1c1.1,0.5,2.4,0.7,3.9,0.7c1.3,0,2.5-0.2,3.4-0.5 c1-0.4,1.8-0.9,2.5-1.5C247.7,18.6,248.2,17.9,248.6,17z">
													<svg:path fill="#EBECED" d="M259,21.4c-2.3,0-4.1-0.7-5.3-2c-1.3-1.4-1.9-3.3-1.9-5.7c0-1.2,0.2-2.2,0.5-3.2s0.8-1.8,1.4-2.5 s1.4-1.2,2.3-1.6c0.9-0.4,1.9-0.6,3.1-0.6s2.2,0.2,3.1,0.6c0.9,0.4,1.7,0.9,2.3,1.6c0.6,0.7,1.1,1.5,1.4,2.4 c0.3,0.9,0.5,2,0.5,3.1c0,1.3-0.2,2.4-0.5,3.4c-0.4,1-0.9,1.8-1.5,2.5s-1.4,1.2-2.3,1.5C261,21.2,260,21.4,259,21.4z M259,18.8 c1.4,0,2.3-0.5,3-1.4c0.6-0.9,0.9-2.2,0.9-3.8c0-1.6-0.3-2.9-0.9-3.8c-0.6-0.9-1.6-1.4-3-1.4s-2.3,0.5-3,1.4 c-0.6,0.9-0.9,2.2-0.9,3.8s0.3,2.9,0.9,3.8S257.6,18.8,259,18.8z">
										<svg:g>
											<svg:path fill="#EBECED" d="M40,20.4C39.7,9.6,30.8,0.9,20,0.9S0.3,9.6,0,20.3c0,0.2,0,0.4,0,0.6v20h18.5h2.9H40v-20 C40,20.7,40,20.6,40,20.4z M2.9,20.9c0-4.3,3.5-7.8,7.8-7.8s7.8,3.5,7.8,7.8v17C9.8,37.2,2.9,29.8,2.9,20.9z M21.5,20.9 c0-4.3,3.5-7.8,7.8-7.8s7.8,3.5,7.8,7.8c0,8.9-6.9,16.2-15.6,17V20.9z M20,3.9c5.9,0,11,3,14.1,7.5c-1.5-0.7-3.1-1.2-4.8-1.2 c-3.9,0-7.4,2.1-9.3,5.3c-1.9-3.2-5.3-5.3-9.3-5.3c-1.7,0-3.4,0.4-4.8,1.2C9,6.8,14.1,3.9,20,3.9z M2.9,31.4c1.7,2.7,3.9,5,6.6,6.6 H2.9V31.4z M37.1,38h-6.6c2.7-1.7,5-3.9,6.6-6.6V38z">
											<svg:circle fill="#EBECED" cx="11" cy="20.9" r="3">
											<svg:circle fill="#EBECED" cx="29" cy="20.9" r="3">
							<div.fall_down_menu_item_flex>
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#books">
									"Books"
									<span> "Deep insights on building a strong design practice"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#workshops">
									"Workshops"
									<span> "In-person workshops hosted by top design experts"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#podcast">
									"Podcasts"
									<span> "Design luminaries share their personal experiences"
								<a.fall_down_menu_item_a style="color: rgb(255, 255, 255);" href="#conversations">
									"Conversations"
									<span> "Short talks with exceptional designers and creatives"
						<div.fall_down_menu_item.fall_down3 .showsubmenu=showmenu1>
							<a.submenu_section_link href="#top-15-blog-posts">
								<img src="https://s3.amazonaws.com/www-assets.invisionapp.com/uploads/2019/04/top-15-810x810.jpg">
								<span>
									<strong> "Must reads: "
									"Check out the top 15 blog posts from our archives, from prototyping 101 to best tips for freelancers."

				<div.for_fall_down_menu_wrapper .show_submenu=showmenu2>
					<div.second_submenu  .show_submenu=showmenu2>
						<a.for_mobile .link_back=show_mobile_menu :tap.for_link_back>
							<svg:svg width="15px" height="14px" viewBox="0 0 15 14" xmlns="http://www.w3.org/2000/svg">
								<svg:g id="arrow" stroke="none" stroke-width="1">
									<svg:path d="M15,5.8331803 L2.67898833,5.8331803 L7.24068927,1.43309052 C7.5725403,1.11308399 7.58254586,0.585573231 7.26236798,0.254733147 C6.94219011,-0.0761069365 6.41523068,-0.0861071406 6.08337966,0.233066038 L0.46942746,5.64984323 C0.17176209,5.90401508 0,6.27485598 0,6.66653064 C0,7.0582053 0.17176209,7.4290462 0.431072818,7.64821734 L6.08337966,13.0999952 C6.24513619,13.2558318 6.45358533,13.3333333 6.66203446,13.3333333 C6.88048916,13.3333333 7.09811006,13.2474982 7.26236798,13.0783281 C7.58254586,12.747488 7.5725403,12.2199773 7.24068927,11.8999708 L2.67732073,7.49988098 L15,7.49988098 L15,5.8331803 Z" id="path-1">
							<h4> "Design Community"
						<div.second_submenu_item_1 .showsubmenu=showmenu2>
							<h5.header_5> "Events"
							<a.fall_down_menu_item_a href="#webinars">
								"Webinars"
								<span> "Actionable deep dives with top minds in product design"
						<div.second_submenu_item_2 .showsubmenu=showmenu2>
							<h5.header_5> "Leaders"
							<a.fall_down_menu_item_a href="#design-leadership-forum">
								"Design Leadership Forum"
								<span> "Leaders supporting—and learning from—one another"
							<a.fall_down_menu_item_a href="#designdisruptors.com">
								"Design Disruptors"
								<span> "A film showcasing the competitive advantage of design"
						<div.second_submenu_item_3 .showsubmenu=showmenu2>
							<h5.header_5> "Innovation"
							<a.fall_down_menu_item_a href="#design-forward-fund">
								"Design Forward Fund"
								<span> "A $5 million fund empowering the future of design"
						<div.second_submenu_item_4 .showsubmenu=showmenu2>
								<a.submenu_section_link href="#expert-advice">
									<img src="https://s3.amazonaws.com/www.invisionapp.com/assets/img/shared/dsm-talk-to-an-expert.jpg">
									<span>
										<strong> "Design system video series: "
										"Watch Brad Frost, Dan Mall, and Josh Clark share the latest thinking in design systems"

				<section.navigation_grid.post_nav css:top=post_nav_top>
					<hr.submenu_hr css:position="absolute">
					<a.post_svg .show_post_svg=show_post_menu style="color:#FFFFFF; grid-column: 3; display: flex; align-items: center;" href="#studio">
						<svg:svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMid">
							<svg:path fill="#f36" d="M0 2v28c0 1.1.9 2 2 2h28c1.1 0 2-.9 2-2V2c0-1.1-.9-2-2-2H2C.9 0 0 .9 0 2z">
							<svg:path fill="#FFF" d="M7.1 19.7c-.1.5-.2 1-.2 1.4 0 1.6.9 2.7 2.7 2.7 1.5 0 2.7-.9 3.6-2.4l-.5 2.3h3l1.7-7.2c.4-1.8 1.3-2.8 2.5-2.8 1 0 1.6.6 1.6 1.7 0 .3 0 .6-.1 1l-.9 3.3c-.1.5-.2.9-.2 1.4 0 1.6.9 2.7 2.7 2.7 1.6 0 2.8-1.1 3.5-3.6l-1.2-.5c-.6 1.7-1.1 2-1.5 2-.4 0-.6-.3-.6-.8 0-.3.1-.5.1-.9l.9-3.2c.2-.8.3-1.4.3-2 0-2.4-1.4-3.7-3.1-3.7-1.6 0-3.2 1.5-4 3l.6-2.8h-4.6l-.6 2.5H15l-1.3 5.5c-1 2.4-2.9 2.4-3.2 2.4-.4-.1-.6-.2-.6-.8 0-.3.1-.7.2-1.3l2-8.3H7l-.6 2.5h2.1l-1.4 5.9M10 6c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2z">
					<section.submenue_flex>
						<div.for_post_links .animated_link_1=show_post_menu>
							<a.submenue_link style="margin: 0; color: rgb(255, 51, 102);" > "Overview"
						<div.for_post_links .animated_link_2=show_post_menu>
							<a.submenue_link css:margin=0 > "Platform"
						<div.for_post_links .animated_link_3=show_post_menu>
							<a.submenue_link css:margin=0 > "Learn"
						<div.for_post_links .animated_link_4=show_post_menu>
							<a.submenue_link css:margin=0 > "New"
						<a.post_nav_download .animated_link_5=show_post_menu >
							<span.desktop-text> "Download studio free"
							<span.mobile-text css:display="none"> "Download studio"

			<figure>
				<div.video_on_back>
					<video.video-elem css:opacity=video_on_back_opacity autoplay="autoplay" preload="auto" src="https://s3.amazonaws.com/www.invisionapp.com-studio/cbb346987ce32cc195de4b209e6c70a81c98b906/static/video/intro-clipped.mp4?v=2" poster="https://s3.amazonaws.com/www.invisionapp.com-studio/cbb346987ce32cc195de4b209e6c70a81c98b906/static/video/poster.png?v=2">
					<a.video_elem_play_link css:opacity=video_elem_play_link_opacity style="text-transform:uppercase">
						<svg:svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 12" width="10" preserveAspectRatio="xMinYMin meet">
							<svg:path d="M0 0l10 6-10 6V0z">
				<figcaption>
					<h1.most_powerful>
						<span> "The world’s most powerful"
						<br>
						<span> "screen design tool"
					<a.download_studio_free style="text-transform: uppercase;">
						<span> "Download studio free"
						<span.mobile-text css:display="none"> "Download studio"
					<a.play_video style="text-transform:uppercase">
						<svg:svg.play_video_svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 12" width="10" preserveAspectRatio="xMinYMin meet">
							<svg:path d="M0 0l10 6-10 6V0z">
						"Play Video"

Imba.mount <App>
