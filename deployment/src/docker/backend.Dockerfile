ARG APP_IMAGE=ocelotsocialnetwork/backend
ARG APP_IMAGE_TAG_BASE=latest-base
ARG APP_IMAGE_TAG_CODE=latest-code
ARG APP_IMAGE_BASE=${APP_IMAGE}:${APP_IMAGE_TAG_BASE}
ARG APP_IMAGE_CODE=${APP_IMAGE}:${APP_IMAGE_TAG_CODE}

##################################################################################
# CODE (branded) #################################################################
##################################################################################
FROM $APP_IMAGE_CODE AS code

ARG CONFIGURATION=example

# copy public constants and email templates into the Docker image to brand it
COPY configurations/${CONFIGURATION}/branding/constants/emails.ts src/config/
COPY configurations/${CONFIGURATION}/branding/constants/logos.ts src/config/
COPY configurations/${CONFIGURATION}/branding/constants/metadata.ts src/config/
COPY configurations/${CONFIGURATION}/branding/email/ src/middleware/helpers/email/

##################################################################################
# BUILD ##########################################################################
##################################################################################
FROM code AS build

# yarn install
RUN yarn install --production=false --frozen-lockfile --non-interactive
# yarn build
RUN yarn run build

##################################################################################
# BRANDED (Does contain only "binary"- and static-files to reduce image size) ####
##################################################################################
FROM $APP_IMAGE_BASE AS branded

# TODO - do all copying with one COPY command to have one layer
# Copy "binary"-files from build image
COPY --from=build ${DOCKER_WORKDIR}/build ./build
COPY --from=build ${DOCKER_WORKDIR}/node_modules ./node_modules
# TODO - externalize the uploads so we can copy the whole folder
COPY --from=build ${DOCKER_WORKDIR}/public/img/ ./public/img/
COPY --from=build ${DOCKER_WORKDIR}/public/providers.json ./build/public/providers.json
# Copy package.json for script definitions (lock file should not be needed)
COPY --from=build ${DOCKER_WORKDIR}/package.json ./package.json

# Run command
CMD /bin/sh -c "yarn run start"
