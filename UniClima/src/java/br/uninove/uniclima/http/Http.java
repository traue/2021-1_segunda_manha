package br.uninove.uniclima.http;

import br.uninove.uniclima.tempo.Tempo;
import com.google.gson.JsonSyntaxException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


public class Http {
    
    public static Tempo getClima(String cidade) {
        try {
            String url = "http://api.openweathermap.org/data/2.5/weather";
            String charset = StandardCharsets.UTF_8.name();
            String appid = ""; //COLOCAR O SEU API KEY
            String units = "metric";
            String lang = "pt_br";
            
            String query = String.format("q=%s&appid=%s&units=%s&lang=%s",
                       URLEncoder.encode(cidade, charset),
                       URLEncoder.encode(appid, charset),
                       URLEncoder.encode(units, charset),
                       URLEncoder.encode(lang, charset));
            
            URLConnection conn = new URL(url + "?" + query).openConnection();
            
            conn.setRequestProperty("Accept-Charset", charset);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);
            Tempo t;
            try(InputStream resp = conn.getInputStream()) {
                BufferedReader buffer = new BufferedReader(new InputStreamReader(resp, Charset.forName("UTF-8")));
                //paramos aqui...
                
            }
            
        } catch(JsonSyntaxException | IOException e) {
            
        }
        return null;
    }
}
