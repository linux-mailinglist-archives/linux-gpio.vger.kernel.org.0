Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136A162D795
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239475AbiKQJ6B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239480AbiKQJ5j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:57:39 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497FF7C01C
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:56:13 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so5641436pjt.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LJw3PGLX/a19XUZyvHK4/qrCaVYfjCnQK616vmrq8E=;
        b=We9Dfni4FcfHdX39ZFoShdRXPd0YJ3wjYpIdFw6H+ysMFUyfb1lBzXGXzmfOGCNu/z
         7d2hWa0mpigvMxT7ZjFu1C3ThZzJf4MF0AXx2JA+VoE0SRIOam6rBv6eAFzUNNwbaLiJ
         LRxwKjZHJzybO80Hqe8tS8WN2oTMfVb6bmA+bS2vyy6VG9ObBpoxnCw4qID+82L8szy+
         OgqrR1Qq7wICCgCmzCpyNsN7EUI85adPzhiZPrp3pJ3QVlxD7+V7P4dj7ZtTokilfRQJ
         PLUT6XkEiTXWacmt1VSF1GD7ANyIE5xVnA0Wbi8aKuYNkNDQZaBrfHKl6YGNT6QfIrkT
         8aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LJw3PGLX/a19XUZyvHK4/qrCaVYfjCnQK616vmrq8E=;
        b=TB/OhY9bdCFVSgc3n4pVb2S5SSmx6mzi5ew5rbAYnTEshWVoIV0KTLEI/CfZc5tS+Q
         cOcBb7cyj4lblPajWLsvT7P2I/Vjns30ya4yH7HDUTK0gnjWGU/GkOvMxJyZVEC841SA
         ij3BtgejFPNwCVt1MepII1u49iQwOx0fuukl60SttmxGmgj9Wbw4zsSjDyYXOG6ifsNO
         /EMiQZlYiy/Qiyh4ifYI25KD5mBOZFh2DdQj+ZB91r0/PncMg1zuCw0YNJyfHdGoFlv8
         c/Shiomra4OSMAirdxwYIhivWYCqVElGLrVh5MOp63cIwtw5wVE40O+hz3MDgFuB92JR
         bHwQ==
X-Gm-Message-State: ANoB5pmAml+7TOgJamPYMfcxptuBLlP9F7LxTkkB7NjUhLE8fNC0vlu3
        HaxepEjqLfHokTMl8eJirDUARA==
X-Google-Smtp-Source: AA0mqf5dVWXib26h8TEKmbPAZwC2xjgNOplC9QJWVf+PtPukU790CId89q1pR9KduDKB3pnDBHAM7w==
X-Received: by 2002:a17:903:48f:b0:188:53bd:878a with SMTP id jj15-20020a170903048f00b0018853bd878amr2101051plb.12.1668678972587;
        Thu, 17 Nov 2022 01:56:12 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090a5e4a00b002086ac07041sm475132pji.44.2022.11.17.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 01:56:11 -0800 (PST)
Date:   Thu, 17 Nov 2022 15:26:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 10:06, Bartosz Golaszewski wrote:
> > File types:
> > - Cargo.toml
> >
> >   Most of these have a different style for versioning, though the workspace
> >   specific files doesn't have a version set. I checked few other projects and
> >   they didn't mention it as well.
> >
> 
> Just use regular SPDX header at the top of the file in a # comment block?

Miguel ? Kent ?

> > - bindings.rs
> >
> >   These are automatically genrated files, with bindgen. Not sure if we should
> >   edit them to add Licensing info.
> >
> 
> Can we not generate them at build-time then?

We can, and we do when we do "cargo build --features=generate".

There are reasons to keep them merged though. It lets the users avoid generating
them on the go, like the vhost-device [1] crate in my case. I also faced issues
with the rust-vmm containers, where vhost-device stuff gets auto-tested, in
enabling bindgen support and finally went back to keeping them generated in
advance. This is also the normal practice it seems, from whatever I have seen
from the rust-vmm community at least.

Maybe then add the header manually to them ?

-- 
viresh

[1] https://github.com/rust-vmm/vhost-device
