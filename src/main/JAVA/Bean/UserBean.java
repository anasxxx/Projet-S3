package Bean;

import java.io.Serializable;
import java.time.LocalDate;



public class UserBean implements Serializable
{
    int id;
    String nom;
    String prenom;
    int tel;
    char sexe;
    String role;
    String massar;
    String password;
    String token;
    LocalDate token_validity;

    public LocalDate getToken_validity() {
        return token_validity;
    }

    public void setToken_validity(LocalDate token_validity) {
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

    public char getSexe() {
        return sexe;
    }

    public void setSexe(char sexe) {
        this.sexe = sexe;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
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
