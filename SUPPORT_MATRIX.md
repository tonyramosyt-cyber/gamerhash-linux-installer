# GamerHash demonstration beta support matrix

Demonstration scope: Ubuntu 24.04 AMD64 and Qualified NVIDIA RTX profiles
starting at 12 GB. The final package smoke result is recorded separately; the
model evidence below is retained from completed qualification runs.

| Profile | Qualification and limits |
| --- | --- |
| 8 GB RTX | Planned; deferred and not supported by this demonstration release |
| 12 GB RTX | Qualified for its compatible live catalog; Chat and Image routes passed |
| 16 GB Ada-or-newer with 64 GB RAM | Qualified by RTX 5060 Ti; applicable Create runtime families passed; 14 exact-tier vendor-blocked models remain unavailable |
| 24 GB Ampere-or-newer with 32 GB RAM | Qualified by RTX 3090; BEN2 and Whisper Large V3 remain known issues on that representative; four vendor-refused models remain unavailable |
| 32 GB Blackwell | Qualified RTX 5090 reference; all 54 consumer Create routes passed; earning-only availability follows vendor assignments |

Qualification does not mean every model runs on every listed machine. Effective
usable memory and the signed profile determine local admission; live vendor
decisions remain authoritative. Marketplace approval and job availability are
separate from local Create support. Other distributions remain Planned.

## September 16 RTX Pro maintenance evidence

The `0.1.0+mig3` maintenance revision was exercised on Ubuntu 24.04 with a single
RTX PRO 6000 Blackwell Server Edition (96 GB VRAM), approximately 141 GiB RAM and
NVIDIA 580.126.16. MIG current/pending Disabled was correctly treated as a full
GPU, and observed RAM above 64 GiB preserved vendor model states. This is focused
admission/Create evidence, not a new boundary-profile qualification or a repeated
model matrix.

All 59 catalog models and seven shared modules were installed on that host. The
corrected local Video catalog excludes earning-only Wan Animate, FlashVSR and
video RealESRGAN routes. A direct unsupported Wan local request was rejected
before GPU ownership and did not disable earning. Wan subsequently loaded as the
vendor-selected earning worker and reached Ready.

The earning client advertised 26 recommended models plus seven LoRAs with zero
skipped requirements and remained authenticated/connected, but received zero
paid assignments during the observation. That result is **not** a promise of
earnings and does not reclassify marketplace availability. The earlier RTX 3090
paid-job completion remains the only recorded paid-job proof in this matrix.

## Retained per-model evidence — 2026-09-11

This is the release classification for every model in the pinned 59-model
GamerHash 0.85.4 catalog. `Passed` may reuse the completed RTX 5090 matrix when
the model/runtime was unchanged; the focused RTX 3090 run retested all models
newly admitted above the 12 GB tier that the live vendor generation would
install, plus one model per applicable runtime family. The focused exact-12-GB
run retested every supported model whose lowest admitted tier is 12 GB.
`Vendor unavailable`
means the live vendor generation refused the model and the Linux client did
not override it. `Known issue` is a reproducible RTX 3090 failure.

| Model ID | Feature/runtime | Status | Release evidence |
| --- | --- | --- | --- |
| `model:acestep_1_5_base` | Music | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:acestep_1_5_turbo` | Music | Passed | Real 10-second MP3; GPU released |
| `model:acestep_1_5_xl_base_int8` | Music | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:acestep_1_5_xl_turbo_int8` | Music | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:astroghxstylefluxschnelllora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:ben2` | Background removal | Known issue | Two clean attempts timed out; worker required service recovery |
| `model:bge_m3_fp16` | Earning-only embedding | Passed | Unchanged worker-startup baseline; live-compatible |
| `model:bielik_v3_4_5b_q8` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:chatterbox` | TTS | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_14b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_1_5b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_7b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:flashvsr_tiny` | Earning-only video upscale | Passed | Installed; unchanged worker-startup baseline |
| `model:flux1dev` | Image | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:flux1schnell` | Image | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:flux_2_klein_4b_bf16` | Image | Passed | Real 768 px PNG; earning worker and real paid job used GPU path |
| `model:gamercoinfluxschnelllora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:gamerhashfluxschnelllora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:gemma_3_it_qat_1b_q4_k_m` | Chat | Passed | Real desktop reply; resources released |
| `model:gemma_3_it_qat_4b_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:gptoss_20b_q4_k_m` | Chat | Passed | Real exact-12-GB Chat reply; GPU released |
| `model:hidreami1dev` | Image | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:hidreami1fast` | Image | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:hidreami1full` | Image | Passed | Real exact-12-GB 1024 px PNG with recorded swap headroom; GPU released |
| `model:kokoro` | TTS | Passed | Real MP3 for `hello`; GPU released |
| `model:llama_3_2_3b_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:ltx2_3_22b_dist_int8` | Video | Vendor unavailable | Live vendor state `min_requirements` |
| `model:ltxv_13b_0_9_8_distilled_fp8` | Video | Vendor unavailable | Live vendor state `min_requirements` |
| `model:ltxv_13b_0_9_8_distilled_int8` | Video | Passed | Real 512 px/1-second MP4; GPU released |
| `model:marvelmixxfluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:minimaxh3_33b_turbo_int8` | Video | Vendor unavailable | Live vendor state `min_requirements` |
| `model:nanonets_ocr_s_f16` | OCR | Passed | Real PNG input returned `HELLO 123`; GPU released |
| `model:phi4_reasoning_plus_q4_k_m` | Chat | Passed | Real exact-12-GB Chat reply; GPU released |
| `model:phi_4_mini_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:phi_4_mini_reasoning_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:phi_4_q4_k` | Chat | Passed | Real exact-12-GB Chat reply; GPU released |
| `model:pixelartdotfluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:qwen3_tts_12hz_1_7b_base` | TTS | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:qwen3_tts_12hz_1_7b_customvoice` | TTS | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:qwen3_tts_12hz_1_7b_voicedesign` | TTS | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:qwen_3_4b_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:qwen_3_8b_q4_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:qwenimage_plus2_nf4` | Image | Passed | Real PNG after one automatic supervisor recovery |
| `model:qwenimageedit_plus2_nf4` | Image edit | Passed | Real PNG from fixture input; GPU released |
| `model:qwenimageedit_plus_nf4` | Image edit | Passed | Real 1024 px PNG from fixture input; GPU released |
| `model:realesrgan_vid_x2` | Earning-only video upscale | Passed | Installed; unchanged worker-startup baseline |
| `model:realesrgan_vid_x4` | Earning-only video upscale | Passed | Installed; unchanged worker-startup baseline |
| `model:realesrgan_x2` | Image upscale | Passed | Real 1024 px PNG and verified Gallery export; GPU released |
| `model:realesrgan_x4` | Image upscale | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:sana16b1024` | Image | Passed | Real exact-12-GB 1024 px PNG; GPU released |
| `model:sanasprint06b1024` | Image | Passed | Real exact-12-GB 256 px PNG; GPU released |
| `model:sanasprint16b1024` | Image | Passed | Real exact-12-GB 256 px PNG; GPU released |
| `model:starwarsfluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:studioghiblistylefluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:wan2_2_animate_14b_int8` | Earning-only video | Vendor unavailable | RTX 3090 live state `min_requirements`; RTX Pro worker reached Ready but received no job |
| `model:whisperlargev3` | Transcription | Known issue | Two clean attempts timed out; worker required service recovery |
| `model:whisperlargev3ct2` | Transcription | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:zanimedistill_8step_int8` | Image | Passed | Real PNG; GPU released |
| `model:zimageturbo_int8` | Image | Passed | Real PNG; GPU released |

Totals: **53 Passed**, **2 Known issue**, **4 Vendor unavailable**, and
**0 Unsupported**. These statuses describe this independent Linux beta, not
official GamerHash Linux support.
