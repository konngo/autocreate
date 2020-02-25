package cn.konngo.mapper;

import cn.konngo.entity.${classname?cap_first}Entity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ${classname?cap_first}Mapper extends BaseMapper<${classname?cap_first}Entity> {

}