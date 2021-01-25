Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DB302462
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 12:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbhAYLlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 06:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbhAYLFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 06:05:07 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F10C061788
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 02:53:44 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kx7so8147970pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jan 2021 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWluKlVRB21YbCIHtN9cf2B0e36xrHZFlSkwIQYCdXI=;
        b=LPdymj0TJrApcXClVoyXRlHL9pRSPuS+fKv7EX2ZxSr0GWrybh7g/armW/3BCkQPMg
         qRa8UTMmAAaU8KA9y7icubDjU+zNi816qBbcfgrCkbLtMopR5Ee3Urtua2o9LFl15y1P
         O5vB1JZ7/EPHE343aEojLV+kLbYUd+pEGD/ZAo9B7phs+hUER7lVxss/Ya+12t/BGZM1
         n6jAbcUjRm9oMVhiRJbwHJDySaNo0i3K+kazUP5mxEF1Mr7BSTY2zEnMPzevmhQDXKxt
         XHqc8G2x5Km8f9s4kAiTGNuVNaeP4IP0C3hYJE0aigEV2Hg2QRckrARB6NfL/LzUzORe
         L9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWluKlVRB21YbCIHtN9cf2B0e36xrHZFlSkwIQYCdXI=;
        b=XYBhdARRPfynO8giKlXIQCtDXzOPIf0j4TXl3Y/yml/PeRg5qC5BqMI9emZLb4HAZy
         AP9p6ES8O6nVUCQ/QVdfX01sVnB2LeUNsvUz7ZgQtK+0P50uFpz0p7qQBJejZLU2de5t
         LbI4zUoPjqKIoLNVvbIyvvNv08gJaiRsXsoEY2imObkT/zUhRZlkxVNJYg3UsaP7aqXB
         T8jrc3UakwZv2BGPmZsz7iBGaLFz38mBjnO0JSoelh/nl8lTvCBWT1drslJVfz6JfWr0
         QYcKsFtHgV4lxh3HBgywgD9TMZWe+ANwd0KidgFYg11YCWQ16kzMBC0ShXzlVLjiuN8R
         7t9Q==
X-Gm-Message-State: AOAM532Mwr0swAoCsmmheMJRBSNGsSxVtN1JtcM+1gnETUYf07+JtH1i
        2KJI0Cyw1q4RiSe5EEPtw28R+iItffjW9vjsbf0=
X-Google-Smtp-Source: ABdhPJx5G5PkFGVSa0gpyWjPHaFD4VMPJ2WwxN5d6k8D9fXeBRLq7eRh/BkGNI64cPCFzuBwIfQ6TkRYC6hBWCLGPzA=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr750966pja.228.1611572024370;
 Mon, 25 Jan 2021 02:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com> <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
In-Reply-To: <20210125055527.GA344851@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 12:54:33 +0200
Message-ID: <CAHp75VcMBMZ2erpy1gmc9i+EMmrL283fiZmqUsCGto6_GXcOYw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 7:55 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Jan 11, 2021 at 04:15:21PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 11, 2021 at 3:45 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Jan 11, 2021 at 03:06:28PM +0100, Bartosz Golaszewski wrote:
> > > > On Mon, Jan 11, 2021 at 2:45 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > >
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > In order to avoid any problems with symbols missing from the host linux
> > > > > > kernel headers (for example: if current version of libgpiod supports
> > > > > > features that were added recently to the kernel but the host headers are
> > > > > > outdated and don't export required symbols) let's add the uapi header to
> > > > > > the repository and include it instead of the one in /usr/include/linux.
> > > > >
> > > > > I doubt this is a good decision. First of all if the host (or rather
> > > > > target, because host should not influence build of libgpiod) has
> > > >
> > > > I meant the host as in: the machine on which you build and which
> > > > contains the headers for the target as well but I see what you mean.
> > > >
> > > > > outdated header it may be for a reason (it runs old kernel).
> > > > > When you run new library on outdated kernel it might produce various
> > > > > of interesting errors (in general, I haven't investigated libgpiod
> > > > > case).
> > > > > On top of that you make a copy'n'paste source code which is against
> > > > > the Unix way.
> > > > >
> > > > > Sorry, but I'm in favour of dropping this one.
> > > > >
> > > >
> > > > Cc: Thomas
> > > >
> > > > This problem has been raised by the buildroot people when we started
> > > > requiring different versions of kernel headers to build v1.4 and v1.6.
> > > > It turns out most projects simply package the uapi headers together
> > > > with their sources (e.g. wpa_supplicant, libnl, iproute2) to avoid
> > > > complicated dependencies. It's true that now the library can fail at
> > > > runtime but I'm fine with that. Also: if we add new features between
> > > > two kernel versions, we still allow to build the new library version
> > > > except that these new features won't work on older kernels.
> > >
> > > I see.
> > >
> > > So known ways to solve this are
> > >  - provide a header with source tree (see above)
> > >  - modify code with ifdeffery against specific kernel versions
> > >  - ...something else... ?
> > >
> > > Second item is what ALSA used (not sure if they provide a standalone driver
> > > anymore). Ugly, but won't require header which may be staled.
> > >
> > > Any other solutions in mind?
> > >
> >
> > I tried to go the third way and just ignore the problem but I've
> > received too many emails about that. :)
> >
> > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > to other suggestions, although I can't come up with anything else.
> >
>
> Going off on a bit of a tangent, but I'm trying to add support for
> decoding the GPIO ioctls into strace and am running up against a similar
> issue.
>
> The way strace does it is to check the uAPI header on the host and use
> it if possible.  To handle where it may be stale, local types are
> defined that mirror any types that may have been added since the header
> was originally released.  If the corresponding type is available in the
> linux header then it is used, else the local type.
>
> This obviously creates a lot of pointless boilerplate code and
> preprocessor chicanery so I floated the idea of just including the latest
> header in the strace tree, as you are doing here for libgpiod.
> But that raised the issue of licencing, specifically if you copy the
> linux/gpio.h into a source tree does that mean that the whole project
> becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> libgpiod.

Very good point!

> The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> which is also not totally clear on this point[1].
>
> My gut feeling was that using and even copying API headers doesn't
> constitute a derived work, as per the FSF view quoted in [1], and
> ethically might even be less of a violation than copying and re-defining
> individual types, but I'd rather not rely on a gut feeling.

This reminds me of the Google vs. Oracle case where they pointed out
the header files (IIRC!).

> Is there some clear opinion or precedent on this point?
> i.e. are libgpiod and strace in legal licence jeopardy if they include
> gpio.h in their source tree?

> [1] https://lkml.org/lkml/2020/2/21/2193



-- 
With Best Regards,
Andy Shevchenko
