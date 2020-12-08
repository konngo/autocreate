<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑页面</title>
    <script src="https://www.layuicdn.com/auto/layui.js"></script>
</head>
<body>
<div class="layui-content">
    <form class="layui-form" action="/${classname?lower_case}?method=saveorupdate">
        <input type="hidden" name="id" value="##${classname?lower_case}.id**">


        <#if columns??>
            <#list columns as col>
         <div class="layui-form-item">
             <label class="layui-form-label">${col["comment"]}</label>
             <div class="layui-input-inline">
                 <input type="text" name="${col["name"]?lower_case}" value="##${classname?lower_case}.${col["name"]?lower_case}**" autocomplete="off" class="layui-input">
             </div>
         </div>
            </#list>
        </#if>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn layui-btn-primary">提交</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>