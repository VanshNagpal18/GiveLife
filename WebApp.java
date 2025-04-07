import java.io.File;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

public class WebApp extends Application {
    @Override
    public void start(Stage stage) {
        WebView webView = new WebView();
	webView.getEngine().setJavaScriptEnabled(true);

//        webView.getEngine().load("~/Give_Life_Project/Give-Life-Project/index.html");
	
	String filePath = "index.html";
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println("File not found: " + file.getAbsolutePath());
        } else {
            // Convert file path to URI string
            webView.getEngine().load(file.toURI().toString());
        }

	
	webView.getEngine().setOnError(event -> 
	    System.out.println("WebView Error: " + event.getMessage()));

	webView.getEngine().locationProperty().addListener((obs, oldLoc, newLoc) -> 
	    System.out.println("Loading: " + newLoc));


        Scene scene = new Scene(webView, 800, 600);
        stage.setScene(scene);
        stage.setTitle("Give Life");
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}

