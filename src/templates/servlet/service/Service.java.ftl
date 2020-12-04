package cn.konngo.service;

import cn.konngo.dao.${classname?cap_first}Dao;
import cn.konngo.model.${classname?cap_first}Bean;

import java.sql.SQLException;
import java.util.List;

/**
  *  ${remark} 业务层
  */
public class ${classname?cap_first}Service {
    ${classname?cap_first}Dao dao=new ${classname?cap_first}Dao();

    // 获取所有${remark}
    public List<${classname?cap_first}Bean> list(){
        return dao.list();
    }

    // 查找指定${remark}
    public ${classname?cap_first}Bean find(int id){
        return dao.search(id);
    }

    // 删除指定${remark}
    public boolean delete(int id) throws SQLException, ClassNotFoundException {
        return dao.delete(id);
    }

    // 修改指定${remark}
    public boolean update(${classname?cap_first}Bean bean) throws IllegalAccessException, SQLException, ClassNotFoundException {
        return dao.update(bean);
    }

    // 添加${remark}
    public boolean insert (${classname?cap_first}Bean bean) throws IllegalAccessException, SQLException, ClassNotFoundException {
        return dao.insert(bean);
    }
}
