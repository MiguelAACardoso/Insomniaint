from io import BytesIO
from flask import Flask, jsonify, request
from flask_cors import CORS
import numpy as np
import matplotlib, base64
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from PIL import Image
import datetime

print(datetime.datetime.now().strftime("%H %M"))
