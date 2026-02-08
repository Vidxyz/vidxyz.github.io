"use client";

import { useEffect, useState } from "react";
import { FiMenu, FiX } from "react-icons/fi";

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
  const [isOpen, setIsOpen] = useState(false);

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
          <button
            type="button"
            aria-label="Toggle menu"
            onClick={() => setIsOpen((value) => !value)}
            className="flex h-10 w-10 items-center justify-center rounded-xl border border-white/10 bg-white/5 text-[color:var(--text)] transition hover:border-[color:var(--teal-soft)] md:hidden"
          >
            {isOpen ? <FiX className="h-5 w-5" /> : <FiMenu className="h-5 w-5" />}
          </button>
        </div>
      </div>
      <div
        className={[
          "md:hidden",
          isOpen ? "pointer-events-auto opacity-100" : "pointer-events-none opacity-0",
        ].join(" ")}
      >
        <div
          onClick={() => setIsOpen(false)}
          className="fixed inset-0 top-[72px] bg-black/20 backdrop-blur-[2px]"
        />
        <div
          className={[
            "relative overflow-hidden border-t border-[color:var(--border)] bg-white/95 transition-all duration-300",
            isOpen ? "max-h-96" : "max-h-0",
          ].join(" ")}
        >
          <nav className="mx-auto flex w-full max-w-6xl flex-col gap-2 px-6 py-4 text-sm text-[color:var(--muted)] sm:px-10">
            {navItems.map((item) => (
              <a
                key={item.href}
                href={item.href}
                onClick={() => setIsOpen(false)}
                className="rounded-lg px-3 py-2 transition hover:bg-white/10 hover:text-[color:var(--teal-dark)]"
              >
                {item.label}
              </a>
            ))}
          </nav>
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
