// Next.js calls register() once per server start.
export async function register() {
  if (process.env.NEXT_RUNTIME !== 'nodejs') return;
  const wt = await import('@watchtowerobservability/node');
  wt.init({
    apiKey: process.env.WT_INGEST_KEY,
    project: process.env.WT_PROJECT_ID,
    service: process.env.WT_SERVICE || 'nextjs-example',
    bufferDir: '.wt-buffer',
  });
}
