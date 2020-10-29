Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B722E29F3D1
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 19:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgJ2SJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 14:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgJ2SJa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 14:09:30 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C31C0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:09:00 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w191so3994445oif.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBUzc9CK7MUBRWLylSHpe2XD8BDUPf6CGZ/koJbns3c=;
        b=qYyU4vJ7lIMZB7mVlFC8g9vfsaKue73KJZYbT2ipvTyGxqr3B/Pb1WNfZNCWp0Rz2n
         VySxQ/9rUoMGieDNBPR/H7OukAl2dCnpp+LkP0WmGeVdsA/J/GGB0HBPRbVGd9fr7Rtl
         CmPB5S/6/sPoolazQBJWrQiD+/paaFMs2uinPNEs3upQeFEnxKygeOe0XcNsN/fseBhK
         Kg/0gT4sTYKG70U2nwMGDEGWRlslBuLc4g1XUqy4rP/4jo20J0RqifYGfFEpjmVmi79h
         04yfpBFIJk15QqwCC/63x1BEpKt5Odj82zoSfDUJoXUVt4gKQ6/S5Zzhj6FNTJBvxEzQ
         mL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBUzc9CK7MUBRWLylSHpe2XD8BDUPf6CGZ/koJbns3c=;
        b=IUJF3ntWal2VbWuEf7W/lDPqlcUbRZP5/0cHL2fIN7VkVHPWeU1Bqj4OOy70X8Eu+w
         /cDzJlTJPJeu7/S3fZlFKG7B72uNaj/udNZhyOKDzNZIoFtvKOWbay+yEj0xx09m53DR
         foJ8LhWiztXIL+oNu64IIbCxVujnfcKr4cZ41ALVDqtC3qmzDrMDHo+yg2NXbykUS86i
         q+aXZoYV7sUWADUsFIFlzg4Y03NrmjGOcNMjHRNS7fiAJn6ZsEExRIfZFl0mK9Q5bvjc
         jU7oWp2Jfcv9QZR6Z4/baFScaqwCxEqWDKi62UILt4vp8xumt0uJhkqtMcxYjegLrFUI
         BNDg==
X-Gm-Message-State: AOAM533t9Gn1JJY2AciqWcQWNtaFZXX+roC+nIHv52yevdAHTDzFX/8j
        pb/WrSBAOExAP32bwZW33uGH6HAbS8bx5G+n4aX1Lw==
X-Google-Smtp-Source: ABdhPJxqT2kL0a4tFiy+m/bOuNX6YodgkMrdSY8ftIGXaGCFzPFB4GPgxkbcd9UTdg23gBYzEH+631+hIBSlXikbbHo=
X-Received: by 2002:aca:3442:: with SMTP id b63mr321446oia.15.1603994940142;
 Thu, 29 Oct 2020 11:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201028171757.765866-1-ribalda@chromium.org> <20201028182744.GZ4077@smile.fi.intel.com>
 <CANiDSCvy2dPyY8O5DVgTBwNNLmfA=kJ5HUKJqcFLnqQ8CWsJgA@mail.gmail.com> <CAHp75Vc6LhqKvuAeOkVtTAniHGRMGV=7Pa71CNT7por=PRk9eQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc6LhqKvuAeOkVtTAniHGRMGV=7Pa71CNT7por=PRk9eQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@google.com>
Date:   Thu, 29 Oct 2020 19:08:47 +0100
Message-ID: <CANiDSCsrtL1h+z_f7jQicgwz5nTc33wJGGCjZyeF9aGQJwED7A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Support GpioInt with active_low polarity
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding Tomasz in CC in case he wants to share more info about the device.

On Thu, Oct 29, 2020 at 6:31 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 29, 2020 at 5:37 PM Ricardo Ribalda <ribalda@google.com> wrote:
> > On Thu, Oct 29, 2020 at 3:38 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 28, 2020 at 06:17:57PM +0100, Ricardo Ribalda wrote:
> > > > On the current implementation we only support active_high polarity for
> > > > GpioInt.
> > > >
> > > > There can be cases where a GPIO has active_low polarity and it is also a
> > > > IRQ source.
> > > >
> > > > De-couple the irq_polarity and active_low fields instead of re-use it.
> > > >
> > > > With this patch we support ACPI devices such as:
> > >
> > > Is it real device on the market?!
> >
> > Yes, it is a chromebook.
>
> You mean it's already on sale with this broken table?!

I do not agree that it is broken.  It follows the current standard ;)

>
> > > This table is broken. _DSD GPIO active_low is only for GpioIo().
> >
> > AFAIK the format of the _DSD is not in the ACPI standard. We have
> > decided its fields. (please correct me if I am wrong here)
>
> _DSD is a concept that is part of the spec, but each UUID and its
> application is out of scope indeed.
>
> GPIO application to _DSD is described in the in-kernel documentation.
> Thanks for pointing out the issues it has.
>
> > On the other mail I have described why we need to make use of the
> > active_low on a GpioInt()
> >
> > If there is another way of describing ActiveBoth + inverted polarity
> > please let me know and I will go that way.
>
> I answered it there, please, continue this topic there.
> NAK to the proposed change.
>
> > > If it is a ChromeBook, please fix the firmware.

Lets agree what is the best way to describe in acpi my usecase and I
will implement it.

>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Ricardo Ribalda
