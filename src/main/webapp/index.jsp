<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>File uploading</title>
<link rel="stylesheet" href="css/style.css">
<body>
<form enctype="multipart/form-data" method="post">
    <div class="jlab-row">
        <label class="jlab-cell-4" for="fileName">File name</label>
        <input class="jlab-cell-4" type="text" name="fileName" id="fileName">
    </div>
    <div class="jlab-row">
        <label class="jlab-cell-4" for="fileContent">File name</label>
        <input class="jlab-cell-4" type="file" accept="image/*" name="fileContent" id="fileContent">
    </div>
    <div class="jlab-row">
        <label class="jlab-cell-4" for="submit">Start loading</label>
        <input class="jlab-cell-4" type="submit" id="submit">
    </div>
</form>
</body>
</html>
