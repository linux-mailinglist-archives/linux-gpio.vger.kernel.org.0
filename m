Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAA44691AA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 09:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbhLFIpO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 03:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239568AbhLFIpO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 03:45:14 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9085C061746
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 00:41:45 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id o20so39693687eds.10
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYsv0I6A6o5uFK+UPY8fyAiz1zz4uJD9KLB+ITvNrnU=;
        b=Na9oLGTjiwHYKrfq7A9Qz4LGmlnRJjcpjIOYPpDh/3BPi9g5o1X8rpVW4mP/sxLFWM
         hAuDGpKChArD8g+AXlU3xZp/f/CHbnKk1crqS++1O4gK3JoooqAizE3HZFSUN9B+eaqK
         3CZjCwIC5WElGg5rbsUrL1k4xBeKlcgQZLyMBwKuYvrHfsbaL1C8bahRh0XklvAoVPZF
         VQN9nFEdammFsIlCeEssLeM5W9x/+5bmPw/SKWrmpagzgxdh6Q8E3taxBMV46/WvALY1
         E6lPsbdWc7CDV7BKSnBtiGSzkK0b0Sk7YbTI4crokMt+UXLf3a/071HEN/2Woe91yaGy
         O2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYsv0I6A6o5uFK+UPY8fyAiz1zz4uJD9KLB+ITvNrnU=;
        b=NcAIOeURiKVKMplZod1U1xujxrc5pSvQxgu61AKB1XgnPBzeNwPMK/l3XpJQCqgoLv
         koFdmixp/vNuF3tE2gdAap/1qnyAd1kHCVKaf2klktLrP8a0Qx02b7/Mf6ayTdvtpbwB
         mukvbBMHEsX/ylF/L6b42um1e4TCX2sL4ytVDXBdrPPeu+/pjqVqaWvGy+CmRwzooate
         HlCbreUD/GHXvz0bxeImy//Y8MDUKIAEyPSl40L+uX/gAjM7akwglSjKJhD1MSzCLXqk
         JkEJInUmOARdV8AdAQQMNl0kSPmqraTXtVbvgkXadbW0Bdbv6Rdnip2G51RiMGgG8hVb
         GsXg==
X-Gm-Message-State: AOAM533XEyUR/0DT7rAfcbOgTS33sGjismxDusnf5/yJYBt2ozdERrPH
        2ppC7j8KRa8TN8RWCdrscSjX0bhj5SUmU6QnLF5y1g==
X-Google-Smtp-Source: ABdhPJwaXHvLPRG0pSMIzqzjXufeL6J34ZTE554GDIxU4BWMdqMOHmcM0b1i3AQuocmn3XKeV23g6rGKxx5cN6iGC/8=
X-Received: by 2002:a17:907:c15:: with SMTP id ga21mr43076617ejc.349.1638780104294;
 Mon, 06 Dec 2021 00:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20211203133003.31786-1-brgl@bgdev.pl> <20211203133003.31786-4-brgl@bgdev.pl>
 <YapnTHQZyNCZXrgp@smile.fi.intel.com> <YapoW+DL4jPo69u8@smile.fi.intel.com>
 <Yapp4vakFxH7JV5B@smile.fi.intel.com> <CAMRc=MeWfKHWFKwRjaqczrfwhAodpDLgrWKF-zqXCsjd=gMv3g@mail.gmail.com>
 <Yap5ctmlw6NeNM+7@smile.fi.intel.com>
In-Reply-To: <Yap5ctmlw6NeNM+7@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Dec 2021 09:41:33 +0100
Message-ID: <CAMRc=MffmFgCZFRziw-QJ+Y3WobJZzUh1Nbp2oym6JLqfnZCdQ@mail.gmail.com>
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

On Fri, Dec 3, 2021 at 9:10 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 03, 2021 at 08:28:34PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Dec 3, 2021 at 8:04 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Dec 03, 2021 at 08:56:27PM +0200, Andy Shevchenko wrote:
> > > > On Fri, Dec 03, 2021 at 08:51:56PM +0200, Andy Shevchenko wrote:
> > > > > On Fri, Dec 03, 2021 at 02:29:59PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > >   if (gc->parent)
> > > > > >           gdev->dev.of_node = gc->parent->of_node;
> > > > > >
> > > > > > + if (gc->fwnode)
> > > > > > +         gc->of_node = to_of_node(gc->fwnode);
> > > > > > +
> > > > > >   /* If the gpiochip has an assigned OF node this takes precedence */
> > > > > >   if (gc->of_node)
> > > > > >           gdev->dev.of_node = gc->of_node;
> > > > >
> > > > > Similar should be done in acpi_gpio_dev_init():
>
>
> ^^^^^^ (1)
>
> ...
>
> > > If we have parent device for several GPIO devices, this won't work right now
> > > due to limitations of fwnode regarding to the sturct device.
> > >
> > > So, it means we may not have shared primary with different secondary fwnodes.
> > >
> > > So, come back to the initial suggestion (overwrite it for now):
> > >
> > >         /*
> > >          * If custom fwnode provided, use it. Currently we may not
> > >          * handle the case where shared primary node has different
> > >          * secondary ones. Ideally we have to use
> > >          * set_secondary_fwnode() here.
> > >          */
> > >         if (gc->fwnode)
> > >                 device_set_node(&gdev->dev, gc->fwnode);
> > >
> >
> > Other parts of gpiolib-of depend on the of_node being there.
> > Converting it to fwnode is a whole other task so for now I suggest we
> > just convert the fwnode to of_node in struct gpio_chip as per my
> > patch.
>
> But this is about ACPI counterpart. If you do this, do this in both cases.
> Above code for ACPI (1).
>

This series concerns the gpio-sim driver and it only uses configfs
(with manually created platform devices) or device-tree. I would
prefer to do ACPI separately and I'd like you to lead that because I
neither have any HW to test nor claim to understand it. :)

Bart
