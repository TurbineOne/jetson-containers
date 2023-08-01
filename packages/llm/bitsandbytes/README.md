# bitsandbytes

<details open>
<summary><b>CONTAINERS</b></summary>
<br>

| **`bitsandbytes`** | |
| :-- | :-- |
| &nbsp;&nbsp;&nbsp;Builds | [![`bitsandbytes_jp51`](https://img.shields.io/github/actions/workflow/status/dusty-nv/jetson-containers/bitsandbytes_jp51.yml?label=bitsandbytes_jp51)](https://github.com/dusty-nv/jetson-containers/actions/workflows/bitsandbytes_jp51.yml) |
| &nbsp;&nbsp;&nbsp;Requires | `L4T >=34.1.0` |
| &nbsp;&nbsp;&nbsp;Dependencies | [`build-essential`](/packages/build-essential) [`python`](/packages/python) [`numpy`](/packages/numpy) [`cmake`](/packages/cmake/cmake_pip) [`onnx`](/packages/onnx) [`pytorch`](/packages/pytorch) |
| &nbsp;&nbsp;&nbsp;Dependants | [`auto-gptq`](/packages/llm/auto-gptq) [`awq`](/packages/llm/awq) [`gptq-for-llama`](/packages/llm/gptq-for-llama) [`l4t-text-generation`](/packages/l4t/l4t-text-generation) [`nemo`](/packages/nemo) [`optimum`](/packages/llm/optimum) [`text-generation-inference`](/packages/llm/text-generation-inference) [`text-generation-webui`](/packages/llm/text-generation-webui) [`transformers`](/packages/llm/transformers) |
| &nbsp;&nbsp;&nbsp;Dockerfile | [`Dockerfile`](Dockerfile) |
| &nbsp;&nbsp;&nbsp;Notes | fork of https://github.com/TimDettmers/bitsandbytes for Jetson |

</details>

<details open>
<summary><b>CONTAINER IMAGES</b></summary>
<br>

| Repository/Tag | Date | Arch | Size |
| :-- | :--: | :--: | :--: |
| &nbsp;&nbsp;[`dustynv/bitsandbytes:r35.2.1`](https://hub.docker.com/r/dustynv/bitsandbytes/tags) | `2023-07-30` | `arm64` | `5.4GB` |
| &nbsp;&nbsp;[`dustynv/bitsandbytes:r35.3.1`](https://hub.docker.com/r/dustynv/bitsandbytes/tags) | `2023-07-30` | `arm64` | `5.4GB` |

> <sub>Container images are compatible with other minor versions of JetPack/L4T:</sub><br>
> <sub>&nbsp;&nbsp;&nbsp;&nbsp;• L4T R32.7 containers can run on other versions of L4T R32.7 (JetPack 4.6+)</sub><br>
> <sub>&nbsp;&nbsp;&nbsp;&nbsp;• L4T R35.x containers can run on other versions of L4T R35.x (JetPack 5.1+)</sub><br>
</details>

<details open>
<summary><b>RUN CONTAINER</b></summary>
<br>

To start the container, you can use the [`run.sh`](/docs/run.md)/[`autotag`](/docs/run.md#autotag) helpers or manually put together a [`docker run`](https://docs.docker.com/engine/reference/commandline/run/) command:
```bash
# automatically pull or build a compatible container image
./run.sh $(./autotag bitsandbytes)

# or explicitly specify one of the container images above
./run.sh dustynv/bitsandbytes:r35.3.1

# or if using 'docker run' (specify image and mounts/ect)
sudo docker run --runtime nvidia -it --rm --network=host dustynv/bitsandbytes:r35.3.1
```
> <sup>[`run.sh`](/docs/run.md) forwards arguments to [`docker run`](https://docs.docker.com/engine/reference/commandline/run/) with some defaults added (like `--runtime nvidia`, mounts a `/data` cache, and detects devices)</sup><br>
> <sup>[`autotag`](/docs/run.md#autotag) finds a container image that's compatible with your version of JetPack/L4T - either locally, pulled from a registry, or by building it.</sup>

To mount your own directories into the container, use the [`-v`](https://docs.docker.com/engine/reference/commandline/run/#volume) or [`--volume`](https://docs.docker.com/engine/reference/commandline/run/#volume) flags:
```bash
./run.sh -v /path/on/host:/path/in/container $(./autotag bitsandbytes)
```
To launch the container running a command, as opposed to an interactive shell:
```bash
./run.sh $(./autotag bitsandbytes) my_app --abc xyz
```
You can pass any options to `run.sh` that you would to [`docker run`](https://docs.docker.com/engine/reference/commandline/run/), and it'll print out the full command that it constructs before executing it.
</details>
<details open>
<summary><b>BUILD CONTAINER</b></summary>
<br>

If you use [`autotag`](/docs/run.md#autotag) as shown above, it'll ask to build the container for you if needed.  To manually build it, first do the [system setup](/docs/setup.md), then run:
```bash
./build.sh bitsandbytes
```
The dependencies from above will be built into the container, and it'll be tested during.  See [`./build.sh --help`](/jetson_containers/build.py) for build options.
</details>