package com.softserve.itacademy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/update")
public class UpdateRecordServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String address = addressBook.read(request.getParameter("first-name"), request.getParameter("last-name"));
        request.setAttribute("first-name", firstName);
        request.setAttribute("last-name", lastName);
        request.setAttribute("address", address);
        request.getRequestDispatcher("/WEB-INF/update-record.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addressBook.update(request.getParameter("first-name"), request.getParameter("last-name"), request.getParameter("address"));
        response.sendRedirect("/records/list");
    }
}
