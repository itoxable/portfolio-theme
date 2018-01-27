<#--
This file allows you to override and define new FreeMarker variables.
-->

<#--  social  -->

<#if layout.getGroup().getExpandoBridge().hasAttribute("facebook")>
    <#assign facebook = layout.getGroup().getExpandoBridge().getAttribute("facebook")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("instagram")>
    <#assign instagram = layout.getGroup().getExpandoBridge().getAttribute("instagram")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("pinterest")>
    <#assign pinterest = layout.getGroup().getExpandoBridge().getAttribute("pinterest")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("youtube")>
    <#assign youtube = layout.getGroup().getExpandoBridge().getAttribute("youtube")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("twitter")>
    <#assign twitter = layout.getGroup().getExpandoBridge().getAttribute("twitter")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("doneby")>
    <#assign doneby = layout.getGroup().getExpandoBridge().getAttribute("doneby")>
    <#if layout.getGroup().getExpandoBridge().hasAttribute("doneby")>
        <#assign donebyUrl = layout.getGroup().getExpandoBridge().getAttribute("donebyUrl")>
    </#if>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("copyright")>
    <#assign copyright = layout.getGroup().getExpandoBridge().getAttribute("copyright")>
</#if>
<#if layout.getGroup().getExpandoBridge().hasAttribute("email")>
    <#assign email = layout.getGroup().getExpandoBridge().getAttribute("email")>
</#if>



<#macro social>
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
</#macro>