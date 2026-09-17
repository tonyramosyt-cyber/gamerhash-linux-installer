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

## Focused earning-stability evidence — 2026-09-16–17

This table keeps local runtime proof separate from marketplace proof. A local
earning-runtime pass invokes the real installed worker without contacting vendor
job-result or payment endpoints; it is not presented as a paid job.

| Model / path | Evidence class | Result |
| --- | --- | --- |
| Qwen Image Edit Plus NF4 | Real marketplace job credited; local earning-runtime operation passed | Three baseline jobs completed and were credited. After the safe-boundary repair, five of five minimal sequential local image-edit operations produced valid PNGs and released GPU ownership. |
| WhisperLargeV3 | Real marketplace job credited | Two read-only baseline assignments and one post-fix assignment completed and were credited. The post-fix job moved pending GUSD from 0.00516934 to 0.00618997 over three billable seconds. This does not erase the separate RTX 3090 local-Create timeout classification below. |
| RealESRGAN Video x2 | Local earning-runtime operation passed; marketplace assignment not observed | The official installed runtime produced a valid 64x64 MP4 from a one-frame fixture, left no orphan, and returned GPU memory to baseline. |
| RealESRGAN Video x4 | Local earning-runtime operation passed; earlier marketplace assignments failed before repair | The official installed runtime produced a valid 128x128 MP4, left no orphan, and returned GPU memory to baseline. The two earlier marketplace failures were interrupted by the repaired ordinary competing-GPU pause. No post-fix x4 assignment arrived in the bounded window. |
| FlashVSR Tiny | Local earning-runtime operation passed; marketplace assignment not observed | The official installed runtime produced a valid 64x64 MP4, left no orphan, and returned GPU memory to baseline. |
| BGE-M3 | Local earning-runtime operation passed; marketplace assignment not observed | The official CUDA-backed runtime returned one 1,024-dimensional finite embedding, left no listener/orphan, and returned GPU memory to baseline. |
| Wan2.2 Animate | Host-ineligible; not tested | The focused RTX 4090 host exposed approximately 59.2 GiB effective RAM, below the signed 64 GiB requirement. The model was not installed or forced. |
| Create / earning ownership | Focused transition passed | Create waited for a vendor Ready/Idle boundary, acquired the GPU without interrupting paid work, and earning resumed afterward. |
| Service restart | Focused recovery passed | Authentication, settings, installed models, earning intent, and healthy service state persisted across one restart. |

The observed root cause was not an intrinsic Qwen or video-runtime failure.
Linux's ordinary competing-GPU policy stopped the vendor process during startup
or generation. The repair latches ordinary contention until Ready/Idle while
retaining immediate stops for temperature, driver, storage, and other
hardware-safety faults. Pinned-runtime version drift was reviewed and was not
causal, so no vendor component was upgraded speculatively.

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
| `model:bge_m3_fp16` | Earning-only embedding | Passed | Real local CUDA embedding operation returned 1,024 finite dimensions; GPU released; no marketplace assignment observed |
| `model:bielik_v3_4_5b_q8` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:chatterbox` | TTS | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_14b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_1_5b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:deepseek_r1_distill_qwen_7b_q5_k_m` | Chat | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:flashvsr_tiny` | Earning-only video upscale | Passed | Real local short-video operation produced valid MP4; GPU released; no marketplace assignment observed |
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
| `model:qwenimageedit_plus_nf4` | Image edit | Passed | Three real marketplace jobs credited; focused local acceptance passed five of five sequential edits; valid PNGs and GPU release |
| `model:realesrgan_vid_x2` | Earning-only video upscale | Passed | Real local short-video operation produced valid 64x64 MP4; GPU released; no marketplace assignment observed |
| `model:realesrgan_vid_x4` | Earning-only video upscale | Passed | Real local short-video operation produced valid 128x128 MP4; GPU released; earlier marketplace failures traced to repaired Linux stop policy |
| `model:realesrgan_x2` | Image upscale | Passed | Real 1024 px PNG and verified Gallery export; GPU released |
| `model:realesrgan_x4` | Image upscale | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:sana16b1024` | Image | Passed | Real exact-12-GB 1024 px PNG; GPU released |
| `model:sanasprint06b1024` | Image | Passed | Real exact-12-GB 256 px PNG; GPU released |
| `model:sanasprint16b1024` | Image | Passed | Real exact-12-GB 256 px PNG; GPU released |
| `model:starwarsfluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:studioghiblistylefluxlora` | Image LoRA | Passed | Real exact-12-GB LoRA PNG; GPU released |
| `model:wan2_2_animate_14b_int8` | Earning-only video | Vendor unavailable | RTX 3090 live vendor state `min_requirements`; focused RTX 4090 host was also locally ineligible at 59.2 GiB effective RAM versus the signed 64 GiB requirement |
| `model:whisperlargev3` | Transcription | Known issue | RTX 3090 local Create timed out; separately, three real marketplace assignments completed and were credited on the focused RTX 4090 worker |
| `model:whisperlargev3ct2` | Transcription | Passed | Unchanged full-matrix baseline; live-compatible |
| `model:zanimedistill_8step_int8` | Image | Passed | Real PNG; GPU released |
| `model:zimageturbo_int8` | Image | Passed | Real PNG; GPU released |

Totals: **53 Passed**, **2 Known issue**, **4 Vendor unavailable**, and
**0 Unsupported**. These statuses describe this independent Linux beta, not
official GamerHash Linux support.
