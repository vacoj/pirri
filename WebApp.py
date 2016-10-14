from flask import Flask, render_template, request, jsonify
import setproctitle
import config
from helpers import WebDataHelper
from helpers.MessageHelper import RMQ
import json
from helpers.AuthHelper import requires_auth


__author__ = 'Joe Vacovsky Jr.'
setproctitle.setproctitle("pirriweb")
app = Flask(__name__)


@app.route('/', methods=["GET"])
@requires_auth
def main():
    if request.method == "GET":
        caldata = json.dumps(WebDataHelper.get_schedule_cal())
        return render_template("index.html", caldata=caldata)


@app.route('/gpio/list', methods=["GET"])
@requires_auth
def gpio_list():
    response = {
        "gpio_pins": WebDataHelper.list_gpio()
    }
    return jsonify(response)


@app.route('/dripnodes/edit', methods=["POST"])
@requires_auth
def dripnodes_edit():
    data = json.loads(request.data.decode('utf8'))
    print(data)
    if 'new' in data and data['new']:
        WebDataHelper.dripnodes_edit(data, True)
    else:
        WebDataHelper.dripnodes_edit(data)
    response = {"status": "submitted"}
    return jsonify(response)


@app.route('/stats/gallons', methods=["GET"])
@requires_auth
def stats_gallons():
    response = WebDataHelper.water_usage_stats()
    return jsonify(response)


@app.route('/station/nodes', methods=["GET", "POST"])
@requires_auth
def station_nodes():
    if request.method == "GET":
        response = WebDataHelper.get_station_nodes()
        return jsonify(response)
    elif request.method == "POST":
        response = {'success': True}
        data = json.loads(request.data.decode('utf8'))
        if 'new' in data and data['new']:
            WebDataHelper.add_or_edit_station_nodes(data, True)
        else:
            WebDataHelper.add_or_edit_station_nodes(data, False)
        return jsonify(response)


@app.route('/station/nodes/delete', methods=["POST"])
@requires_auth
def delete_station_node():
    if request.method == "POST":
        response = {'success': True}
        data = json.loads(request.data.decode('utf8'))
        WebDataHelper.delete_station_node(data['id'])
        return jsonify(response)


@app.route('/schedule', methods=["GET"])
@requires_auth
def schedule_list():
    response = {
        'schedule': WebDataHelper.get_schedule()
    }
    return jsonify(response)


@app.route('/schedule/cal', methods=["GET"])
@requires_auth
def schedule_cal():
    response = {
        'schedule': WebDataHelper.get_schedule_cal()
    }
    return jsonify(response)


@app.route('/schedule/edit', methods=["POST"])
@requires_auth
def schedule_edit():
    data = json.loads(request.data.decode('utf8'))
    print(data)
    if 'new' in data and data['new']:
        WebDataHelper.schedule_edit(data, True)
    else:
        WebDataHelper.schedule_edit(data)
    response = {"status": "submitted"}
    return jsonify(response)


@app.route('/station/edit', methods=["POST"])
@requires_auth
def station_edit():
    response = {}
    data = json.loads(request.data.decode('utf8'))
    WebDataHelper.station_edit(data)
    return jsonify(response)


@app.route('/station/lastruns', methods=["GET"])
@requires_auth
def station_lastruns():
    response = {
        'lastrunlist': WebDataHelper.get_last_station_run()
    }
    return jsonify(response)


@app.route('/station/nextruns', methods=["GET"])
@requires_auth
def station_nextruns():
    response = {
        'nextrunlist': WebDataHelper.get_next_station_run()
    }
    return jsonify(response)


@app.route('/schedule/add', methods=["POST"])
@requires_auth
def schedule_add():
    data = json.loads(request.data.decode('utf8'))
    WebDataHelper.schedule_add(data)
    response = {"status": "submitted"}
    return jsonify(response)


@app.route('/schedule/delete', methods=["POST"])
@requires_auth
def schedule_delete():
    data = json.loads(request.data.decode('utf8'))
    WebDataHelper.schedule_delete(data['schedule_id'])
    response = {"status": "submitted"}
    return jsonify(response)


@app.route('/history', methods=["GET"])
@requires_auth
def station_history():
    response = None
    response = WebDataHelper.station_history()
    return jsonify(response)


@app.route('/station/add', methods=["GET", "POST"])
@requires_auth
def station_add():
    response = {}
    return jsonify(response)


@app.route('/stats', methods=["GET"])
@requires_auth
def stats():
    response = {}
    print(request.args.get('id'))
    if int(request.args.get('id')) == 1:
        response['chartData'] = WebDataHelper.get_chart_stats(
            int(request.args.get('id')))
    elif int(request.args.get('id')) == 2:
        response['chartData'] = WebDataHelper.chart_stats_chrono()
    return jsonify(response)


@app.route('/station/run', methods=["POST"])
@requires_auth
def station_run():
    data = json.loads(request.data.decode('utf8'))
    RMQ().publish_message(json.dumps({
        "sid": data['sid'],
        "duration": data['duration']
    }))
    response = {"status": "submitted"}
    return jsonify(response)


@app.route('/station/list', methods=["GET"])
@requires_auth
def station_list():
    response = {}
    response['stations'] = WebDataHelper.list_stations()
    return jsonify(response)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=config.PORT, threaded=True)
