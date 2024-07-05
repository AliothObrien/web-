<%@page contentType="text/html;charset=utf-8"%>
<%@include file="jdbc-xsjbxx.jsp"%>

<%
	String xuehao = request.getParameter("xuehao");
	String sql = "delete from xsjbxx where xuehao = '"+xuehao+"'";
	s.executeUpdate(sql);
	s.close();
	c.close();
	
	// 提示成功并跳转
    out.print("<script language='javascript'>alert('学号" + xuehao + "的基本信息已成功删除!');window.location.href='index.htm';</script>");
%>
