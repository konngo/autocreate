<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>${remark}中心</title>
    <base th:href="${r"${#request.getContextPath()}"}+'/'">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" href="font/iconsmind-s/css/iconsminds.css" />

    <link rel="stylesheet" href="font/simple-line-icons/css/simple-line-icons.css" />
    <link rel="stylesheet" href="css/vendor/fullcalendar.min.css" />
    <link rel="stylesheet" href="css/vendor/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="css/vendor/datatables.responsive.bootstrap4.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap-float-label.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap-tagsinput.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" href="css/vendor/perfect-scrollbar.css" />
    <link rel="stylesheet" href="css/vendor/select2.min.css" />
    <link rel="stylesheet" href="css/vendor/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="css/vendor/glide.core.min.css" />
    <link rel="stylesheet" href="css/vendor/baguetteBox.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap-stars.css" />
    <link rel="stylesheet" href="css/vendor/nouislider.min.css" />
    <link rel="stylesheet" href="css/vendor/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="css/vendor/component-custom-switch.min.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/vendor/dropzone.min.css" />
    <link rel="stylesheet" href="css/vendor/quill.snow.css" />
    <link rel="stylesheet" href="css/vendor/quill.bubble.css" />



    <script src="js/vendor/jquery-3.3.1.min.js"></script>

    <script src="js/vendor/vue.min.js"></script>
    <script src="js/vendor/dropzone.min.js"></script>
    <script src="js/vendor/bootstrap.bundle.min.js"></script>
    <script src="js/vendor/Chart.bundle.min.js"></script>
    <script src="js/vendor/chartjs-plugin-datalabels.js"></script>
    <script src="js/vendor/moment.min.js"></script>
    <script src="js/vendor/fullcalendar.min.js"></script>
    <script src="js/vendor/perfect-scrollbar.min.js"></script>
    <script src="js/vendor/baguetteBox.min.js"></script>
    <script src="js/vendor/glide.min.js"></script>
    <script src="js/vendor/progressbar.min.js"></script>
    <script src="js/vendor/jquery.barrating.min.js"></script>
    <script src="js/vendor/jquery.validate/jquery.validate.min.js"></script>
    <script src="js/vendor/jquery.validate/additional-methods.min.js"></script>
    <script src="js/vendor/bootstrap-tagsinput.min.js"></script>
    <script src="js/vendor/datatables.min.js"></script>
    <script src="js/vendor/dataTables.buttons.min.js"></script>
    <script src="js/vendor/jszip.min.js"></script>
    <script src="js/vendor/pdfmake.min.js"></script>
    <script src="js/vendor/vfs_fonts.js"></script>
    <script src="js/vendor/buttons.html5.min.js"></script>
    <script src="js/vendor/buttons.print.min.js"></script>
    <script src="js/vendor/select2.full.js"></script>
    <script src="js/vendor/nouislider.min.js"></script>
    <script src="js/vendor/bootstrap-datepicker.js"></script>
    <script src="js/vendor/Sortable.js"></script>
    <script src="js/vendor/mousetrap.min.js"></script>
    <script src="js/dore.script.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/vendor/bootstrap-notify.min.js"></script>
    <script src="js/vendor/quill.min.js"></script>
    <script src="js/vendor/ckeditor5-build-classic/ckeditor.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ChFSPAT0N4jcce5lfCBKOh570kD91WOO"></script>

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