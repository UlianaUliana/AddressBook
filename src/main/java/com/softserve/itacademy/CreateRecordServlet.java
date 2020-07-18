package com.softserve.itacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/create")
public class CreateRecordServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("massage", "");
        request.getRequestDispatcher("/WEB-INF/create-record.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String address = request.getParameter("address");

        if (addressBook.read(firstName, lastName) !=null) {
            request.setAttribute("massage", "An error occurred. Please try again!");
            request.getRequestDispatcher("/WEB-INF/create-record.jsp").forward(request, response);
        } else {
            addressBook.create(firstName, lastName, address);
            request.setAttribute("massage", "");
            response.sendRedirect("/records/list");
        }



//        addressBook.create(firstName, lastName, address);
//        page = "/records/list";
//        response.sendRedirect(page);
    }


}
