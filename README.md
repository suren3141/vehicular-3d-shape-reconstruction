# Vehicular 3D Shape Reconstruction

This repository contain the code for 3D Shape Reconstruction from monocular images taken from a vehicular camera.

## Introduction

Vehicular shape reconstruction and pose estimation is a vital step for autonomous driving tasks. While many SOTA works are based on bounding box detection, shape reconstruction has gained interests in recent past for tasks such as digital twin. However, the lack of extensive labeled dataset with a wide range of classes has made shape reconstruction challenging task. While recent models have used the limited dataset for supervised training, this project focuses on moving towards a semi-supervised / self-supervised learning methodology, which would pave the way for unsupervised techniques.

## Dataset

### Apollo3D

[Apollo3D](https://apolloscape.auto) dataset is an autonomous driving dataset.

- The [car instance set](https://github.com/ApolloScapeAuto/dataset-api/tree/master/car_instance) for shape reconstruction contains more information about the dataset, including the API and links to download the dataset.
- The [Kaggle challenge](https://www.kaggle.com/competitions/pku-autonomous-driving/data?select=car_models_json) for shape reconstruction contains models in `.json` format.

This project uses the [BAAM model](https://github.com/gywns6287/BAAM/tree/main) as the baseline which gives the SOTA performance on 3D vehicular reconstruction and pose estimation. As such the "apollo3D - car instance dataset" should be organized as follows.



```
${CODE Root}
└── data
    └── apollo
        └── train
            └── apollo_annot
            └── images
        └── val
            └── apollo_annot
            └── images
```

The ``images`` folder contains all the images and the ``apollo_annot`` folder has all the annotation combined into a single json. More information can be found [here](https://github.com/gywns6287/BAAM/blob/main/for_git/directory.md).

<!-- Note : All the sets listed above contains the same information. However, the organization of data and the file types used differ.  -->

## Baseline Model

The model is built with [BAAM](https://github.com/gywns6287/BAAM/tree/main/) as the baseline.
- The quick run guide can be found in the BAAM repository.
- Alternatively, the docker file provided [here](./BAAM/Dockerfile) can be used to build the image and run it.

```
docker build -t baam .
docker run --gpus all --rm -v $APOLLO_PATH:/mnt/dataset/apollo baam bash
```
where APOLLO_PATH is the path to the dataset.

<!-- ## Training -->

<!-- ## Evaluation -->

The figure below shows a sample input and the prediction with the BAAM model.

Image             |  Prediction
:-------------------------:|:-------------------------:
![](./BAAM/vis_results/171206_081123508_Camera_5.jpg)  |  ![](./BAAM/vis_results/171206_081123508_Camera_5.image_plane.png)


## Experiments

BAAM uses Mask R-CNN backbone as a feature extractor. The neck consists of a a bi-contextual attention module for shape reconstruction and attention-guided modeling for pose estimation.

![](./reports/images/BAAM.png)

To remove the dependency on labels, the keypoints were removed from the object features as the first step. To this end, key-point detector was eliminated from the backbone to observe the drop in the performance of the model.

Next, the bi-contextual attention module will be replaced with a visual transformer for shape reconstruction...

<!-- ## Evaluation -->


## Weekly progress report

- The progress report can be found [here](https://docs.google.com/document/d/16RfMfSbtCRv5nYbSyYtppTITUEyDj1bzGLlCNlxb1fs/edit?usp=sharing)


<!-- ## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://gitlab.vision.in.tum.de/s0056/vehicular-3d-shape-reconstruction.git
git branch -M main
git push -uf origin main
```

## Integrate with your tools

- [ ] [Set up project integrations](https://gitlab.vision.in.tum.de/s0056/vehicular-3d-shape-reconstruction/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Automatically merge when pipeline succeeds](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing(SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

# Editing this README

When you're ready to make this README your own, just edit this file and use the handy template below (or feel free to structure it however you want - this is just a starting point!). Thank you to [makeareadme.com](https://www.makeareadme.com/) for this template.

## Suggestions for a good README
Every project is different, so consider which of these sections apply to yours. The sections used in the template are suggestions for most open source projects. Also keep in mind that while a README can be too long and detailed, too long is better than too short. If you think your README is too long, consider utilizing another form of documentation rather than cutting out information.

## Name
Choose a self-explaining name for your project.

## Description
Let people know what your project can do specifically. Provide context and add a link to any reference visitors might be unfamiliar with. A list of Features or a Background subsection can also be added here. If there are alternatives to your project, this is a good place to list differentiating factors.

## Badges
On some READMEs, you may see small images that convey metadata, such as whether or not all the tests are passing for the project. You can use Shields to add some to your README. Many services also have instructions for adding a badge.

## Visuals
Depending on what you are making, it can be a good idea to include screenshots or even a video (you'll frequently see GIFs rather than actual videos). Tools like ttygif can help, but check out Asciinema for a more sophisticated method.

## Installation
Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Roadmap
If you have ideas for releases in the future, it is a good idea to list them in the README.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

## Project status
If you have run out of energy or time for your project, put a note at the top of the README saying that development has slowed down or stopped completely. Someone may choose to fork your project or volunteer to step in as a maintainer or owner, allowing your project to keep going. You can also make an explicit request for maintainers. 
-->
