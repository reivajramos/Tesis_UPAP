from flask import Flask, request, jsonify, render_template, redirect, url_for
import sqlite3

app = Flask(__name__)

DATABASE = '../db/db.db'

# Función para conectar a la base de datos
def get_db():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn


# Rutas para Categorías
@app.route('/', methods=['GET', 'POST'])
def manage_categorias():
    db = get_db()
    cursor = db.execute('SELECT * FROM Categorias')
    categorias = cursor.fetchall()
    categorias_list = [dict(row) for row in categorias]
    return jsonify(categorias_list)
    #return categorias


    #return render_template('categorias.html', categorias=categorias)

if __name__ == '__main__':
    app.run(debug=True)