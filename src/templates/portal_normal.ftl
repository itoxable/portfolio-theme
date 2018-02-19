<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Quicksand:400,500,700" rel="stylesheet">


	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<div class="container">
		<div class="row">
			<div id="heading" class="layout-row spacer-xs-ver-15 spacer-ver-30 space-between align-middle align-center-xs">
				<div id="mobile-nav-button">
					<div id="mobile-nav-icon">
						<span></span>
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<div>
					<h1 class="site-title spacer-0">
						<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
							<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
						</a>
						<#if show_site_name>
							<a href="${site_default_url}" class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
								${site_name}
							</a>
						</#if>
					</h1>
				</div>

				<div class="navigation">
					<#if show_site_name>
						<h2  class="site-name">
							${site_name}
						</h2>
					</#if>
					<#if has_navigation && is_setup_complete>
						<#include "${full_templates_path}/navigation.ftl" />
					</#if>
					<div class="close-navigation">
						<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
					</div>
					<div class="menu-social spacer-top-20">
						<@social/> 
					</div>
				</div>
			</div>
		</div>
	</div>

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		<div class="">
			<p class="text-center">
				<#if copyright?has_content>
					© 2018 ${copyright}
				</#if>

				<#if doneby?has_content>
					<a href="http://${donebyUrl}" target="_blank">Created by ${doneby}</a>
				</#if>
			</p>
			<@social/> 
		</div>
	</footer>
</div>

<div id="overlay"></div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->

	<script type="text/javascript" src="${javascript_folder}/slick.js"></script>
	<script type="text/javascript" src="${javascript_folder}/lightbox.js"></script>
	<script type="text/javascript" src="${javascript_folder}/cookieconsent.js"></script>

	

	<script type="text/javascript">
		function closeNavigation() {
			$('body').toggleClass("menu-on");
		}
		$('#mobile-nav-button').click(function(){
			closeNavigation();
		});
		$('#overlay').click(function(){
			closeNavigation();
		});
		$('.close-navigation').click(function(){
			closeNavigation();
		});		
	</script>

<!-- endinject -->

<#--  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.0.3/cookieconsent.min.css" />  -->

<script>
	window.addEventListener("load", function(){
	window.cookieconsent.initialise({
	"palette": {
		"popup": {
		"background": "#000"
		},
		"button": {
		"background": "#f1d600"
		}
	},
	"position": "bottom-right"
	})});
</script>

</body>

</html>
