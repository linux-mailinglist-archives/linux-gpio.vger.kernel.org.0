Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D3C45EBF9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 11:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhKZK5W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 05:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKZKzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 05:55:20 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9867C035407
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 02:26:34 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id e3so36884968edu.4
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 02:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xVP94R+dRuu3FMjsfnrvAUvAbuGPe4qG4TVuPkf5ds=;
        b=ijwB6fmPaWQjzRJgUohX1UANvy8oVBBR+qS+idmSA4fNEJuHUj5DEB0gC9yHE+k/vB
         oifn7GLD9Qkq/Xxyu072QAEHFHlaNLVMtGkqrDPnsQRgI6xQWTTVup5UtOv9OardIEKX
         4hYepGDW4zhs2s5BlCzBZVv4uzB68fxFIZS6d2PuKfB9DsxoRNie8nJUnZQLcx8PhoAd
         1r2EViUfLsoTi4neD/Ur29Rzvhpwyi5BL2Ln38De4sX/X0wSeb2wrKj/uTM/iH+qzQbN
         9wK6MCkBm36O38UWCHobL6Nc6OtqnYimMSPVgoEWELV3reg8Pjuzzk2SF473rt9jvDsB
         he9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xVP94R+dRuu3FMjsfnrvAUvAbuGPe4qG4TVuPkf5ds=;
        b=dISrxPwrCci0hjnYr0BN7AulByiEuXgEdxgeUAXfdnVTXjBlSvCMfJVr3LzhsjU6Xe
         vnhEKybz6MjZGnETGHwETwUB4fpvEg6bbRYVe/XyQN9qxhGvNCLyp9WYm0IJ/Ru5SpFF
         TEQYw5Sa1p3825ErwgW6n46HBNWh+lGPQKb3I4XMoHrt/1loNeOi38uK0NeObOjMLthc
         S574I2qIu0REkoclej1Grfs5xJhYoGhY7psBe7Dheo6SRs27cG8D8Lf20VbTVYGlEznz
         Xpj6Qip7FoxAleYc7eOtwkg72L2kL5BW3d4GA9DIZRPEIhd3w4dE6wB/6xlhZdVWSQFE
         J0Aw==
X-Gm-Message-State: AOAM530s4xbHZSsAT3akFLapXNxdLF0FldDd3zQLpjiOOjTcO1AdCx5W
        0c1nlIZg4ao8W1M5g93Wu6Ag71BXhy+m2+FpZjh+lg==
X-Google-Smtp-Source: ABdhPJxHpPq8QHs5cdLpGQZe3oZAPOqQ10mo8SvSXXxwo6nGNyHZs6l7zJKx5JJqwYaw3RAR6Ib+l8cYePFGXHnr3Mg=
X-Received: by 2002:a05:6402:2813:: with SMTP id h19mr46686676ede.267.1637922393451;
 Fri, 26 Nov 2021 02:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211124114257.19878-1-brgl@bgdev.pl> <20211124114257.19878-3-brgl@bgdev.pl>
 <CAMRc=MeR4ubyVWUmR_x99dLjovcFn3Bn9FwGKgX88-P0_PeStw@mail.gmail.com> <20211126022334.GA11357@sol>
In-Reply-To: <20211126022334.GA11357@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 26 Nov 2021 11:26:22 +0100
Message-ID: <CAMRc=MdorxE58YRWTfCVkXOuuakXyMq=F+0HbQGJtrVmOygv7w@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] gpio: sim: new testing module
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 3:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Nov 25, 2021 at 02:14:20PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 24, 2021 at 12:43 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > Implement a new, modern GPIO testing module controlled by configfs
> > > attributes instead of module parameters. The goal of this driver is
> > > to provide a replacement for gpio-mockup that will be easily extensible
> > > with new features and doesn't require reloading the module to change
> > > the setup.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  Documentation/admin-guide/gpio/gpio-sim.rst |   80 ++
> > >  drivers/gpio/Kconfig                        |    8 +
> > >  drivers/gpio/Makefile                       |    1 +
> > >  drivers/gpio/gpio-sim.c                     | 1370 +++++++++++++++++++
> > >  4 files changed, 1459 insertions(+)
> > >  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
> > >  create mode 100644 drivers/gpio/gpio-sim.c
> > >
> >
> > Hi guys!
> >
> > I'd like to get your opinion on some parts of the interface.
> >
> > Should we allow creating multiple gpiochips per platform device like
> > some drivers do? And if so - should the sysfs groups be created for
> > each gpiochip device kobject and not the parent?
> >
> > Currently we do this:
> >
> > # Create the chip (platform device + single gpiochip):
> > mkdir /sys/kernel/config/gpio-sim/my-chip
> > # Configure it
> > echo 8 > /sys/kernel/config/gpio-sim/my-chip/num_lines
> > # Enable it
> > echo 1 > /sys/kernel/config/gpio-sim/my-chip/live
> >
> > What I mean above would make it look like this:
> >
> > # Create the platform device
> > mkdir /sys/kernel/config/gpio-sim/my-gpio-device
> >
> > # what's inside?
> > ls /sys/kernel/config/gpio-sim/my-gpio-device
> > live
> >
> > # Create GPIO chips
> > mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip0
> > mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip1
> >
> > # Configure chips
> > echo 8 > /sys/kernel/config/gpio-sim/my-gpio-device/chip0/num_lines
> > echo 4 > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/num_lines
> > echo foobar > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/label
> >
> > # Enable both chips
> > echo 1 > /sys/kernel/config/gpio-sim/my-gpio-device/live
> >
> > And in sysfs instead of current:
> >
> > echo pull-up > /sys/devices/platform/gpio-sim.0/sim_line0/pull
> >
> > We'd have to do:
> >
> > echo pull-up > /sys/devices/platform/gpio-sim.0/gpiochip1/sim_line0/pull
> >
> > While I don't see any usefulness of that at this time, if we don't do
> > it now, then it'll be hard to extend this module later. What are your
> > thoughts?
> >
>
> I might be missing something, but I don't see the platform abstraction
> adding anything that can't be easily emulated in userspace using multiple
> chips, and it complicates the minimal case as you now have to create a
> platform as well as the chip.

I wouldn't stress about the level of complication of the user-space
interface. Normally users will wrap it in some kind of library anyway.

> So I'd keep it simple and stick with the chip level abstraction.
>
> Cheers,
> Kent.
>

Yes, in user-space nothing would change as it only sees separate
gpiochips whether they're just banks of the same device or actual
devices of their own (except if you start digging into uevents'
contents, then you'll see it).

But this module is also aimed at doing some kernel subsystem testing
(even if triggered from user-space) and providing multiple banks of
GPIOs is a regularly used feature. Adding it allows us to test this
other level of hierarchy + multi-level device properties etc.

Another issue is logical correctness. In this version the line
attributes in sysfs are at the platform device level
(/sys/platform/devices/gpio-sim.X). Logically they really should be at
the gpio device level (/sys/platform/devices/gpio-sim.X/gpiochipY).

So I'm willing to give it a shot.
