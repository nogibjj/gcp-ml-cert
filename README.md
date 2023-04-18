# GCP Machine Learning Certification Notes and Code

### TensorFlow Serving

* [Docker TensorFlow Serving](https://www.tensorflow.org/tfx/serving/docker)

#### Verify containerized GPU works for Tensorflow

*Because of potential versioning conflicts between PyTorch and Tensorflow it is recommended to run Tensorflow via GPU Container and PyTorch via default environment.* 

See [TensorFlow GPU documentation](https://www.tensorflow.org/install/docker)
* Run `docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu \
   python -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"`

* Also interactively explore:  `docker run --gpus all -it --rm tensorflow/tensorflow:latest-gpu`, then when inside run:
`apt-get update && apt-get install pciutils` then `lspci | grep -i nvidia`

* To mount the code into your container:  `docker run --gpus all -it --rm -v $(pwd):/tmp tensorflow/tensorflow:latest-gpu /bin/bash`.  Then do `apt-get install -y git && cd /tmp`.  Then all you need to do is run `make install`.  Now you can verify you can train deep learning models by doing `python utils/quickstart_tf2.py`

##### More Tensorflow GPU Ideas

https://www.tensorflow.org/resources/recommendation-systems

```bash
# Deploy the retrieval model with TensorFlow Serving
docker run -t --rm -p 8501:8501 \
  -v "RETRIEVAL/MODEL/PATH:/models/retrieval" \
  -e MODEL_NAME=retrieval tensorflow/serving &
```