package co.grandcircus.TaskTracker;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sun.el.parser.ParseException;

@Controller
public class TaskTrackerController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private UserInformationRepository urep;
	
	@Autowired
	private TaskRepository trep;	
	
	
	private String message="";
	
	@GetMapping("/")
	public String index(Model model)
	{
		model.addAttribute("message",message);
		return "index";
	}
	
	
	@GetMapping("/homepage")
	public String register(Model model)
	{
		UserInformation user =(UserInformation)session.getAttribute("user");
		model.addAttribute("user",user);
		return "homepage";
	}
	
	@GetMapping("/logout")
	public String register()
	{
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	@PostMapping("/register")
	public String register(UserInformation user,Model model)
	{
		UserInformation u = null;
				
		u=urep.findByEmail(user.getEmail());
		System.out.println("I am in U " + u);
		if(u!=null)
		{
			message ="Email id already exists";
			return "redirect:/";
		}
		else
		{

		urep.save(user);
		session.setAttribute("user", user);
		model.addAttribute("user",user);
		return "homepage";
		}
		
	}
	
	@PostMapping("/login")
	public String login(String email,String password,Model model)
	{
		UserInformation users =urep.findByEmail(email);
		
		if(users != null)
		{
			if(users.getEmail().equals(email) && users.getPassword().equals(password))
			{
				session.setAttribute("user", users);
			model.addAttribute("user",(UserInformation)session.getAttribute("user"));
			return "homepage";
			}
			else
			{
			message = "Invalid Login details";
				return "redirect:/";
			}
		}
		else
		{
		message = "Invalid Login details";
			return "redirect:/";
		}
	}
	
	@PostMapping("/createtask")
	public String createtask(Task task,Model model)
	{
		UserInformation user =(UserInformation)session.getAttribute("user");
		task.setUserinformation(user);
		trep.save(task);
		model.addAttribute("user",(UserInformation)session.getAttribute("user"));
		return "redirect:/tasks";
	}
	
	@GetMapping("/tasks")
	public String tasks(Model model)
	{
		UserInformation user =(UserInformation)session.getAttribute("user");
          List<UserInformation> users = urep.findAll();
		
		for(UserInformation u :users)
		{
			if(u.getEmail().equals(user.getEmail()) && u.getPassword().equals(user.getPassword()))
			{
				model.addAttribute("user",u);
				break;
			}
		}
		
		return "tasks";
	}
	
	@GetMapping("/delete")
	public String delete(Long id)
	{
		UserInformation user =(UserInformation)session.getAttribute("user");
        user = urep.findByEmail(user.getEmail());
		
        for(Task task : user.getTasks())
        {
        	if(task.getId()== id)
        	{
        		trep.deleteById(id);
        	}
        }
        
		
		//trep.deleteById(id);
		return "redirect:/tasks";
	}
	
	@GetMapping("/completed")
	public String completed(Long id)
	{
		UserInformation user =(UserInformation)session.getAttribute("user");
        user = urep.findByEmail(user.getEmail());
		
        for(Task task : user.getTasks())
        {
        	if(task.getId()== id)
        	{
        		Task t = trep.findById(id).get();
        		t.setStatus("completed");
        		trep.save(t);
        	}
        }
        
		
		return "redirect:/tasks";
	}
	
	
}
