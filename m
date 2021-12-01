Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6895464C5A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 12:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348855AbhLALLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 06:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242684AbhLALLr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 06:11:47 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CAEC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 03:08:27 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id r11so100167569edd.9
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFNScvSh6LbU6k+5BwU0cV7Unq9VgPStW8vYQAq4SmQ=;
        b=mF/qj2yBPqWjFhj5BOBYoBeNiiaVI7bYNiHC+4vfO5z+iXtVzduHOWoFNPrwEnNa21
         fTkVVpOM5OnNLQrP9n9pjrEQHEn0bVCzmfvlIA+0wkFOOJSzotL8hMJkLX852WROAMQU
         Wx3FQRfCOAwzQEdQ3qSsQ6WLOZGbWT1D44gQ3unQd7k6XrzOWJdgAp9c1Qv3eVFzdhxl
         Yxbl4QKzhZzClByuhfnvz8PL+ptOokhaSL7j72MNpeUR5RDi+JHUu+D76/g2OpNK9S2j
         Z+LPczJ0t6qr3GqJN8asT7GPMvEkfe+raCuniK1F+Qb0Ww+Qc7b7gXb9wq1VKBuSqjE+
         6lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFNScvSh6LbU6k+5BwU0cV7Unq9VgPStW8vYQAq4SmQ=;
        b=wG/BcxsN89UbykAt3x3qcx9km3p845Mqe2FZdUw2mi6+6c8xXz0NoE9IzsTmAA/Fe4
         BZPBH+eHuHwOwy0YEqDcGYq1a5t7EFzOgweNpfuJgMXllEUd0xwzthVJuVkcpz/aSBKi
         zYh3zTevgnneNjdZ/FYUhdWnDjuTSjsgd4Vo7hTm4IDiIt7828bplg9tHmSEA70m/ePA
         Q6nqcLY4eNgw8LkRJRRs3GKtesyuRudXmJtvj0w6NSK4tJM6UlFJVTYjTqEGxWGY7ie3
         nfmPzcc5zMl0wz0CO4ui8pEgfI3dG1TUO5JUypCnjmxaMjcZJ/adU9rstLsdl0fXdNZg
         7H5Q==
X-Gm-Message-State: AOAM531zxLOH/Q7sQZP9rsjNw+lQqLENetD4D6EysaiMsDEVOxRwpotf
        gHhM+AB62H1WiRV10tiBNoNEgyrPTxPywdBdzVziVgmJF+nHGphN
X-Google-Smtp-Source: ABdhPJwjxxF68zK7hGvae+4bw2agFbW9NEvgRvs0AbrVNuviLObhyZTr94QwqfYcg3jb0USx9DMxzBEsNVcmU5bBXpA=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr7478666edd.365.1638356905541;
 Wed, 01 Dec 2021 03:08:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638182138.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1638182138.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 12:08:14 +0100
Message-ID: <CAMRc=Meof=kMOXWFmgueOMMZWLMr=t0X=MYr4_3f=Ct+zStC7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 29, 2021 at 11:42 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Bartosz,
>
> This patch adds rust bindings for libgpiod v2.0, this is already partially
> tested with the virtio rust backend I am developing, which uses these to talk to
> the host kernel.
>
> This is based of the next/post-libgpiod-2.0 branch.
>
> I haven't added any mock test for this as of now and I am not sure how exactly
> am I required to add them. I did see what you mentioned in your patchset about
> mock-test vs gpio-sim stuff. Rust also have its own test-framework and I am not
> sure if that should be used instead or something else.
>
> Since I am posting this publicly for the first time, it is still named as V1. I
> have not made significant changes to the code since last time, but just divided
> the same into multiple files.
>
> --
> Viresh
>
> Viresh Kumar (2):
>   libgpiod: Generate rust FFI bindings
>   libgpiod: Add rust wrappers
>
>  .gitignore                          |   6 +
>  bindings/rust/Cargo.toml            |  14 +
>  bindings/rust/build.rs              |  60 ++++
>  bindings/rust/src/bindings.rs       |  16 ++
>  bindings/rust/src/chip.rs           | 197 +++++++++++++
>  bindings/rust/src/edge_event.rs     |  78 +++++
>  bindings/rust/src/event_buffer.rs   |  59 ++++
>  bindings/rust/src/info_event.rs     |  70 +++++
>  bindings/rust/src/lib.rs            | 268 +++++++++++++++++
>  bindings/rust/src/line_config.rs    | 431 ++++++++++++++++++++++++++++
>  bindings/rust/src/line_info.rs      | 186 ++++++++++++
>  bindings/rust/src/line_request.rs   | 218 ++++++++++++++
>  bindings/rust/src/request_config.rs | 118 ++++++++
>  bindings/rust/wrapper.h             |   2 +
>  14 files changed, 1723 insertions(+)
>  create mode 100644 bindings/rust/Cargo.toml
>  create mode 100644 bindings/rust/build.rs
>  create mode 100644 bindings/rust/src/bindings.rs
>  create mode 100644 bindings/rust/src/chip.rs
>  create mode 100644 bindings/rust/src/edge_event.rs
>  create mode 100644 bindings/rust/src/event_buffer.rs
>  create mode 100644 bindings/rust/src/info_event.rs
>  create mode 100644 bindings/rust/src/lib.rs
>  create mode 100644 bindings/rust/src/line_config.rs
>  create mode 100644 bindings/rust/src/line_info.rs
>  create mode 100644 bindings/rust/src/line_request.rs
>  create mode 100644 bindings/rust/src/request_config.rs
>  create mode 100644 bindings/rust/wrapper.h
>
> --
> 2.31.1.272.g89b43f80a514
>

Hi Viresh!

Thanks for the hard work on that. Before I even dig into the patches
themselves, I'd like to clarify a couple things (because I'm still not
sure we're on the same page) and the projected timeline for v2.

#1. The v2 API is obviously not stable yet and we're still reworking
certain structures (like line_config's accessors). This means I can't
merge the bindings just yet but I'm fine with taking them in for v2
given that the missing elements are added, which brings me to:

#2. If you look at the existing bindings, you'll notice they all have
tests implemented. These tests use the combination of whatever testing
framework was chosen for a given language and a wrapper around
libgpio-mockup that allows to use the gpio-mockup kernel module to
instantiate simulated GPIO devices. I'd like to see a comprehensive
test suite for the rust bindings too before they get into the repo.
Except that:

#3. The development of other parts of the project is currently blocked
by the gpio-sim development in the kernel. I don't want to reuse
gpio-mockup in v2 because it's simply badly designed. Currently the
v11 of the gpio-sim series[1] (based on configfs & sysfs) is on the
list and only once it lands in mainline, will we be able to advance
the tests for the C, C++ and Python interfaces. This is when the rust
tests should be developed too by following what other parts of
libgpiod do: providing a wrapper around the future libgpiosim (a
wrapper around gpio-sim configfs/sysfs interface that I'll implement
once gpio-sim is in next) and then using whatever testing framework
for rust is preferable.

#4. This one is something you could already add at this time: other
bindings contain the examples directory. Inside there are simplified
reimplementations of the gpio-tools. It would be very useful for me
(as someone not very fluent in rust) to see how those bindings are
used in practice. Could you please add it?

Thanks!
Bart

[1] https://lkml.org/lkml/2021/11/30/898
