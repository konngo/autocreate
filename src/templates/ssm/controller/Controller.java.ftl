package ${basepackage}.controller;

import ${basepackage}.entity.${classname?cap_first}Entity;
import ${basepackage}.service.${classname?cap_first}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/${classname?uncap_first}")
// ${remark} 控制层
public class ${classname?cap_first}Controller {
    @Autowired
    ${classname?cap_first}Service ${classname?uncap_first}Service;


    @RequestMapping("list")
    @ResponseBody
    // 返回所有${remark}
    public Map list(){
        Map map=new HashMap();
        map.put("code","0");
        map.put("msg","");
        List list=${classname?uncap_first}Service.list();
        map.put("count",list.size());
        map.put("aaData",list);
        return map;
    }

    @RequestMapping("search")
    @ResponseBody
    // 查询指定${remark}
    public Map search(int id){
        Map map=new HashMap();
        map.put("code","0");
        map.put("msg","");
        ${classname?cap_first}Entity ${classname?uncap_first}Entity=${classname?uncap_first}Service.select(id);
        map.put("entity",${classname?uncap_first}Entity);
        return map;
    }


    @RequestMapping("delete")
    @ResponseBody
    // 根据id删除${remark}
    public HashMap delete(int id){
        HashMap map=new HashMap();
        int count=${classname?uncap_first}Service.delete(id);
        int flag=count>0?0:1;
        map.put("code",flag);
        return map;
    }

    @RequestMapping("addOrUpdate")
    @ResponseBody
    // 添加或者修改${remark}
    public HashMap saveOrUpdate(${classname?cap_first}Entity ${classname?uncap_first}Entity){
        HashMap map=new HashMap();

        int count=0;
        // 根据id进行判断，如果id为空或者0进行添加操作，否则进行修改
        if ((""+${classname?uncap_first}Entity.getId()).equals("")||${classname?uncap_first}Entity.getId()==0){
            count=${classname?uncap_first}Service.insert(${classname?uncap_first}Entity);
        }else {
            count=${classname?uncap_first}Service.update(${classname?uncap_first}Entity);
        }
        int flag=count>0?0:1;
        map.put("code",flag);
        return map;
    }


    @RequestMapping("page")
    public String page(){
         return "${classname?uncap_first}";
    }
}
