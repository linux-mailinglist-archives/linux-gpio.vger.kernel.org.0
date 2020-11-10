Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE0D2ADC4E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgKJQnq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbgKJQnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 11:43:46 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB41C0613D1;
        Tue, 10 Nov 2020 08:43:46 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id r10so10650377pgb.10;
        Tue, 10 Nov 2020 08:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtX8JBV+6E2KPNfEwP024+o67AmbZzvL6k7scU6NL6E=;
        b=aV/2m0HUb9BtspOkCa/H2S/4r3YPFYdGVb7jOS3UzKeSMtUquIbS35o5tj+QVbjKph
         caekWBeb0OhnIPdtgJpRL6IsefC29Lj9jpDKehAJS3X60VvAKtKeULu7VLRAAu1bbGwx
         0CNTZqredRmEAlNdytm8IXrukC6njouoGM4sBOsSos7622O28evxMydxybBCS39/0qOR
         KNBtXgpLxLR2juK3+iezU+yUOGRdOQn5WNL0jIOF3dtB5KtenK3qf12/NotuYC8TT6H2
         LoY0IUsA5YlA3YAUoHwEEmoV1LSBM10xRgoBZ5YUxKOxJKMf8YNnzueCyn12FSF1ZmnI
         veSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtX8JBV+6E2KPNfEwP024+o67AmbZzvL6k7scU6NL6E=;
        b=ZG79949G9pl+5ZOTjHIZdPNfGfSXBZZLMdBKalTOyPjnTXOZStEYhcaJhzzwbF4LtC
         8FF13kFphrM19nbqaFfos2magoIbMuFFd0rgs3ZlP3bQH+UJNV/2BfFeB+Y3avauDUSI
         MQD7B0ptyq4q18bIPAn2e91Ja+hlT7mjYjyGnMu0txUg2IBvPUD1JKgnffJ5p+fnKs5Z
         zUjdMcITGns7rHp4zq2qXp88RR9qb7BfEdY0RjXtWIgpG5xAh6RI47XvPUCNUNkNxOHd
         8CrZzcuPTMpZPM2DHe43KCD8mnbkVW8be8eKNohB0AG/bxUrZOkH8PkdmeESYpUlOG8f
         L1Sw==
X-Gm-Message-State: AOAM5316WppSPMt9HDdmadN6P2U/DjLKrvYwqNl05VqNfbmlGSeZMADW
        HuzAcccKxEorBlMtprxK5hrl56Po3+B8ezt3h/g=
X-Google-Smtp-Source: ABdhPJyZSRVEUGtnFmj1si+hs6h/4OVZFdcn9wu2qrOBSVHnci994DjB3cH5I7tLfYjZiUBvFIeGVo6j6fVAW3HukuQ=
X-Received: by 2002:a62:7c95:0:b029:18c:5002:a1ab with SMTP id
 x143-20020a627c950000b029018c5002a1abmr2608866pfc.40.1605026625724; Tue, 10
 Nov 2020 08:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20201110145552.23024-1-brgl@bgdev.pl> <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com> <20201110151022.GY4077@smile.fi.intel.com>
 <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com>
 <20201110161225.GZ4077@smile.fi.intel.com> <CAMpxmJV4hsV34YS0Ez9_GsnBakXGgr3NTu8oBd+3Apg+921aRQ@mail.gmail.com>
In-Reply-To: <CAMpxmJV4hsV34YS0Ez9_GsnBakXGgr3NTu8oBd+3Apg+921aRQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 18:44:34 +0200
Message-ID: <CAHp75VcBp4HLBf1EVxkHYW-=wtJpFPx_14L2xZfBfB9yx5GM7w@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 6:37 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Tue, Nov 10, 2020 at 5:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > > > > > +static const struct regmap_config exar_regmap_config = {
> > > > > > +   .name           = "exar-gpio",
> > > > > > +   .reg_bits       = 16,
> > > > >
> > > > > As per previous version comment.
> > > > >
> > > > > Hold on, the registers are 16-bit wide, but their halves are sparsed!
> > > > > So, I guess 8 and 8 with helpers to get hi and lo parts are essential.
> > > > >
> > > > >
> > > > > TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT
> > > > >
> > > > > > +   .val_bits       = 8,
> > > > > > +};
> > > > >
> > > > > This is basically represents two banks out of 6 8-bit registers each.
> > > >
> > > > ...which makes me wonder if gpio-regmap can be utilized here...
> > > >
> > >
> > > But the address width won't affect the actuall accessing of 8 bits
> > > registers in an mmio regmap. Internally the mmio regmap does pretty
> > > much the same thing the previous driver did: call readb()/writeb() on
> > > 8-bit "chunks" of the banks.
> >
> > It will affect reg dump in debugfs. I would really narrow down the register
> > address space in the config, otherwise that debugfs facility will screw up a
> > lot of things.
> >
> > So, and to be on pedantic side...
> >
> > "The Device Configuration Registers and the two individual UART Configuration
> > Registers of the XR17V352 occupy 2K of PCI bus memory address space."
> >
> > 11 seems the correct value for the address width.
>
> I take it as a typo and assume you meant 16. So the patch should be
> correct and your review tag is good to go?

It's not a typo. But thinking again. This is basically done in regmap
to support serial buses. Here we have MMIO pretty much with 32-bit or
64-bit address accesses. I didn't dig into regmap implementation to
understand the consequences of changing this to the different values
(it seems like rather offset, and in this case 11 is a correct one,
not a typo, and regmap is okay with that).
But I would rather ask Jan to actually mount debugfs and dump
registers and see if it screws up the UART (because it may go all over
important registers), that's why I think this configuration is still
missing some strict rules about what addresses (offsets) driver may or
may not access.



-- 
With Best Regards,
Andy Shevchenko
