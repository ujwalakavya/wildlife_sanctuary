<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="com.mongodb.*" %>
	<%@page import="java.util.*" %>
	
	<%
	String id;
		int f=0;
		id=request.getParameter("id");
		try {
		Mongo m=new Mongo("127.0.0.1",27017);
		DB db=m.getDB("wildlife1");
		DBCollection col=db.getCollection("animals");
		BasicDBObject query=new BasicDBObject("_id","ele2");
		Iterator<DBObject> cur = col.find(query).iterator(); 
		    while (cur.hasNext()) {
		        DBObject doc = cur.next();
		        out.println("name:"+doc.get("name"));
		        out.println("scintific name:"+doc.get("scintific name"));
		        out.println("age:"+doc.get("age"));
		        out.println("type:"+doc.get("type"));
		        }
		    
		}
		catch(Exception e) {}
	%>
</body>
</html>