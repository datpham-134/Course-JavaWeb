/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.client;

import entity.Image;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ImageService;
import service.ProductService;
import util.NumberHelper;

/**
 *
 * @author Shado
 */
@WebServlet(name = "ProductDetail", urlPatterns = {"/detail"})
public class ProductDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = NumberHelper.getId(request.getParameter("id"));
            if (id == -1) {
                response.sendRedirect("error");
            } else {
                Product product = new ProductService().getOne(id);
                if (product != null) {
                    List<Image> listImage = new ImageService().getAllByProductId(id);

                    Image image = Image.builder()
                            .productId(id)
                            .imageName(product.getImage())
                            .status(1)
                            .build();
                    listImage.add(image);
                    
                    listImage.sort((Image o1, Image o2) -> {
                        return o1.getImageName().compareToIgnoreCase(o2.getImageName());
                    });

                    request.setAttribute("product", product);
                    request.setAttribute("listImage", listImage);
                    request.getRequestDispatcher("client/detail.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
