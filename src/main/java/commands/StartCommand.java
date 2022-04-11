package commands;

import org.telegram.telegrambots.meta.api.objects.Chat;
import org.telegram.telegrambots.meta.api.objects.User;
import org.telegram.telegrambots.meta.bots.AbsSender;

import static util.AccessControl.checkAccess;

public class StartCommand extends Command {
    public StartCommand(String commandIdentifier, String description) {
        super(commandIdentifier, description);
    }

    @Override
    public void execute(AbsSender absSender, User user, Chat chat, String[] strings) {
        if (checkAccess(user.getId())) {
            sendAnswer(absSender, chat.getId(), "Старт");
        }
    }
}
