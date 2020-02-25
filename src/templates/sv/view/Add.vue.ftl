<template>
    <a-card title="">
        <a-form layout="horizontal" @submit="handleSubmit">
            <#if columns??>
                <#list columns as col>
                    <a-form-item label="${col["comment"]}">
                        <a-input v-model="${classname?uncap_first}.${col["name"]?lower_case}" />
                    </a-form-item>
                </#list>
            </#if>
            <a-form-item>
                <a-button type="primary" @click="handleSubmit" class="login-form-button">
                    添加
                </a-button>
            </a-form-item>
            <br><br><br><br><br>
        </a-form>
    </a-card>
</template>

<script>

    export default {
        data(){
            return{
                ${classname?uncap_first}:{}
            }
        },
        methods:{
            handleSubmit(){
                this.axios.post('${classname?uncap_first}/add',this.$qs.stringify({
                <#if columns??>
                    <#list columns as col>
                    ${col["name"]?lower_case}:this.${classname?uncap_first}.${col["name"]?lower_case},
                    </#list>
                </#if>
                })).then(response=>{
                    console.log(response)
                    if(response.data.success){
                        this.$message.success('添加成功!');
                        this.${classname?uncap_first}={}
                    }else {
                        this.$message.error('修改失败!');
                    }
                })
            }
        },
        mounted() {
        }
    }
</script>

<style>
</style>
