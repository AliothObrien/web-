<%@page contentType="text/html;charset=GB2312"%>
<%@include file="jdbc-xsjbxx.jsp"%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>��ѯѧ��������Ϣ</title>
<link rel=stylesheet href="xsjbxx.css" type=text/css>
</head>

<body>

<form method="POST" action="cxxsjbxx.jsp">
    <table border="1" width="100%">
        <tr>
            <td colspan="3"><a href="index.htm">��ҳ</a> �� ��ѯѧ��������Ϣ</td>
        </tr>
        <tr>
            <td colspan="3">
            <p align="center" id=s1>�������ѯ����</td>
        </tr>
        <tr>
            <td width="33%">��ѯ��ʽ��<input type="radio" value="xuehao" checked name="fangshi">ѧ�� 
            <input type="radio" name="fangshi" value="xingming">����</td>
            <td width="34%">��ѯ������<input type="text" name="tiaojian" size="20"></td>
            <td width="32%"><input type="submit" value="�ύ" name="B1">&nbsp;&nbsp;&nbsp; <input type="reset" value="����" name="B2"></td>
        </tr>
    </table>
    <p>��</p>
    <table border="1" width="100%">
        <tr>
            <td colspan="11">
            <p align="center"><b>�����ѯ������ѧ��������Ϣ</b></td>
        </tr>
        <tr align=center>
            <td>����</td>
            <td>ѧ��</td>
            <td>�Ա�</td>
            <td>��������</td>
            <td>��������</td>
            <td>Ѫ��</td>
            <td>����</td>
            <td>ϲ�����˶�</td>
            <td>��ע</td>
            <td>�Ƿ��޸�</td>
            <td>�Ƿ�ɾ��</td>
        </tr>
<%
    // �������ı��뷽ʽ
    request.setCharacterEncoding("gb2312");
    // ���ղ�ѯ��ʽ��ֵ
    String fangshi = request.getParameter("fangshi");
    // ���ղ�ѯ������ֵ
    String tiaojian = request.getParameter("tiaojian");
    // ִ�в�ѯSQL���
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
            <td><a href="xgxsjbxx.jsp?xuehao=<%=xuehao%>">�޸�</a></td>
            <td><a href="scxsjbxx.jsp?xuehao=<%=xuehao%>">ɾ��</a></td>
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