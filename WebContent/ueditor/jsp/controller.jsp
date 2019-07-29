<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="dywh.ml.util.ActionEnterExt"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
	ActionEnterExt actionEnter = new ActionEnterExt( request, rootPath );
	
	actionEnter.configUploadPath();

	out.write( actionEnter.exec() );
	
%>