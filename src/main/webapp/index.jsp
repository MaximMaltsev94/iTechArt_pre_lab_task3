<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>File uploading</title>
<link rel="stylesheet" href="css/style.css">
<body>
<form enctype="multipart/form-data" method="post">
    <div class="jlab-row">
        <label class="jlab-cell-2" for="fileName">File name</label>
        <input class="jlab-cell-2" type="text" name="fileName" id="fileName" required>
    </div>
    <div class="jlab-row">
        <label class="jlab-cell-2" for="fileContent">Choose file</label>
        <input class="jlab-cell-2" type="file" accept="image/*" name="fileContent" id="fileContent" required>
    </div>
    <div class="jlab-row">
        <label class="jlab-cell-2"></label>
        <input class="jlab-cell-2" type="submit" value="Start loading" id="submit">
    </div>
</form>
</body>
</html>
