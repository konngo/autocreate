package cn.konngo.tool;

import cn.konngo.model.Table;
import cn.konngo.utils.Config;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class CreateFileTool {
    //生成指定文件
    public void create(ArrayList<Table> tables) {
        // 1.导入配置
        Config.init();

        for (Table t:tables) {
            // 2.创建装载对象
            Map<String,Object> root=this.createRoot(t);
            // 3.生成文件
            String tempPath="templates/"+Config.TEMPLATE;
            this.createTempalteFile(tempPath,Config.FILE_PATH,root);
        }

    }

    //创建装载对象
    private Map<String, Object> createRoot(Table table) {
        Map<String,Object> root=new HashMap<>();
        root.put("basepackage",Config.BASEPACKAGE);
        root.put("classname",table.getName());
        root.put("remark",table.getRemark());
        root.put("columns",table.getColumns());
        return root;
    }

    //生成文件
    private void createTempalteFile(String tempPath,String path,Map<String,Object> root) {
        String classname= (String) root.get("classname");
        //遍历指定样式文件夹
        tempPath=System.getProperty("user.dir")+"/src/"+tempPath;
        File[] files=new File(tempPath).listFiles();
        for (File f:files) {
            String filename=classname+f.getName();
            path=path+filename.replace(".ftl","");
            try {
                Configuration config=new Configuration(Configuration.VERSION_2_3_22);
                config.setDirectoryForTemplateLoading(f.getParentFile());
                Template temp=config.getTemplate(f.getName());
                temp.process(root,new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path)))));
            } catch (IOException | TemplateException e) {
                System.out.println("生成文件失败！");
                e.printStackTrace();
            }
        }
    }

}
