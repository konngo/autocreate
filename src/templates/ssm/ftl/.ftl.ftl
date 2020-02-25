<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${remark}管理</title>
    <script src="/lib/vue.js" ></script>
    <script src="/lib/antdesign/antd.min.js" ></script>
    <script src="/lib/axios.min.js" ></script>
    <script src="/lib/layui/layui.js" ></script>
    <link rel="stylesheet" href="/lib/antdesign/antd.min.css"></link>



    <script src="/lib/moment.min.js"></script>
    <script src="/lib/jquery.min.js"></script>
    <script src="/lib/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/index.css"></link>
    <link rel="stylesheet" href="/lib/layui/css/layui.css"></link>
    <link rel="stylesheet" href="/lib/jqgrid/ui.jqgrid-bootstrap.css">


    <script src="/lib/jqgrid/grid.locale-cn.js"></script>
    <script src="/lib/jqgrid/jquery.jqGrid.min.js"></script></head>
<body>
<div id="app">
    <div v-show="show">
        <table class="layui-hide" id="demo" lay-filter="demo"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            </div>
        </script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
    </div>

    <div v-show="!show">
        <form class="layui-form" action="/${classname?uncap_first}/addOrUpdate">
            <#list columns as col>

                <div class="layui-form-item">
                    <label class="layui-form-label">${col["comment"]}</label>
                    <div class="layui-input-block">
                        <input type="text" name="${col["name"]?lower_case}"  :value="${classname?uncap_first}. ${col["name"]?lower_case}" class="layui-input">
                    </div>
                </div>
            </#list>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button @click="returnMain" class="layui-btn layui-btn-primary">返回</button>
                </div>
            </div>
        </form>
    </div>

</div>

<script >
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#demo'
            ,url:'/${classname?uncap_first}/list'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,title: '${remark}数据表'
            ,cols: [[
                <#list columns as col>
                {field:'${col["name"]?lower_case}', title:'${col["comment"]}', width:120},
                </#list>
                {fixed:'right',title:'操作',toolbar:'#barDemo',width:150}
            ]]
            ,page: true
        });


        //头工具栏事件
        table.on('toolbar(demo)', function(obj){
            switch(obj.event){
                case 'add':
                    vue.handleAdd();
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    vue.handleDelete(data.id);
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                vue.handleEdit(data);
            } else if(obj.event === 'add'){
                vue.handleAdd();
            }
        });
    })



    var vue=new Vue({
        el:'#app',
        data:{
            show:true,
            ${classname?uncap_first} <#noparse>:{}</#noparse>
        },
        methods:{
            handleAdd(){
                this.show=false;
                this.${classname?uncap_first}={};
            },
            handleEdit(${classname?uncap_first}){
                this.show=false;
                this.${classname?uncap_first}=${classname?uncap_first};
            },
            handleDelete(id){
                axios.get("/${classname?uncap_first}/delete?id="+id).then(function (response) {
                    this.$message.error('删除成功！');
                }).catch(function (error) {
                    console.log(error)
                });
            },
            returnMain(){
                this.show=true;
            }
        }
    })
</script>


</body>
</html>