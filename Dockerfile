FROM pistonsh/srcds-server
LABEL maintainer="admin@deniscraig.com"

ARG version=1
ENV VERSION $version

ARG game=sfclassic
ENV GAME $game
ENV HOSTNAME="docker-$game"

ARG default_map=sf_skywalk
ENV DEFAULT_MAP=$default_map

ENV GAME_DIR=$STEAM_USER_DIR/$game

COPY --chown=steam:steam $game $GAME_DIR
# Override server config
COPY --chown=steam:steam cfg $GAME_DIR/cfg

ENV BLOCK_LIMIT=50
ENV BUILD_LENGTH_LONG=600 
ENV BUILD_LENGTH_SHORT=240 
ENV COMBAT_LENGTH=600

VOLUME $GAME_DIR

COPY --chown=steam:steam start.sh start.sh
ENTRYPOINT [ "./start.sh" ]
