FROM jupyter/minimal-notebook

RUN apt-get update && \
    apt-get install -y pciutils wget cmake git build-essential libncurses5-dev libncursesw5-dev libsystemd-dev libudev-dev libdrm-dev pkg-config


RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install jupyter
RUN pip install ipywidgets
RUN pip install jupyter_contrib_nbextensions
RUN pip install jupyterlab_code_formatter black isort
RUN pip install JLDracula
RUN pip install jupyterlab_materialdarker
RUN pip install jupyterlab-drawio
RUN pip install jupyterlab_execute_time
RUN pip install ipympl

RUN mkdir /project
RUN mkdir /root/.jupyter

COPY ./requirements.txt .

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=*", "--port=8888", "--allow-root", "--no-browser", "--notebook-dir=/project", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.default_url='/lab/tree'"]
