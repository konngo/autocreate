package ${basepackage}.entity;

public class ${classname} {

<#if columns??>
    <#list columns as col>
        //${col["comment"]}
        private ${col["type"]} ${col["name"]};
    </#list>
</#if>

}
