type SkillBarProps = {
  label: string;
  value: number;
};

export default function SkillBar({ label, value }: SkillBarProps) {
  return (
    <div className="flex flex-col gap-2">
      <div className="flex items-center justify-between text-sm text-[color:var(--muted)]">
        <span className="font-medium text-[color:var(--text)]">{label}</span>
        <span>{value}%</span>
      </div>
      <div className="h-2 w-full rounded-full bg-[color:var(--bg-elev)]">
        <div
          className="h-2 rounded-full bg-gradient-to-r from-[color:var(--teal)] to-[color:var(--accent)]"
          style={{ width: `${value}%` }}
        />
      </div>
    </div>
  );
}
