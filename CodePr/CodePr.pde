//import org.apache.commons.mail.*;
//import javax.mail.*;
import javax.mail.internet.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeBodyPart;


import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import javax.mail.Session;
import javax.mail.Message;
import javax.activation.DataHandler;
 PImage img;


void setup() {
  //Imagenes captadas en camara
  size(1000,800);
  img = loadImage("C:\\Users\\davic\\Downloads\\prueba5\\fotoDavies.jpeg");
  DataHandler dh = new DataHandler(new FileDataSource("data/camara1.png"));
  
  // Configurar las propiedades de la sesión de correo
  Properties props = new Properties();
  props.put("mail.smtp.host", "smtp.office365.com");
  props.put("mail.smtp.port", "587");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable", "true");
  
  // Crear una sesión de correo electrónico con tus credenciales de Outlook
  Session session = Session.getInstance(props,
    new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("alertdavidroom@outlook.es", "Anthonie30");
      }
    });

  try {
    // Crear un mensaje de correo electrónico "C:\Users\davic\OneDrive - Universidad Mariano Gálvez\Documentos\Processing\Sketchs\PruebaFinal\CodePr\camara1.png"
     Message message = new MimeMessage(session);
    message.setFrom(new InternetAddress("alertdavidroom@outlook.es"));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("mineradavid6@gmail.com"));
    message.setSubject("❗❗ALGUIEN HA ENTRADO A TU HABITACIÓN DAVID!!!!⚠⚠️");

    BodyPart messageBodyPart = new MimeBodyPart();
    messageBodyPart.setText("⚠⚠ESTA PERSONA HA ENTRADO A TU HABITACIÓN POR FAVOR TEN CUIDADO.⚠⚠");
    //video
    String archivoVideo = "C:\\Users\\davic\\Downloads\\prueba5\\video.mp4";
    MimeBodyPart mensajeBodyPart = new MimeBodyPart();
    DataSource source2 = new FileDataSource(archivoVideo);
    mensajeBodyPart.setDataHandler(new DataHandler(source2));
    mensajeBodyPart.setFileName("video.mp4");
    
    MimeBodyPart imageBodyPart = new MimeBodyPart();
    DataSource source = new FileDataSource("C:\\Users\\davic\\Downloads\\prueba5\\fotoDavies.jpeg"); 
    imageBodyPart.setDataHandler(new DataHandler(source));
    imageBodyPart.setFileName("camara1.png");
    
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);
    multipart.addBodyPart(imageBodyPart);

    message.setContent(multipart);

    
    Transport.send(message);

  
    System.out.println("El correo electrónico ha sido enviado exitosamente.");

  } catch (MessagingException e) {
    throw new RuntimeException(e);
  }
  
}
void draw(){
image(img,0,0);
}






//import javax.activation.*;
//void setup() {
//  // Crea un objeto Email con las credenciales de tu cuenta de correo electrónico
//  Email email = new SimpleEmail();
//  //email.setHostName("smtp.gmail.com");
//  email.setHostName("gmail.com");
//  email.setSmtpPort(465);
//  email.setAuthenticator(new DefaultAuthenticator("alertdavidroom@gmail.com", "Anthonie30"));
//  email.setSSLOnConnect(true);
  
//  try {
//    // Especifica la dirección de correo electrónico de destino, el asunto y el cuerpo del mensaje
//    email.setFrom("alertdavidroom@gmail.com");
//    email.setSubject("Prueba de correo electrónico");
//    email.setMsg("Este es un correo de prueba enviado desde Processing.");
//    email.addTo("davidminera30@gmail.com");
    
//    // Envía el correo electrónico
//    email.send();
//    println("Correo electrónico enviado.");
//  } catch (EmailException e) {
//    println("Error al enviar el correo electrónico: " + e.getMessage());
//  }
  
//  // Sale del programa
//  exit();
//}


//import com.twilio.Twilio;
//import com.twilio.type.PhoneNumber;
//import com.twilio.whatsapp.Message;
//import com.twilio.whatsapp.MessageCreator;

//void setup() {
//  Twilio.init("ACCOUNT_SID", "AUTH_TOKEN");

//  String from = "whatsapp:++15076288214"; // Número de WhatsApp de Twilio
//  String to = "whatsapp:+50254931711"; // Número de destino de WhatsApp
//  String message = "¡Hola desde Processing!"; // Mensaje a enviar

//  MessageCreator creator = Message.creator(new PhoneNumber(to), new PhoneNumber(from), message);
//  creator.create();
//}










//Enviar imagen captada en camara
    // MimeBodyPart messageBodyPart = new MimeBodyPart();
    //messageBodyPart.setDataHandler(dh);
    //messageBodyPart.setFileName("camara1.png");
    //Multipart multipart = new MimeMultipart();
    //multipart.addBodyPart(messageBodyPart);
    //message.setContent(multipart);
    // Enviar el mensaje de correo electrónico
    //Transport.send(message);
    //
