<template>
  <li>
    <div
      class="folder-row"
      :class="{ selected: folder.id === selectedId }"
      :style="{ paddingLeft: `${level * 12}px` }"
      @click.stop="onClickRow"
    >
      <span class="caret" v-if="hasChildren" @click.stop="toggle">
        <svg v-if="!open" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
        <svg v-else xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><path d="M19 8H5v8h14z"/></svg>
      </span>
      <span class="icon">📁</span>
      <span class="label">{{ folder.name }}</span>
    </div>

    <ul v-if="open && children.length" class="children-list">
      <FolderItem
        v-for="child in children"
        :key="child.id"
        :folder="child"
        :folders="folders"
        :level="level + 1"
        :selectedId="selectedId"
        @select="$emit('select', $event)"
      />
    </ul>
  </li>
</template>

<script setup lang="ts">
import { ref, computed } from "vue";
import type { Folder } from "@/types";

const props = defineProps<{
  folder: Folder;
  folders: Folder[];
  level?: number;
  selectedId?: number | null;
}>();

const emit = defineEmits<{
  (e: "select", id: number | null): void;
}>();

const open = ref(false);

const children = computed(() =>
  props.folders.filter((f) => f.parent_id === props.folder.id)
);

const hasChildren = computed(() => children.value.length > 0);

function onClickRow() {
  // pilih folder (toggle selection). kita emit id
  emit("select", props.folder.id);
  // optionally auto-open the node
  open.value = true;
}

function toggle() {
  open.value = !open.value;
}
</script>

<style scoped>
li {
  list-style: none;
  margin: 6px 0;
}

/* row */
.folder-row {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 6px 8px;
  border-radius: 6px;
  user-select: none;
  cursor: pointer;
  font-size: 14px;
  color: #243044;
}

.folder-row:hover {
  background: rgba(0,0,0,0.03);
}

.folder-row.selected {
  background: #0b5cff1a;
  border-left: 3px solid #0b5cff;
}

.icon {
  width: 18px;
  text-align: center;
}

/* children list */
.children-list {
  list-style: none;
  margin: 6px 0 0 0;
  padding-left: 0;
}

/* caret small */
.caret {
  width: 14px;
  height: 14px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  opacity: 0.8;
}
.caret svg path {
  fill: #243044;
}
</style>
