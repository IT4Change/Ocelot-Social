<template>
  <div :class="[badges.length === 2 && 'hc-badges-dual']" class="hc-badges">
    <div v-for="badge in badges" :key="badge.id" class="hc-badge-container">
      <img :title="badge.key" :src="badge.icon | proxyApiUrl" class="hc-badge" />
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

  $badge-size: 30px;
  $main-badge-size: 60px;
  $gap-x: -2px;
  $gap-y: 2px;
  $slot-x: $badge-size + $gap-x;
  $slot-y: $badge-size + $gap-y;
  $offset-y: ($badge-size) / 2 - 2 * $gap-x;

  width: calc($main-badge-size + 4 * $badge-size + 4 * $gap-x);
  height: calc(3 * $badge-size + 4 * $gap-y);
  margin: auto;

  .hc-badge-container {
    position: absolute;
    width: $badge-size;
    height: $badge-size;
  }

  .hc-badge {
    display: block;
    width: 100%;
    height: 100%;
  }

  .hc-badge-container:nth-child(1) {
    width: $main-badge-size;
    height: $main-badge-size;
    top: $offset-y + calc($gap-y / 2);
    left: 0;
  }

  .hc-badge-container:nth-child(2) {
    top: $offset-y + calc(-1 * $gap-y / 2);
    left: calc($main-badge-size + $gap-x);
  }

  .hc-badge-container:nth-child(3) {
    top: $offset-y + calc($slot-y + $gap-y / 2);
    left: calc($main-badge-size + $gap-x);
  }

  .hc-badge-container:nth-child(4) {
    top: $offset-y + calc(-1 * $badge-size / 2 - 2 * $gap-y);
    left: calc($main-badge-size + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(5) {
    top: $offset-y + calc($badge-size / 2);
    left: calc($main-badge-size + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(6) {
    top: $offset-y + calc(1.5 * $badge-size + 2 * $gap-y);
    left: calc($main-badge-size + $gap-x + $slot-x);
  }

  .hc-badge-container:nth-child(7) {
    top: $offset-y + calc(-1 * $gap-y / 2);
    left: calc($main-badge-size + $gap-x + 2 * $slot-x);
  }

  .hc-badge-container:nth-child(8) {
    top: $offset-y + calc($slot-y + $gap-y / 2);
    left: calc($main-badge-size + $gap-x + 2 * $slot-x);
  }

  .hc-badge-container:nth-child(9) {
    top: $offset-y + calc($slot-y - ($badge-size / 2) - $gap-y);
    left: calc($main-badge-size + $gap-x + 3 * $slot-x);
  }

  .hc-badge-container:nth-child(10) {
    top: $offset-y + calc($badge-size * 1.5 + 2 * $gap-y);
    left: calc($main-badge-size + $gap-x + 3 * $slot-x);
  }

}
</style>
