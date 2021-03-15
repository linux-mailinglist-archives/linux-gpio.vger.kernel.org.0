Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8DA33C271
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 17:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhCOQse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 12:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhCOQsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 12:48:05 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E78BC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:48:05 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b16so5377250eds.7
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 09:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R7MyrsFfIqiQG50IuRjCCrpFO9gLvQ3bFYxbpODTywo=;
        b=e1yO9WobmXZ0dEf9C1lw4cJtss53NYsmCr+ldwukP+xJwC0X+017jAmRUoZXhoL+bW
         hXcs8jX/GFTZuw9OCJuPOXzi/Of0e5T26kbm4uJBLWNXcUOzMMmuhpKMqp6r3F/DpwL+
         hER/AaghWunEnboCoIffiVPGg2gM2QkMxPufollZBoUxr1TRCyG+nkvOgNw/ZwX6nfNh
         nNEqQwk+IzqBWkMKKXCPt77UjxZEbhVtsQyxOHfuI+qxXnCv1fTWnFS6B12o4Sl+NpW0
         Avh0HcbvqHNyW8Esb9IXD6d8nZUi0BdV9+LkiCiBhvcY6U8d6wluSEScf1lj5/whd+Kj
         8Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R7MyrsFfIqiQG50IuRjCCrpFO9gLvQ3bFYxbpODTywo=;
        b=Gkm0nQrn9cZgldEL+959FhHuZjS2kT4VuVRtCNw7uYj7oY8+iVoE8mKaR6ofnaxVSU
         wDaBbCh/pKtmsZo1WTvX54HZKqdiCML0wOtAzoPWzB+C/Nh94HwLUVSd1LHI6ecERFmB
         xrtIRFQg9QLzvdQCawMajzw3iqlY679mE+3V/1TQCQrvEN75+/vqNZoQkb1qmUCO3pHC
         e/Vp5zpL/EfynvopayQSUrGGOgL0xlY40UQGnmW/XOZwCWzF1mLCvOfft2MUuNh83eAl
         RPN3Cegq0KMkfxG0QFHb3gqjyLy2hnBw3ZBLYCe5rAHzZWzZCvdzVR0qf36hceFffYbZ
         e7oQ==
X-Gm-Message-State: AOAM532C2tKyCYd/G6CjUujEsZmPo+MXqYhbUQJ1ubKv9Hysr+Jpv8tx
        HL8NWOCcFe39n0Ln67wPWTcHaoZJGy5sbQ9STdS/PA==
X-Google-Smtp-Source: ABdhPJxXfMtxbj2CriAhsS7X4Ppc7pdEkux7D9pFuybyxMbziBCfrkC83cLcqBoomg3QBeXMte6I30k13WGyR6Ax3B4=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr30973965edb.113.1615826884243;
 Mon, 15 Mar 2021 09:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com> <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
 <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com> <YE9whHhaa2XavKfj@smile.fi.intel.com>
In-Reply-To: <YE9whHhaa2XavKfj@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 15 Mar 2021 17:47:53 +0100
Message-ID: <CAMpxmJVUVhpcNOVQCB3p8tNpac5e5c7vRQS=-avA6Cuaag9eRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 3:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 15, 2021 at 03:04:37PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > > Unfortunately while this may fix the particular use-case on STM32, it
> > > > > breaks all other users as the 'gpio-line-names' property doesn't live
> > > > > on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> > > > >
> > > > > How about we first look for this property on the latter and only if
> > > > > it's not present descend down to the former fwnode?
> > > >
> > > > Oops, I have tested on x86 and it worked the same way.
> > > >
> > > > Lemme check this, but I think the issue rather in ordering when we apply fwnode
> > > > to the newly created device and when we actually retrieve gpio-line-names
> > > > property.
> > >
> > > Hmm... I can't see how it's possible can be. Can you provide a platform name
> > > and pointers to the DTS that has been broken by the change?
> > >
> >
> > I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
> > the WiP gpio-sim - but it's the same on most DT platforms. The node
> > that contains the `gpio-line-names` is the one associated with the
> > platform device passed to the GPIO driver. The gpiolib then creates
> > another struct device that becomes the child of that node but it
> > doesn't copy the parent's properties to it (nor should it).
> >
> > Every driver that reads device properties does it from the parent
> > device, not the one in gdev - whether it uses of_, fwnode_ or generic
> > device_ properties.
>
> What you are telling contradicts with the idea of copying parent's fwnode
> (or OF node) in the current code.
>

Ha! While the OF node of the parent device is indeed assigned to the
gdev's dev, the same isn't done in the core code for fwnodes and
simulated chips don't have an associated OF node, so this is the
culprit I suppose.

Bart

> Basically to access the properties we have to use either what specific driver
> supplied (by setting gpiochip->of_node or by leaving it NULL and in this case
> gpiochip_add_data_with_key() will copy it from the parent.
>
> That said, we shouldn't care about parent vs. GPIO device fwnode when reading
> properties. So, bug is somewhere else.
>
> In any case, I will test with the gpio-mockup, thanks!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
