Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360B43021F8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jan 2021 06:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbhAYF5b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jan 2021 00:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbhAYF42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jan 2021 00:56:28 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB37C061573
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 21:55:33 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id p18so8170647pgm.11
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AXjAjOIIYEyIYC4qUlCnmjZXOUXqBzzGz777qRqjc/w=;
        b=D05htR5KzDs2xsCwB+bpxyXyE1JndklrMeAX7jk+IB9v/H2ErWb9kBvx4c+vgaQ6GD
         5aaP5mmqAjyfZKyCe6Bkz/YPrHEeWeeH38uVqp92sI8Cbxj+kMI9+IVduABeheFXHaYq
         +m6AbydyRG52KfzyrUU3AcZqRpQy+1XIOUtmJX5fxn6B/sAVGxx3glzfrb/Bu2/O5oMm
         WScqXszbw0ILe2IvNliU2UP5y3OY8hUmuRt/NWkEtvrZ9KcUKkFtmpXS030wurJoQAj2
         5KtRO37xlwX95cm9gEtK+0hI5bckZRrLgmHhVpMHaN4KP7UY/93Br15eX276L9cUOmpI
         PVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AXjAjOIIYEyIYC4qUlCnmjZXOUXqBzzGz777qRqjc/w=;
        b=XyHOAv3dGJZMKgXFAs/WgFbAMKI2o+2go1qJKXbSXOSSLMney6hSCY3/yzdT/Gus+7
         +XoWCalvgp9p9hv6879LHD0aGJlOSNjBC95b+ZBG38H0bTDOX8he3rGg5eMZ+Ux5103D
         NmV7SPgZXRsUj5yvOmiIgqJH7Qh//ZKAII/fem/4wz4SUKGxQyjW5Zr6nRBoarH+0JHp
         P7pPHtQW9ZeutkGQF+JPgzQnVifBiYHYF7VsJ8n1aRLrWi8r1400lrb1+z7NV1QFsaSn
         6CjFMUMoZVyFngGaapjSyQar0bFbRKT5uEplx3qW7RyAiLGQEe6RdBzjWlIgl6uT5C7q
         0+oQ==
X-Gm-Message-State: AOAM530gQ5Bqd40pfmso7o4R6/20G2zNxY5ktZzMDBAIvGrsA+7DGk0Q
        1kZZWJ9IVgXCtd2SS5J2ohqXsu8bIe0=
X-Google-Smtp-Source: ABdhPJwRoo8Bxk4IhlIKSk+Xd9yUHWl4ZdOxUYW1WUP9vFNyiAwk/nxiwOjhqppF6bzPrG+Ys+XdTQ==
X-Received: by 2002:a63:e058:: with SMTP id n24mr673993pgj.345.1611554133329;
        Sun, 24 Jan 2021 21:55:33 -0800 (PST)
Received: from sol (106-69-188-37.dyn.iinet.net.au. [106.69.188.37])
        by smtp.gmail.com with ESMTPSA id n15sm17303933pjk.57.2021.01.24.21.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 21:55:32 -0800 (PST)
Date:   Mon, 25 Jan 2021 13:55:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the
 repository
Message-ID: <20210125055527.GA344851@sol>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com>
 <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 04:15:21PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 11, 2021 at 3:45 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 03:06:28PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Jan 11, 2021 at 2:45 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > On Mon, Jan 11, 2021 at 3:37 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > >
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > In order to avoid any problems with symbols missing from the host linux
> > > > > kernel headers (for example: if current version of libgpiod supports
> > > > > features that were added recently to the kernel but the host headers are
> > > > > outdated and don't export required symbols) let's add the uapi header to
> > > > > the repository and include it instead of the one in /usr/include/linux.
> > > >
> > > > I doubt this is a good decision. First of all if the host (or rather
> > > > target, because host should not influence build of libgpiod) has
> > >
> > > I meant the host as in: the machine on which you build and which
> > > contains the headers for the target as well but I see what you mean.
> > >
> > > > outdated header it may be for a reason (it runs old kernel).
> > > > When you run new library on outdated kernel it might produce various
> > > > of interesting errors (in general, I haven't investigated libgpiod
> > > > case).
> > > > On top of that you make a copy'n'paste source code which is against
> > > > the Unix way.
> > > >
> > > > Sorry, but I'm in favour of dropping this one.
> > > >
> > >
> > > Cc: Thomas
> > >
> > > This problem has been raised by the buildroot people when we started
> > > requiring different versions of kernel headers to build v1.4 and v1.6.
> > > It turns out most projects simply package the uapi headers together
> > > with their sources (e.g. wpa_supplicant, libnl, iproute2) to avoid
> > > complicated dependencies. It's true that now the library can fail at
> > > runtime but I'm fine with that. Also: if we add new features between
> > > two kernel versions, we still allow to build the new library version
> > > except that these new features won't work on older kernels.
> >
> > I see.
> >
> > So known ways to solve this are
> >  - provide a header with source tree (see above)
> >  - modify code with ifdeffery against specific kernel versions
> >  - ...something else... ?
> >
> > Second item is what ALSA used (not sure if they provide a standalone driver
> > anymore). Ugly, but won't require header which may be staled.
> >
> > Any other solutions in mind?
> >
> 
> I tried to go the third way and just ignore the problem but I've
> received too many emails about that. :)
> 
> I don't like the ifdef hell so I prefer to bundle the header. I'm open
> to other suggestions, although I can't come up with anything else.
> 

Going off on a bit of a tangent, but I'm trying to add support for
decoding the GPIO ioctls into strace and am running up against a similar
issue.

The way strace does it is to check the uAPI header on the host and use
it if possible.  To handle where it may be stale, local types are
defined that mirror any types that may have been added since the header
was originally released.  If the corresponding type is available in the
linux header then it is used, else the local type.

This obviously creates a lot of pointless boilerplate code and
preprocessor chicanery so I floated the idea of just including the latest
header in the strace tree, as you are doing here for libgpiod.
But that raised the issue of licencing, specifically if you copy the
linux/gpio.h into a source tree does that mean that the whole project
becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
libgpiod.

The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
which is also not totally clear on this point[1].

My gut feeling was that using and even copying API headers doesn't
constitute a derived work, as per the FSF view quoted in [1], and
ethically might even be less of a violation than copying and re-defining
individual types, but I'd rather not rely on a gut feeling.

Is there some clear opinion or precedent on this point?
i.e. are libgpiod and strace in legal licence jeopardy if they include
gpio.h in their source tree?

Cheers,
Kent.

[1] https://lkml.org/lkml/2020/2/21/2193
