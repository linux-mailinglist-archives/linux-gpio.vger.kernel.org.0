Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42E6467E3B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 20:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382869AbhLCTcL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 14:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353754AbhLCTcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 14:32:10 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CBFC061353
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 11:28:46 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id l25so15603470eda.11
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 11:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3mtz8VE+XSHmuF/1hsfZdAAcBHullfiaK+FTYXOaw0=;
        b=QIq8O9E5NW9kqjHRg+AslYvtUmzsQzcyNAmATrdMlBVEbcPBmv9bkO/Sm9E6zkrJOh
         diMXbc4RT6JCMzezCzmf/5E4HgC50k7amZB9hp2212Q1EZrl0nNm4TAnj/aodEzPYAWY
         F7DDEkKlfLVQL7BZ0ejDRUWGIJt62pt9m3jugDXkutl92BTDJWmLIfavoH3GKPjHsTuR
         C7C1YJr1kmL1+MoRW5l/h0A2v/bG0cl7ZyV6AfbuoTF4VPLAk8YPdLdtAUDtGUoqHEOg
         5SRsCBFYIuAymbbBzzHD2FKVJmQMxlF7XHp6L1ptGCpwaKJzePwZM7l0janlE4aig5Wm
         K5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3mtz8VE+XSHmuF/1hsfZdAAcBHullfiaK+FTYXOaw0=;
        b=ptuGWLLEvqiIEGBu9p4K+W8dQOAcW4Hmkd89eGMKuvsNaAdms/5nUJumbMjuhFSWoR
         uHLEbczEBve31rFMhj+Va6UD32AXP82TJLGje5GkOUqcYIVy79dpvUkHoCD16cVG+nL7
         3hhwGZmyqa4B0r4cdoUFTOmAOiNdPl3p2Q7S1EmIznLx8Nt+C4xVY4121ugQNbwthWlJ
         ohZJMZpylPIOXKDSffGQ1mNTWWogowqADkwv4ogy2XjPRWExdSEJV47zkXbPK4SIkhxK
         rYmfnWKrOuRg+5wRo4Q+jQKejngp1VrlMw1Qc9kkHna/RUpxPd/gEIUh5rzHCjmCgRqU
         Om5g==
X-Gm-Message-State: AOAM530oBIg5cbq1AQs3zoaugst5q/ZWlIWONk0+maNLUFV5Xp2R6ycJ
        c4umKRxkQMzZrn/uQ1zXnJD9CMUZeezlztC0hCfXVwhU7TpCjQ==
X-Google-Smtp-Source: ABdhPJw5CFp+py3IKpRGcPqNiGG4UgNpCg+pnkKmPhuMsAAZLi5nAdE7ZVqX7PQoax8QqIjtj5Hg0Mw+3NOuAu2BELU=
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr29557634ede.0.1638559724691;
 Fri, 03 Dec 2021 11:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20211203133003.31786-1-brgl@bgdev.pl> <20211203133003.31786-4-brgl@bgdev.pl>
 <YapnTHQZyNCZXrgp@smile.fi.intel.com> <YapoW+DL4jPo69u8@smile.fi.intel.com> <Yapp4vakFxH7JV5B@smile.fi.intel.com>
In-Reply-To: <Yapp4vakFxH7JV5B@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 20:28:34 +0100
Message-ID: <CAMRc=MeWfKHWFKwRjaqczrfwhAodpDLgrWKF-zqXCsjd=gMv3g@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] gpiolib: of: make fwnode take precedence in
 struct gpio_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 3, 2021 at 8:04 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 03, 2021 at 08:56:27PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 03, 2021 at 08:51:56PM +0200, Andy Shevchenko wrote:
> > > On Fri, Dec 03, 2021 at 02:29:59PM +0100, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > >   if (gc->parent)
> > > >           gdev->dev.of_node = gc->parent->of_node;
> > > >
> > > > + if (gc->fwnode)
> > > > +         gc->of_node = to_of_node(gc->fwnode);
> > > > +
> > > >   /* If the gpiochip has an assigned OF node this takes precedence */
> > > >   if (gc->of_node)
> > > >           gdev->dev.of_node = gc->of_node;
> > >
> > > Similar should be done in acpi_gpio_dev_init():
> > >
> > >     if (gc->fwnode)
> > >             device_set_node(&gdev->dev, gc->fwnode);
> >
> > Hmm... On the second though this should be rather
> >
> >       if (gc->fwnode)
> >               set_secondary_fwnode(&gdev->dev, gc->fwnode);
> >
> > So the logic will be that:
> >  - if we have parent, set primary fwnode to it
> >  - if we have fwnode, set secondary one to it
> >  - otherwise do nothing
>
> Heck, it's Friday...
>
> If we have parent device for several GPIO devices, this won't work right now
> due to limitations of fwnode regarding to the sturct device.
>
> So, it means we may not have shared primary with different secondary fwnodes.
>
> So, come back to the initial suggestion (overwrite it for now):
>
>         /*
>          * If custom fwnode provided, use it. Currently we may not
>          * handle the case where shared primary node has different
>          * secondary ones. Ideally we have to use
>          * set_secondary_fwnode() here.
>          */
>         if (gc->fwnode)
>                 device_set_node(&gdev->dev, gc->fwnode);
>

Other parts of gpiolib-of depend on the of_node being there.
Converting it to fwnode is a whole other task so for now I suggest we
just convert the fwnode to of_node in struct gpio_chip as per my
patch.

Bart
