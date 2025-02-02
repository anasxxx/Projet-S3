package Bean;

import java.io.Serializable;
import java.sql.Timestamp;


public class ClubBean implements Serializable
{
    int id;
    int id_president;
    String name;
    String description;
    String acronym;
    Timestamp creation_date;
    String fb;

    public String getIg() {
        return ig;
    }

    public void setIg(String ig) {
        this.ig = ig;
    }

    public String getFb() {
        return fb;
    }

    public void setFb(String fb) {
        this.fb = fb;
    }

    public String getYt() {
        return yt;
    }

    public void setYt(String yt) {
        this.yt = yt;
    }

    String ig;
    String yt;

    public Timestamp getCreation_date() {return creation_date;}

    public void setCreation_date(Timestamp creation_date) {this.creation_date = creation_date;}

    public String getAcronym() {
        return acronym;
    }

    public void setAcronym(String acronym) {
        this.acronym = acronym;
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
