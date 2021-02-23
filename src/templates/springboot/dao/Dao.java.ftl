package ${basepackage}.dao;


import ${basepackage}.entity.${classname?cap_first}Entity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
  *  ${remark}持久层 数据库操作
  */
@Mapper
public interface ${classname?cap_first}Dao {

    /**
    *  查询所有${remark}
    */
    List<${classname?cap_first}Entity> list();

    /**
    * 根据id查询${remark}
    */
    ${classname?cap_first}Entity select(int id);

    /**
    * 删除${remark}
    */
    int delete(int id);

    /**
    * 更新${remark}
    */
    int update(${classname?cap_first}Entity ${classname?uncap_first}Entity);

    /**
    * 插入${remark}
    */
    int insert(${classname?cap_first}Entity ${classname?uncap_first}Entity);

}