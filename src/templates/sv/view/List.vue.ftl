<template>
    <div>
        <a-table v-if="!flag"
                 :columns="columns"
                 :dataSource="data"
                 :pagination="pagination"
                 :loading="loading"
                 :rowKey="record => record.id"
        >
     <span slot="action" slot-scope="text,record">
      <a href="javascript:;" @click="edit(record)">编辑</a>
      <a-divider type="vertical" />
         <a-popconfirm
                 v-if="data.length"
                 title="确定删除吗?"
                 @confirm="() => onDelete(record)"
         >
                <a href="javascript:;" >删除</a>
             </a-popconfirm>
    </span>
        </a-table>


        <a-card :loading="loading" title="" v-if="flag">
            <a-form layout="horizontal" @submit="handleSubmit">
             <#list columns as col>
                    <a-form-item label="${col["comment"]}">
                        <a-input v-model="${classname?uncap_first}.${col["name"]?lower_case}" />
                    </a-form-item>
             </#list>
                <a-form-item>
                    <a-button type="primary" @click="handleSubmit" class="login-form-button">
                        修改
                    </a-button>
                </a-form-item>
                <br><br><br><br><br>
            </a-form>
        </a-card>
    </div>
</template>

<script>
    const columns=[
        <#list columns as col>
        {
            title:'${col["comment"]}',
            dataIndex:'${col["name"]?lower_case}',
            sorter: true
        },
        </#list>
       {
            title:'操作',
            scopedSlots: { customRender: 'action' }
        },
    ];
    export default {
        data(){
            return{
                columns,
                data: [],
                pagination: {},
                loading: false,
                ${classname?uncap_first}:{},
                flag:false
            }
        },
        methods:{
            fetch(){
                this.loading = true;
                this.axios.get("${classname?uncap_first}/list").then(response=>{
                    console.log(response.data.data.${classname?uncap_first});
                    if (response.data.success){
                        this.data=response.data.data.${classname?uncap_first};
                        this.loading = false;
                    }else {
                        this.$message.error('连接服务器异常！');
                    }
                })
            },
            edit(record){
                console.log(record)
                this.flag=true;
                this.${classname?uncap_first}=record;

            },
            onDelete(record){
                //删除记录
                this.axios.get("${classname?uncap_first}/delete?id="+record.id).then(response=>{
                    if (response.data.success){
                        this.$message.success('删除成功!');
                        this.fetch();
                    }else {
                        this.$message.error('连接服务器异常！');
                    }
                })
            },
            handleSubmit(){
                this.axios.post('${classname?uncap_first}/update',this.$qs.stringify({
                    <#if columns??>
                    <#list columns as col>
                    ${col["name"]?lower_case}:this.${classname?uncap_first}.${col["name"]?lower_case},
                    </#list>
                    </#if>
                })).then(response=>{
                    if(response.data.success){
                        this.$message.success('修改成功!');
                        this.flag=false;
                        this.fetch();
                    }else {
                        this.$message.error('修改失败!');
                    }
                })
            }
        },
        mounted() {
            this.fetch();
        }
    }
</script>

<style>
</style>
