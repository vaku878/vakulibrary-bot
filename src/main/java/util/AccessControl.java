package util;

import java.util.HashSet;
import java.util.Set;

public class AccessControl {
    private static final Set<Long> IDS = getUsersIds();

    //Todo: переписать с помощью стримов
    private static Set<Long> getUsersIds() {
        String stringIds = System.getenv("BOT_USERS");
        Set<Long> longIds = new HashSet<>();
        String[] stringIdArr = stringIds.split(":");
        for (String s : stringIdArr) {
            longIds.add(Long.valueOf(s));
        }
        return longIds;
    }

    public static boolean checkAccess(long userId) {
        return IDS.contains(userId);
    }
}
