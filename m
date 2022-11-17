Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B251262DAF7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 13:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239889AbiKQMeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 07:34:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240198AbiKQMdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 07:33:20 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA0E6325
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:32:46 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id a6so1362745vsc.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ho1BHb7t/yZlzbbn3WaXvDZ8tjFZ8sHvOp6SzvbHeeU=;
        b=ly34yopELHJkCvg8ZMvDLd7tjliQyJWZHBMIyN3ZuJ4ETennOzqBdRKl1gjWAupJSO
         M5v3Hdfr5cIpbrt1VBfObQCuKg/8TpcmVRBEp2RbOQ6M4zprbS6q8OGFwst+VbcRyvdj
         +DxPzWp68H0b0EKvB+rva89cN8MNbcXLapcYSgyLCZ5PpwJq6CijLDZ4+DbE1TKJnuhC
         W8ewMMhB/FdIO2GpbkXFR/cjbU/1oxcHXzp7esTbDF3s6WLtV/gkFded3GKG4dR6uyYk
         NsJkKlgpL0yf/PSUSOtL0d8u1gyODfbAR2fYjg16i/qzfzuL0wdEdBebsKnMY8cxUX8c
         /M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho1BHb7t/yZlzbbn3WaXvDZ8tjFZ8sHvOp6SzvbHeeU=;
        b=4rQ+qh3NezEFXGal2giydAmRxm7EsPM/C/lofrF0bzpxPdLFVUM0WPkeq4fydNDC/h
         e1K7QvV9zxUj1pCtChYncyOJLiOa8FIGLkLP3K6jMrbGupxCBB+wDdaV+a/sxk8uiVmw
         snZ5k04bJj6bcp0Z8zAUpp5mzFN7FyLdNmrlcSxtj0Wun2I9j534zkjOoL28v4ovPiAD
         W63YCRbdJJT0GSAJFy00MtQK5X092Ji57U5xqAISNEv8rHO+EIi+cgNh4h0wUygkTQ7y
         5/busNfAC2YDJg+VbfLF5wJ0Js54kahQY1XXT9h9+YTr0AoD4GwPch2jeGlnBC2j805z
         bTaw==
X-Gm-Message-State: ANoB5pldXUWwD1KUfdLuGP6XRD563PV4y4c4elsypZvMmRq89hrqgE3R
        NX5yY6UdPKYxOcihGv7JCaR738Q7z9ZpiIQT4p3bLQ==
X-Google-Smtp-Source: AA0mqf7HfYeMvoSE4svtl+wBJYZ6GWWDItpCoFWqy0AIiWLiVfHAAc+G7PvyvuPmIx2J7JMv6CJ5N/9Ja28TyIjq3dE=
X-Received: by 2002:a67:fd19:0:b0:398:6504:9ece with SMTP id
 f25-20020a67fd19000000b0039865049ecemr1513174vsr.16.1668688366051; Thu, 17
 Nov 2022 04:32:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1667815011.git.viresh.kumar@linaro.org> <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7> <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7> <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
 <20221117104006.wvpuenedh7wqsjjj@vireshk-i7> <CAMRc=Me3NBDicrTenfsZ97+T28QwQL8SfZsM=ECM=i=1sqHr+g@mail.gmail.com>
 <20221117105534.shhm4ib2aukj7d3e@vireshk-i7> <CAMRc=MdYuxK3cPHy=N3M2tRgu3y_ZQD4BJtBPy323s=9Uq3tUA@mail.gmail.com>
 <20221117111551.4w7zp6wfwwirps2t@vireshk-i7>
In-Reply-To: <20221117111551.4w7zp6wfwwirps2t@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Nov 2022 13:32:35 +0100
Message-ID: <CAMRc=Md_F8wd_oO3ZMxWZDZDaC0W_gOTSJ_rT1vANvREYtjXjQ@mail.gmail.com>
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

On Thu, Nov 17, 2022 at 12:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 17-11-22, 12:05, Bartosz Golaszewski wrote:
> > So it already only impacts developers exclusively and not users who'd
> > for example want to install libgpiod from crates.io? If so then I
> > don't really see a reason to keep those files in the repo really.
>
> Users are impacted in the sense that they will be forced to build the bindings
> using bindgen now, automatically of course. It is an extra, time consuming,
> operation which can be avoided. For rust-vmm projects, every pull request
> results in fresh rebuild of the entire crate, which would mean two additional
> bindgen builds too, just for gpio now. It isn't a huge problem, but it is time
> that could have been saved.
>

If build-time is the only issue then I vote for automatic generation
at build-time and not storing those files.

> > I'm not familiar with rust-vmm containers but the fact that bindgen
> > support is missing or causes problems sounds like a problem with
> > rust-vmm and not users of bindgen, right?
>
> Yeah it can be, but IIUC, in the Rust world, more often than not such bindings
> are pre-generated, as this basically is Rust code only. These bindings will
> only change if we make a change to the gpiod API.
>

Leaving space for maintainer errors when preparing releases I suppose.
I don't know what the reason is for the Rust world to go that way but
more often than not, files that are generated automatically are not
checked in into repositories. This is my experience from working with
Qt, GLib or the linux kernel (flex and bison files generated by
kconfig).

> Perhaps that's why I was asked to avoid generating the bindings there, but I can
> ask again and try fixing the rust-vmm containers if it doesn't work.
>

Yes, if there's no show-stopper then let's generate the files at
build-time which also fixes the licensing issue.

Bart
