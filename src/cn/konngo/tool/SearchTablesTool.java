package cn.konngo.tool;

import cn.konngo.model.Columns;
import cn.konngo.model.Table;
import cn.konngo.utils.DBHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;

/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class SearchTablesTool {

    public static void main(String[] args) {

    }
    public void search(){
        // 1.获取数据库所有表信息
        ArrayList<Table> tables=searchTables();
        // 2.生成文件
        new CreateFileTool().create(tables);
    }

    //获取数据库表信息
    private ArrayList<Table> searchTables() {
        ArrayList<Table> tables=new ArrayList<>();
        Connection conn=DBHelper.getConnection();
        String sql="select table_name,table_comment from information_schema.tables where TABLE_SCHEMA='codeschool' ";
        try {
            ResultSet set=conn.createStatement().executeQuery(sql);
            while (set.next()){
                Table t=new Table();
                t.setName(set.getString("table_name"));
                t.setRemark(set.getString("table_comment"));
                t.setColumns(searchColumns(t.getName()));
                tables.add(t);
            }
            conn.close();
        }catch (Exception e){
            System.out.println("查询数据库表信息故障");
            e.printStackTrace();
        }

        return  tables;
    }

    /**
     *  查询字段信息
     * @param name 表名
     */
    private ArrayList<Columns> searchColumns(String name) {
        ArrayList<Columns> list=new ArrayList<>();
        Connection conn=DBHelper.getConnection();
        String sql="show full columns from "+name;
        try {
            ResultSet rs=conn.createStatement().executeQuery(sql);
            while (rs.next()){
                Columns c=new Columns();
                c.setName(rs.getString("field"));
                c.setType(changeType(rs.getString("type")));
                c.setComment(rs.getString("comment"));
                list.add(c);
            }
        }catch (Exception e){
            System.out.println("查询表："+name+"字段信息失败");
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 将数据库的数据类型更换为JAVA的
     */
    private String changeType(String type) {
        ResourceBundle properteis=ResourceBundle.getBundle("config/type");
        for (String key:properteis.keySet()) {
            //排除意外
            // time类型不能使用下面的判断
            if (type.contains("time")||type.contains("date")||type.contains("TIME")||type.contains("DATE")){
                if (type.toUpperCase().equals(key)){
                    type=properteis.getString(key);
                }
            }else {
                //判断类型
                if (type.toUpperCase().equals(key)||type.toUpperCase().contains(key)){
                    type=properteis.getString(key);
                }
            }

        }
        return type;
    }






}
