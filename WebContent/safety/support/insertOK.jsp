<%@page import="dao.PersonalDNDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int total = Integer.parseInt(request.getParameter("total"));
String names = request.getParameter("names");

PersonalDNDAO dao = new PersonalDNDAO();
dao.addData(total, names);

System.out.println(total);
System.out.println(names+"=*********");
%>