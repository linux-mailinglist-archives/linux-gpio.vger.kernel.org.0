Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82192AC01F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 16:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbgKIPmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 10:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgKIPmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 10:42:54 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E1AC0613CF
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 07:42:54 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id x13so7456820pgp.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qh3GhGR0WPXyo+or7QQbAcqfmMQMrMs1tUQ8I47VQzM=;
        b=II4nQSM38slbux0KTWxGPSPivRUB7aCz4GQTKvzEhuEo05LX7iDopavZ8FeksDUNZX
         DV5tBrWuD3iPUpqf3CVtCgC0Fe9gdsxxr2mW4kEAAUJyHtoI2wJMh1FHOeY/qq3uSvG2
         HUaf1MmTEOPqrB7Pk3ei0lHnSm+jrb9QR2QrghEa9hJ+BvrLsPqAF0AJ0kGBcM4YIW42
         TMIGH0fkGSkWVg80LvQY2i1Aj1dE+lY+BYiZ6LXbaJOwQaG2qW9V3LSsPGQGLTZdFvmA
         wEryBJNHMXPjTd7BtpdIq7zOw4rAKR1aX2GnSllma8WSDSBIdNh+VT+tPW9VcbYp4JN+
         k+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qh3GhGR0WPXyo+or7QQbAcqfmMQMrMs1tUQ8I47VQzM=;
        b=P4xisdlk8pSsYdp2gEA/iUltYoOt88IblU7ZTu3MpRzqGBkFQiW8hJeATlVVK/UM69
         YZYhohryGhg2m3UuO8zsJuXto3wTKMXhEvKIvTr/j6X7m10ccSB3R4qyCICcLC7OyuVE
         p4+x5Xni+6CTBW1nEXpZTdNXQGzyNbu9OJgfIL8XnP4q503zNx11ssjbkql1c3BgxqiI
         fJmhIzPub5MJFCtac9GmlNRO/FGSWkricoFMSRp3NeuQ45ApCRWrffRcQHx0wJ2nuyol
         VIhibNnBuMGb9/E72ojERmeqPJsJWIWuKYsabzt8PnvCx9on8isUfv3lUzRI/c6YaLnr
         fKaQ==
X-Gm-Message-State: AOAM533hsqiRabcSVq6HLEWFh3Xq9ASZOd5fJ/SNfREr28QNpfCNU30R
        YT0lla+Tzb4ma/k8HVN/EAetkrzstOlUItaNvNg=
X-Google-Smtp-Source: ABdhPJxCKpgUu99m9nY38IqoBx2SQt8bEhsUud6eoThG2Oq6wlrkE1rzkX+yjDdWgIvxth7Usu4PS4HfNrz6kQcwdqA=
X-Received: by 2002:a17:90a:430b:: with SMTP id q11mr14004675pjg.129.1604936573850;
 Mon, 09 Nov 2020 07:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
 <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com> <CAHp75Vf8MkaNGmH1-FWxR66mB6pAWoV=Xw3sAi2Riw1uLe5YNA@mail.gmail.com>
 <35581c32-8022-87e6-259d-84ea6aaebbae@redhat.com> <20201109114511.GZ4077@smile.fi.intel.com>
 <3658b0a1-f6e4-b904-cd7d-2b173403fb8b@redhat.com>
In-Reply-To: <3658b0a1-f6e4-b904-cd7d-2b173403fb8b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 17:43:42 +0200
Message-ID: <CAHp75VcZL=CCvEY19NQjZqmsGvRCcfUCDJiKcqSyc0-z7MTxyg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Coiby Xu <coiby.xu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: my work address back (by some reason Gmail(?) dropped it)

On Mon, Nov 9, 2020 at 1:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/9/20 12:45 PM, Andy Shevchenko wrote:
> > On Sun, Nov 08, 2020 at 10:31:32AM +0100, Hans de Goede wrote:
> >> On 11/7/20 4:26 PM, Andy Shevchenko wrote:
> >>> On Sat, Nov 7, 2020 at 4:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>> On 11/6/20 8:22 PM, Andy Shevchenko wrote:
> >
> > ...
> >
> >>> Thank you very much for the testing! I remember that I fixed debounce
> >>> for BayTrail, but it seems I have yet to fix Cherry Trail pin control
> >>> as a prerequisite to this patch.
> >>>
> >>> And like I said this series is definitely not for backporting.
> >>
> >> Independent of fixing the CherryTrail pinctrl driver to support this,
> >> I strongly believe that -ENOTSUPP should be ignored (treated as success)
> >> by this patch. Remember ACPI is not only used on x86 but also on ARM
> >> now a days. We simply cannot guarantee that all pinctrls will support
> >> (let alone implement) debounce settings. E.g. I'm pretty sure that
> >> the pinctrl on the popular Allwinner A64 does not support debouncing
> >> and there are builts using a combination of uboot + EDK2 to boot!
> >>
> >> The documentation for gpiod_set_debounce even explicitly mentioned that
> >> -ENOTSUPP is an error which one may expect (and thus treat specially).
> >>
> >> The same goes for the bias stuff too.
> >
> > While for debounce I absolutely agree with you I don't think it applies to
> > bias. ACPI table is coupled with a platform and setting bias == !PullNone

s/None/Default/

> > implies that bias is supported.
>
> What about PullDefault ? I can easily see DSDT writers using PullDefault
> on platforms where bias setting is not supported.

PullDefault is ASIS in terms of BIAS, it's always supported.
I mistakenly took None in the upper paragraph, but I got your point.

> > If we break something with this it means:
> > - ACPI table is broken and we need a quirk
>
> Broken ACPI tables are as common as rain in the Netherlands, where ever
> possible we want to deal with these / workaround the brokenness
> without requiring per device quirks. Requiring a per device quirk for
> every broken ACPI table out there does not scale.

Okay.

> > - GPIO library is broken on architectural level and needs not to return
> >   ENOTSUPP for the flags configuration.
>
> Usually we handle features not being implemented gracefully. E.g chances
> are good that whatever bias is required was already setup by the firmware
> (or bootloader in the uboot + EDK2 case). Making bias set failures a
> critical error will likely regress working platforms in various cases.
>
> Keep in mind we have an existing userbase where things is working fine
> without taking the bias settings into account now. So if we hit the
> -ENOTSUPP case on any platform out there, then that is a regression
> plain and simple and as you know regressions are a big red flag.

Yeah, probably the best is to have these things optional and thus
return only real error cases.

> Since it is really easy to avoid the regression here we really
> should avoid it IMHO. What about just printing a warning on ENOTSUPP
> when setting the bias instead ?

So, looking into this deeper I have got the following:

FUNC            Relation to ENOTSUPP

gpiod_set_config()  returns if not supported
gpiod_set_debounce()  as gpiod_set_config() above
gpio_set_debounce()  legacy wrapper on top of gpiod_set_debounce()
gpiod_set_transitory()  skips it (returns okay) with debug message
gpio_set_config()  returns if not supported
gpio_set_bias()  skips it (returns okay)

Now, what the heck are the last ones? Why do we have this difference?
(I meant APIs)

So, I will try to unify it. Not sure that we need to issue a message
in case something is not supported. Debug one? Might be, but don't
think we need it right now.


-- 
With Best Regards,
Andy Shevchenko
