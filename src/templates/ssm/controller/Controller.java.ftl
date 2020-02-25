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
public class ${classname?cap_first}Controller {
    @Autowired
    ${classname?cap_first}Service ${classname?uncap_first}Service;

    @Autowired
    HttpServletRequest request;


    @RequestMapping("list")
    @ResponseBody
    public Map searchAll(){
        Map map=new HashMap();
        map.put("code","0");
        map.put("msg","");
        List list=${classname?uncap_first}Service.list();
        map.put("count",list.size());
        map.put("data",list);
        return map;
    }

    @RequestMapping("delete")
    @ResponseBody
        public boolean delte(int id){
        ${classname?uncap_first}Service.delect(id);
        return true;
    }

    @RequestMapping("addOrUpdate")
    public String  saveOrUpdate(${classname?cap_first}Entity ${classname?uncap_first}Entity){
        if ((""+${classname?uncap_first}Entity.getId()).equals("")||${classname?uncap_first}Entity.getId()==0){
            ${classname?uncap_first}Service.insert(${classname?uncap_first}Entity);
        }else {
            ${classname?uncap_first}Service.update(${classname?uncap_first}Entity);
    }
        return "admin/${classname?uncap_first}";
    }


    @RequestMapping("page")
    public String page(){
         return "admin/${classname?uncap_first}";
    }
}
