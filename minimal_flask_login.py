# Author: Gouthaman Balaraman
# http://gouthamanbalaraman.com/minimal-flask-login-example.html
import base64
from flask import Flask
import MySQLdb
from functools import wraps
from flask import request, abort
import json

app = Flask(__name__)
app.config.from_object('configmodule.DevelopmentConfig')


def connect():
    # conn = mysql.connection
    conn = MySQLdb.connect(user='negotiate', passwd='negotiate123', db='negotiate_db', host='localhost')
    cur = conn.cursor()
    return cur, conn


def require_appkey(view_function):
    @wraps(view_function)
    def decorated_function(*args, **kwargs):
        if request.args.get('key') and request.args.get('key') == 'SECRETKEY':
            return view_function(*args, **kwargs)
        else:
            abort(401)

    return decorated_function


@app.route("/product_dim", methods=["GET"])
@require_appkey
def get_product_dim():
    cur, conn = connect()
    cur.execute('select cat_id, category from product_dim')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'cat_id': entry[0], 'category': entry[1]}
        row_list.append(row)
    # conn.close()
    return json.dumps({'category': row_list})
    # return str(entries)


@app.route("/product_sub_dim", methods=["GET"])
@require_appkey
def get_product_sub_dim(*args, **kwargs):
    cur, conn = connect()
    cat_id = request.args.get('cat_id')
    cur.execute('select sub_cat_id, sub_category from product_sub_dim where cat_id=' + cat_id)
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'sub_cat_id': entry[0], 'sub_category': entry[1]}
        row_list.append(row)
    # conn.close()
    return json.dumps({'sub_category': row_list})


@app.route("/product_tbl", methods=["GET"])
@require_appkey
def get_product_tbl(*args, **kwargs):
    cur, conn = connect()
    sub_category = request.args.get('sub_category')
    cur.execute(
            'select product_id, item_name, icon_url  from product_tbl as A join product_sub_dim as B on A.sub_cat_id = B.sub_cat_id where B.sub_category like("' + sub_category + '")')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        encodeString = base64.b64encode(entry[2])
        row = {'product_id': entry[0], 'item_name': entry[1], 'icon_url': encodeString}
        row_list.append(row)
    return json.dumps({'product': row_list})


@app.route("/product_item", methods=["GET"])
@require_appkey
def get_product_item(*args, **kwargs):
    cur, conn = connect()
    item_name = request.args.get('item_name')
    cur.execute(
            'select item_name, item_desc, price, delivery_date, icon_url, product_id from product_tbl where item_name like("' + item_name + '")')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'item_name': entry[0], 'item_desc': entry[1], 'price': entry[2], 'delivery_date': entry[3],
               'icon_url': base64.b64encode(entry[4]), 'product_id': entry[5]}
        row_list.append(row)
    return json.dumps({'product': row_list})


@app.route("/order_tbl", methods=["GET"])
@require_appkey
def get_order_id(*args, **kwargs):
    cur, conn = connect()
    item_name = request.args.get('product_id')
    cur.execute('INSERT INTO negotiate_db.order_tbl (product_id) VALUES ("' + item_name + '")')
    cur.execute(
            'SELECT max(order_id) FROM negotiate_db.order_tbl')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'order_id': entry[0]}
        row_list.append(row)
    return json.dumps({'product': row_list})


@app.route("/negotiate_manual", methods=["GET"])
@require_appkey
def get_neg_manual(*args, **kwargs):
    cur, conn = connect()
    edtPrice = request.args.get('price')
    edtDays = request.args.get('days')
    product_id = request.args.get('product_id')
    cur.execute(
            'SELECT price, days FROM negotiate_db.negotiate_manual where product_id=' + product_id + ' and price<' + edtPrice + ' and days<' + edtDays + ' order by price desc, days desc limit 4')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'price': entry[0], 'days': entry[1]}
        row_list.append(row)
    return json.dumps({'product': row_list})


@app.route("/negotiate_auto", methods=["GET"])
@require_appkey
def get_neg_auto(*args, **kwargs):
    cur, conn = connect()
    edtMinPrice = request.args.get('minprice')
    edtMaxPrice = request.args.get('maxprice')
    priceWeight = request.args.get('priceweight')
    edtMinDays = request.args.get('mindays')
    edtMaxDays = request.args.get('maxdays')
    daysweight = request.args.get('daysweight')
    product_id = request.args.get('product_id')
    cur.execute(
            'SELECT price, days, (' + priceWeight + '*(' + edtMaxPrice + ' - price)/(' + edtMaxPrice + '-'
            + edtMinPrice + '))+(' + daysweight + '*(' + edtMaxDays + '- days)/(' + edtMaxDays
            + '-' + edtMinDays + ')) as score FROM negotiate_db.negotiate_manual where product_id='
            + product_id + ' order by score desc limit 4')
    entries = cur.fetchall()
    row_list = []
    for entry in entries:
        row = {'price': entry[0], 'days': entry[1]}
        row_list.append(row)
    return json.dumps({'product': row_list})


def write_file(data, filename):
    with open(filename, 'wb') as f:
        f.write(data)


if __name__ == '__main__':
    app.config["SECRET_KEY"] = "ITSASECRET"
    app.run(host='0.0.0.0', port=5000, debug=True)
    # app.run(host='0.0.0.0')
