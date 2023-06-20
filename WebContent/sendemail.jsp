
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.Message.RecipientType" %>
<%@ page import="java.util.Properties "%>
<%@ page import="javax.mail.internet.*"  %>

<%
 String to=request.getParameter("to");
 String from=request.getParameter("from");
 String subject=request.getParameter("sub");
 String message=request.getParameter("mess");
 
//Get properties object    
 Properties props = new Properties();    
 props.put("mail.smtp.host", "smtp.gmail.com");    
 props.put("mail.smtp.socketFactory.port", "465");    
 props.put("mail.smtp.socketFactory.class",    
           "javax.net.ssl.SSLSocketFactory");    
 props.put("mail.smtp.auth", "true");    
 props.put("mail.smtp.port", "465");  
 
 //get Session   
 Session session1 = Session.getInstance(props,    
  new javax.mail.Authenticator() {    
  protected PasswordAuthentication getPasswordAuthentication() {    
  return new PasswordAuthentication("vaishalifarkade143@gmail.com","crxgdeiiukusodku");   
  }    
 });  
 
 //compose message    
 try {    
  MimeMessage message1 = new MimeMessage(session1);    
  message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
  message1.setSubject(subject);    
  message1.setText(message);  
  
  //send message  
  Transport.send(message1);    
  System.out.println("message sent successfully");    
 } catch (Exception e) {throw new RuntimeException(e);}    
    
  
  
%>