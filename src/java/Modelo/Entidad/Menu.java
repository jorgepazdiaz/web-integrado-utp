/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Entidad;

import java.sql.Date;

public class Menu {

   int  idMenu;
   int  idDia;
   Date  fecRegistro;
   int  idDesayuno;
   double preDesayuno;
   double totDesayuno;
   int idAlmSopa;
   double preAlmSopa;
   double totAlmSopa;
   int idAlmSegundo;
   double preAlmSegundo;
   double totAlmSegundo;
   int idCenSopa;
   double preCenSopa;
   double totCenSopa;
   int idCenSegundo;
   double preCenSegundo;
   double totCenSegundo;
   double totMenu;

    public Menu() {
    }

    public Menu(int idMenu, int idDia, Date fecRegistro, int idDesayuno, double preDesayuno, double totDesayuno, int idAlmSopa, double preAlmSopa, double totAlmSopa, int idAlmSegundo, double preAlmSegundo, double totAlmSegundo, int idCenSopa, double preCenSopa, double totCenSopa, int idCenSegundo, double preCenSegundo, double totCenSegundo, double totMenu) {
        this.idMenu = idMenu;
        this.idDia = idDia;
        this.fecRegistro = fecRegistro;
        this.idDesayuno = idDesayuno;
        this.preDesayuno = preDesayuno;
        this.totDesayuno = totDesayuno;
        this.idAlmSopa = idAlmSopa;
        this.preAlmSopa = preAlmSopa;
        this.totAlmSopa = totAlmSopa;
        this.idAlmSegundo = idAlmSegundo;
        this.preAlmSegundo = preAlmSegundo;
        this.totAlmSegundo = totAlmSegundo;
        this.idCenSopa = idCenSopa;
        this.preCenSopa = preCenSopa;
        this.totCenSopa = totCenSopa;
        this.idCenSegundo = idCenSegundo;
        this.preCenSegundo = preCenSegundo;
        this.totCenSegundo = totCenSegundo;
        this.totMenu = totMenu;
    }

   
   
    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public int getIdDia() {
        return idDia;
    }

    public void setIdDia(int idDia) {
        this.idDia = idDia;
    }

    public Date getFecRegistro() {
        return fecRegistro;
    }

    public void setFecRegistro(Date fecRegistro) {
        this.fecRegistro = fecRegistro;
    }

    public int getIdDesayuno() {
        return idDesayuno;
    }

    public void setIdDesayuno(int idDesayuno) {
        this.idDesayuno = idDesayuno;
    }

    public double getPreDesayuno() {
        return preDesayuno;
    }

    public void setPreDesayuno(double preDesayuno) {
        this.preDesayuno = preDesayuno;
    }

    public double getTotDesayuno() {
        return totDesayuno;
    }

    public void setTotDesayuno(double totDesayuno) {
        this.totDesayuno = totDesayuno;
    }

    public int getIdAlmSopa() {
        return idAlmSopa;
    }

    public void setIdAlmSopa(int idAlmSopa) {
        this.idAlmSopa = idAlmSopa;
    }

    public double getPreAlmSopa() {
        return preAlmSopa;
    }

    public void setPreAlmSopa(double preAlmSopa) {
        this.preAlmSopa = preAlmSopa;
    }

    public double getTotAlmSopa() {
        return totAlmSopa;
    }

    public void setTotAlmSopa(double totAlmSopa) {
        this.totAlmSopa = totAlmSopa;
    }

    public int getIdAlmSegundo() {
        return idAlmSegundo;
    }

    public void setIdAlmSegundo(int idAlmSegundo) {
        this.idAlmSegundo = idAlmSegundo;
    }

    public double getPreAlmSegundo() {
        return preAlmSegundo;
    }

    public void setPreAlmSegundo(double preAlmSegundo) {
        this.preAlmSegundo = preAlmSegundo;
    }

    public double getTotAlmSegundo() {
        return totAlmSegundo;
    }

    public void setTotAlmSegundo(double totAlmSegundo) {
        this.totAlmSegundo = totAlmSegundo;
    }

    public int getIdCenSopa() {
        return idCenSopa;
    }

    public void setIdCenSopa(int idCenSopa) {
        this.idCenSopa = idCenSopa;
    }

    public double getPreCenSopa() {
        return preCenSopa;
    }

    public void setPreCenSopa(double preCenSopa) {
        this.preCenSopa = preCenSopa;
    }

    public double getTotCenSopa() {
        return totCenSopa;
    }

    public void setTotCenSopa(double totCenSopa) {
        this.totCenSopa = totCenSopa;
    }

    public int getIdCenSegundo() {
        return idCenSegundo;
    }

    public void setIdCenSegundo(int idCenSegundo) {
        this.idCenSegundo = idCenSegundo;
    }

    public double getPreCenSegundo() {
        return preCenSegundo;
    }

    public void setPreCenSegundo(double preCenSegundo) {
        this.preCenSegundo = preCenSegundo;
    }

    public double getTotCenSegundo() {
        return totCenSegundo;
    }

    public void setTotCenSegundo(double totCenSegundo) {
        this.totCenSegundo = totCenSegundo;
    }

    public double getTotMenu() {
        return totMenu;
    }

    public void setTotMenu(double totMenu) {
        this.totMenu = totMenu;
    }

   
   
}
