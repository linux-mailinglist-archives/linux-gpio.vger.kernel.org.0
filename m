Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1D42C0BED
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbgKWNdc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730742AbgKWNdQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 08:33:16 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5494DC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 05:33:14 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id v3so1717254ilo.5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B86W+jdVxuWIBPQvh9VgYQZlnqJjyNB5p5InAyRoB6I=;
        b=Ql+B5HYPmAmLy91ozR3CtGnnrhQQcGm7J219+3qkj1QbqFA5NSFZ+53URtCaAZT5Wz
         mHi4LpbDZVPZNkfNnvgXiwgCbF68xX0VM75It6kkBHOvkUxvB+0tXqDqZ8+C4hSJ9STm
         EW3mVDzssW88YlKed6bULwvfZZy929cSDs0GC4vJAOmCSQx9ao9emyU1yiUYnCk5I6mq
         Kfu9ZePha0xTRdNKbDey5RbU32dM/gdBioX7rzdMEbTxS5BfHS2IqhNzx9CeDpRB+OsQ
         8GapysEAT6UI//oDNv3Q4fGAqAyIt428bOzgatRAjZtuHPjST5lp2ViK+vEG4Rayo/KV
         68Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B86W+jdVxuWIBPQvh9VgYQZlnqJjyNB5p5InAyRoB6I=;
        b=gxplBwWZYPG+nDHrJWwXdWuTrzU2+8X8jgV6ksq3lFdCWB5G5LohyhXZQOtg9MClFT
         npLqZMtmRnIou6PwhEaM5aBkjZc+AgeQulZEXmsCJ9+83ql+ORSn/NcIg+uqknRAj8Ui
         YEGSbZFMPySB9lH9PpGQACqA4AXmrI1hgEzeJii4AlvD/E9KcmbbjPA2Sm4UosIe3az6
         VE7gSCYsWx3mAd/i14HaMzQryaA3CbudDO0LxeeED3rUSnK7v82Ho4oKXuBev719QT5D
         HfVkzDdbFfttsFrF/G3M05eKGHcUqWT4KeDII8HEXoG6u9MBJ11GFNGCTMxJprHq6cul
         rp0g==
X-Gm-Message-State: AOAM532yUjC3Q2oKXcvuVKxdoKdZrpUFH1Oo4lzW/yPP5JEX2wsLq9AD
        pfQgXYThJspIsvdUOxXIfye75heurLUwdgOmKYH5UQ==
X-Google-Smtp-Source: ABdhPJycqSQElwVZGEibmP19tZAWy2OngMjiRi5rnuSzVjw3YWvslTK4f2cE5l7Xvyx7SmC6df6yYxWbtJmvsnBt3MI=
X-Received: by 2002:a92:dc07:: with SMTP id t7mr34265185iln.189.1606138393796;
 Mon, 23 Nov 2020 05:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20201116104242.19907-1-brgl@bgdev.pl> <CAMRc=Mdkr+65Nu7ddjtMHTbedpNf22w1bE97vipKSdXBYm8=fw@mail.gmail.com>
 <86bf5fda-eeb5-5cb2-901f-a887af7584f6@siemens.com> <CAMRc=MeayB1-hUiNUgKoG5v+CFt-Kxx88s+b-12iZDBfMjvttw@mail.gmail.com>
 <fe36f3f9-fc33-c39a-1b6e-962fe2567bb8@siemens.com>
In-Reply-To: <fe36f3f9-fc33-c39a-1b6e-962fe2567bb8@siemens.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Nov 2020 14:33:03 +0100
Message-ID: <CAMRc=Mcai324zc-W52jVeyUeG6pcCmBZx2Q-Ao_d-GMMwW6ATg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: exar: refactor the driver
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 2:00 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 23.11.20 13:12, Bartosz Golaszewski wrote:
> > Thanks!On Mon, Nov 23, 2020 at 1:03 PM Jan Kiszka
> > <jan.kiszka@siemens.com> wrote:
> >>
> >> On 23.11.20 12:38, Bartosz Golaszewski wrote:
> >>> On Mon, Nov 16, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>>>
> >>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>>
> >>>> I just wanted to convert the driver to using simpler IDA API but ended up
> >>>> quickly converting it to using regmap. Unfortunately I don't have the HW
> >>>> to test it so marking the patches that introduce functional change as RFT
> >>>> and Cc'ing the original author.
> >>>>
> >>>
> >>> Hi Jan!
> >>>
> >>> Could you give this last version a final spin before I merge it?
> >>>
> >>
> >> [   14.250117] exar_serial 0000:02:00.0: enabling device (0000 -> 0002)
> >> [   14.336622] 0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
> >> [   14.391588] 0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
> >> [   19.250510] gpio_exar: probe of gpio_exar.1.auto failed with error -22
> >>
> >> That's "new"...
> >>
> >
> > And if you change reg_bits from 11 to 16?
> >
>
> 16 works. Didn't we have that already?
>
> Jan

Yes we have, Andy suggested 11 is fine because it fits the highest
address we need to access but it seems regmap doesn't like this value.
Ok so I'll change it when applying, is that fine with you?

Bart
