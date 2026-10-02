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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tca.entity.Student;

@WebServlet({"/displayStudent" , "/searchStudent"})
public class displayStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
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
		ResultSet rs = null;
		
		String qry = "";
		
		String srno = request.getParameter("srno"); //"103"            
		String sbtn = request.getParameter("sbtn"); //Search or Refresh 
		
		if(sbtn==null || srno.isEmpty() || sbtn.equals("Refresh"))
		{
			qry = "Select * from Student " ;
		}
		else if(sbtn.equals("search"))
		{
			qry = "Select * from Student where rno="+ srno ;
		}
		
		
		List<Student> student = new ArrayList<Student>();     // Creating List of Student.
		
		try
		{
			Class.forName(DB_DRIVER);
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			ps = con.prepareStatement(qry);
			
		    rs = ps.executeQuery();     //when we use resultSet then use rs here also to execute.
		    
		    while( rs.next())
		    {
		    	int rno     = rs.getInt("rno");
		    	String name = rs.getString("name");
		    	double per  = rs.getDouble("per");
		    	
		    	//Student s = new Student("rno,name,per");   //This is like BR
		    	//Student.add(s);
		    	
		    	student.add(new Student(rno,name,per));  //So we use This  & creating Student object
		    }	
		    
		    request.setAttribute("students" , student);     //key:students  value: L
			
			RequestDispatcher rd = request.getRequestDispatcher("./displayStudent.jsp");
			rd.forward(request, response);
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(con !=null)
			{
				try 
				{
					con.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
		}
	 
		out.close();
	}
}
