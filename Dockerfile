FROM asensei/vapor:xenial-swift-4.1

WORKDIR /app

COPY ./ ./

RUN vapor build

EXPOSE 8080

CMD vapor run
