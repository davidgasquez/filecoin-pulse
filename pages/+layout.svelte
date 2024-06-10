<script>
    import "@evidence-dev/tailwind/fonts.css";
    import "../app.css";
    import { EvidenceDefaultLayout } from "@evidence-dev/core-components";
    export let data;
</script>

<EvidenceDefaultLayout
    {data}
    title="Filecoin Pulse"
    builtWithEvidence={false}
    fullWidth={true}
    maxWidth="2000"
    githubRepo="https://github.com/davidgasquez/filecoin-data-portal/"
    xProfile="https://twitter.com/davidgasquez/"
>
    <slot slot="content" />
</EvidenceDefaultLayout>
