<%@page contentType="text/html;charset=GB2312"%>
<%@include file="jdbc-xsjbxx.jsp"%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询学生基本信息</title>
<link rel=stylesheet href="xsjbxx.css" type=text/css>
</head>

<body>

<form method="POST" action="cxxsjbxx.jsp">
    <table border="1" width="100%">
        <tr>
            <td colspan="3"><a href="index.htm">主页</a> → 查询学生基本信息</td>
        </tr>
        <tr>
            <td colspan="3">
            <p align="center" id=s1>请输入查询条件</td>
        </tr>
        <tr>
            <td width="33%">查询方式：<input type="radio" value="xuehao" checked name="fangshi">学号 
            <input type="radio" name="fangshi" value="xingming">姓名</td>
            <td width="34%">查询条件：<input type="text" name="tiaojian" size="20"></td>
            <td width="32%"><input type="submit" value="提交" name="B1">&nbsp;&nbsp;&nbsp; <input type="reset" value="重置" name="B2"></td>
        </tr>
    </table>
    <p>　</p>
    <table border="1" width="100%">
        <tr>
            <td colspan="11">
            <p align="center"><b>满足查询条件的学生基本信息</b></td>
        </tr>
        <tr align=center>
            <td>姓名</td>
            <td>学号</td>
            <td>性别</td>
            <td>出生日期</td>
            <td>电子邮箱</td>
            <td>血型</td>
            <td>爱好</td>
            <td>喜欢的运动</td>
            <td>备注</td>
            <td>是否修改</td>
            <td>是否删除</td>
        </tr>
<%
    // 设置中文编码方式
    request.setCharacterEncoding("gb2312");
    // 接收查询方式的值
    String fangshi = request.getParameter("fangshi");
    // 接收查询条件的值
    String tiaojian = request.getParameter("tiaojian");
    // 执行查询SQL语句
    String sql = "select * from xsjbxx where " + fangshi + " like '%" + tiaojian + "%'";
    ResultSet rs = s.executeQuery(sql);
    while (rs.next()) {
        String xingming = rs.getString("xingming");
        String xuehao = rs.getString("xuehao");
        String xingbie = rs.getString("xingbie");
        String chushengriqi = rs.getString("chushengriqi");
        String youxiang = rs.getString("youxiang");
        String xuexing = rs.getString("xuexing");
        String aihao = rs.getString("aihao");
        String tiyuyundong = rs.getString("tiyuyundong");
        String beizhu = rs.getString("beizhu");
%>
        <tr align=center>
            <td><%=xingming%></td>
            <td><%=xuehao%></td>
            <td><%=xingbie%></td>
            <td><%=chushengriqi%></td>
            <td><%=youxiang%></td>
            <td><%=xuexing%></td>
            <td><%=aihao%></td>
            <td><%=tiyuyundong%></td>
            <td><%=beizhu%></td>
            <td><a href="xgxsjbxx.jsp?xuehao=<%=xuehao%>">修改</a></td>
            <td><a href="scxsjbxx.jsp?xuehao=<%=xuehao%>">删除</a></td>
        </tr>
<%
    }
    rs.close();
    s.close();
    c.close();
%>
    </table>
</form>
</body>
</html>