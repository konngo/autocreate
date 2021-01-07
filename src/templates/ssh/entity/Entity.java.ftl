package ${basepackage}.entity;

import java.io.Serializable;

/**
 *  ${remark}
 */
public class ${classname?cap_first}Entity implements Serializable{

<#if columns??>
    <#list columns as col>
        //${col["comment"]}
        private ${col["type"]} ${col["name"]?lower_case};
    </#list>

    <#list columns as col>
        public ${col["type"]} get${col["name"]?cap_first}() {
            return ${col["name"]?lower_case};
        }

        public void set${col["name"]?cap_first}(${col["type"]} ${col["name"]?lower_case}) {
            this.${col["name"]?lower_case} = ${col["name"]?lower_case};
        }
    </#list>
</#if>

}
