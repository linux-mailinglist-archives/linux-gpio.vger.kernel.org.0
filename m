Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B5862F165
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242010AbiKRJjY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242019AbiKRJjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:39:16 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BBC942D4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:39:03 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id k67so4195958vsk.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w5mWfKJ5tV1q91srDAalpmazodMqeebNiTHJu3364PY=;
        b=anq9w6F4O0wMPMCkzkMd5NgfjaR+HlqfYP9F/zQ6U+R0kHHs5vKX99eerupITh9iUo
         GyV73FQ37s3PyvI8nkwsXJc/PBCvgc6/ULg/JW9yqdJLLO5QC77+IJLxWGetdhK2H1If
         nma1qLbrM4zXu9NMaxCXWiIW0uwAsgqcQ9Ljos1hAXwl3xvddW6xg65dFgXOxhKQFlmy
         d/9ypzELp/5HjAhPkl5YCpucqcy8hlhC8XJTXrYdjqSztKBUMhxe9hGcK7l6tsCGH5Mn
         YRBSEYf8YjwiCeMgXBpLVgT5H+J/xi7+OvqXvLbhPJVCXLCQDOGSuXPjHz1ewl/bdqkF
         mPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5mWfKJ5tV1q91srDAalpmazodMqeebNiTHJu3364PY=;
        b=1vckMpKrhk4Ciroh/WKo6/ZfUo6ohk9f4PzkmsNGU12XZwK6enrapDgbXMlvmx4gu4
         kr1VCibyg+ZrKS3QUytCNcRdkgo2qI2Ibta1rG4QqX73720oymKH2RZrKbjSbTgTb7H/
         bwbWgVE2SrKsgvuedofRlU2v+y0fdPdQT3iLFc0aR8YLbQk87YEmx9xmzB4n+eW1Mlbh
         VCtOlQ9Rc7VbQCcwn9ueSdF3wxYMtyIRoBnUpp/VT/GdBO2uqjEQi4WpbnrdLF3QWH70
         nLnZkKUQvVUZIRZohDtBqojxAEoRqqPayrob1xwG3ffgNeBs9wBXx9ZlRkvY2yjcY22X
         Vn9A==
X-Gm-Message-State: ANoB5pk35si814Kd5xyCsBGsqfDhGL5qbB6hdR5fu7k6pVVZHuav5Y8c
        EBYKlR9uM4EA/TqETLTS5vkhnVOGc4woxr6wKB+xfw==
X-Google-Smtp-Source: AA0mqf4x6zodYsMECm36LsrhPFT7pPZ35/Qhi6u42wAKXJXFR3li3pkfzrcOGQNRLtTR/rdH2DFpNCHdwrOFjYnODWw=
X-Received: by 2002:a67:d285:0:b0:3aa:c58:66 with SMTP id z5-20020a67d285000000b003aa0c580066mr3869811vsi.47.1668764342431;
 Fri, 18 Nov 2022 01:39:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
 <20221117112517.64fvaynvjwbcqeix@vireshk-i7> <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
 <20221118093558.hopbhda6knmoekyt@vireshk-i7>
In-Reply-To: <20221118093558.hopbhda6knmoekyt@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Nov 2022 10:38:51 +0100
Message-ID: <CAMRc=Mf8c8sen+8_76POGjCzTea-SK-DBPJOdGH7MCvTzWjFPw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 10:36 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 13:18, Bartosz Golaszewski wrote:
> > Then let's just add the SPDX identifier on top to make reuse happy.
>
> This looks fine ?
>
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index 4fdf4e06ff90..85abe70b4aa5 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -1,7 +1,12 @@
> +# SPDX-License-Identifier: CC0-1.0
> +#
> +# Copyright 2022 Linaro Ltd. All Rights Reserved.
> +#     Viresh Kumar <viresh.kumar@linaro.org>
> +

Should be:

# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2022 Linaro Ltd.
# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>

>  [workspace]
>
>
> diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
> index ecf75b31c41e..567891a30868 100644
> --- a/bindings/rust/libgpiod-sys/README.md
> +++ b/bindings/rust/libgpiod-sys/README.md
> @@ -1,11 +1,15 @@
> +# SPDX-License-Identifier: CC0-1.0
> +#
> +# Copyright 2022 Linaro Ltd. All Rights Reserved.
> +#     Viresh Kumar <viresh.kumar@linaro.org>
> +
>  # Generated libgpiod-sys Rust FFI bindings
>
> --
> viresh
