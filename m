Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C9662D932
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 12:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239768AbiKQLQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 06:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239689AbiKQLP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 06:15:58 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9D1CCB
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:15:57 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id t14so1163412vsr.9
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 03:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QU0nSJpD9ka9k8qpAWYKUoxPSuG3FpjCq7CoLXEwtfM=;
        b=vbIDvXSCBP/n20uZKOJFzxEktFeddxaJxfntOT7UUZGdnbYbaLU35Kaw7cuTi+PUDV
         ax4glYQ25XgZL2gOwUOA74iOi1jmfbrx80XwZZ0+FQ+ytQJU+JSeSd/RMYJR/g4jA/A/
         5rNlD9awE/IYltBhcVDG6OXDrp/lJRbpullmzC9dDJEc/WWZlWBKFn0SsBBmkaVGqo2t
         pk927Ev86zFzaiS7AVLHCFh1fbKTdzPedfzUHbaXwNKeyDd7QnTVY77PUdzJY6ummIIr
         SFlVvBJfVvdEUmaNI3qABKRdqABIs8aD95E45cD/JAQcdW4NMcE2TonNaq4qB3ft5ZeW
         ilnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU0nSJpD9ka9k8qpAWYKUoxPSuG3FpjCq7CoLXEwtfM=;
        b=7xMD0gPDAHBT5JDZuAQ1T8DYjSEoyH+npepiFQmXhUsFpKVCMVwGUItjHUyqzJcEfC
         guneLJJqdLHLS75TNkKCqD3DVa+4yrTf8NgBfJqtlnwgVjiL49StNaSn+zUwXoLjEnGM
         AEvXnSAdGcyQj33zJ7sc9LC7C5HoQmlEivVzGDe3WbDFhCVqvi6R6BHkiOHMueGM5k/H
         Z7GMr11qV7wevQw2I39awNC65gynY7DEVJTv34AFDxtCNrrn+gL/wA1ftY1lth04VWw/
         DUHNMat3xyU6jtGpo1XXIdtSsDfF+phSa/j0LdSvpeHTN2tVYBlyVjz/dnMa1Ip/7VWJ
         T+nw==
X-Gm-Message-State: ANoB5pkh2wMauCJmP3A33Cv4eyj2XFPszjA+oTeS6syCaF2+ZH2grQNs
        sTPltf1DW+KeZLhnStlqlvw2dzzjxhf0YyCqduSihg==
X-Google-Smtp-Source: AA0mqf4yStYnVmBdvxAEEPlkc+MTofFbbOa+Uj2n8uEGr8nndvakzZRgbHwgOngKHxnz1fBI0s6Z+1uQ+vGEUJa+F1s=
X-Received: by 2002:a67:fbd6:0:b0:3ac:38c7:1bdd with SMTP id
 o22-20020a67fbd6000000b003ac38c71bddmr1330885vsr.9.1668683756848; Thu, 17 Nov
 2022 03:15:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
In-Reply-To: <CANiq72nxJn3F0hvWerUJvbgRjfyutQ=CCnpNqfMOEBumX62_SQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 12:15:45 +0100
Message-ID: <CAMRc=McUTqUJzV-9yEA-7LxrQ8ktWzaPMv+x-1mOLZ0M2W+uJg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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

On Thu, Nov 17, 2022 at 12:07 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 17, 2022 at 10:56 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 17-11-22, 10:06, Bartosz Golaszewski wrote:
> > >
> > > Just use regular SPDX header at the top of the file in a # comment block?
> >
> > Miguel ? Kent ?
>
> In the kernel at least, all files (including docs) should have an SPDX line.
>
> However, configuration files which use a publicly documented format
> (things like dot files) are not copyrightable apparently, and it was
> proposed that the `scripts/spdxexclude` kernel script excludes those
> [1], but the patch has not been merged (yet?) since I raised a couple
> questions about how to handle those (sorry...).
>
> So I am not sure if e.g. `Cargo.toml` should have a SPDX license
> identifier or not.
>
> [1] https://lore.kernel.org/lkml/20220516102615.884180377@linutronix.de/
>
> Cheers,
> Miguel

Ha! I wasn't even aware of this spdxexclude and spdxcheck mechanism.
What does spdxcheck do better than reuse lint other than having its
own ignore list?

I'm not sure I want to import it into libgpiod though.

Reuse docs say:

---
You probably will have files in your project that you do not find
particularly copyrightable, for example configuration files such as
.gitignore. Intuitively you may not want to license these files, but
the fundamental idea of REUSE is that all your files will clearly have
their copyright and licensing marked.
---

So I'd say - just use CC0-1.0 license in Cargo.toml?

Bart
