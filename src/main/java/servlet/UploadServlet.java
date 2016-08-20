package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

public class UploadServlet extends HttpServlet {
    private String uploadPath;
    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath("") + File.separator + "img";
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists()) {
            uploadDir.mkdir();
            getServletContext().setAttribute("imageFolder", uploadPath);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        PrintWriter out = response.getWriter();

        if(isMultipart) {
            try {
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Configure a repository (to ensure a secure temp location is used)
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                List<FileItem> items = upload.parseRequest(request);

                // Process the uploaded items
                Iterator<FileItem> iter = items.iterator();
                String paramFileName = "";
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    if (!item.isFormField()) {
                        try {
                            // Check if loaded file is actually image
                            ImageIO.read(item.getInputStream()).toString();

                            String fileExtension = item.getName().substring(item.getName().indexOf('.'));
                            String resultFileName = uploadPath + File.separator + paramFileName + fileExtension;
                            File fileToSave = new File(resultFileName);
                            item.write(fileToSave);

                            out.println("Successfully loaded");

                            request.setAttribute("imageFolder", uploadPath);
                            getServletContext().getRequestDispatcher("/showImage.jsp").forward(request, response);
                        } catch (Exception ex) {
                            out.println("Loaded file is not image");
                        }
                    } else {
                        if(item.getFieldName().equals("fileName")) {
                            paramFileName = item.getString();
                        }
                    }
                }
            }catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                out.flush();
            }
        }
    }
}
