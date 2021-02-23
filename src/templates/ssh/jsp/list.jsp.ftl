<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${remark}中心</title>

    <base href="<%=basePath%>">
    <jsp:include page="header.jsp"></jsp:include>

</head>
<body  class="show-spinner">
<div id="app">

    <div class="container-fluid" v-show="show">
        <div class="row">
            <div class="col-12">
                <h1>${remark}管理</h1>

                <div class="top-right-button-container">
                    <div class="btn-group">
                        <button  class="btn btn-outline-primary mb-1" @click="showAddItem" type="button">
                            添加
                        </button>

                        <button class="btn btn-outline-primary mb-1" type="button" @click="showUpdateItem">
                            编辑
                        </button>

                        <button class="btn btn-outline-primary mb-1" type="button" @click="deleteItem()">
                            删除
                        </button>

                        <button class="btn btn-outline-primary mb-1 dropdown-toggle" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            导出
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" id="dataTablesCopy" href="#">Copy</a>
                            <a class="dropdown-item" id="dataTablesExcel" href="#">Excel</a>
                            <a class="dropdown-item" id="dataTablesCsv" href="#">Csv</a>
                            <a class="dropdown-item" id="dataTablesPdf" href="#">Pdf</a>
                        </div>
                    </div>
                </div>

                <nav class="breadcrumb-container d-none d-sm-block d-lg-inline-block" aria-label="breadcrumb">
                    <ol class="breadcrumb pt-0">
                        <li class="breadcrumb-item">
                            <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">${classname?cap_first}</a>
                        </li>
                    </ol>
                </nav>
                <div class="mb-2">
                    <a class="btn pt-0 pl-0 d-inline-block d-md-none" data-toggle="collapse" href="#displayOptions"
                       role="button" aria-expanded="true" aria-controls="displayOptions">
                        显示操作
                        <i class="simple-icon-arrow-down align-middle"></i>
                    </a>
                    <div class="collapse dont-collapse-sm" id="displayOptions">
                        <div class="d-block d-md-inline-block">
                            <div class="search-sm d-inline-block float-md-left mr-1 mb-1 align-top">
                                <input class="form-control" placeholder="查询" id="searchDatatable">
                            </div>
                        </div>
                        <div class="float-md-right dropdown-as-select" id="pageCountDatatable">
                            <span class="text-muted text-small">单页展示行数</span>
                            <button class="btn btn-outline-dark btn-xs dropdown-toggle" type="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                10
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#">5</a>
                                <a class="dropdown-item active" href="#">10</a>
                                <a class="dropdown-item" href="#">20</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="separator"></div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 mb-4 data-table-rows data-tables-hide-filter">
                <table id="datatableRows"
                       data-tableheader='[
                           <#list columns as col>
                                {"data":"${col["name"]?lower_case}"},
                            </#list>
                    ]'
                       data-ajax="/${classname?uncap_first}/list"
                       class="data-table responsive nowrap">
                    <thead>
                    <tr>
                        <th>#</th>
                <#list columns as col>
                    <#if col["comment"]!='编号' >
                        <th>${col["comment"]}</th>
                    </#if>
                </#list>
                    </tr>
                    </thead>
                    <tbody id="tbody">

                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="container-fluid" v-show="!show">
        <div class="row">
            <div class="col-12">


                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="mb-4">${remark}信息</h5>

                        <input type="hidden" v-model="${classname?uncap_first}.id">


            <#list columns as col>
                <#if col["name"]!='id' >
                    <label class="form-group has-float-label mb-4">
                        <input class="form-control" v-model="${classname?uncap_first}.${col["name"]}"> <span>${col["comment"]}</span>
                    </label>
                </#if>
            </#list>



                        <button  class="btn btn-primary btn-lg btn-shadow" @click="addItem">提交</button>
                        <button  class="btn btn-primary btn-lg btn-shadow" @click="reback">返回</button>


                    </div>
                </div>



            </div>
        </div>
    </div>
</div>
</body>



<script>
    // 消除子窗口内的theme主题按钮
    $(".theme-button").remove()


    var vue=new Vue({
        el:'#app',
        data(){
            return {
                show:true,
                action:0, // action 为1时进行添加，为2时进行修改
                ${classname?uncap_first}:[],
            }
        },
        methods:{
            reback(){
                this.show=true;
            },
            addItem(){

                $.ajax({
                    type: 'POST',
                    url: host+"${classname?uncap_first}/addOrUpdate",
                    data: {
                <#list columns as col>
                        ${col["name"]?lower_case}:this.${classname?uncap_first}.${col["name"]?lower_case},
                </#list>
                    },
                    success: function (response){
                        console.log(response)
                        if(response.code==0){
                            showNotify('top', 'center', "success","结果","保存成功！");
                            datatableRow.ajax.reload();
                        }else{
                            showNotify('top', 'center', "danger","结果","保存失败，请重新尝试。");
                        }
                    }
                });

            },
            cancleEdit(){
                // 返回表格
                this.show=true;
            },
            deleteItem(){
                this.${classname?uncap_first}=datatableRow.rows('.selected').data();

                $.ajax({
                    type: 'POST',
                    url: host+"${classname?uncap_first}/delete",
                    data: {
                        id:this.${classname?uncap_first}[0].id
                    },
                    success: function (response){
                        console.log(response)
                        if(response.code==0){
                            showNotify('top', 'center', "success","结果","删除成功！");
                            datatableRow.ajax.reload();
                        }else{
                            showNotify('top', 'center', "danger","结果","删除失败，请重新尝试。");
                        }
                    }
                });

            },
            showUpdateItem(){
                // 显示修改界面
                console.log(datatableRow.rows('.selected').data());
                var choose=datatableRow.rows('.selected').data();
                if (choose.length>1){
                    showNotify('top', 'center', "warning","提示","只能编辑一条数据哦！");
                    return ;
                }
                if (choose.length==0){
                    showNotify('top', 'center', "warning","提示","请选择要编辑的数据哦！");
                    return ;
                }

                this.${classname?uncap_first}=choose[0];
                this.show=false;
                this.action=1;
            },
            showAddItem(){
                //显示添加界面
                this.show=false;
                this.action=2;
                // 清空
                this.${classname?uncap_first}={}
            }
        }
    })

</script>


</html>