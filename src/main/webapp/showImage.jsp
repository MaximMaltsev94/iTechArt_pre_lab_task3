<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: maxim
  Date: 19.08.2016
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List of loaded images</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="jlab-container">

    <% String imageFolder = request.getAttribute("imageFolder").toString();
        File[] images = new File(imageFolder).listFiles();
        List<List<String>> imagesPaths = new ArrayList<List<String>>();
        int i = 0;
        for (File f : images) {
            if (!f.isDirectory()) {
                if (i == 0) {
                    imagesPaths.add(new ArrayList<String>());
                }
                imagesPaths.get(imagesPaths.size() - 1).add("img/" + f.getName());
                i++;
                if (i == 3) {
                    i = 0;
                }
            }
        }
        pageContext.setAttribute("imagesPaths", imagesPaths);
    %>

    <a href="<c:url value="/" />">Back to previous page </a>

    <c:forEach var="imgCol" items="${imagesPaths}">
        <div class="jlab-row">
            <c:forEach var="imgName" items="${imgCol}">
                <div class="jlab-cell-4">
                    <img src="${imgName}" width="100%"/>
                </div>
            </c:forEach>

        </div>
    </c:forEach>
</div>
</body>
</html>
