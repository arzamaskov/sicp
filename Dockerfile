
FROM racket/racket:9.3-full

RUN raco pkg install \
    --scope installation \
    --auto \
    --skip-installed \
    --no-docs \
    sicp review

WORKDIR /workspace

CMD ["racket"]

