Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328AF44AC68
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245616AbhKILUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245647AbhKILUm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 06:20:42 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045BEC061767
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 03:17:57 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id v65so22589126ioe.5
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zOIK0pY0+erpcI8zPo6QJaQ+g1dAYFq2ZtgG2KTZtWE=;
        b=UDUz7sHZPURLvom+Kh2cDDrlO5XWNfmQNNIvqvsuWObekW/AyjTQPRwCAGRZEdsbU1
         m+R+wFppRZml5QBTMSG+Mc0a2nHnjkC3XCqs1g8ZtmxAR3onKHek0b0+wML77fXBR+FZ
         qn019oc4sNY9FrbNyeD9tZegmL+TtUnVQoUUihme7zc1PTs8ORVdbgM8lOijUYZTXXUh
         m+6Wjz2ZNzWoJD3UDKiOQA+lzqGcYoUnVKe83h99xwP/xXxffcKicLx/xeztcnBWZXuq
         hMkO3iFOnT3Y/WAMa3elQP+IkZkye4rbazx0vm8SowYecVRoLjckBgGGaVx/pKW4LIYQ
         SKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zOIK0pY0+erpcI8zPo6QJaQ+g1dAYFq2ZtgG2KTZtWE=;
        b=Lbn/NTn9LxkiSXBZq4cyD+6mFbr5OlfYvGoIOLh/gEALtS4PApuc8nyQRcSOQFOoMM
         sg8IYsbsLMX0TZwjcl1vvTMckC+wbVm1ZYcZRWRfnIRMN6kbQHuu8+h664LgQt0h6S39
         ye/LbpCxGx1TJ6MucPEYsZYPwG1iHEFFIQ6RHoJg3TrY4WIfG8pHVvfzlwQ098ZHwQRX
         iLDpn7zmM1jwdqyuo3uvUAmsbvxUcT3GklIgfKp+qCGls9YzF2VUPBUVzFARvhHHfnCr
         aMkXiKSSE3DiJy149LQkh+G7I0SJNubzjQhLdzulTFy/VWQYMdFrjwH0fn3IvTo7zK2q
         ULew==
X-Gm-Message-State: AOAM532xO1cGK3alJphgjaEEjaO0rKDs4PTnMKd4Fd75L1lWltaGoyIB
        sRg2pAFPCNCrGvYwFou1L4l/0pB4EpXw/aNp6ayIxA==
X-Google-Smtp-Source: ABdhPJxkewbkxk0UMJv01soJvj4cYeO1lJGXlHNahvj8mE/OiHUmUvXCfoRZtv+grdjLzbRct3hoET8+Xr23RlmiTq0=
X-Received: by 2002:a05:6638:1607:: with SMTP id x7mr4962927jas.27.1636456676433;
 Tue, 09 Nov 2021 03:17:56 -0800 (PST)
MIME-Version: 1.0
References: <20211102165657.3428995-1-robert.marko@sartura.hr>
 <20211102165657.3428995-2-robert.marko@sartura.hr> <CAHp75VdnQq76f5Xeo5LCq83sr4TbcXY_mtZ4x_rFzUkS01BYZg@mail.gmail.com>
 <CA+HBbNEEPHLbJSdWPdxWb5gASha_NavJrEBBRkbvzEW2aDSjmQ@mail.gmail.com> <cd0b876b5a043de21179eea01ca0344c@walle.cc>
In-Reply-To: <cd0b876b5a043de21179eea01ca0344c@walle.cc>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 9 Nov 2021 12:17:45 +0100
Message-ID: <CA+HBbNEcHi_tmat28RRNvw6dppv_zKLY3+gC1uELE9STaNqQ6w@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Michael Walle <michael@walle.cc>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 6, 2021 at 12:19 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-11-05 12:34, schrieb Robert Marko:
> > On Tue, Nov 2, 2021 at 8:28 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >>
> >> On Tue, Nov 2, 2021 at 6:57 PM Robert Marko <robert.marko@sartura.hr>
> >> wrote:
> >> >
> >> > Delta TN48M switch has an onboard Lattice CPLD that is used as a GPIO
> >> > expander.
> >> >
> >> > The CPLD provides 12 pins in total on the TN48M, but on more advanced
> >> > switch models it provides up to 192 pins, so the driver is extendable
> >> > to support more switches.
> >>
> >> ...
> >>
> >> > +static int tn48m_gpio_probe(struct platform_device *pdev)
> >> > +{
> >>
> >> > +       const struct tn48m_gpio_config *gpio_config = NULL;
> >> > +       struct gpio_regmap_config config = {0};
> >>
> >> I don't see a point in assigning these variables.
> >
> > Hi,
> > The NULL one isn't required, but the regmap one is, otherwise the
> > devm_gpio_regmap_register call will
> > return -EINVAL.
> >
> > It will fail here:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpio-regmap.c#L209
> >
> > I see that Michael Walle who did the GPIO regmap uses it as well in
> > the Kontron CPLD driver.
> > Michael, can you shed some light on this?
>
> I guess this was already clarified? Because you don't set
> all the properties of the config you have to initialize it.
> Otherwise anything could happen.

Yeah, I think it's clear now.
Thanks,
Robert
>
> -michael



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
