import Reveal from "@/components/Reveal";
import SectionHeader from "@/components/SectionHeader";
import SkillBar from "@/components/SkillBar";
import SpotlightCard from "@/components/SpotlightCard";
import StickyHeader from "@/components/StickyHeader";
import {
  designProcess,
  education,
  experience,
  patents,
  projects,
  site,
  skills,
  stats,
} from "@/data/site";

const navItems = [
  { label: "About", href: "#about" },
  { label: "Skills", href: "#skills" },
  { label: "Experience", href: "#experience" },
  { label: "Projects", href: "#projects" },
  { label: "Patents", href: "#patents" },
  { label: "Education", href: "#education" },
  { label: "Contact", href: "#contact" },
];

export default function Home() {
  return (
    <div className="relative overflow-x-hidden font-sans">
      <div className="pointer-events-none absolute -left-40 top-40 h-80 w-80 rounded-full bg-[color:var(--teal)]/15 blur-[120px]" />
      <div className="pointer-events-none absolute right-[-120px] top-10 h-96 w-96 rounded-full bg-[color:var(--accent)]/15 blur-[140px]" />

      <StickyHeader name={site.name} navItems={navItems} onEmail={site.email} />

      <main className="pt-28">
        <section className="section pb-24 pt-16">
          <div className="grid items-center gap-12 lg:grid-cols-[1.1fr_0.9fr]">
            <div className="flex flex-col gap-6">
              <span className="pill">{site.role}</span>
              <div className="space-y-2">
                <h1 className="text-4xl font-semibold tracking-tight text-slate-900 sm:text-5xl">
                  <span className="gradient-text">{site.name.split(" ")[0]}</span>{" "}
                  {site.name.split(" ").slice(1).join(" ")}
                </h1>
                <p className="text-lg text-[color:var(--muted)]">{site.tagline}</p>
              </div>
              <p className="max-w-xl text-base leading-7 text-[color:var(--muted)]">
                {site.intro}
              </p>
              <div className="flex flex-wrap gap-4">
                <a href={`mailto:${site.email}`} className="btn btn-primary">
                  Start a project
                </a>
                <a href={site.resumeUrl} className="btn btn-secondary">
                  View resume
                </a>
                <a href={site.resumePdfUrl} className="btn btn-secondary">
                  Download PDF
                </a>
              </div>
              <div className="flex flex-wrap items-center gap-4 text-sm text-[color:var(--muted)]">
                <div className="flex gap-3">
                  {site.links.map((link) => (
                    <a
                      key={link.href}
                      href={link.href}
                      className="transition-colors hover:text-white"
                    >
                      {link.label}
                    </a>
                  ))}
                </div>
              </div>
            </div>
            <div className="relative">
              <div className="absolute inset-4 rounded-3xl bg-gradient-to-r from-[color:var(--teal)]/20 to-transparent blur-2xl" />
              <div className="relative overflow-hidden rounded-3xl border border-[color:var(--border)] bg-white/80 p-4 shadow-[0_30px_80px_-50px_rgba(2,6,23,0.25)]">
                <img
                  src={site.heroImage}
                  alt="Portrait"
                  className="h-full w-full rounded-2xl object-contain"
                />
              </div>
            </div>
          </div>
        </section>

        <section id="about" className="section pt-0">
          <SectionHeader
            eyebrow="About"
            title="Designing systems with clarity, resilience, and momentum."
            subtitle="I love building backend platforms, cloud infrastructure, and developer tooling that unlocks speed for the teams I work with."
          />
          <div className="mt-10 grid gap-6 lg:grid-cols-2">
            <SpotlightCard className="card glass">
              <p className="text-sm uppercase tracking-[0.2em] text-[color:var(--muted)]">
                Focus
              </p>
              <p className="mt-4 text-lg font-semibold text-slate-900">
                I&apos;m a software engineer who loves designing reactive and scalable
                systems.
              </p>
              <p className="mt-4 text-sm leading-7 text-[color:var(--muted)]">
                {site.intro} When a product grows, I enjoy shaping the infrastructure,
                automation, and developer workflows that keep it reliable.
              </p>
            </SpotlightCard>
            <div className="grid gap-6 sm:grid-cols-2">
              {designProcess.map((item) => (
                <SpotlightCard
                  key={item.title}
                  className="card glass flex flex-col gap-4 transition hover:shadow-[0_30px_60px_-45px_rgba(13,148,136,0.4)]"
                >
                  <div className="flex items-center gap-3">
                    <img
                      src={item.image}
                      alt={item.title}
                      className="h-10 w-10 rounded-lg bg-[color:var(--bg-elev)] p-2"
                    />
                    <h3 className="text-base font-semibold text-slate-900">{item.title}</h3>
                  </div>
                  <p className="text-sm leading-6 text-[color:var(--muted)]">
                    {item.subtitle}
                  </p>
                </SpotlightCard>
              ))}
            </div>
          </div>
        </section>

        <section className="section pt-0">
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {stats.map((stat) => (
              <Reveal key={stat.label}>
                <SpotlightCard className="card glass flex flex-col gap-2">
                  <span className="text-3xl font-semibold text-slate-900">{stat.value}</span>
                  <span className="text-sm text-[color:var(--muted)]">{stat.label}</span>
                </SpotlightCard>
              </Reveal>
            ))}
          </div>
        </section>

        <section id="skills" className="section">
          <SectionHeader
            eyebrow="Skills"
            title="Strategy, execution, and the tools to deliver."
            subtitle="Deep experience across backend engineering, cloud infrastructure, and platform reliability."
          />
          <div className="mt-10 grid gap-8 lg:grid-cols-[1.2fr_0.8fr]">
            <SpotlightCard className="card glass flex flex-col gap-6">
              <h3 className="text-lg font-semibold text-slate-900">Core strengths</h3>
              <div className="grid gap-5">
                {skills.core.map((skill) => (
                  <SkillBar key={skill.label} label={skill.label} value={skill.value} />
                ))}
              </div>
            </SpotlightCard>
            <div className="flex flex-col gap-6">
              <SpotlightCard className="card glass flex flex-col gap-6">
                <h3 className="text-lg font-semibold text-slate-900">Tech stack</h3>
                <div className="grid gap-4">
                  {skills.stack.map((skill) => (
                    <SkillBar key={skill.label} label={skill.label} value={skill.value} />
                  ))}
                </div>
              </SpotlightCard>
              <SpotlightCard className="card glass flex flex-col gap-4">
                <h3 className="text-lg font-semibold text-slate-900">Tooling</h3>
                <div className="flex flex-wrap gap-3">
                  {skills.tooling.map((tool) => (
                    <a
                      key={tool.label}
                      href={tool.href}
                      className="chip hover:border-[color:var(--teal)] hover:text-[color:var(--teal-dark)]"
                    >
                      <img src={tool.icon} alt="" className="h-4 w-4" />
                      {tool.label}
                    </a>
                  ))}
                </div>
              </SpotlightCard>
            </div>
          </div>
        </section>

        <section id="experience" className="section">
          <SectionHeader
            eyebrow="Experience"
            title="Building infrastructure and platforms across teams."
            subtitle="Leadership roles spanning developer foundations, DevOps, and full-stack delivery."
          />
          <div className="mt-10 grid gap-6">
            {experience.map((item) => (
              <Reveal key={item.company}>
                <SpotlightCard className="card glass">
                <div className="flex flex-wrap items-center gap-4">
                  <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-white/90 p-2">
                    <img src={item.logo} alt={item.company} className="h-8 w-8" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-lg font-semibold text-slate-900">{item.company}</h3>
                    <p className="text-sm text-[color:var(--muted)]">{item.role}</p>
                  </div>
                  <span className="text-xs uppercase tracking-[0.2em] text-[color:var(--muted-strong)]">
                    {item.period}
                  </span>
                </div>
                <ul className="mt-6 grid gap-3 text-sm text-[color:var(--muted)]">
                  {item.points.map((point) => (
                    <li key={point} className="flex gap-3">
                      <span className="mt-2 h-1.5 w-1.5 rounded-full bg-[color:var(--teal)]" />
                      <span>{point}</span>
                    </li>
                  ))}
                </ul>
                </SpotlightCard>
              </Reveal>
            ))}
          </div>
        </section>

        <section id="projects" className="section">
          <SectionHeader
            eyebrow="Projects"
            title="Selected builds with real-world impact."
            subtitle="From consumer apps to infrastructure platforms, each project reflects an obsession with scale and reliability."
          />
          <div className="mt-10 grid gap-8">
            {projects.map((project) => (
              <Reveal key={project.name}>
                <SpotlightCard
                key={project.name}
                className="card glass grid gap-6 overflow-hidden lg:grid-cols-[1.1fr_0.9fr]"
              >
                <div className="space-y-4">
                  <div className="flex flex-wrap items-center gap-3">
                    <h3 className="text-xl font-semibold text-slate-900">
                      {project.name}
                    </h3>
                    <span className="chip">{project.platforms}</span>
                  </div>
                  <p className="text-sm leading-7 text-[color:var(--muted)]">
                    {project.description}
                  </p>
                  <p className="text-xs uppercase tracking-[0.2em] text-[color:var(--muted-strong)]">
                    {project.tech}
                  </p>
                  <ul className="grid gap-2 text-sm text-[color:var(--muted)]">
                    {project.highlights.map((highlight) => (
                      <li key={highlight} className="flex gap-2">
                        <span className="mt-2 h-1.5 w-1.5 rounded-full bg-[color:var(--teal)]" />
                        <span>{highlight}</span>
                      </li>
                    ))}
                  </ul>
                  <div className="flex flex-wrap gap-3 pt-2">
                    {project.repo ? (
                      <a href={project.repo} className="btn btn-secondary">
                        View repo
                      </a>
                    ) : null}
                    {project.website ? (
                      <a href={project.website} className="btn btn-secondary">
                        Live site
                      </a>
                    ) : null}
                    {project.appStore ? (
                      <a href={project.appStore} className="btn btn-secondary">
                        App Store
                      </a>
                    ) : null}
                    {project.playStore ? (
                      <a href={project.playStore} className="btn btn-secondary">
                        Google Play
                      </a>
                    ) : null}
                  </div>
                </div>
                <div className="relative overflow-hidden rounded-2xl border border-[color:var(--border)] bg-[color:var(--bg-elev)]">
                  <img
                    src={project.image}
                    alt={project.name}
                    className="h-full w-full object-cover"
                  />
                </div>
                </SpotlightCard>
              </Reveal>
            ))}
          </div>
        </section>

        <section id="patents" className="section">
          <SectionHeader
            eyebrow="Patents"
            title="Recognized innovation."
            subtitle="Applied research and intellectual property that enables real-world fraud detection."
          />
          <div className="mt-8 grid gap-4">
            {patents.map((patent) => (
              <Reveal key={patent.code}>
                <SpotlightCard>
                  <a
                    key={patent.code}
                    href={patent.href}
                    className="card glass flex flex-wrap items-center justify-between gap-4 transition hover:border-[color:var(--teal)]"
                  >
                    <div>
                      <h3 className="text-lg font-semibold text-slate-900">{patent.name}</h3>
                      <p className="text-sm text-[color:var(--muted)]">{patent.code}</p>
                    </div>
                    <span className="btn btn-secondary">View patent</span>
                  </a>
                </SpotlightCard>
              </Reveal>
            ))}
          </div>
        </section>

        <section id="education" className="section">
          <SectionHeader
            eyebrow="Education"
            title="Academic foundation with real-world co-op impact."
            subtitle="Strong computer science fundamentals with applied industry experience."
          />
          <div className="mt-10 grid gap-6 lg:grid-cols-[1fr_1.2fr]">
            <SpotlightCard className="card glass flex flex-col gap-5">
              <div className="flex items-center gap-4">
                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-white text-[color:var(--teal-dark)] shadow-[0_12px_24px_-16px_rgba(15,23,42,0.2)]">
                  🎓
                </div>
                <div>
                  <a
                    href={education.institutionUrl}
                    className="text-lg font-semibold text-slate-900 hover:text-[color:var(--teal-dark)]"
                  >
                    {education.institution}
                  </a>
                  <p className="text-sm text-[color:var(--muted)]">{education.period}</p>
                </div>
              </div>
              <span className="chip">{education.program}</span>
              <p className="text-sm leading-7 text-[color:var(--muted)]">
                {education.description}
              </p>
            </SpotlightCard>
            <SpotlightCard className="card glass">
              <h3 className="text-lg font-semibold text-slate-900">Coursework</h3>
              <div className="mt-4 grid gap-2 sm:grid-cols-2">
                {education.coursework.map((course) => (
                  <div key={course} className="flex items-start gap-2 text-sm text-[color:var(--muted)]">
                    <span className="mt-2 h-1.5 w-1.5 rounded-full bg-[color:var(--teal)]" />
                    <span>{course}</span>
                  </div>
                ))}
              </div>
            </SpotlightCard>
          </div>
        </section>


        <section id="contact" className="section">
          <Reveal>
            <SpotlightCard className="card glass flex flex-col gap-6 text-center">
            <SectionHeader
              eyebrow="Reach out"
              title="Have a project in mind?"
              subtitle="Let’s collaborate on infrastructure, developer experience, or product strategy."
              align="center"
            />
            <div className="flex flex-wrap items-center justify-center gap-4">
              <a href={`mailto:${site.email}`} className="btn btn-primary">
                {site.email}
              </a>
              <a href={site.resumeUrl} className="btn btn-secondary">
                View resume
              </a>
            </div>
            </SpotlightCard>
          </Reveal>
        </section>
      </main>

      <footer className="section pt-0">
        <div className="flex flex-wrap items-center justify-between gap-4 border-t border-[color:var(--border)] pt-8 text-xs text-[color:var(--muted)]">
          <span>© {new Date().getFullYear()} {site.name}. All rights reserved.</span>
          <div className="flex gap-4">
            {site.links.map((link) => (
              <a key={link.href} href={link.href} className="hover:text-white">
                {link.label}
              </a>
            ))}
          </div>
        </div>
      </footer>
    </div>
  );
}
