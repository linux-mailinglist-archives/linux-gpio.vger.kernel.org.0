Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C41304D7B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 01:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732210AbhAZXJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 18:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389432AbhAZTIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 14:08:54 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C735CC06174A
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 11:08:13 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id w1so24503175ejf.11
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ccncod4bJ72tcGcy7W1/RKUQfGbg1f/NFT4D3fRxO50=;
        b=yEYdB7vsEehLKEZC2ypXX0M42F4dJ3KGTo3pasLpV495AsHFNvYpn91cR8wDxCPZz9
         8auip/3OOarJfZC9X/KwcSyFdjx/0WG1wExuts04bUNAeHQVB30ULQqdu4TIHgOeO0ir
         a01lMvlZH3bcrZwRrXgAcPs3I0KDIsCf60uJ0JXYfkAMsJKFWtZdEd9tYIfLau2vwW/W
         Dj1CzGtwF4k2yNjJ466EehQZHkaez7C6W/yDcHJzouSrozO2OgQJp0s97PSpXa+BBqD9
         9pm88HFjlpQXpzG1hfvUWSBLMbbmPN+GHxgIZuWqqHMNbrgevpWYhFGfNYCy9R/weYNw
         ZFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ccncod4bJ72tcGcy7W1/RKUQfGbg1f/NFT4D3fRxO50=;
        b=Qvms90TDfEr5eppl1tYgnoqXgYf79u7HM4ZIBGMlwI/V/K9TMC53YEGwc3K7T0TFu6
         Detao8KmwFn0CNWjqoOe0riVRM6K+rA3sEOsvozeslslxcQ7Iu6nXWJpPiRQU/mMOolX
         Evc5gF48HjDrECTF+5bpQ3y1HLfitayCvjAUqBqehU5Th/oxClo/OHHsIKsrPYhxIHQ0
         OTe7lTysOaPLO6qqtzBErZNdfa2TRX/78nrwagTpdtN6f05SfeAffWPxY+PjJrvEHgQz
         0V+FGvfqtwTX/3XRRVGlGM6XSV54gLKPe3n4hi+27SqBUvNUrMR6ii5JPPVYE3rbaRet
         o3Rg==
X-Gm-Message-State: AOAM532eCREzgqSehaDwBhttdjKNsu540XcuSb2dpXDWYwfsJxwsCYV8
        y6vq+GefcAt/m/8oMD0hLp5EoY8U+jNmNKsmzN9iLw==
X-Google-Smtp-Source: ABdhPJyoTxhQLMpU2yvgvDSgyt29JQpVwyAN40O84op4wXCsNdUUDazQbbBsPeQgeng/l8ZfzuDE12LMcJxrQxoFvlI=
X-Received: by 2002:a17:906:dfd3:: with SMTP id jt19mr4402078ejc.64.1611688092563;
 Tue, 26 Jan 2021 11:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com> <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol> <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
 <YBBNSzKHYNXki6NY@kroah.com>
In-Reply-To: <YBBNSzKHYNXki6NY@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 26 Jan 2021 20:08:01 +0100
Message-ID: <CAMRc=MeQ2gNgCEuf9apUgmzxeCUUPjD5oAChXXVOw=JmoqqaGA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 6:11 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 26, 2021 at 04:07:47PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 25, 2021 at 6:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip!]
> >
> > > >
> > > > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > > > to other suggestions, although I can't come up with anything else.
> > > >
> > >
> > > Going off on a bit of a tangent, but I'm trying to add support for
> > > decoding the GPIO ioctls into strace and am running up against a similar
> > > issue.
> > >
> > > The way strace does it is to check the uAPI header on the host and use
> > > it if possible.  To handle where it may be stale, local types are
> > > defined that mirror any types that may have been added since the header
> > > was originally released.  If the corresponding type is available in the
> > > linux header then it is used, else the local type.
> > >
> > > This obviously creates a lot of pointless boilerplate code and
> > > preprocessor chicanery so I floated the idea of just including the latest
> > > header in the strace tree, as you are doing here for libgpiod.
> > > But that raised the issue of licencing, specifically if you copy the
> > > linux/gpio.h into a source tree does that mean that the whole project
> > > becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> > > libgpiod.
> > >
> > > The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> > > which is also not totally clear on this point[1].
> > >
> > > My gut feeling was that using and even copying API headers doesn't
> > > constitute a derived work, as per the FSF view quoted in [1], and
> > > ethically might even be less of a violation than copying and re-defining
> > > individual types, but I'd rather not rely on a gut feeling.
> > >
> > > Is there some clear opinion or precedent on this point?
> > > i.e. are libgpiod and strace in legal licence jeopardy if they include
> > > gpio.h in their source tree?
> > >
> > > Cheers,
> > > Kent.
> > >
> > > [1] https://lkml.org/lkml/2020/2/21/2193
> >
> > Thanks for pointing that out. I lack the legal knowledge to have an
> > opinion of my own on this.
> >
> > Cc'ing Greg KH for help.
> >
> > Greg: do you know if it's fine to bundle a 'GPL-2.0 WITH
> > Linux-syscall-note' uAPI header together with an LGPL-v2.1-or-later
> > user-space shared library?
>
> How would you "bundle" such a thing as that is not what is in the kernel
> source tree?  If you are going to copy files out of the kernel and do
> other things with them, well, I recommend asking a lawyer as I am not
> one :)
>
> good luck!
>
> greg k-h

By "bundling" I mean - copying the kernel uAPI header verbatim from
the kernel tree into the project repository. The reason for that is
the fact that always relying on the toolchain kernel headers leads to
build issues if we want to support more recent kernel features in the
library while the supplied headers don't define all required symbols.

We can either make the latest supported version of linux headers a
hard requirement for building (I did that and buildroot folks yelled
at me because two stable versions of the library had different kernel
headers requirements) or redefine certain symbols (new symbols since
the oldest supported kernel version) or - and this is preferred unless
it's against the linux license - include the kernel headers in the
source tarball of the library.

I hope this is not a stupid question but obviously I don't know any
lawyer well versed in software copyright: can we direct this question
to anyone at the Linux Foundation maybe?

Bartosz
