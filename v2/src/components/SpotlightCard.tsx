"use client";

import { useRef } from "react";

type SpotlightCardProps = {
  children: React.ReactNode;
  className?: string;
};

export default function SpotlightCard({ children, className }: SpotlightCardProps) {
  const ref = useRef<HTMLDivElement | null>(null);

  const handleMove = (event: React.MouseEvent<HTMLDivElement>) => {
    const element = ref.current;
    if (!element) return;
    const rect = element.getBoundingClientRect();
    const x = ((event.clientX - rect.left) / rect.width) * 100;
    const y = ((event.clientY - rect.top) / rect.height) * 100;
    element.style.setProperty("--spot-x", `${x}%`);
    element.style.setProperty("--spot-y", `${y}%`);
  };

  return (
    <div ref={ref} onMouseMove={handleMove} className={`spotlight ${className ?? ""}`}>
      {children}
    </div>
  );
}
