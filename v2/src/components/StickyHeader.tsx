"use client";

import { useEffect, useState } from "react";

type NavItem = {
  label: string;
  href: string;
};

type StickyHeaderProps = {
  name: string;
  navItems: NavItem[];
  onEmail: string;
};

export default function StickyHeader({ name, navItems, onEmail }: StickyHeaderProps) {
  const [isScrolled, setIsScrolled] = useState(false);
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    const onScroll = () => {
      const scrollY = window.scrollY;
      const docHeight = document.documentElement.scrollHeight - window.innerHeight;
      const nextProgress = docHeight > 0 ? (scrollY / docHeight) * 100 : 0;
      setIsScrolled(scrollY > 24);
      setProgress(Math.min(100, Math.max(0, nextProgress)));
    };
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <header
      className={[
        "fixed left-0 right-0 top-0 z-50 border-b border-[color:var(--border)] backdrop-blur transition-all",
        isScrolled
          ? "bg-white/98 shadow-[0_16px_40px_-30px_rgba(15,23,42,0.35)]"
          : "bg-white/85 shadow-none",
      ].join(" ")}
    >
      <div
        className={[
          "mx-auto flex w-full max-w-6xl items-center justify-between px-6 sm:px-10 transition-all",
          isScrolled ? "py-2" : "py-4",
        ].join(" ")}
      >
        <a href="#" className="flex items-center gap-3 text-slate-900">
          <span className="flex h-10 w-10 items-center justify-center rounded-xl bg-[color:var(--teal)] text-lg font-bold text-white">
            VH
          </span>
          <span className="text-sm font-semibold tracking-wide">{name}</span>
        </a>
        <nav className="hidden items-center gap-6 text-sm text-[color:var(--muted)] md:flex">
          {navItems.map((item) => (
            <a
              key={item.href}
              href={item.href}
              className="transition-colors hover:text-[color:var(--teal-dark)]"
            >
              {item.label}
            </a>
          ))}
        </nav>
        <div className="flex items-center gap-3">
          <a href={`mailto:${onEmail}`} className="btn btn-primary">
            Let&apos;s talk
          </a>
        </div>
      </div>
      <div className="h-[2px] w-full bg-transparent">
        <div
          className="h-full bg-gradient-to-r from-[color:var(--teal)] to-[color:var(--accent)] transition-[width] duration-200"
          style={{ width: `${progress}%` }}
        />
      </div>
    </header>
  );
}
