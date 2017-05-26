source url

# Ensure an old container is removed
docker rm davmail &> /dev/null

# Run the new container
docker run -d \
  -p 1025:1025 \
  -p 1110:1110 \
  --name davmail \
  -e EXCHANGE_URL="$URL" \
  davmail
