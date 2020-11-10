Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B412ADC3B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgKJQhC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgKJQhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 11:37:02 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13702C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 08:37:01 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id t9so10033955edq.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2mMYu22dnz+KyZr+E8arCrO6cReA2kl7/dkkmSbSl4=;
        b=kDAwYoi6LXxzoso9zqdVjjlUWZIm6xW4ElgNna+3DzDyLTPvlhco1e4t5pqaVrX0eT
         aXLuHlWyxqZxuxG17iNQKw08f4k+DaHUjiasnfxpLyFmJXQpiEmbKQ/KTetW4OCi5H6N
         BucQtJHaBiJ7dvPapiFYp5s3PFULpD9AS0omTKnDVevV4INFPmFViw6Zh3sXY3oxc50S
         5jDIsertocB6/Swivyj9jxXKqW4qLx0L0goOhIWuEGuIZ5wRVVrl/+dhDPxkKBRycyvz
         ALstp0GuC5D+OrBLkTwueM8/jXSl22UrIy/IhPRRC3FaBOb37njhd4xvGBlPaJj+QSNa
         yV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2mMYu22dnz+KyZr+E8arCrO6cReA2kl7/dkkmSbSl4=;
        b=gVj41PMiTBwvvOUTzu/AGys+F5HWAWFkKN1876IYGlTkXxOZQeENmSrvgVeYi/Nn4Z
         hRypK5UjmVf8GOYoshHB86YcvtIjpMkCA8Bqp9kFZjqYYqfglP+1NBQVewC84w8r7GQl
         NDAuV1M6ioH2V5I0KsABAMDZ+jKdBu5iwBlbDFEQ7ANqL0lJoZIqomJLuUXeLGzLcYrw
         4zN8CArsLD2YRFUrlLiEp/VFKUFS0HVUTOzeEiZM24G0E7+E1typPa9q5sLpL3Srkh7c
         18xmqaXs5ZfnWccYv8WP/iGDpZqQhOTU+d7uxHwxpert3tNh10dBNVouHLoY6/bAB3L0
         4N/Q==
X-Gm-Message-State: AOAM531Ul1T98ohGEZ2SnEteM6YMU3Wvv6fPVf0nq6iHoQX8GiKPPSaT
        ou/n60Af2FJ3oQlbAEHmM8TRYdmqRsw46tq2xdVkxw==
X-Google-Smtp-Source: ABdhPJz0I1CrN7kmr6zJD1EK1LX4uyfIgmFogQ6zgX/xEESrBrqH3kwGyIbjXPcUOdq+gxwFhWEuehXR4+4WS0DC6Tc=
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr150048edb.186.1605026219716;
 Tue, 10 Nov 2020 08:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20201110145552.23024-1-brgl@bgdev.pl> <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com> <20201110151022.GY4077@smile.fi.intel.com>
 <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com> <20201110161225.GZ4077@smile.fi.intel.com>
In-Reply-To: <20201110161225.GZ4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Nov 2020 17:36:48 +0100
Message-ID: <CAMpxmJV4hsV34YS0Ez9_GsnBakXGgr3NTu8oBd+3Apg+921aRQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 5:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 10, 2020 at 04:12:38PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 10, 2020 at 4:09 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Nov 10, 2020 at 05:04:47PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Nov 10, 2020 at 03:55:51PM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > We can simplify the code in gpio-exar by using regmap. This allows us to
> > > > > drop the mutex (regmap provides its own locking) and we can also reuse
> > > > > regmap's bit operations instead of implementing our own update function.
> > > >
> > > > ...
> > > >
> > > > > +static const struct regmap_config exar_regmap_config = {
> > > > > +   .name           = "exar-gpio",
> > > > > +   .reg_bits       = 16,
> > > >
> > > > As per previous version comment.
> > > >
> > > > Hold on, the registers are 16-bit wide, but their halves are sparsed!
> > > > So, I guess 8 and 8 with helpers to get hi and lo parts are essential.
> > > >
> > > >
> > > > TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT
> > > >
> > > > > +   .val_bits       = 8,
> > > > > +};
> > > >
> > > > This is basically represents two banks out of 6 8-bit registers each.
> > >
> > > ...which makes me wonder if gpio-regmap can be utilized here...
> > >
> >
> > But the address width won't affect the actuall accessing of 8 bits
> > registers in an mmio regmap. Internally the mmio regmap does pretty
> > much the same thing the previous driver did: call readb()/writeb() on
> > 8-bit "chunks" of the banks.
>
> It will affect reg dump in debugfs. I would really narrow down the register
> address space in the config, otherwise that debugfs facility will screw up a
> lot of things.
>
> So, and to be on pedantic side...
>
> "The Device Configuration Registers and the two individual UART Configuration
> Registers of the XR17V352 occupy 2K of PCI bus memory address space."
>
> 11 seems the correct value for the address width.
>

I take it as a typo and assume you meant 16. So the patch should be
correct and your review tag is good to go?

Bartosz
