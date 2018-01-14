<div class="top-banner">
    <#if entries?has_content>   
    <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
    	<#list entries as entry>

            <#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
            <#assign article = assetRenderer.getArticle()/>
            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />

			<#assign imageNode = doc.selectSingleNode("/root/dynamic-element[@name='image']/dynamic-content") />
			<#assign imageUrl = imageNode.getText() />
			<#assign imageAlt = imageNode.valueOf("@alt") />
            <#assign class = "" />
            <#if entry?index == 0>  
                <#assign class = "on-top" />
            </#if>
			<#assign imageDescription = article.getDescription(locale) />
                <div class="top-banner-image ${class}" style="background-image:url('${imageUrl}');">    
                    <@getEditIcon/> 
                    <div class="top-banner-txt" >
                        <h2 class="top-banner-name">
                            ${entry.getTitle(locale)}
                        </h2>
                        <p class="top-banner-description" >
                            ${imageDescription}
                        </p>
                    </div>
				</div>
    	</#list>
    </#if>
</div>
<script type="text/javascript" charset="utf-8">
</script>
<#macro getEditIcon>
	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
		<#assign redirectURL = renderResponse.createRenderURL() />

		${redirectURL.setParameter("mvcPath", "/add_asset_redirect.jsp")}
		${redirectURL.setWindowState("pop_up")}

		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState("pop_up"), redirectURL)!"" />
		<#if validator.isNotNull(editPortletURL)>
			<#assign title = languageUtil.format(locale, "edit-x", entryTitle, false) />
            <div class="lfr-meta-actions asset-actions" style="float: none">
                <@liferay_ui["icon"]
                    cssClass="icon-monospaced visible-interaction"
                    icon="pencil"
                    markupView="lexicon"
                    message=title
                    url="javascript:Liferay.Util.openWindow({id:'" + renderResponse.getNamespace() + "editAsset', title: '" + title + "', uri:'" + htmlUtil.escapeURL(editPortletURL.toString()) + "'});"
                />
            </div>
		</#if>
	</#if>

</#macro>