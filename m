Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8525D62D8C8
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbiKQLF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbiKQLFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:05:18 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5232DA83
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:05:17 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id c12so446026uat.13
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ggRZGIQiCaDq9oNQpytrOcFJKTYzC/VlmIpTFfBUMg=;
        b=JgN91ILX9fIZ3R1rmcnHa/2ycJVaRvzbSEpv9P1pS7K9bBxVXFZGbvY6XY0zesm37M
         YWEB6Ga5tHerjXfVp9OkTWdYC8VFJXg6WrpsXlca7POKyIdk4aYFatecjNLlKX85yli4
         67AXD61eHznOBhsvbganmSiso7zZDqbR1yIWYytKWeToqBAIb/RtFFYLVqBtDP0bWlY0
         x6YUcKnpl+RzF/LFEo0cxMvpFQL0DwQqPc1gUYLsePIXevI3Jj7p5L2sW9BbsgzRkI+T
         u6o2ILzkdeEZXxAn0JzatJ+JnkSEdo/gxcgIK5dy7TEUCEG9X4mKWp/sybVjN3M0JigK
         AAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ggRZGIQiCaDq9oNQpytrOcFJKTYzC/VlmIpTFfBUMg=;
        b=XhtRJzGEJFzYytAsCoHOGI7DKNvZUe5mPGR+iwTJROUh+6PXH4Qa5fEEE7V3FLavXy
         9tORnWsTwNW+ihN1q+Yt9Qp0lGcvMiJt40PQhkRB1cyAEmhO0b8QlczQeeP94qGS2aWw
         7r0mTe3+8ny7AoBHfKJXIFAiJo2kJNHfyU/he8+SW8DZ+l3B/6tCUyHcIZ+rliZliQz4
         9Wf32LpjFStYKkrM4R7OUxqJ0/CIHm5j1B/L1BIJbtAI4o1fF9NFvPyEKIqDCAw0FW2C
         G07BmrcAyOcVfkD9X7Hk1A0UtTOE/PLZ2B0LMrOrGVtAYQUieDc9z2Bdd8rikmB7i28Z
         SyAA==
X-Gm-Message-State: ANoB5pkogo6XnUR+lySpJ+gBGxe6avI0GaSwC8L7uhbS7yX2o2fKzgQO
        H9CKsvpTeuHxLlQ+x+2YxNppr3Hwpa5cXbUL3YJDsQ==
X-Google-Smtp-Source: AA0mqf4VKA79k+Q5comIZax4KzPp2BxVp3lqXR9PJIyTtiy1Pxrz4DP4dT29+SneSQdHiGZiGF013Hh/vEjftKTcYgw=
X-Received: by 2002:ab0:5a6e:0:b0:415:715c:1e70 with SMTP id
 m43-20020ab05a6e000000b00415715c1e70mr787921uad.81.1668683116639; Thu, 17 Nov
 2022 03:05:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <20221117104006.wvpuenedh7wqsjjj@vireshk-i7> <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
 <20221117105534.shhm4ib2aukj7d3e@vireshk-i7>
In-Reply-To: <20221117105534.shhm4ib2aukj7d3e@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 12:05:05 +0100
Message-ID: <CAMRc=MdYuxK3cPHy=N3M2tRgu3y_ZQD4BJtBPy323s=9Uq3tUA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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

On Thu, Nov 17, 2022 at 11:55 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 11:48, Bartosz Golaszewski wrote:
> > Let me propose a different solution. When preparing release tarballs
> > with autotools, certain files are generated automatically that go into
> > the tarball but are never part of the repository. This way developers
> > don't have to deal with the automatically generated files polluting
> > the repo while end-users get a tarball with less dependencies and
> > reproducible results.
> >
> > It's called the dist-local hook in automake.
> >
> > Does it sound like something we could use here?
>
> These auto-generated bindings are used only by the code present in
> bindings/rust/libgpiod/src/, and are never visible to end user code.
>
> The end user will use the new interface provided by the libgpiod Rust bindings
> instead and that works over the web and will be picked from libgpiod's git tree
> or crates.io (later).
>
> Not sure how the tarball solution will work here.
>

So it already only impacts developers exclusively and not users who'd
for example want to install libgpiod from crates.io? If so then I
don't really see a reason to keep those files in the repo really.

I'm not familiar with rust-vmm containers but the fact that bindgen
support is missing or causes problems sounds like a problem with
rust-vmm and not users of bindgen, right?

Bart
