import sys

from flask import Flask
app = Flask(__name__)
greeting = 'hello'
message = 'world'


@app.route("/")
def hello():
    return greeting + " " + message


if __name__ == '__main__':
    if (len(sys.argv) == 3):
        print "overriding default greetings.."
        greeting = sys.argv[1]
        message = sys.argv[2]

    app.run(debug=False, host='0.0.0.0')