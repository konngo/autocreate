<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basepackage}.dao.${classname?cap_first}Dao">

    <resultMap id="${classname?cap_first}Entity" type="${basepackage}.entity.${classname?cap_first}Entity">

        <#if columns??>
            <#list columns as col>
                <result property="${col["name"]?lower_case}" column="${col["name"]?lower_case}"/>
            </#list>
        </#if>

    </resultMap>

    <select id="list" resultMap="${classname?cap_first}Entity">
        SELECT * from ${classname?lower_case} ;
    </select>

    <select id="select" resultMap="${classname?cap_first}Entity">
        select * from ${classname?lower_case} where id=<#noparse>#{</#noparse>id}
    </select>

    <insert id="insert" >
        insert into ${classname?lower_case}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list columns as col>
                <if test="${col["name"]?lower_case}!=null" >${col["name"]?lower_case},</if>
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list columns as col>
                <if test="${col["name"]?lower_case}!=null" ><#noparse>#{</#noparse>
                    ${col["name"]?lower_case}},</if>
            </#list>
        </trim>
    </insert>

    <update id="update">
        update ${classname?lower_case}
        <set>
            <trim  suffixOverrides=",">
            <#list columns as col>
                <if test="${col["name"]?lower_case}!=null" >${col["name"]?lower_case}=<#noparse>#{</#noparse>${col["name"]?lower_case}},</if>
            </#list>
            </trim>
        </set>
        where id=<#noparse>#{</#noparse>id}
    </update>

    <delete id="delete">
        delete from ${classname?lower_case} where id=<#noparse>#{</#noparse>id}
    </delete>

</mapper>