server:
applicationConnectors:
- type: http
port: ${env.HTTP_PORT!4444}
port: ${env.HTTP_PORT!5555}
registerDefaultExceptionMappers: false
requestLog:
appenders:
- type: console