/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muchachos.MODELS;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Valter Lafuente Junior
 */
public class Perfume implements Serializable {
    
    private Integer ID;
    private String status;
    private String titulo;
    private String descricao;
    private float valorVenda;
    private float valorCusto;
    private String categoria;
    private Integer quantidade;
    private String data;
    private String imagem;
    private String imagem1;
    private String imagem2;
    private float peso;
    private String tag;
    private List<Perguntas> perguntas;

    public List<Perguntas> getPerguntas() {
        return perguntas;
    }

    public void setPerguntas(List<Perguntas> perguntas) {
        this.perguntas = perguntas;
    }

    public Perfume() {
    }

    public Perfume(String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, float peso, String tag) {
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.peso = peso;
        this.tag = tag;
    }

    public Perfume(Integer ID, String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, float peso, String tag) {
        this.ID = ID;
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.peso = peso;
        this.tag = tag;
    }

    public Perfume(Integer ID, String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, String imagem1, String imagem2, float peso) {
        this.ID = ID;
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.peso = peso;
    }

    public Perfume(Integer ID, String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, String imagem1, String imagem2, float peso, String tag, List<Perguntas> perguntas) {
        this.ID = ID;
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.peso = peso;
        this.tag = tag;
        this.perguntas = perguntas;
    }

    public Perfume(Integer ID, String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, String imagem1, String imagem2, float peso, String tag) {
        this.ID = ID;
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.peso = peso;
        this.tag = tag;
    }

    public Perfume(String status, String titulo, String descricao, float valorVenda, float valorCusto, String categoria, Integer quantidade, String data, String imagem, String imagem1, String imagem2, float peso, String tag/*, List<Perguntas> perguntas*/) {
        this.status = status;
        this.titulo = titulo;
        this.descricao = descricao;
        this.valorVenda = valorVenda;
        this.valorCusto = valorCusto;
        this.categoria = categoria;
        this.quantidade = quantidade;
        this.data = data;
        this.imagem = imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.peso = peso;
        this.tag = tag;
        //this.perguntas = perguntas;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValorVenda() {
        return valorVenda;
    }

    public void setValorVenda(float valorVenda) {
        this.valorVenda = valorVenda;
    }

    public float getValorCusto() {
        return valorCusto;
    }

    public void setValorCusto(float valorCusto) {
        this.valorCusto = valorCusto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String formatarValor(float valor) {
        Locale ptBr = new Locale("pt", "BR");
        String valorString = NumberFormat.getCurrencyInstance(ptBr).format(valor);
        return valorString;
    }
}
