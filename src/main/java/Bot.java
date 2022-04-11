import commands.*;
import org.telegram.telegrambots.extensions.bots.commandbot.TelegramLongPollingCommandBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

import static util.AccessControl.checkAccess;

public class Bot extends TelegramLongPollingCommandBot {
    private final String BOT_NAME;
    private final String BOT_TOKEN;

    public Bot(String botName, String token) {
        super();
        this.BOT_NAME = botName;
        this.BOT_TOKEN = token;
        register(new StartCommand("/start", "Старт"));
        register(new HelpCommand("/help", "Помощь"));
        register(new SearchCommand("/search", "Поиск"));
        register(new UploadCommand("/upload", "Загрузка"));
        register(new ListCommand("/list", "Список файлов"));
    }

    @Override
    public String getBotUsername() {
        return BOT_NAME;
    }

    @Override
    public String getBotToken() {
        return BOT_TOKEN;
    }

    @Override
    public void processNonCommandUpdate(Update update) {
        Message msg = update.getMessage();
        long chatId = msg.getChatId();
        long userId = msg.getFrom().getId();
        if (checkAccess(userId)) {
            sendAnswer(chatId, msg.getText());
        }
    }

    public void sendAnswer(Long chatId, String text) {
        SendMessage answer = new SendMessage();
        answer.setText(text);
        answer.setChatId(chatId.toString());
        try {
            execute(answer);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }
}
