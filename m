Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E133970D6A0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjEWIFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236256AbjEWIFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:05:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C424B1AE
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:04:45 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso994691a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684829021; x=1687421021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qduq9LColrD8nCcQjMb+Vh9HPNMpRdvjaynMGQgi44k=;
        b=b5+a/SBt87C6VLHH327RqzLf15rc8rCSU6ZnNSNWleVcdjypCPfVFbl2QrzG94G6Je
         NhEW3ilBcyPQDaVtQsrpHmLrmw0KqfxfvTX8np1CL5q9F+3rYTx/+vsuy6XWJgzB8oSZ
         kBb6brTIaFVBRvEr6syVk+KOQ8jRXXKgps5/XG4tpFMdeWL8RReJP7fQhwgXUUnuaM+X
         Ln+EnwTaEkNw6jxUePLfvSyKdPTaEMTd+J0/xV2pYeLy2WOJGbhun546cq//xINMuzpb
         KZ9jOc1xrwq8P4l2dtVieNqqeb/pmY4G7wbmrCbnSvEIEZEqNp8jjnHowa5hr+4X3YKa
         ncBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684829021; x=1687421021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qduq9LColrD8nCcQjMb+Vh9HPNMpRdvjaynMGQgi44k=;
        b=ejmGl5aAay50CrEuglj8WSL76EOs4I7KRXNpfcq5oRNQZlt2DH5yR+8hoLs74MZ+Ui
         YpVUYYuPiUiHmS4/d1rh1brfcEVbXKov2F0s2HsbuIUix/E3AYRBuJ6NuUwc0BF1AZwA
         QWuT+033jl+tn9hyclJewEp82BScFGCpegYdZIaFrMsy+WrW4FyxTDS6P0LfTVhcLBM6
         xNSJDCpnjv/SAEtgDOcDEUtxrQytwOzKj2ObyPj1eztAwX2n0YtGaRpu9IMHX5akRw2e
         b5bBL5Y6PaOPlu5y1y2rLsAvC2jYt6wYgxqSuAzTOgyQg/vLHe2kutXnqpnBNhGAngEL
         hfMA==
X-Gm-Message-State: AC+VfDzTKWnDl7H6m1Ft7/Gcd7+703MxuMPIHk/LyMzRkJ9YFDTtVdR9
        ikV8BUdJxxYICIbnmcBEF5sPeA==
X-Google-Smtp-Source: ACHHUZ5DuxdoQrk/XxN4tJ3+aICKGLPQxDMazPp47ECkugH317/rAur5tDjOsqhk3e76aPKLQeHyNw==
X-Received: by 2002:a17:907:9308:b0:969:fc68:fa9a with SMTP id bu8-20020a170907930800b00969fc68fa9amr12378538ejc.40.1684829020484;
        Tue, 23 May 2023 01:03:40 -0700 (PDT)
Received: from [192.168.1.149] (i5C7409D3.versanet.de. [92.116.9.211])
        by smtp.gmail.com with ESMTPSA id r25-20020a1709064d1900b0094bb4c75695sm4099971eju.194.2023.05.23.01.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 01:03:40 -0700 (PDT)
Message-ID: <4637c361-59ef-011e-6d0a-795521bb801a@linaro.org>
Date:   Tue, 23 May 2023 10:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [libgpiod][PATCH] bindings: Fix typo "SPDX-FileCopyrightTest"
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org
References: <2a4dd7e50f7be9d515059f1ac4709eb2fdc7d36d.1684828674.git.viresh.kumar@linaro.org>
Content-Language: en-US
From:   Erik Schilling <erik.schilling@linaro.org>
In-Reply-To: <2a4dd7e50f7be9d515059f1ac4709eb2fdc7d36d.1684828674.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/23/23 09:59, Viresh Kumar wrote:
> It should be SPDX-FileCopyrightText instead. Fix it.

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>

> 
> Reported-by: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   bindings/python/gpiod/version.py                             | 2 +-
>   bindings/rust/.gitignore                                     | 2 +-
>   bindings/rust/Cargo.toml                                     | 2 +-
>   bindings/rust/Makefile.am                                    | 2 +-
>   bindings/rust/gpiosim-sys/Cargo.toml                         | 2 +-
>   bindings/rust/gpiosim-sys/Makefile.am                        | 2 +-
>   bindings/rust/gpiosim-sys/README.md                          | 2 +-
>   bindings/rust/gpiosim-sys/build.rs                           | 2 +-
>   bindings/rust/gpiosim-sys/src/Makefile.am                    | 2 +-
>   bindings/rust/gpiosim-sys/src/lib.rs                         | 2 +-
>   bindings/rust/gpiosim-sys/src/sim.rs                         | 2 +-
>   bindings/rust/libgpiod-sys/Cargo.toml                        | 2 +-
>   bindings/rust/libgpiod-sys/Makefile.am                       | 2 +-
>   bindings/rust/libgpiod-sys/README.md                         | 2 +-
>   bindings/rust/libgpiod-sys/build.rs                          | 2 +-
>   bindings/rust/libgpiod-sys/src/Makefile.am                   | 2 +-
>   bindings/rust/libgpiod-sys/src/lib.rs                        | 2 +-
>   bindings/rust/libgpiod/Cargo.toml                            | 2 +-
>   bindings/rust/libgpiod/Makefile.am                           | 2 +-
>   bindings/rust/libgpiod/examples/Makefile.am                  | 2 +-
>   bindings/rust/libgpiod/examples/gpio_events.rs               | 2 +-
>   bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs | 2 +-
>   bindings/rust/libgpiod/examples/gpiodetect.rs                | 2 +-
>   bindings/rust/libgpiod/examples/gpiofind.rs                  | 2 +-
>   bindings/rust/libgpiod/examples/gpioget.rs                   | 2 +-
>   bindings/rust/libgpiod/examples/gpioinfo.rs                  | 2 +-
>   bindings/rust/libgpiod/examples/gpiomon.rs                   | 2 +-
>   bindings/rust/libgpiod/examples/gpionotify.rs                | 2 +-
>   bindings/rust/libgpiod/examples/gpioset.rs                   | 2 +-
>   bindings/rust/libgpiod/examples/gpiowatch.rs                 | 2 +-
>   bindings/rust/libgpiod/src/Makefile.am                       | 2 +-
>   bindings/rust/libgpiod/src/chip.rs                           | 2 +-
>   bindings/rust/libgpiod/src/edge_event.rs                     | 2 +-
>   bindings/rust/libgpiod/src/event_buffer.rs                   | 2 +-
>   bindings/rust/libgpiod/src/info_event.rs                     | 2 +-
>   bindings/rust/libgpiod/src/lib.rs                            | 2 +-
>   bindings/rust/libgpiod/src/line_config.rs                    | 2 +-
>   bindings/rust/libgpiod/src/line_info.rs                      | 2 +-
>   bindings/rust/libgpiod/src/line_request.rs                   | 2 +-
>   bindings/rust/libgpiod/src/line_settings.rs                  | 2 +-
>   bindings/rust/libgpiod/src/request_config.rs                 | 2 +-
>   bindings/rust/libgpiod/tests/Makefile.am                     | 2 +-
>   bindings/rust/libgpiod/tests/chip.rs                         | 2 +-
>   bindings/rust/libgpiod/tests/common/Makefile.am              | 2 +-
>   bindings/rust/libgpiod/tests/common/config.rs                | 2 +-
>   bindings/rust/libgpiod/tests/common/mod.rs                   | 2 +-
>   bindings/rust/libgpiod/tests/edge_event.rs                   | 2 +-
>   bindings/rust/libgpiod/tests/info_event.rs                   | 2 +-
>   bindings/rust/libgpiod/tests/line_config.rs                  | 2 +-
>   bindings/rust/libgpiod/tests/line_info.rs                    | 2 +-
>   bindings/rust/libgpiod/tests/line_request.rs                 | 2 +-
>   bindings/rust/libgpiod/tests/line_settings.rs                | 2 +-
>   bindings/rust/libgpiod/tests/request_config.rs               | 2 +-
>   53 files changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/bindings/python/gpiod/version.py b/bindings/python/gpiod/version.py
> index 1ad903e09146..2e182a3dc765 100644
> --- a/bindings/python/gpiod/version.py
> +++ b/bindings/python/gpiod/version.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: LGPL-2.1-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   __version__ = "2.0.1"
> diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
> index 6fe7bde6f8a7..a8bda09778f5 100644
> --- a/bindings/rust/.gitignore
> +++ b/bindings/rust/.gitignore
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   target
>   Cargo.lock
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index b4a28fd7129c..2e026b49103a 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   [workspace]
>   
> diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
> index 7903f828d87d..e89c39327c89 100644
> --- a/bindings/rust/Makefile.am
> +++ b/bindings/rust/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   EXTRA_DIST = Cargo.toml
>   SUBDIRS = gpiosim-sys libgpiod libgpiod-sys
> diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
> index 9aa047feba82..af307486badb 100644
> --- a/bindings/rust/gpiosim-sys/Cargo.toml
> +++ b/bindings/rust/gpiosim-sys/Cargo.toml
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   [package]
>   name = "gpiosim-sys"
> diff --git a/bindings/rust/gpiosim-sys/Makefile.am b/bindings/rust/gpiosim-sys/Makefile.am
> index 9471b0eb35c1..310722319835 100644
> --- a/bindings/rust/gpiosim-sys/Makefile.am
> +++ b/bindings/rust/gpiosim-sys/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = build.rs Cargo.toml README.md
>   SUBDIRS = src
> diff --git a/bindings/rust/gpiosim-sys/README.md b/bindings/rust/gpiosim-sys/README.md
> index 686d522bf174..6cd24d9aaa52 100644
> --- a/bindings/rust/gpiosim-sys/README.md
> +++ b/bindings/rust/gpiosim-sys/README.md
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   # Generated gpiosim Rust FFI bindings
>   Automatically generated Rust FFI bindings via
> diff --git a/bindings/rust/gpiosim-sys/build.rs b/bindings/rust/gpiosim-sys/build.rs
> index 0651c6115322..c31fccb09684 100644
> --- a/bindings/rust/gpiosim-sys/build.rs
> +++ b/bindings/rust/gpiosim-sys/build.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   extern crate bindgen;
>   
> diff --git a/bindings/rust/gpiosim-sys/src/Makefile.am b/bindings/rust/gpiosim-sys/src/Makefile.am
> index af104d05eae4..e88f477083a0 100644
> --- a/bindings/rust/gpiosim-sys/src/Makefile.am
> +++ b/bindings/rust/gpiosim-sys/src/Makefile.am
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = lib.rs sim.rs
> diff --git a/bindings/rust/gpiosim-sys/src/lib.rs b/bindings/rust/gpiosim-sys/src/lib.rs
> index e3630442e24b..eed2a425afd6 100644
> --- a/bindings/rust/gpiosim-sys/src/lib.rs
> +++ b/bindings/rust/gpiosim-sys/src/lib.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use libgpiod::{Error, OperationType, Result};
>   
> diff --git a/bindings/rust/gpiosim-sys/src/sim.rs b/bindings/rust/gpiosim-sys/src/sim.rs
> index 777bf086061a..896596f07955 100644
> --- a/bindings/rust/gpiosim-sys/src/sim.rs
> +++ b/bindings/rust/gpiosim-sys/src/sim.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::ffi::{CStr, CString};
>   use std::os::raw::c_char;
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index 3bc3525aedca..938a0d5e9f22 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   [package]
>   name = "libgpiod-sys"
> diff --git a/bindings/rust/libgpiod-sys/Makefile.am b/bindings/rust/libgpiod-sys/Makefile.am
> index 9471b0eb35c1..310722319835 100644
> --- a/bindings/rust/libgpiod-sys/Makefile.am
> +++ b/bindings/rust/libgpiod-sys/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = build.rs Cargo.toml README.md
>   SUBDIRS = src
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
> index 7e6e643ab2ab..3eb5c9defeac 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   # Generated libgpiod-sys Rust FFI bindings
>   Automatically generated Rust FFI bindings via
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
> index e3ed04afa141..d4825a924f81 100644
> --- a/bindings/rust/libgpiod-sys/build.rs
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   extern crate bindgen;
>   
> diff --git a/bindings/rust/libgpiod-sys/src/Makefile.am b/bindings/rust/libgpiod-sys/src/Makefile.am
> index 36361e7e0be5..0ef728b7ffac 100644
> --- a/bindings/rust/libgpiod-sys/src/Makefile.am
> +++ b/bindings/rust/libgpiod-sys/src/Makefile.am
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = lib.rs
> diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> index 68526910c8ee..06f1a50c2753 100644
> --- a/bindings/rust/libgpiod-sys/src/lib.rs
> +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   #[allow(non_camel_case_types, non_upper_case_globals)]
>   #[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index 655e7a2ce107..48681defc316 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: CC0-1.0
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   [package]
>   name = "libgpiod"
> diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
> index 38f2ebf37aff..e9a10c18b45f 100644
> --- a/bindings/rust/libgpiod/Makefile.am
> +++ b/bindings/rust/libgpiod/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   command = cargo build --release --lib
>   
> diff --git a/bindings/rust/libgpiod/examples/Makefile.am b/bindings/rust/libgpiod/examples/Makefile.am
> index 2e1ccbd63f3f..c1d2c174370e 100644
> --- a/bindings/rust/libgpiod/examples/Makefile.am
> +++ b/bindings/rust/libgpiod/examples/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = \
>   	gpiodetect.rs \
> diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
> index b26c60b064d9..a45b6dbba384 100644
> --- a/bindings/rust/libgpiod/examples/gpio_events.rs
> +++ b/bindings/rust/libgpiod/examples/gpio_events.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation to show handling of events, when the buffer
>   // is read into multiple times. Based on gpiomon example.
> diff --git a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
> index 620f4ec57ca0..8853a7bc720e 100644
> --- a/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
> +++ b/bindings/rust/libgpiod/examples/gpio_threaded_info_events.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation to show handling of info events, that are
>   // generated from another thread.
> diff --git a/bindings/rust/libgpiod/examples/gpiodetect.rs b/bindings/rust/libgpiod/examples/gpiodetect.rs
> index 96581bc604c6..97922524188f 100644
> --- a/bindings/rust/libgpiod/examples/gpiodetect.rs
> +++ b/bindings/rust/libgpiod/examples/gpiodetect.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of gpiodetect tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpiofind.rs b/bindings/rust/libgpiod/examples/gpiofind.rs
> index 99fba30c1a3c..da0530daf0fc 100644
> --- a/bindings/rust/libgpiod/examples/gpiofind.rs
> +++ b/bindings/rust/libgpiod/examples/gpiofind.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of gpiofind tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpioget.rs b/bindings/rust/libgpiod/examples/gpioget.rs
> index a71612bd1988..8e390f3928c5 100644
> --- a/bindings/rust/libgpiod/examples/gpioget.rs
> +++ b/bindings/rust/libgpiod/examples/gpioget.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of gpioget tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpioinfo.rs b/bindings/rust/libgpiod/examples/gpioinfo.rs
> index 02d8c9765ab3..1fe1ae01dd3b 100644
> --- a/bindings/rust/libgpiod/examples/gpioinfo.rs
> +++ b/bindings/rust/libgpiod/examples/gpioinfo.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of gpioinfo tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
> index 8f2a71adaa14..c3564db2465a 100644
> --- a/bindings/rust/libgpiod/examples/gpiomon.rs
> +++ b/bindings/rust/libgpiod/examples/gpiomon.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of the gpiomon tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpionotify.rs b/bindings/rust/libgpiod/examples/gpionotify.rs
> index 54445d293eaf..fca108638c53 100644
> --- a/bindings/rust/libgpiod/examples/gpionotify.rs
> +++ b/bindings/rust/libgpiod/examples/gpionotify.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2023 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +// SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   //
>   // Simplified Rust implementation of the gpionotify tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpioset.rs b/bindings/rust/libgpiod/examples/gpioset.rs
> index 4b43010a3b80..607407d5a68f 100644
> --- a/bindings/rust/libgpiod/examples/gpioset.rs
> +++ b/bindings/rust/libgpiod/examples/gpioset.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of the gpioset tool.
>   
> diff --git a/bindings/rust/libgpiod/examples/gpiowatch.rs b/bindings/rust/libgpiod/examples/gpiowatch.rs
> index a356fd589721..26a2ed88d6d8 100644
> --- a/bindings/rust/libgpiod/examples/gpiowatch.rs
> +++ b/bindings/rust/libgpiod/examples/gpiowatch.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Simplified Rust implementation of the gpiowatch tool.
>   
> diff --git a/bindings/rust/libgpiod/src/Makefile.am b/bindings/rust/libgpiod/src/Makefile.am
> index df63c7275d9e..589260069464 100644
> --- a/bindings/rust/libgpiod/src/Makefile.am
> +++ b/bindings/rust/libgpiod/src/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = \
>   	chip.rs \
> diff --git a/bindings/rust/libgpiod/src/chip.rs b/bindings/rust/libgpiod/src/chip.rs
> index f4554a116946..f4de008b5048 100644
> --- a/bindings/rust/libgpiod/src/chip.rs
> +++ b/bindings/rust/libgpiod/src/chip.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   pub mod info {
>       /// GPIO chip info event related definitions.
> diff --git a/bindings/rust/libgpiod/src/edge_event.rs b/bindings/rust/libgpiod/src/edge_event.rs
> index d8404952b0b0..d324ce675df8 100644
> --- a/bindings/rust/libgpiod/src/edge_event.rs
> +++ b/bindings/rust/libgpiod/src/edge_event.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::time::Duration;
>   
> diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
> index 0675ea6c5181..1deaf2bc3983 100644
> --- a/bindings/rust/libgpiod/src/event_buffer.rs
> +++ b/bindings/rust/libgpiod/src/event_buffer.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::ptr;
>   
> diff --git a/bindings/rust/libgpiod/src/info_event.rs b/bindings/rust/libgpiod/src/info_event.rs
> index 8bd558532095..b0ceb3b26f78 100644
> --- a/bindings/rust/libgpiod/src/info_event.rs
> +++ b/bindings/rust/libgpiod/src/info_event.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::time::Duration;
>   
> diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
> index 8073bd440bf4..26354e5b4eee 100644
> --- a/bindings/rust/libgpiod/src/lib.rs
> +++ b/bindings/rust/libgpiod/src/lib.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   //
>   // Rust wrappers for GPIOD APIs
>   
> diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
> index a2721a20e4fa..e973cde4a2fa 100644
> --- a/bindings/rust/libgpiod/src/line_config.rs
> +++ b/bindings/rust/libgpiod/src/line_config.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use super::{
>       gpiod,
> diff --git a/bindings/rust/libgpiod/src/line_info.rs b/bindings/rust/libgpiod/src/line_info.rs
> index b45878c523c9..702f1b478dec 100644
> --- a/bindings/rust/libgpiod/src/line_info.rs
> +++ b/bindings/rust/libgpiod/src/line_info.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::ffi::CStr;
>   use std::str;
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> index ebf41f240ae2..b175eea3217e 100644
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::os::unix::prelude::AsRawFd;
>   use std::time::Duration;
> diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
> index 1c5ac66f9ce7..918d6c26f27e 100644
> --- a/bindings/rust/libgpiod/src/line_settings.rs
> +++ b/bindings/rust/libgpiod/src/line_settings.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::time::Duration;
>   
> diff --git a/bindings/rust/libgpiod/src/request_config.rs b/bindings/rust/libgpiod/src/request_config.rs
> index 2ad68efdd12a..0c6c5c1d8275 100644
> --- a/bindings/rust/libgpiod/src/request_config.rs
> +++ b/bindings/rust/libgpiod/src/request_config.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::ffi::{CStr, CString};
>   use std::os::raw::c_char;
> diff --git a/bindings/rust/libgpiod/tests/Makefile.am b/bindings/rust/libgpiod/tests/Makefile.am
> index 198f4e4dfe4c..8927649d07e0 100644
> --- a/bindings/rust/libgpiod/tests/Makefile.am
> +++ b/bindings/rust/libgpiod/tests/Makefile.am
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = \
>   	chip.rs \
> diff --git a/bindings/rust/libgpiod/tests/chip.rs b/bindings/rust/libgpiod/tests/chip.rs
> index 702af93e5f2c..f2647084aaab 100644
> --- a/bindings/rust/libgpiod/tests/chip.rs
> +++ b/bindings/rust/libgpiod/tests/chip.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/common/Makefile.am b/bindings/rust/libgpiod/tests/common/Makefile.am
> index 4cfc3555229b..6a32db427ecc 100644
> --- a/bindings/rust/libgpiod/tests/common/Makefile.am
> +++ b/bindings/rust/libgpiod/tests/common/Makefile.am
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>   
>   EXTRA_DIST = config.rs mod.rs
> diff --git a/bindings/rust/libgpiod/tests/common/config.rs b/bindings/rust/libgpiod/tests/common/config.rs
> index 36ccc948860e..7bb1f659a928 100644
> --- a/bindings/rust/libgpiod/tests/common/config.rs
> +++ b/bindings/rust/libgpiod/tests/common/config.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   use std::sync::{Arc, Mutex};
>   use std::time::Duration;
> diff --git a/bindings/rust/libgpiod/tests/common/mod.rs b/bindings/rust/libgpiod/tests/common/mod.rs
> index 5f725c61f905..586115b5accb 100644
> --- a/bindings/rust/libgpiod/tests/common/mod.rs
> +++ b/bindings/rust/libgpiod/tests/common/mod.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   #[allow(dead_code)]
>   mod config;
> diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
> index 45c1cfc09022..03b7e7cb05f7 100644
> --- a/bindings/rust/libgpiod/tests/edge_event.rs
> +++ b/bindings/rust/libgpiod/tests/edge_event.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/info_event.rs b/bindings/rust/libgpiod/tests/info_event.rs
> index f06dd2d2dd67..c969af782383 100644
> --- a/bindings/rust/libgpiod/tests/info_event.rs
> +++ b/bindings/rust/libgpiod/tests/info_event.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/line_config.rs b/bindings/rust/libgpiod/tests/line_config.rs
> index b5a04ef8949a..7fccf8cc3daa 100644
> --- a/bindings/rust/libgpiod/tests/line_config.rs
> +++ b/bindings/rust/libgpiod/tests/line_config.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/line_info.rs b/bindings/rust/libgpiod/tests/line_info.rs
> index 9e4928b49682..ce66a605b8f4 100644
> --- a/bindings/rust/libgpiod/tests/line_info.rs
> +++ b/bindings/rust/libgpiod/tests/line_info.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index d60e15a7a106..d49874f77ac9 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/line_settings.rs b/bindings/rust/libgpiod/tests/line_settings.rs
> index de2148ee6018..1aaa6b44ed63 100644
> --- a/bindings/rust/libgpiod/tests/line_settings.rs
> +++ b/bindings/rust/libgpiod/tests/line_settings.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
> diff --git a/bindings/rust/libgpiod/tests/request_config.rs b/bindings/rust/libgpiod/tests/request_config.rs
> index d78c4bddc443..a925a6833105 100644
> --- a/bindings/rust/libgpiod/tests/request_config.rs
> +++ b/bindings/rust/libgpiod/tests/request_config.rs
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: Apache-2.0 OR BSD-3-Clause
>   // SPDX-FileCopyrightText: 2022 Linaro Ltd.
> -// SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +// SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>   
>   mod common;
>   
