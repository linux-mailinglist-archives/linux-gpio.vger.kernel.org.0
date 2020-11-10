Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D582ADC73
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgKJQwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKJQwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 11:52:39 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19C4C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 08:52:37 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id t8so10408708iov.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 08:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h8aV1fRyAQr4lu0BWRM7KfIjU599lmTXpnXF/29ou/8=;
        b=LeDCrYseEV54t+QJ/c0KmtoQtibA3j/TYcLG1Qxs+L/v7kGAEXBpKq76n16mjKfakN
         uPACa6ThhNs+bRAll5Wpidpm5moKVd+ag49pJSn+YruLoszoM98vZy3SXShtzbsG1G6C
         t6z8RbDo+VKrrNDQMbCcU/r9ZXT8JPzDVCoVJlU476xTYyuEVY90UCsdJRwThxo+i5gm
         RTf1kLlV9gz4wbygu2LxYeoklDT2Mu4lUnlTJ8YuneQsjG0zIGGYbZtKnCgJ3irYRPtn
         Q3mqedE0I4FUjIjSO+Z+VMChANMFrJJpo3LKBvgMnZ02+Tmrt/SuibBv3GEzs24l6cTX
         rITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8aV1fRyAQr4lu0BWRM7KfIjU599lmTXpnXF/29ou/8=;
        b=edRTX52s2pkC6EibcSx7ejNTVBX9JDL1SaJGh60ujwQ/wibcG861t6ud5pxOsmhAr0
         GOUYgUVrQBhF3w6oel4GyoULQJYSD40AdIUV6Acj11bSfzqvU4SLd2A428QjypNKzjvz
         rpZaBvhJUD3jl4D9EmNBqtgpctoh75Fcw536f3KpkWaZqMoECVtZiJUhGZafJ+od88zN
         i4QBpdr/8pTaORzMh6bOjtvz+eeMnWjReHRZs0kLcxtNr+Q57aiI/Aw15WpAzSQ2Ha08
         Krs6jzjvp2pl+l+AYP9O3/rpLVbqagEHLpJhvd4XCbb0BL31uH8KYd2aVmTBeQ4IdQTg
         nNPg==
X-Gm-Message-State: AOAM530BwEZbi5Bp/WbWHSDsHZ5wCTmSchWFUOVvBmZ2vhbVbgG714WN
        AzMyGUHBcjyRJxdlGtG4+oHNgPYJTCz+55EEukDQWA==
X-Google-Smtp-Source: ABdhPJyJOUuveGDhCdaEOJ/9X23r3GKk4VSIPGKbrm4siQ5YBwGU1B0PfgtDNymxvOfGEe+aqVPErTFYcBfMDF1BYEU=
X-Received: by 2002:a02:65cf:: with SMTP id u198mr15677478jab.24.1605027157271;
 Tue, 10 Nov 2020 08:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20201110145552.23024-1-brgl@bgdev.pl> <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com> <20201110151022.GY4077@smile.fi.intel.com>
 <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com>
 <20201110161225.GZ4077@smile.fi.intel.com> <CAMpxmJV4hsV34YS0Ez9_GsnBakXGgr3NTu8oBd+3Apg+921aRQ@mail.gmail.com>
 <CAHp75VcBp4HLBf1EVxkHYW-=wtJpFPx_14L2xZfBfB9yx5GM7w@mail.gmail.com>
In-Reply-To: <CAHp75VcBp4HLBf1EVxkHYW-=wtJpFPx_14L2xZfBfB9yx5GM7w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 10 Nov 2020 17:52:26 +0100
Message-ID: <CAMRc=McyHfti_9ner8vyF=J=srzWJXsa7GRmwKF1TJ=ksGQM5g@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 5:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 6:37 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Tue, Nov 10, 2020 at 5:17 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > > > > +static const struct regmap_config exar_regmap_config = {
> > > > > > > +   .name           = "exar-gpio",
> > > > > > > +   .reg_bits       = 16,
> > > > > >
> > > > > > As per previous version comment.
> > > > > >
> > > > > > Hold on, the registers are 16-bit wide, but their halves are sparsed!
> > > > > > So, I guess 8 and 8 with helpers to get hi and lo parts are essential.
> > > > > >
> > > > > >
> > > > > > TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT
> > > > > >
> > > > > > > +   .val_bits       = 8,
> > > > > > > +};
> > > > > >
> > > > > > This is basically represents two banks out of 6 8-bit registers each.
> > > > >
> > > > > ...which makes me wonder if gpio-regmap can be utilized here...
> > > > >
> > > >
> > > > But the address width won't affect the actuall accessing of 8 bits
> > > > registers in an mmio regmap. Internally the mmio regmap does pretty
> > > > much the same thing the previous driver did: call readb()/writeb() on
> > > > 8-bit "chunks" of the banks.
> > >
> > > It will affect reg dump in debugfs. I would really narrow down the register
> > > address space in the config, otherwise that debugfs facility will screw up a
> > > lot of things.
> > >
> > > So, and to be on pedantic side...
> > >
> > > "The Device Configuration Registers and the two individual UART Configuration
> > > Registers of the XR17V352 occupy 2K of PCI bus memory address space."
> > >
> > > 11 seems the correct value for the address width.
> >
> > I take it as a typo and assume you meant 16. So the patch should be
> > correct and your review tag is good to go?
>
> It's not a typo. But thinking again. This is basically done in regmap
> to support serial buses. Here we have MMIO pretty much with 32-bit or
> 64-bit address accesses. I didn't dig into regmap implementation to
> understand the consequences of changing this to the different values
> (it seems like rather offset, and in this case 11 is a correct one,
> not a typo, and regmap is okay with that).
> But I would rather ask Jan to actually mount debugfs and dump
> registers and see if it screws up the UART (because it may go all over
> important registers), that's why I think this configuration is still
> missing some strict rules about what addresses (offsets) driver may or
> may not access.

Ok now I get it. Yes 11 seems to be right in this case for the max
address. We can implement the readable/writable callbacks to be very
strict about the register accesses but isn't it overkill? This driver
is very small and only accesses a couple registers. I don't see such
strict checking very often except for very complicated modules (like
pca953x you mentioned).

Bartosz
