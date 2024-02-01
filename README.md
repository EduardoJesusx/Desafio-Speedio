<h1 align="center">Speedio Backend Ruby Project</h1>

<p>
  <img alt="Principal linguagem do projeto" src="https://img.shields.io/github/languages/top/EduardoJesusx/vecterinary-project?color=56BEB8">

  <img alt="Tamanho do repositório" src="https://img.shields.io/github/repo-size/EduardoJesusx/vecterinary-project?color=56BEB8">

  <img alt="Licença" src="https://img.shields.io/github/license/EduardoJesusx/vecterinary-project?color=56BEB8">
</p>

<hr>

<p align="center">
  <a href="#dart-sobre">About</a> &#xa0; | &#xa0; 
  <a href="#rocket-tecnologias">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-pré-requisitos">Preconditions</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-começando">Getting Started</a> &#xa0; | &#xa0;
  <a href="#memo-licença">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/EduardoJesusx" target="_blank">Author</a>
</p>

<br>

## :dart: Sobre ##

This is a project requested by Speedio, project is based on creating a web scraper using Ruby on Rails to gather data from SimilarWeb and store it in records in MongoDB.

## :rocket: Tecnologias ##

The following tools were used in the construction of the project:

- [Ruby on Rails](https://rubyonrails.org/)
- [Mongodb](https://www.mongodb.com/)
- [Docker](https://www.docker.com/products/docker-desktop)

## :checkered_flag: Começando ##

Clone the project into your local folder.

```bash
git clone https://github.com/EduardoJesusx/Desafio-Speedio
```

Build the Docker image.
```bash
docker-compose build
```
Start the container with bash
```bash
docker-compose run --service-ports app bash
```

Install the dependencies

```bash
bundle install
```


Start the Rails server
```bash
rails s -b 0.0.0.0 -b
```

Access the application:
- [localhost:3000](https://localhost:3000)

*Note: To be able to use the application, it is necessary to modify the access key to the database in the Atlas service.*

## :memo: Licença ##

This project is under the MIT license. See the file. [MIT](https://opensource.org/license/mit/) for more details.


By <a href="https://github.com/EduardoJesusx" target="_blank"> Eduardo Silveira</a>

&#xa0;

<a href="#top">Voltar para o topo</a>
