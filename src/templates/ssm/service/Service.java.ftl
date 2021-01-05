package ${basepackage}.service;

import ${basepackage}.dao.${classname?cap_first}Dao;
import ${basepackage}.entity.${classname?cap_first}Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
// ${remark} 业务层
public class ${classname?cap_first}Service {
    @Autowired
    ${classname?cap_first}Dao ${classname?uncap_first}Dao;

    // 查询所有${remark}
    public List<${classname?cap_first}Entity> list(){
        return ${classname?uncap_first}Dao.list();
    }

    // 根据id查询${remark}
    public ${classname?cap_first}Entity select(int id){return ${classname?uncap_first}Dao.select(id);}

    // 删除${remark}
    public int delete (int id){return ${classname?uncap_first}Dao.delete(id);}

    // 添加${remark}
    public int insert (${classname?cap_first}Entity ${classname?uncap_first}Entity){return ${classname?uncap_first}Dao.insert(${classname?uncap_first}Entity);}

    // 更新${remark}
    public int update (${classname?cap_first}Entity ${classname?uncap_first}Entity){ return ${classname?uncap_first}Dao.update(${classname?uncap_first}Entity);}

}
