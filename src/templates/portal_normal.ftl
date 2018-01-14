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
		<div class="row spacer-hor-20">
			<div id="heading" class="layout-row space-between align-middle">
				<div>
					<h1 class="site-title">
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
					<#if has_navigation && is_setup_complete>
						<#include "${full_templates_path}/navigation.ftl" />
					</#if>
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

			<div class="social nav-social">
				<ul>
					<#if facebook?has_content>
					<li>
						<a href="http://www.facebook.com/${facebook}" target="_blank">
							<i class="fa fa-facebook" aria-hidden="true"></i>
						</a>
					</li>
					</#if>
					<#if instagram?has_content>
					<li>
						<a href="https://www.instagram.com/${instagram}/" target="_blank">
							<i class="fa fa-instagram" aria-hidden="true"></i>
						</a>
					</li>
					</#if>
					<#if pinterest?has_content>
					<li>
						<a href="http://www.pinterest.com/${pinterest}" target="_blank">
							<i class="fa fa-pinterest" aria-hidden="true"></i>
						</a>
					</li>
					</#if>
					<#if youtube?has_content>
					<li>
						<a href="http://www.youtube.com/c/${youtube}" target="_blank">
							<i class="fa fa-youtube" aria-hidden="true"></i>
						</a>
					</li>
					</#if>
					<#if twitter?has_content>
					<li>
						<a href="http://www.twitter.com/${twitter}" target="_blank">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</li>
					</#if>
					<#if email?has_content>
					<li>
						<a href="mailto:${email}">
							<i class="fa fa-envelope-o" aria-hidden="true"></i>
						</a>
					</li>
					</#if>


					
				</ul>
			</div>
		
		</div>

		
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->

	<script type="text/javascript" src="${javascript_folder}/slick.js"></script>
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

</body>

</html>