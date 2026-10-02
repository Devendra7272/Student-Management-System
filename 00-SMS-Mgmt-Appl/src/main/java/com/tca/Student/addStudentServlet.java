package com.tca.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addStudent")
public class addStudentServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd = request.getRequestDispatcher("./addStudent.jsp");
		rd.forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		/*Configuration Information*/
		final String DB_URL = "jdbc:postgresql://localhost/ajdb21";
		final String DB_USER = "dev";
		final String DB_PWD = "darshan";
		final String DB_DRIVER ="org.postgresql.Driver";
		
		Connection con= null;
		PreparedStatement ps = null;
		
		String message="";
		
		try
		{
			Class.forName(DB_DRIVER);
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			con.setAutoCommit(false);
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			String name = request.getParameter("name");
			double per = Double.parseDouble(request.getParameter("per"));
			
			ps = con.prepareStatement("INSERT INTO STUDENT VALUES(?,?,?)");
			ps.setInt(1, rno);
			ps.setString(2, name);
			ps.setDouble(3, per);
			
			ps.executeUpdate();
			
			con.commit();
			
			message ="<div class='alert alert-success text-center' role='alert'> Record is Saved Successfully for RNO : " + rno + "</div>";
			
			//message = "<p style='color:Purple'>Record is Saved Successfully for RNO :  </p>" + rno ;				
		}
		catch(Exception e)
		{
			message ="<div class='alert alert-danger text-center' role='alert'> Failed to saved Record </div>";	
			e.printStackTrace();
			
			try
			{
				if(con !=null)
					con.rollback();
			}
		    catch(SQLException e1)
		    {
		    	e1.printStackTrace();
		    }
		}
		finally
		{
			try
			{
				if(con !=null)
					con.close();
		    }
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		request.setAttribute("msg", message);
		
		RequestDispatcher rd= request.getRequestDispatcher("./addStudent.jsp");
		rd.forward(request, response);
		
		out.close();
	}
}
	

	
