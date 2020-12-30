FROM glitchcrab/hass-config-check-base:latest

COPY runaction.sh /runaction.sh

ENTRYPOINT ["bash", "/runaction.sh"]
