package Bean;

import java.io.Serializable;
import java.time.LocalDate;

public class LogsBean implements Serializable {
    int id_user;
    LocalDate login;
    LocalDate logout;

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public LocalDate getLogin() {
        return login;
    }

    public void setLogin(LocalDate login) {
        this.login = login;
    }

    public LocalDate getLogout() {
        return logout;
    }

    public void setLogout(LocalDate logout) {
        this.logout = logout;
    }
}
