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


