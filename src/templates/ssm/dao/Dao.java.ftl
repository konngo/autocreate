package ${basepackage}.dao;


import ${basepackage}.entity.${classname?cap_first}Entity;

import java.util.List;

public interface ${classname?cap_first}Dao {

    /**
    *  查询所有
    */
    List<${classname?cap_first}Entity> list();

    /**
    * 根据id查询
    */
    ${classname?cap_first}Entity select();

    /**
    * 删除
    */
    void delect(int id);

    /**
    * 更新
    */
    void update(${classname?cap_first}Entity ${classname?uncap_first}Entity);

    /**
    * 插入
    */
    void insert(${classname?cap_first}Entity ${classname?uncap_first}Entity);

}