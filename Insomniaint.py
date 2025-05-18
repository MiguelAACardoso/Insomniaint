from io import BytesIO
from flask import Flask, jsonify, request
from flask_cors import CORS
import numpy as np
import matplotlib, base64
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from PIL import Image



app = Flask(__name__)
CORS(app)

mensagem = ""

@app.route("/sent", methods = ['POST'])
def sent():


    #global mensagem
    #mensagem = request.get_json(force = True)

    xpoints = np.array([1, 2, 3, 4])
    ypoints = np.array([6, 4, 9, 11])

    #Faz o plot
    fig, ax = plt.subplots()
    ax.plot(xpoints, ypoints)
   
   
    #Guarda o plot num buffer 
    buf = BytesIO()
    fig.savefig(buf, format='png')
    buf.seek(0)

    #converte a imagem para base64
    image = base64.b64encode(buf.read()).decode('utf-8')

    with open("test_output.png", "wb") as f:
        f.write(base64.b64decode(image))


    return jsonify({"imagem" : image})



if __name__ == '__main__':
    app.run(debug=True,port=2000)