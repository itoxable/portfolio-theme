<#if entries?has_content>
    <h3 class="spacer-top-0 text-center page-title">
	<#list entries as curEntry>
		<span class="spacer">${curEntry.getTitle()}<#if curEntry?has_next>: </#if></span>
	</#list>
	</h3>
</#if>