package ${basepackage}.service;

import ${basepackage}.dao.${classname?cap_first}Dao;
import ${basepackage}.entity.${classname?cap_first}Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ${classname?cap_first}Service {
    @Autowired
    ${classname?cap_first}Dao ${classname?uncap_first}Dao;

    public List<${classname?cap_first}Entity> list(){
        return ${classname?uncap_first}Dao.list();
    }

    public ${classname?cap_first}Entity select(){return ${classname?uncap_first}Dao.select();}

    public void delect (int id){${classname?uncap_first}Dao.delect(id);}

    public void insert (${classname?cap_first}Entity ${classname?uncap_first}Entity){${classname?uncap_first}Dao.insert(${classname?uncap_first}Entity);}

    public void update (${classname?cap_first}Entity ${classname?uncap_first}Entity){${classname?uncap_first}Dao.update(${classname?uncap_first}Entity);}

}
