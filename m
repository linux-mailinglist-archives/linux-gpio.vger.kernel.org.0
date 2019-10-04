Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6649CB4EE
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 09:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbfJDHWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 03:22:46 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39132 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbfJDHWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 03:22:46 -0400
Received: by mail-io1-f67.google.com with SMTP id a1so11425241ioc.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rr4KX7bERa4Yu69abX8xfFvq8NytKVdbkKwnbr1PxgI=;
        b=WLW23CRICngclJtlLT3g4XeeRR+Imoe8mH82TVBk+TzcXvRgmcqeKWZvuox1Ck+xS5
         ILqa5m+qg7jjxMrEnXTpenCSZ3WDvdFbuWngT91F85Yun1FV3xBNHx6FT5e8sBGh7T2D
         LUlUn2QUj922Buy3NnBzl78DEInzf4MCojkfAZWUHPcN7GOQ4WZI6RbWxmOWi80cQOAL
         uK2Ra1eMNbOaHFtJeAcgVI54I3rK36ZTkQlDJSOKTNad1ztucUU0AyRaLZSZu79bKp4H
         2RNqXU8v4PDIVXSWYZ459lC/iJ3ld9ZzgkJr874Cun/LUaEZIGx/Q6A10cgavUtpOhC5
         K0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rr4KX7bERa4Yu69abX8xfFvq8NytKVdbkKwnbr1PxgI=;
        b=Dy44BpcPODzdHfcvLnoJcQO733Pl4fSRNHKX6A33bcWSPJgM/lKjtoVJK27ZWYdrTj
         Npm3SjCXk55HJwaS8hnMd7BzYUQwXpWhL+Avxh0jACTdG4kC0UAkAnQ2A1e63rQEjmL0
         ST2WPi5zgIc2VA2vqVYpOHqPVfGRkqlL5qnJk0UHDDxlDwWLKD6x8QkKprFEEvmfFFBE
         GksNqAwTF/y/zG92SKXqlMuysE7RWTt10n3CMVvpEcubE2qKrwubAcnLCBar9Wa4U9+g
         n0VSzMgtURzx3TWJxjCnCVPcOvEsiZmUT9VPB7nnrZRmfqtN0sTU1g6kv06YHIJV+Ik/
         E50A==
X-Gm-Message-State: APjAAAUeLICDoyFoMEPoEfb+12v/KHYYbYcIcqCRnpSOY0EseJLcu7Lo
        MwOn3NaMMuvUm+ClUZszfodgnbDBh2+b0gGjzGvkmg==
X-Google-Smtp-Source: APXvYqzQelZI030Q5i12C887+2dKlj14TpLc1IixAuX2v0K4UvqPzIqnDxEq0Rj9uHSqiomzfgsadY8Ky2OsyQBCu54=
X-Received: by 2002:a02:ba17:: with SMTP id z23mr13355941jan.24.1570173765120;
 Fri, 04 Oct 2019 00:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <CAMRc=Me=6JeOOv_SRhKt+vOsd3p5yOVkWyNu4Oo+DeCwMJHmaA@mail.gmail.com>
 <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
In-Reply-To: <CACRpkdZjswY4zW232ahSQSGfprbgBx8YL4Wb0i3ebegT00v3jQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 4 Oct 2019 09:22:33 +0200
Message-ID: <CAMRc=McH=ui1c9yTMtuMwVUT2-yBHhV=r0VGsKY0KbYMLHJhPA@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 3 pa=C5=BA 2019 o 14:47 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Mon, Sep 23, 2019 at 10:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>
> > I remember discussing it with Linus some time ago. This may not be as
> > straightforward as simply adding new flags. Since PULL-UP/DOWN
> > resistors can - among other parameters - also have configurable
> > resistance, we'll probably need some kind of a structure for this
> > ioctl() to pass any additional information to the kernel. Since we
> > can't change ABI this may require adding a whole new ioctl() for
> > extended configuration. This in turn has to be as future-proof as
> > possible - if someone asks for user-space-configurable drive-strength,
> > the new ioctl() should be ready for it.
> >
> > I should have some bandwidth in the coming days, so I'll try to give it=
 a try.
>
> What we did for the in-kernel API and the Device Tree ABI
> was to simply say that if you need such elaborate control over
> the line, it needs to be done with a proper pin control driver.
>
> So for lines that just have the GPIO_PULL_UP or
> GPIO_PULL_DOWN set as a (one-bit) flag, what you will
> get is "typical" pull down/up (whatever the hardware default
> is, or what the driver thinks is default, which should be safe
> so the highest possible pull resistance I suppose).
>
> So one option is to just go with these flags and explicitly
> say that it will give a "system default (high resistance)
> pull up/down".
>
> That said, the pin controller back-end is fully capable of
> accepting more elaborate configuration, so if we prefer then
> we can make the more complex userspace ABI that can
> set it to a desired-or-default resistance.
>
> I lean toward simplicity here. I haven't seen that these
> userspace consumers need very elaborate control of this
> resistance, they are for one-off hacks and as such should
> be fine with just default pull up/down I think?
>
> I  think that specifying "this line will use pull up/down"
> at request time and having the driver set a safe default
> pull-up/down as response, (and pretty much what this
> patch does) and then add another explicit
> ioctl to refine it the day we need it is a viable way forward.
>
>  in the future something like:
> #define GPIOHANDLE_SET_LINE_CONFIG_IOCTL _IOWR(0xB4, 0x0a, struct
> gpiohandle_config)
>
> And then, when we need it, try to come up with some
> really flexible ABI for the config, based on
> include/linux/pinctrl/pinconf-generic.h
>

Thanks for your input Linus. I'm good with that. The config ioctl (or
something similar) you're mentioning may appear sooner actually -
users of libgpiod have been requesting a way of changing the direction
of a line without releasing it - something that's possible in the
kernel, but not from user-space at the moment. I'll submit something
that allows to change the configuration of a requested line soon.

Bart

> But no upfront code for that right now as it is not needed.
> A practical usecase must come first.
>
> Yours,
> Linus Walleij
