<template>
  <div class="sub-list">
    <h2 class="title">
      Sub Folders
      <small v-if="parent">for «{{ parent.name }}»</small>
    </h2>

    <div v-if="folders.length === 0" class="empty">Tidak ada subfolder</div>

    <ul v-else class="sub-ul">
      <li v-for="f in folders" :key="f.id" class="sub-item">
        <div class="sub-card">
          <div class="sub-left">
            <span class="icon">📂</span>
            <div class="meta">
              <div class="name">{{ f.name }}</div>
              <div class="path">{{ f.path ?? f.id }}</div>
            </div>
          </div>
          <!-- contoh action -->
          <div class="sub-right">
            <button @click="openFolder(f.id)">Open</button>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import type { Folder } from "@/types";
const props = defineProps<{ folders: Folder[]; parent?: Folder | null }>();

function openFolder(id: number) {
    
  console.log("Open subfolder", id);
}
</script>

<style scoped>
.title {
  margin: 0 0 12px 0;
  font-size: 20px;
  color: #172b4d;
}

.empty {
  color: #6b7280;
  font-size: 14px;
}

.sub-ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 12px;
}

.sub-card {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  border-radius: 10px;
  border: 1px solid #eee;
  background: white;
  box-shadow: 0 1px 2px rgba(16,24,40,0.03);
}

.sub-left {
  display: flex;
  gap: 10px;
  align-items: center;
}

.icon { font-size: 20px; }

.meta .name { font-weight: 600; }
.meta .path { font-size: 12px; color: #9aa0ad; }
</style>
