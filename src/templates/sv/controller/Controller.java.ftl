package cn.konngo.controller;

import cn.konngo.entity.${classname?cap_first}Entity;
import cn.konngo.mapper.${classname?cap_first}Mapper;
import cn.konngo.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
  *  ${remark} Controller
  */

@RestController
@RequestMapping("${classname?uncap_first}")
public class ${classname?cap_first}Controller {
    @Autowired
    HttpServletRequest request;
    @Autowired
    ${classname?cap_first}Mapper ${classname?uncap_first}Mapper;


    //添加
    @RequestMapping("add")
    public R add(${classname?cap_first}Entity ${classname?uncap_first}Entity){
        if(${classname?uncap_first}Mapper.insert(${classname?uncap_first}Entity)>0){
            return R.ok();
        }
        return R.error();
    }

    //修改
    @RequestMapping("update")
    public R update(${classname?cap_first}Entity ${classname?uncap_first}Entity){
        if(${classname?uncap_first}Mapper.updateById(${classname?uncap_first}Entity)>0){
            return R.ok();
        }
        return R.error();
    }

    //删除
    @RequestMapping("delete")
    public R delete(int id){
        if (${classname?uncap_first}Mapper.deleteById(id)>0){
            return R.ok();
        }
        return R.error();
    }

    //展示所有
    @RequestMapping("list")
    public R list(){
        return R.ok().data("${classname?uncap_first}",${classname?uncap_first}Mapper.selectList(null));
    }
}
