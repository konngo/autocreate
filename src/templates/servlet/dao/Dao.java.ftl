package cn.konngo.dao;

import cn.konngo.model.${classname?cap_first}Bean;
import cn.konngo.util.DBUtil;
import cn.konngo.util.TransforUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
  *  ${remark} 持久层
  */
public class ${classname?cap_first}Dao  {
    DBUtil<${classname?cap_first}Bean> dbUtil=new DBUtil<>();
    TransforUtil<${classname?cap_first}Bean> transforUtil=new TransforUtil<>();


    //获取所有${remark}
    public List<${classname?cap_first}Bean> list()  {
        List<${classname?cap_first}Bean> list=new ArrayList<>();
        try {
            String sql="select  * from ${classname?lower_case}";
            list=dbUtil.select(sql,transforUtil,${classname?cap_first}Bean.class);
        }catch (Exception e){
            e.printStackTrace();
        }
            return list;
        }

    // 查找${remark}信息
    public ${classname?cap_first}Bean search(Integer id){
        ${classname?cap_first}Bean ${classname?lower_case}Bean=null;
        String sql ="select * from ${classname?lower_case} where id=?";
        try {
            List<${classname?cap_first}Bean> list=dbUtil.select(sql,transforUtil,${classname?cap_first}Bean.class,id);
            if (list.size()>0){
                ${classname?lower_case}Bean=list.get(0);
            }
        }catch (Exception e){
             e.printStackTrace();
        }
        return ${classname?lower_case}Bean;
    }

    // 删除${remark}信息
    public boolean delete(int id) throws SQLException, ClassNotFoundException {
        String sql ="delete from ${classname?lower_case}  where id="+id;
        return dbUtil.excute(sql);
    }


    // 更新${remark}信息
    public boolean update(${classname?cap_first}Bean ${classname?lower_case}Bean) throws SQLException, ClassNotFoundException, IllegalAccessException {
        String sql =transforUtil.getUpdateSql(${classname?lower_case}Bean);
        System.out.println(sql);
        return dbUtil.excute(sql);
    }


    // 添加${remark}信息
    public boolean insert(${classname?cap_first}Bean ${classname?lower_case}Bean) throws SQLException, ClassNotFoundException, IllegalAccessException {
        String sql =transforUtil.getInsertSql(${classname?lower_case}Bean);
        System.out.println(sql);
        return dbUtil.excute(sql);
    }
}