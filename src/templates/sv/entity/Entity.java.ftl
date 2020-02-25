package cn.konngo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
  *  ${remark}
  */

@Data
@ToString
@TableName(value = "${classname?uncap_first}")
public class ${classname?cap_first}Entity implements Serializable {

    @TableId(type= IdType.AUTO)
<#if columns??>
    <#list columns as col>
        //${col["comment"]}
        private ${col["type"]} ${col["name"]?lower_case};

    </#list>
</#if>

}
