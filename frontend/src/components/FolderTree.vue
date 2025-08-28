<template>
  <div class="folder-tree">
    <ul class="tree-root">
      <FolderItem
        v-for="root in rootFolders"
        :key="root.id"
        :folder="root"
        :folders="folders"
        :level="0"
        :selectedId="selectedId"
        @select="$emit('select', $event)"
      />
    </ul>
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";
import type { Folder } from "@/types";
import FolderItem from "./FolderItem.vue";

const props = defineProps<{
  folders: Folder[]; // expect plain array
  selectedId?: number | null;
}>();

const emit = defineEmits<{
  (e: "select", id: number | null): void;
}>();

const rootFolders = computed(() =>
  props.folders.filter((f) => f.parent_id === null)
);
</script>

<style scoped>
.tree-root {
  list-style: none;
  padding-left: 8px;
  margin: 0;
}
</style>
