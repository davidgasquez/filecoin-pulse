<script>
    import "@evidence-dev/tailwind/fonts.css";
    import "../app.css";
    import { EvidenceDefaultLayout } from "@evidence-dev/core-components";
    export let data;
</script>

<EvidenceDefaultLayout
    {data}
    title="Filecoin Pulse"
    fullWidth="false"
    githubRepo="https://github.com/davidgasquez/filecoin-data-portal/"
    xProfile="https://twitter.com/davidgasquez/"
>
    <slot slot="content" />
</EvidenceDefaultLayout>
