package Bean;

import java.io.Serializable;
import java.sql.Date;



public class UserBean implements Serializable
{
    int id;
    String nom;
    String prenom;
    Integer tel;
    String sexe;
    String role;
    String massar;
    String password;
    String token;
    Date token_validity;

    public Date getToken_validity() {
        return token_validity;
    }

    public void setToken_validity(Date token_validity) {
        this.token_validity = token_validity;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMassar() {
        return massar;
    }

    public void setMassar(String massar) {
        this.massar = massar;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
