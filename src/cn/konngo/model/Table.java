package cn.konngo.model;

import java.util.ArrayList;

/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class Table {
    //表名
    public String name;
    //备注
    public String remark;
    // 字段名
    public ArrayList<Columns> columns;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ArrayList getColumns() {
        return columns;
    }

    public void setColumns(ArrayList columns) {
        this.columns = columns;
    }

    @Override
    public String toString() {
        return "Table{" +
                "name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                ", columns=" + columns +
                '}';
    }
}
