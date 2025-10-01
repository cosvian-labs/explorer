<script lang="ts" setup>
import { Icon } from '@iconify/vue';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

const cosvianNetworks = ref([
  {
    name: 'cosvian',
    title: 'Cosvian Mainnet',
    description: 'Production network for Cosvian Protocol',
    chainId: 'cosvian-1',
    color: '#812cd6',
    icon: '🚀',
    enabled: true,
  },
  {
    name: 'cosvian-testnet',
    title: 'Cosvian Testnet',
    description: 'Testing network for development - Coming Soon',
    chainId: 'cosvian-testnet-1',
    color: '#666cff',
    icon: '🧪',
    enabled: false,
  },
]);

const navigateToChain = (networkName: string, enabled: boolean) => {
  if (enabled) {
    router.push(`/${networkName}`);
  }
};
</script>

<template>
  <div
    class="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 dark:from-gray-900 dark:to-gray-800"
  >
    <div class="container mx-auto px-4 py-16">
      <!-- Header -->
      <div class="text-center mb-16">
        <div class="flex justify-center mb-6">
          <div
            class="w-20 h-20 rounded-full bg-gradient-to-r from-purple-600 to-blue-600 flex items-center justify-center"
          >
            <Icon icon="mdi:cube-outline" class="text-4xl text-white" />
          </div>
        </div>

        <h1 class="text-5xl font-bold text-gray-900 dark:text-white mb-4">
          {{ $t('pages.title') }}
        </h1>

        <p
          class="text-xl text-gray-600 dark:text-gray-300 mb-8 max-w-3xl mx-auto"
        >
          {{ $t('pages.slogan') }}
        </p>
      </div>

      <!-- Networks -->
      <div class="max-w-4xl mx-auto">
        <h2
          class="text-3xl font-bold text-center text-gray-900 dark:text-white mb-12"
        >
          Choose Your Network
        </h2>

        <div class="grid md:grid-cols-2 gap-8">
          <div
            v-for="network in cosvianNetworks"
            :key="network.name"
            class="group"
            :class="{
              'cursor-pointer': network.enabled,
              'cursor-not-allowed opacity-60': !network.enabled,
            }"
            @click="navigateToChain(network.name, network.enabled)"
          >
            <div
              class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg transition-all duration-300 p-8 border border-gray-200 dark:border-gray-700"
              :class="{
                'hover:shadow-2xl group-hover:border-purple-500 group-hover:scale-105':
                  network.enabled,
                'border-gray-300 dark:border-gray-600': !network.enabled,
              }"
            >
              <div class="flex items-center justify-between mb-6">
                <div class="flex items-center space-x-4">
                  <div
                    class="w-16 h-16 rounded-full flex items-center justify-center text-3xl"
                    :style="{
                      backgroundColor: network.color + '20',
                      color: network.enabled ? network.color : '#999',
                    }"
                  >
                    {{ network.icon }}
                  </div>
                  <div>
                    <h3
                      class="text-2xl font-bold text-gray-900 dark:text-white"
                    >
                      {{ network.title }}
                    </h3>
                    <p class="text-gray-500 dark:text-gray-400">
                      {{ network.chainId }}
                    </p>
                  </div>
                </div>

                <div class="flex items-center space-x-2">
                  <div
                    class="w-3 h-3 rounded-full"
                    :class="
                      network.enabled
                        ? 'bg-green-500 animate-pulse'
                        : 'bg-gray-400'
                    "
                  ></div>
                  <span
                    class="text-sm font-medium"
                    :class="
                      network.enabled
                        ? 'text-green-600 dark:text-green-400'
                        : 'text-gray-500 dark:text-gray-400'
                    "
                  >
                    {{ network.enabled ? 'Live' : 'Coming Soon' }}
                  </span>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-300 mb-6">
                {{ network.description }}
              </p>

              <button
                class="w-full py-3 px-6 rounded-lg font-medium text-white transition-all duration-200"
                :style="{
                  backgroundColor: network.enabled ? network.color : '#999',
                }"
                :disabled="!network.enabled"
              >
                {{
                  network.enabled ? `Explore ${network.title}` : 'Coming Soon'
                }}
                <Icon
                  v-if="network.enabled"
                  icon="mdi:arrow-right"
                  class="inline ml-2"
                />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo path {
  fill: #171d30;
}
</style>
