import java.io.File;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import javafx.scene.web.WebEngine;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;


public class WebApp extends Application {
    @Override
    public void start(Stage stage) {
        WebView webView = new WebView();
	WebEngine engine = webView.getEngine();
	webView.getEngine().setJavaScriptEnabled(true);

	engine.setOnAlert(event -> {
		Alert alert = new Alert(AlertType.INFORMATION);
            		alert.setTitle("JavaScript Alert");
            		alert.setHeaderText(null);
            		alert.setContentText(event.getData());
            		alert.showAndWait();
        	});
	
	String filePath = "index.html";
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println("File not found: " + file.getAbsolutePath());
        } else {
            // Convert file path to URI string
            webView.getEngine().load(file.toURI().toString());
        }

	
	engine.setOnError(event -> 
	    System.out.println("WebView Error: " + event.getMessage()));

	engine.locationProperty().addListener((obs, oldLoc, newLoc) -> 
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

