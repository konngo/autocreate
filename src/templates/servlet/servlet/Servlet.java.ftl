package cn.konngo.servlet;

import cn.konngo.dao.StudentsDao;
import cn.konngo.model.*;
import cn.konngo.service.${classname?cap_first}Service;
import cn.konngo.util.TransforUtil;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*  ${remark}servlet
*/
@WebServlet("/${classname?lower_case}")
public class ${classname?cap_first}Servlet  extends HttpServlet {
${classname?cap_first}Service service=new ${classname?cap_first}Service();
TransforUtil<${classname?cap_first}Bean> trans=new TransforUtil<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        if(method.equals("list")){
            list(request,response);
        }else if(method.equals("saveorupdate")){
            try {
                saveorupdate(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(method.equals("delete")){
            delete(request,response);
        }else if(method.equals("edit")){
            String id =request.getParameter("id");
            ${classname?cap_first}Bean bean=service.find(Integer.parseInt(id));
            request.setAttribute("${classname?lower_case}",bean);
            request.getRequestDispatcher("${classname?lower_case}edit.jsp").forward(request,response);
        }
    }

    // 进行删除操作
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");  // 设置request字符编码
        String searchText = request.getParameter("search"); // 获取传入的search字段的内容
        response.setContentType("text/json; charset=utf-8");    // 设置response的编码及格式
        PrintWriter out = response.getWriter();

        String id =request.getParameter("id");
        try {
            service.delete(Integer.parseInt(id));
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }

        Map<String,Object> resultMap = new HashMap<>();
        List<${classname?cap_first}Bean> list=service.list();
        resultMap.put("code", "0");

        String resJSON = JSON.toJSONString(resultMap);     // 转换为json
        out.print(resJSON); // 输出
    }

    // 保存或者修改
    private void saveorupdate(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, SQLException, ClassNotFoundException, InstantiationException, ParseException, IOException {
        String id=request.getParameter("id");
        ${classname?cap_first}Bean bean=trans.requestTransforBean(request,${classname?cap_first}Bean.class);
        if (id==null||id.equals("")){
            service.insert(bean);
        }else {
            service.update(bean);
        }
        response.sendRedirect("success.jsp");
    }


    // 查询所有用户信息返回
    private void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");  // 设置request字符编码
        String searchText = request.getParameter("search"); // 获取传入的search字段的内容
        response.setContentType("text/json; charset=utf-8");    // 设置response的编码及格式
        PrintWriter out = response.getWriter();

        Map<String, Object> resultMap = new HashMap<>();
        List<${classname?cap_first}Bean> list=service.list();
        resultMap.put("data", list);
        resultMap.put("code", "0");
        resultMap.put("msg", "");
        resultMap.put("count", "1");

        String resJSON = JSON.toJSONString(resultMap);     // 转换为json
        out.print(resJSON); // 输出
    }



        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            this.doGet(req, resp);
        }
}
