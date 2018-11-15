<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page import="com.mongodb.*" %>
    <%@ page import="com.mongodb.BasicDBObject" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.lang.*" %>
    <%
    String id,name,scn,ard,expd,age,weight,ani_type,health,food,spc;
    ArrayList<String> key=new ArrayList();
	ArrayList<String> values=new ArrayList();
    id=request.getParameter("id");
    name=request.getParameter("name");
    ard=request.getParameter("ard");
    expd=request.getParameter("exd");
    spc=request.getParameter("spc");
    scn=request.getParameter("scn");
    weight=request.getParameter("wgt");
    ani_type=request.getParameter("type");
    health=request.getParameter("hlt");
    food=request.getParameter("food");
    age=request.getParameter("age");
    key.add("_id");
    values.add(id);
    key.add("name");
    values.add(name);
    key.add("age");
    values.add(age);
    key.add("weight");
    values.add(weight);
    key.add("type");
    values.add(ani_type);
    key.add("food");
    values.add(food);
    if((ard!=null))
    {
    	key.add("arrival date");
    	values.add(ard);
    }
   	if(!(expd.isEmpty()))
   	{
   		key.add("expiry date");
    	values.add(expd);
   	}
   	if(!(scn.isEmpty()))
   	{
   		key.add("scintific name");
    	values.add(scn);
   	}
   	if(!(spc.isEmpty()))
   	{
   		key.add("species");
    	values.add(spc);
   	}
   	if(!(health.isEmpty()))
   	{
   		key.add("health condition");
    	values.add(health);
   	}
   	
	BasicDBObject document = new BasicDBObject();//BasicDBObject is data structure to store key and value pair
	Iterator i=key.iterator();
	Iterator j=values.iterator();
	try {
		while(i.hasNext() && j.hasNext()) {
			document.put((String) i.next(),(String) j.next());
		}
		Mongo m=new Mongo("127.0.0.1",27017);
		DB db=m.getDB("wildlife1");
		DBCollection col=db.getCollection("animals");
		col.insert(document);
		out.println("successfull");%>
		
		<a href="add.html">BACK</a><%
		
	}
	catch(Exception e)
	{
		out.println("oops! sorry something went wrong");%>
		
		<a href="add.html">BACK</a><%
	}
    %>
</body>
</html>