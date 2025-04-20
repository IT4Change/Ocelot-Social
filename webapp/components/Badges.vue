<template>
  <div :class="[badges.length === 2 && 'hc-badges-dual']" class="hc-badges">
    <div
      v-for="badge in badges"
      :key="badge.id"
      :class="['hc-badge-container', badge.type]"
      :title="badge.title"
    >
      <img v-if="badge.icon" :title="badge.key" :src="badge.icon | proxyApiUrl" class="hc-badge" />
    </div>
  </div>
</template>

<script>
export default {
  props: {
    badges: {
      type: Array,
      default: () => [],
    },
  },
}
</script>

<style lang="scss">
.hc-badges {
  position: relative;

  $badge-size-x: 30px;
  $badge-size-y: 26px;
  $main-badge-size-x: 60px;
  $main-badge-size-y: 52px;
  $gap-x: -6px;
  $gap-y: 1px;
  $slot-x: $badge-size-x + $gap-x;
  $slot-y: $badge-size-y + $gap-y;
  $offset-y: ($badge-size-y) / 2 - 2 * $gap-x;

  width: calc($main-badge-size-x + 4 * $badge-size-x + 4 * $gap-x);
  height: calc(3 * $badge-size-y + 4 * $gap-y);
  margin: auto;

  .hc-badge-container {
    position: absolute;
    width: $badge-size-x;
    height: $badge-size-y;
    background-image: url('/img/badges/slot-empty.svg');
    background-position: top;
    background-repeat: no-repeat;
    background-size: contain;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    font-size: 10px;
    color: #333;
  }

  .hc-badge {
    display: block;
    width: 100%;
    height: 100%;
  }

  .hc-badge-container:nth-child(1) {
    width: $main-badge-size-x;
    height: $main-badge-size-y;
    top: $offset-y + calc($gap-y / 2);
    left: 0;
    font-size: 20px; /* Doubled font size for first slot */
  }

  .hc-badge-container:nth-child(2) {
    top: $offset-y + calc(-1 * $gap-y / 2);
    left: calc($main-badge-size-x + $gap-x);
  }

  .hc-badge-container:nth-child(3) {
    top: $offset-y + calc($slot-y + $gap-y / 2);
    left: calc($main-badge-size-x + $gap-x);
  }

  .hc-badge-container:nth-child(4) {
    top: $offset-y + calc(-1 * $badge-size-y / 2 - 2 * $gap-y);
    left: calc($main-badge-size-x + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(5) {
    top: $offset-y + calc($badge-size-y / 2);
    left: calc($main-badge-size-x + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(6) {
    top: $offset-y + calc(1.5 * $badge-size-y + 2 * $gap-y);
    left: calc($main-badge-size-x + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(7) {
    top: $offset-y + calc(-1 * $gap-y / 2);
    left: calc($main-badge-size-x + $gap-x + 2 * $slot-x);
  }

  .hc-badge-container:nth-child(8) {
    top: $offset-y + calc($slot-y + $gap-y / 2);
    left: calc($main-badge-size-x + $gap-x + 2 * $slot-x);
  }

  .hc-badge-container:nth-child(9) {
    top: $offset-y + calc($slot-y - ($badge-size-y / 2) - $gap-y);
    left: calc($main-badge-size-x + $gap-x + 3 * $slot-x);
  }

  .hc-badge-container:nth-child(10) {
    top: $offset-y + calc($badge-size-y * 1.5 + 2 * $gap-y);
    left: calc($main-badge-size-x + $gap-x + 3 * $slot-x);
  }

  .nordrhein-westfalen::after {
    content: "NW";
  }

  .test-express::after {
    content: "TE";
  }

  .liberation-express::after {
    content: "LE";
  }

  .nachweis-express::after {
    content: "NE";
  }

  .maskenfrei-express::after {
    content: "ME";
  }

  .beitragsblocker::after {
    content: "BB";
  }

  .beitragsstopper::after {
    content: "BS";
  }

  .masern-impfbloker::after {
    content: "MI";
  }

  .rundfunk-alarm::after {
    content: "RA";
  }

  .freunde-der-demokratie::after {
    content: "FD";
  }

  .restart-democracy::after {
    content: "RD";
  }
}
</style>
