import { create } from 'zustand';
import { persist } from 'zustand/middleware';

const useStore = create(
  persist(
    (set) => ({
      count: 100,
      increment: () => set((state) => ({
        count: state.count + 1
      })),
      decrement: () => set((state) => ({
        count: state.count - 1
      })),
      setCount: (newCount) => set({ count: newCount }),
    }),
    {
      name: 'count-storage',
    }
  )
);

export default useStore;
