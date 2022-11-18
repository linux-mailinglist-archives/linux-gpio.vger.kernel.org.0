Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACE162F14F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbiKRJgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiKRJgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:36:06 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE1CA47E
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:36:03 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id y13so4369092pfp.7
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 01:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMpH9QrMmZcD/iw8g7zfLIcvd9qzkR0/JcRk7BBC/tA=;
        b=Xu78wYvixMCcCkwuUqfubwygNwbVnSAHygf58D81Lc3X7zyLqRDtTW94vMn8kdC/0k
         AdTQiu9e7lO04BOOrKcq0EZAAO96Jl/2jvpijm5kX5EfITl1DWTbErsHGVGoEeabxMaL
         u5+NONdGv6rHucaTsZXZwL2SBdHjKYTkJTmOOlOhjhNBI6ijwC3wCxwVlg5NRvm40nJH
         cwV/areEzihw7d9zTSx7Vs3bXjBGRKjrm+L9EDCwTb3MDOqMbAPfoRf48MCAttZUsYAO
         WQAR1hT58zfvWl9VYxKmdDYBN2uglwYG8qzG8cS2e/dQVYpB275UhKfXqx+HN75ygLpb
         jm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMpH9QrMmZcD/iw8g7zfLIcvd9qzkR0/JcRk7BBC/tA=;
        b=DWmCiQRfKDbAEPWOu2pSesVCd5C/5hQFHGgBRagQgkB2RrHzzbIQ/U++XZEWuzfvVa
         X1bMlHA0qINJxPfaXX4kuGGy0ahMAlMKfzDAELhDr/3a0/RA1LmW8vfp0qgGK+f62OjQ
         M51ECRpM6JMpUESPLqisg9Cl1j5UnoRFZlrbXw/+GOuN4VgmCipl/5qLQAhCEGeu4v6G
         JbgFThRU2qsU45/CBeW5KxU8v1qjFjNJNN+Lu3djuOR6NhAFHPc8DktzGYAZu0H3g8iu
         m+hbnH8mlGAlcly9XAqhXtGUQXIZkSxc9y3IN0ffH+H8LdJzNB75NRkmYjmgTl5PeR8n
         TtgQ==
X-Gm-Message-State: ANoB5pl1FOPda0dEU2oeJK246tl6zSNF5T2IUOktSZy8Q3q68FtSL9VW
        cq5/FUXXSdsuEhGTxbA4sKIE8g==
X-Google-Smtp-Source: AA0mqf6TuHjmiq21/1AYgbe+JxVlZpkN8xeKNuDSitQTJ02HdDuUvw3UCr91E5vDiNcS8dfhWjVN3A==
X-Received: by 2002:a63:165d:0:b0:473:f7cd:6603 with SMTP id 29-20020a63165d000000b00473f7cd6603mr6037958pgw.336.1668764163207;
        Fri, 18 Nov 2022 01:36:03 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id u5-20020a170903124500b00186c3afb49esm3098403plh.209.2022.11.18.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:36:02 -0800 (PST)
Date:   Fri, 18 Nov 2022 15:05:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221118093558.hopbhda6knmoekyt@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
 <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
 <20221117112517.64fvaynvjwbcqeix@vireshk-i7>
 <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdyk4Fx5aKvjKjZSRhsSOq03wiHcMP7=Y2TG4ovWf-+zA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 13:18, Bartosz Golaszewski wrote:
> Then let's just add the SPDX identifier on top to make reuse happy.

This looks fine ?

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index 4fdf4e06ff90..85abe70b4aa5 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -1,7 +1,12 @@
+# SPDX-License-Identifier: CC0-1.0
+#
+# Copyright 2022 Linaro Ltd. All Rights Reserved.
+#     Viresh Kumar <viresh.kumar@linaro.org>
+
 [workspace]


diff --git a/bindings/rust/libgpiod-sys/README.md b/bindings/rust/libgpiod-sys/README.md
index ecf75b31c41e..567891a30868 100644
--- a/bindings/rust/libgpiod-sys/README.md
+++ b/bindings/rust/libgpiod-sys/README.md
@@ -1,11 +1,15 @@
+# SPDX-License-Identifier: CC0-1.0
+#
+# Copyright 2022 Linaro Ltd. All Rights Reserved.
+#     Viresh Kumar <viresh.kumar@linaro.org>
+
 # Generated libgpiod-sys Rust FFI bindings

-- 
viresh
