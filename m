Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA7845E470
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 03:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357575AbhKZCag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 21:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343514AbhKZC2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 21:28:34 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF48C061759;
        Thu, 25 Nov 2021 18:23:40 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b13so5724428plg.2;
        Thu, 25 Nov 2021 18:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NsPivK1F8gutfxE53N2XkDIVXBtrdu+7Oa0dShO8GXY=;
        b=FM0g2blbLYPiPQ26BvdEyNk0YD+Ka39v4v5gYjji065vCU7oEMFI+GupvKgVD8pt+d
         3GvNwrkcR5dZXYTnaZZHoROhpOzv9J+Rd9flSZvvuq9K62AG+lbwi2XsVHrN+a0qMHS8
         sMYUq2vmnOvZTrc08YarKp6bSNjYf2vLaRNodtiYfn8cD4Ga6FAWV3AJ+UtjjPFE98ur
         SPx276EXgiJvSHQG54onbsUP4wE8THIKR9scplrWQMQnKt2W0CegkUB3fsVtdlMQxaol
         QuEoFqWDy/xISx+lOvE5K2W8pK0ezOG4pbhXyMRpHWwmGV6HQUHDpz/gfiQH+L9hXMKa
         lQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NsPivK1F8gutfxE53N2XkDIVXBtrdu+7Oa0dShO8GXY=;
        b=ELWttJF4XvKmD8jn0Ss0MhHZc3y+cnLJ2RSvIeLN2AUKFQmpp4AQDA1j4WWUBRtyFi
         3UrRcbdALY9S3rydyzjxiIudR8Xq4b5WQYaEeLzc5RHN+KgUmQgU7NlNe9vnr4fI7fY9
         pNjhVpgxlHzjPI8O80xn+tkad3qxCGjLsPvv7iB+hKM0906Gpdm+JVIDzi1Yj3aEUhui
         jsjEWNy1DASMaPHeT032yA/Q3JIs8ASezPlaqn8UN0VfC7NUjhKhLBJR70JRVjTUjAxN
         ZqmR1HGX1LjWhkOP2TNK3NxPoIK83UDpVlYZrCtWaAM9Ho7xkof3eP6s7hQf4xSGQ0F+
         4URg==
X-Gm-Message-State: AOAM5324cvoQKFygUnLh+/lJiLqNvDRlVjIeDVlnGmPKUSNrXVYj4pfT
        PpoLkF3EL1CQXQFRzaEUQAc=
X-Google-Smtp-Source: ABdhPJxvlKuSDS6wynSztZKHVy+DiCjyYCr2v/drUYlFGUuDv+aNpyhiBLRyb5FJ2qBv9s5Ffmruwg==
X-Received: by 2002:a17:90b:1b04:: with SMTP id nu4mr12502548pjb.72.1637893420049;
        Thu, 25 Nov 2021 18:23:40 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id q11sm4554777pfk.192.2021.11.25.18.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:23:39 -0800 (PST)
Date:   Fri, 26 Nov 2021 10:23:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/5] gpio: sim: new testing module
Message-ID: <20211126022334.GA11357@sol>
References: <20211124114257.19878-1-brgl@bgdev.pl>
 <20211124114257.19878-3-brgl@bgdev.pl>
 <CAMRc=MeR4ubyVWUmR_x99dLjovcFn3Bn9FwGKgX88-P0_PeStw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeR4ubyVWUmR_x99dLjovcFn3Bn9FwGKgX88-P0_PeStw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 02:14:20PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 24, 2021 at 12:43 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > Implement a new, modern GPIO testing module controlled by configfs
> > attributes instead of module parameters. The goal of this driver is
> > to provide a replacement for gpio-mockup that will be easily extensible
> > with new features and doesn't require reloading the module to change
> > the setup.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  Documentation/admin-guide/gpio/gpio-sim.rst |   80 ++
> >  drivers/gpio/Kconfig                        |    8 +
> >  drivers/gpio/Makefile                       |    1 +
> >  drivers/gpio/gpio-sim.c                     | 1370 +++++++++++++++++++
> >  4 files changed, 1459 insertions(+)
> >  create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
> >  create mode 100644 drivers/gpio/gpio-sim.c
> >
> 
> Hi guys!
> 
> I'd like to get your opinion on some parts of the interface.
> 
> Should we allow creating multiple gpiochips per platform device like
> some drivers do? And if so - should the sysfs groups be created for
> each gpiochip device kobject and not the parent?
> 
> Currently we do this:
> 
> # Create the chip (platform device + single gpiochip):
> mkdir /sys/kernel/config/gpio-sim/my-chip
> # Configure it
> echo 8 > /sys/kernel/config/gpio-sim/my-chip/num_lines
> # Enable it
> echo 1 > /sys/kernel/config/gpio-sim/my-chip/live
> 
> What I mean above would make it look like this:
> 
> # Create the platform device
> mkdir /sys/kernel/config/gpio-sim/my-gpio-device
> 
> # what's inside?
> ls /sys/kernel/config/gpio-sim/my-gpio-device
> live
> 
> # Create GPIO chips
> mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip0
> mkdir /sys/kernel/config/gpio-sim/my-gpio-device/chip1
> 
> # Configure chips
> echo 8 > /sys/kernel/config/gpio-sim/my-gpio-device/chip0/num_lines
> echo 4 > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/num_lines
> echo foobar > /sys/kernel/config/gpio-sim/my-gpio-device/chip1/label
> 
> # Enable both chips
> echo 1 > /sys/kernel/config/gpio-sim/my-gpio-device/live
> 
> And in sysfs instead of current:
> 
> echo pull-up > /sys/devices/platform/gpio-sim.0/sim_line0/pull
> 
> We'd have to do:
> 
> echo pull-up > /sys/devices/platform/gpio-sim.0/gpiochip1/sim_line0/pull
> 
> While I don't see any usefulness of that at this time, if we don't do
> it now, then it'll be hard to extend this module later. What are your
> thoughts?
> 

I might be missing something, but I don't see the platform abstraction
adding anything that can't be easily emulated in userspace using multiple
chips, and it complicates the minimal case as you now have to create a
platform as well as the chip.
So I'd keep it simple and stick with the chip level abstraction.

Cheers,
Kent.

