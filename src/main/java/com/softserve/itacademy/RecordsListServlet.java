package com.softserve.itacademy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/list")
public class RecordsListServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String order = request.getParameter("sort") == null ? "" : request.getParameter("sort");
        if (order.equals("asc")) {
            addressBook.sortedBy(SortOrder.ASC);
        }
        if (order.equals("desc")) {
            addressBook.sortedBy(SortOrder.DESC);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/records-list.jsp");
        request.setAttribute("records", addressBook);
        requestDispatcher.forward(request, response);
    }
}
