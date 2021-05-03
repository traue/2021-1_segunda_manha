package br.uninove.uniclima.http;

import br.uninove.uniclima.tempo.Tempo;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

public class Http {

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static Tempo getClima(String cidade) {
        try {
            String charset = StandardCharsets.UTF_8.name();
            String url = "http://api.openweathermap.org/data/2.5/weather";
            String appid = "XXXX"; //COLOCAR A SUA API KEY
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
            try (InputStream resp = conn.getInputStream()) {
                BufferedReader buffer = new BufferedReader(new InputStreamReader(resp, Charset.forName("UTF-8")));
                String json = readAll(buffer);
                Gson gson = new Gson();
                t = gson.fromJson(json, Tempo.class);
            }
            return t;
        } catch (JsonSyntaxException | IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
