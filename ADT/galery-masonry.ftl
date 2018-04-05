<div class="gallery masonry">
    <#if entries?has_content>   
    <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
    	<#list entries as entry>

            <#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
            <#assign article = assetRenderer.getArticle()/>
            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />


			<#assign assetViewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />
			<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, assetViewURL) />

			<#assign articleDescription = article.getDescription(locale) />
			<#assign imageNode = doc.selectSingleNode("/root/dynamic-element[@name='image']/dynamic-content") />
			<#assign image = imageNode.getText() />
			<#assign imageAlt = imageNode.valueOf("@alt") />
			<#assign imageDescription = doc.selectSingleNode("/root/dynamic-element[@name='description']/dynamic-content").getText()  />
			
			<#assign inGallery = doc.selectSingleNode("/root/dynamic-element[@name='inGallery']/dynamic-content").getText()  />
			
			<#assign sold = doc.selectSingleNode("/root/dynamic-element[@name='sold']/dynamic-content").getText()  />

            <div class="item-wrapper">
                <div class="item">
                    <@getEditIcon/> 
                    <div class="item-image">
            			<a class="item-link" href="${viewURL}" >
            			    <img src="${image}">
            			</a>
            			<a class="item-zoom" href="${image}" data-lightbox="gallery-set">
        					<i class="fa fa-search-plus" aria-hidden="true"></i>
        				</a>
            			<div class="item-status">
            				<#if sold == "true"> 
            				   <span class="sold">sold</span> 
            				</#if>
            				<#if inGallery  == "true"> 
            				   <span class="in-gallery" title="In gallery">(G)</span> 
            				</#if>
        				</div>
        			</div>
        			<h3 class="item-title">
    					${entry.getTitle(locale)}
    				</h3>
    				
        			<a class="item-zoom" href="${image}" data-lightbox="gallery-set">
    					<i class="fa fa-search-plus" aria-hidden="true"></i>
    				</a>
    			</div>
            </div>
    	</#list>
    </#if>
</div>
<script type="text/javascript" charset="utf-8">

    /*$('.gallery').masonry({})*/

</script>
<#macro getEditIcon>
	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
		<#assign redirectURL = renderResponse.createRenderURL() />

		${redirectURL.setParameter("mvcPath", "/add_asset_redirect.jsp")}
		${redirectURL.setWindowState("pop_up")}

		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState("pop_up"), redirectURL)!"" />
		<#if validator.isNotNull(editPortletURL)>
			<#assign title = languageUtil.format(locale, "edit-x", entryTitle, false) />
			<div class="lfr-meta-actions asset-actions">

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