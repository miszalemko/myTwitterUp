package twitter.controlers;

import twitter.dto.TwitterMessageDto;
import twitter.service.TwitterMessageService;
import twitter.service.TwitterMessageServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TweetSearchController",value = "/tweets/search")
public class TweetSearchController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("searchUsername");
        String message = req.getParameter("searchMessage");

        TwitterMessageService twitterMessageService = new TwitterMessageServiceImpl();
        List<TwitterMessageDto> foundTweets= twitterMessageService.findByUserNameAndByMessage(username,message);

        req.setAttribute("tweetsModel", foundTweets);
        req.setAttribute("searchTotalCount", String.valueOf(foundTweets.size()));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/tweets_jstl/tweets.jsp");
        dispatcher.forward(req,resp);
    }
}
