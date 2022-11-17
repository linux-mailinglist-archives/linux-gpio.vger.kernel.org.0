Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CA462D5DC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 10:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239064AbiKQJG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 04:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbiKQJGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 04:06:50 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87385A6D6
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:06:47 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id g16so502680vkl.11
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 01:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B5rO7jdSBBMGYknwso/DlaVI9Y2gorfX1CptprbJvrw=;
        b=26L88FJM3jPSgXX8t4CG3NzZeRmWhTBKkN28UEhBUcbepjL4dmZpnr970SHfQFwOjM
         zULTVtzy8GBBeolay0tiNVzFjKpHfYsw5lUp/6eyLO0VbbojeljfH9Uft5LBTInID/le
         anI0XPf6FbPQ6l1OMqzkYtZrZJnSmxXBpN/+kBr8vGXoc5u4SPm8uskf4l2YHZkuFtIK
         vKwWQ4VCjlJv0dlNV4f5Cy9dBbYg8vg7lL0lj5pzBdm7Fh0PuNDgQ+F6wFyyajH4t1xJ
         FZRc2R5WCRZ1BGGnDfvMLhcXDyfVzl1CJODBLr9SYWQ9UqkQBrSNHnBBy4vaW33WrD1M
         3z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5rO7jdSBBMGYknwso/DlaVI9Y2gorfX1CptprbJvrw=;
        b=1C9IG+AA4FCvZtycmDOJZtRFlXx+v7AtydOkFdiLVzC2T6O6Mznxg7b/uN8mrEpufi
         E9+VmkrTqXPYopDXwtZuADpP2eNzlOMmRsT4+MYcGA8JZc/lP3CyK0lzNCmqKLnUlYu8
         D3RnXLLarKPT1M8SO0AW3kIw4jqZg+TucHYC3YXC7pyzQ61AKNXKp5OpPhBfzG8MyLid
         B+8QmArb/BbV00mAKhI7DrixnNoOKe86r9HbevyZ0/hrYJWXGYgMuvCwbOid/TlOWDfe
         /Bh2rajJCsoOxUMT6cpmg7tAH4J6Fbw3PPzpvVundq9sRXS6+ebYO32rU+RBSBsiT7Ec
         rKVg==
X-Gm-Message-State: ANoB5pm0HiW4dERhcvFWQipy+cHz5MhSC3t71p60RVy8r8ouT8eOwabY
        aD0O/kH6dUlK8ehSdzdD9mx6bEJ/cWFHeVoTG8C9tg==
X-Google-Smtp-Source: AA0mqf6T8nbMsk3lXcGU85u0Ku2dGM/ojQSCg6509oUXZlHMXM77b1RS9DksKsFSCXCUsc7b291XdPWcredIj1Ls8Zc=
X-Received: by 2002:ac5:cbe4:0:b0:3b7:3aca:9868 with SMTP id
 i4-20020ac5cbe4000000b003b73aca9868mr702906vkn.33.1668676006897; Thu, 17 Nov
 2022 01:06:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
In-Reply-To: <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 10:06:35 +0100
Message-ID: <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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

On Thu, Nov 17, 2022 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 16-11-22, 11:29, Bartosz Golaszewski wrote:
> > Hi Viresh,
> >
> > There are some licensing issues I noticed now: can you make sure
> > `reuse lint` doesn't return errors for rust bindings?
>
> I have fixed couple of those now, but there are few which I am not sure about.
>
> # MISSING COPYRIGHT AND LICENSING INFORMATION
>
> The following files have no copyright and licensing information:
> * ../../bindings/rust/Cargo.toml
> * ../../bindings/rust/gpiosim/Cargo.toml
> * ../../bindings/rust/gpiosim/README.md
> * ../../bindings/rust/gpiosim/src/bindings.rs
> * ../../bindings/rust/libgpiod/Cargo.toml
> * ../../bindings/rust/libgpiod-sys/Cargo.toml
> * ../../bindings/rust/libgpiod-sys/README.md
> * ../../bindings/rust/libgpiod-sys/src/bindings.rs
>
> File types:
> - Cargo.toml
>
>   Most of these have a different style for versioning, though the workspace
>   specific files doesn't have a version set. I checked few other projects and
>   they didn't mention it as well.
>

Just use regular SPDX header at the top of the file in a # comment block?

> - README.md
>
>   Here also version is mentioned differently (added now), based on how I found
>   it elsewhere, i.e. towards the bottom of the file.
>

The main README.md just has a regular header at the top of the file.
I'm fine with this. I guess the bottom of the file is good too.

> - bindings.rs
>
>   These are automatically genrated files, with bindgen. Not sure if we should
>   edit them to add Licensing info.
>

Can we not generate them at build-time then? When I was first flirting
with implementing a dbus daemon for libgpiod, I used gdbus-codegen to
generate dbus bindings from xml but I generated them at build-time
instead of putting them into the repo. It would also shrink the
release checklist for rust if we didn't have to manually regenerate
them.

Bart

> > One other thing is the license of the rust bindings themselves - I'm
> > not a lawyer but it seems to me that if you link against LGPL code
> > statically, your code must be licensed under an LGPL-compatible
> > license. It seems that BSD-3-Clause and Apache-2.0 are compatible but
> > it would be great to have someone knowledgeable comment on that. Is
> > there anyone at linaro we could contact?
>
> Hmm, not sure. Cc'ing Arnd, in case he can help.
>

I think that's been clarified by Linus below. We should be good.

Bartosz
