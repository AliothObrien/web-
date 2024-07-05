<%@page contentType="text/html;charset=utf-8"%>
<%@include file="jdbc-xsjbxx.jsp"%>
<%
    // 设置中文编码方式
    request.setCharacterEncoding("utf-8");

    // 获取提交的表单信息
    String xingming = request.getParameter("xingming");
    String xuehao = request.getParameter("xuehao");
    String xingbie = request.getParameter("xingbie");
    String chushengriqi = request.getParameter("chushengriqi");
    String youxiang = request.getParameter("youxiang");
    String xuexing = request.getParameter("xuexing");
    String beizhu = request.getParameter("beizhu");

    // 获取兴趣爱好信息，存在数组中，转换为用“，”连接的字符串
    String[] aihao = request.getParameterValues("aihao");
    String aihao2 = "";
    if (aihao != null) {
        for (int i = 0; i < aihao.length; i++) {
            aihao2 += aihao[i] + ",";
        }
    }

    // 获取体育运动信息，同上
    String[] tiyu = request.getParameterValues("tiyuyundong");
    String tiyu2 = "";
    if (tiyu != null) {
        for (int i = 0; i < tiyu.length; i++) {
            tiyu2 += tiyu[i] + ",";
        }
    }

    // 判断学号唯一
    String sql = "select * from xsjbxx where xuehao = '" + xuehao + "'";
    ResultSet rs = s.executeQuery(sql);
    String id = null;
    while (rs.next()) {
        id = rs.getString("xuehao");
    }
    rs.close();

    // 学号已存在，给出提示
    if (id != null) {
        out.print("<script language='javascript'>alert('学号" + xuehao + "的信息已存在，请输入其他学号！');history.back();</script>");
    } else {
        String sql1 = "insert into xsjbxx(xingming, xuehao, xingbie, chushengriqi, youxiang, xuexing, aihao, tiyuyundong, beizhu) values('"
                + xingming + "', '" + xuehao + "', '" + xingbie + "', '" + chushengriqi + "', '" + youxiang + "', '"
                + xuexing + "', '" + aihao2 + "', '" + tiyu2 + "', '" + beizhu + "')";
        s.executeUpdate(sql1);
        s.close();
        c.close();
        out.print("<script language='javascript'>alert('学号" + xuehao + "的基本信息已成功增加!');window.location.href='index.htm';</script>");
    }
%>