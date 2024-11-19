package Bean;

import java.io.Serializable;


public class ClubBean implements Serializable
{
    int id;
    int id_president;
    String name;
    String description;
    String acronyme;

    public String getAcronyme() {
        return acronyme;
    }

    public void setAcronyme(String acronyme) {
        this.acronyme = acronyme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId_president() {
        return id_president;
    }

    public void setId_president(int id_president) {
        this.id_president = id_president;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
