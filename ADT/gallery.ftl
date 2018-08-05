<div class="gallery layout-row flex-wrap">
    <#if entries?has_content>   
    <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
    <#assign jsonFactoryUtil = serviceLocator.findService('com.liferay.portal.kernel.json.JSONFactoryUtil') />

com.liferay.portal.kernel.json
        JSONObject jsonObject =  JSONFactoryUtil.createJSONObject();


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

			<#assign image = jsonFactoryUtil.createJSONObject(imageNode.getText()) />
			<#assign groupId = image.getLong("groupId") />
			<#assign uuid = image.getLong("uuid") />


			<#assign imageAlt = imageNode.valueOf("@alt") />
			<#assign imageDescription = doc.selectSingleNode("/root/dynamic-element[@name='description']/dynamic-content").getText()  />

            <div class="item-wrapper flex-xs-50 flex-third">
    			<a class="item" href="${viewURL}" >
    				<@getEditIcon/> 

    				<div class="item-image">
    				    <img src="/documents/${groupId}/${uuid}">
    				</div>
    				
    				<div class="item-title">
    					${entry.getTitle(locale)}
    				</div>
    				<a class="item-zoom" href="/documents/${groupId}/${uuid}" data-lightbox="example-set">
    					<i class="fa fa-search-plus" aria-hidden="true"></i>
    				</a>
    			</a>
            </div>
    	</#list>
    </#if>
</div>
<script type="text/javascript" charset="utf-8">

    jQuery(document).ready(function($) {
       /* var options = {
            onFinish : {
		        redraw: function (){
                    lightcase.resize();
                 }
	        }};
		$('.item-zoom').lightbox();*/
	});

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