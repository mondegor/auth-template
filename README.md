# Auth Template REST API

Этот репозиторий содержит Auth Template в формате OpenAPI.

## Что такое OpenAPI?

Из [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification):

> The OpenAPI Specification (OAS) defines a standard, programming language-agnostic interface description for HTTP APIs, which allows both humans and computers to discover and understand the capabilities of a service without requiring access to source code, additional documentation, or inspection of network traffic. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic. Similar to what interface descriptions have done for lower-level programming, the OpenAPI Specification removes guesswork in calling a service.

## Статус проекта

Проект находится на стадии проверки, уточнения и согласования.

## Описание проекта

Проект представляет собой обобщённую API спецификацию аутентификации пользователя, на основе которой можно собирать API спецификации предназначенные для конкретных проектов.
Также задача этого проекта, показать как описываются обобщённые API спецификации, чтобы на основе него создавать собственные обобщённые API спецификации.

- В директории `./assembly` находится полная API спецификация `full_openapi.yaml`, в других файлах содержатся её компоненты по отдельности;
- Исходники спецификации находятся в директории `./src`. Для того чтобы перегенерировать их, необходимо запустить `./mrcmd openapi gen-all`;
- Примеры, полученные из обобщённой спецификации, находятся здесь `./samples`;
- В примере auth_login_password_email также содержатся sequence диаграммы, описывающие основные сценарии его применения `./samples/auth_login_password_email/sequence`;
- Sequence диаграммы хранятся в формате puml, чтобы из них сгенерировать png, необходимо запустить `./mrcmd plantuml gen-all`;

## Описание спецификации OpenAPI на swagger.io
- [v3.0](https://swagger.io/specification/v3/)
- [v3.1](https://swagger.io/specification/)

## Просмотр и редактирование OpenAPI спецификации
- [Swagger Editor](https://editor.swagger.io/)
- [Insomnia](https://insomnia.rest/download)
- [OpenAPI.Tools](https://openapi.tools/)