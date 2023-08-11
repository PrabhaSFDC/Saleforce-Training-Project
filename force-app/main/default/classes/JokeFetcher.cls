public class JokeFetcher implements Queueable {

    public static execute(QueueableContext context) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://official-joke-api.appspot.com/random_joke');
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            JokeResponse joke = (JokeResponse)JSON.deserialize(res.getBody(), JokeResponse.class);
            
            System.debug('Joke Type: ' + joke.type);
            System.debug('Setup: ' + joke.setup);
            System.debug('Punchline: ' + joke.punchline);
            System.debug('ID: ' + joke.id);
        } else {
            System.debug('Error fetching joke. Status code: ' + res.getStatusCode());
            System.debug('Response body: ' + res.getBody());
        }
    }
}
