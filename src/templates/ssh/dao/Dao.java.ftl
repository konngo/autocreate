package cn.konngo.dao;

import cn.konngo.entity.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.List;

@Component
@Transactional
/**
*  ${remark}持久层 数据库操作
*/
public class UsersDao {

@Autowired
private HibernateTemplate hibernateTemplate;

Class clazz=new UsersEntity().getClass();

    /**
    *  查询所有${remark}
    */
    public List<UsersEntity> list(){
        return hibernateTemplate.loadAll(clazz);
    }

    /**
    * 根据id查询${remark}
    */
    public UsersEntity select(int id){
    return (UsersEntity) hibernateTemplate.get(clazz,id);
    }

    /**
    * 删除${remark}
    */
    public void delete(int id){
    UsersEntity usersEntity=new UsersEntity();
    usersEntity.setId(id);
    hibernateTemplate.delete(usersEntity);
    }

    /**
    * 更新${remark}
    */
    public void update(UsersEntity usersEntity){
    hibernateTemplate.update(usersEntity);
    }

    /**
    * 插入${remark}
    */
    public void insert(UsersEntity usersEntity){

    hibernateTemplate.save(usersEntity);
    }



        }
