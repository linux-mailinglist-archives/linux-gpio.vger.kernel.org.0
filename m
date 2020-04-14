Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E37A1A77C9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437948AbgDNJut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 05:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437939AbgDNJuY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2020 05:50:24 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07254C03C1A5
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 02:50:24 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id g74so12448713qke.13
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/DhJ4EzT/qK/S+BlKlO4uoMzq/4I59+oyG4OzepvYlA=;
        b=yJpe/IZa7MG2vVVoYih+Gt4OkeMZMIvXQy0ofjG6eCtenRILevCwunlUaag128HxX0
         llUMyq9HY/d0RA/S0LzMJe749ahbdp6VIi1IRrO3LzEQMi9DEgG1QfFESgbczZg4zbqx
         xmwE3xvH7zCCy39akXq6NFDYZmW4Y8zcHs2wRX9BnXCq4zt7G/xnAccSNXX/Y2c0b+dL
         dxysTNdJ2ZLkdH4xkyQGJUTeHnfYgrJjHIAPmN000ubmzePf6Q4XA0WtiZvlRZiaUOiQ
         wOsikaEjb1PlflvbiZOzGTYL+e6HEifR7zEi+mpmfAWgAKqALFp+lIxpz1jPSVhW7O+2
         KjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/DhJ4EzT/qK/S+BlKlO4uoMzq/4I59+oyG4OzepvYlA=;
        b=T2feHiUPCMuk98T9xvj2Df7tvl4AKphbAM3IyfDE4jtryZYewlvtciUpn6plB/uFHJ
         tGiYWdZG71EOGBf+ILTg6KBhu8h9nSFny3DVm0IlXmR+PjmEATcKcY+hj3FQJP5XFHVB
         vwqc0+lSIXE72h39/tYnBkTFermMDNdZJkXRR6GgT8fieGIaDUD597i1CgQbFl9irFCQ
         VOu68OCWbvtsMP/ydo1E27WG8fUzpTGfTQj0obdHdVrvoOUYxfSLH+zF1+kIc71XoSn3
         qAWGWHsFgXLHkaWY2Ukll8L/RLba0PSGZMAUxIwLaQEuL9uizUwpjWOt5fEbuMqAbd05
         VWgg==
X-Gm-Message-State: AGi0PuaQo8v3AP4n8BdHAA4MzE+1xwCmRdpm+ie9FvlmPr+AOzqlXk8Y
        SCH9JI9LZTNv8Al9i/eDLaqW//m63xng1isI0TL4Mg==
X-Google-Smtp-Source: APiQypLRnSNRTZ7adXEhjoANPp4O6Cddg20KUv7l9FAno3ZccIj+4u1/MYSt+Ss+59XVof24kucbUMpsSRx+R0RnkaI=
X-Received: by 2002:a05:620a:1289:: with SMTP id w9mr5503980qki.263.1586857822917;
 Tue, 14 Apr 2020 02:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203656.27047-1-michael@walle.cc> <20200402203656.27047-11-michael@walle.cc>
 <CAMpxmJVE3PgVCxkQ-ryc5=KSrKcpdmk1cnJUxJBz9QFCx-e_+A@mail.gmail.com> <80bd8661ec8a1f5eda3f09a267846eaa@walle.cc>
In-Reply-To: <80bd8661ec8a1f5eda3f09a267846eaa@walle.cc>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 14 Apr 2020 11:50:11 +0200
Message-ID: <CAMpxmJVC7e9JnHzBo-h8M1+KmcA32=Rvxo7+znH=-kAbcCr_LQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] gpio: add a reusable generic gpio_chip using regmap
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 6 kwi 2020 o 12:10 Michael Walle <michael@walle.cc> napisa=C5=82(a):
>
>
> Hi Bartosz, Hi Mark Brown,
>
> Am 2020-04-06 09:47, schrieb Bartosz Golaszewski:
> > czw., 2 kwi 2020 o 22:37 Michael Walle <michael@walle.cc> napisa=C5=82(=
a):
> >>
> >> There are quite a lot simple GPIO controller which are using regmap to
> >> access the hardware. This driver tries to be a base to unify existing
> >> code into one place. This won't cover everything but it should be a
> >> good
> >> starting point.
> >>
> >> It does not implement its own irq_chip because there is already a
> >> generic one for regmap based devices. Instead, the irq_chip will be
> >> instanciated in the parent driver and its irq domain will be associate
> >> to this driver.
> >>
> >> For now it consists of the usual registers, like set (and an optional
> >> clear) data register, an input register and direction registers.
> >> Out-of-the-box, it supports consecutive register mappings and mappings
> >> where the registers have gaps between them with a linear mapping
> >> between
> >> GPIO offset and bit position. For weirder mappings the user can
> >> register
> >> its own .xlate().
> >>
> >> Signed-off-by: Michael Walle <michael@walle.cc>
> >
> > Hi Michael,
> >
> > Thanks for doing this! When looking at other generic drivers:
> > gpio-mmio and gpio-reg I can see there are some corner-cases and more
> > specific configuration options we could add
>
> I didn't want to copy every bit without being able to test it.
>

Sure, I didn't mean we need to do it now - just set it as the future goal.

> > but it's not a blocker,
> > we'll probably be extending this one as we convert more drivers to
> > using it.
>
> correct, that was also my plan.
>
> > Personally I'd love to see gpio-mmio and gpio-reg removed
> > and replaced by a single, generic regmap interface eventually.
>
> agreed.
>
>

[snip!]

> >> +
> >> +/**
> >> + * gpio_regmap_simple_xlate() - translate base/offset to reg/mask
> >> + *
> >> + * Use a simple linear mapping to translate the offset to the
> >> bitmask.
> >> + */
> >> +int gpio_regmap_simple_xlate(struct gpio_regmap *gpio, unsigned int
> >> base,
> >> +                            unsigned int offset,
> >> +                            unsigned int *reg, unsigned int *mask)
> >> +{
> >> +       unsigned int line =3D offset % gpio->ngpio_per_reg;
> >> +       unsigned int stride =3D offset / gpio->ngpio_per_reg;
> >> +
> >> +       *reg =3D base + stride * gpio->reg_stride;
> >> +       *mask =3D BIT(line);
> >> +
> >> +       return 0;
> >> +}
> >> +EXPORT_SYMBOL_GPL(gpio_regmap_simple_xlate);
> >
> > Why does this need to be exported?
>
> Mh, the idea was that a user could also set this xlate() by himself (for
> whatever reason). But since it is the default, it is not really
> necessary.
> That being said, I don't care if its only local to this module.
>

Let's only export symbols that have external users then.

[snip!]

> >> +
> >> +MODULE_AUTHOR("Michael Walle <michael@walle.cc>");
> >> +MODULE_DESCRIPTION("GPIO generic regmap driver core");
> >> +MODULE_LICENSE("GPL");
> >> diff --git a/include/linux/gpio-regmap.h b/include/linux/gpio-regmap.h
> >> new file mode 100644
> >> index 000000000000..ad63955e0e43
> >> --- /dev/null
> >> +++ b/include/linux/gpio-regmap.h
> >> @@ -0,0 +1,88 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +
> >> +#ifndef _LINUX_GPIO_REGMAP_H
> >> +#define _LINUX_GPIO_REGMAP_H
> >> +
> >> +struct gpio_regmap_addr {
> >> +       unsigned int addr;
> >> +       bool valid;
> >> +};
> >
> > I'm not quite sure what the meaning behind the valid field here is.
> > When would we potentially set it to false?
>
> Some base addresses are optional, but on the other hand, a base address
> of 0 could also be valid. So I cannot use 0 as an indicator whether a
> base address is set or not. The generic mmio driver has some special
> case for the ack base, where there is a use_ack flag which forces to
> use the ack register even if its zero. So I've had a look at the kernel
> if there is a better idiom for that, but I haven't found anything.
>
> So the best from a user perspective I've could come up with was:
>
>    ->base_reg =3D GPIO_REGMAP_ADDR(addr);
>
> I'm open for suggestions.
>

Maybe setting the pointer to ERR_PTR(-ENOENT) which will result in
IS_ERR() returning true?

> >
> >> +#define GPIO_REGMAP_ADDR(_addr) \
> >> +       ((struct gpio_regmap_addr) { .addr =3D _addr, .valid =3D true =
})
> >> +
> >> +/**
> >> + * struct gpio_regmap - Description of a generic regmap gpio_chip.
> >> + *
> >> + * @parent:            The parent device
> >> + * @regmap:            The regmap use to access the registers
> >
> > s/use/used/
> >
> >> + *                     given, the name of the device is used
> >> + * @label:             (Optional) Descriptive name for GPIO
> >> controller.
> >> + *                     If not given, the name of the device is used.
> >> + * @ngpio:             Number of GPIOs
> >> + * @reg_dat_base:      (Optional) (in) register base address
> >> + * @reg_set_base:      (Optional) set register base address
> >> + * @reg_clr_base:      (Optional) clear register base address
> >> + * @reg_dir_in_base:   (Optional) out setting register base address
> >> + * @reg_dir_out_base:  (Optional) in setting register base address
> >> + * @reg_stride:                (Optional) May be set if the registers
> >> (of the
> >> + *                     same type, dat, set, etc) are not consecutive.
> >> + * @ngpio_per_reg:     Number of GPIOs per register
> >> + * @irq_domain:                (Optional) IRQ domain if the
> >> controller is
> >> + *                     interrupt-capable
> >> + * @reg_mask_xlate:     (Optional) Translates base address and GPIO
> >> + *                     offset to a register/bitmask pair. If not
> >> + *                     given the default gpio_regmap_simple_xlate()
> >> + *                     is used.
> >> + * @to_irq:            (Optional) Maps GPIO offset to a irq number.
> >> + *                     By default assumes a linear mapping of the
> >> + *                     given irq_domain.
> >> + * @driver_data:       Pointer to the drivers private data. Not used
> >> by
> >> + *                     gpio-regmap.
> >> + *
> >> + * The reg_mask_xlate translates a given base address and GPIO offset
> >> to
> >> + * register and mask pair. The base address is one of the given
> >> reg_*_base.
> >> + */
> >> +struct gpio_regmap {
> >
> > I'd prefer to follow a pattern seen in other such APIs of calling this
> > structure gpio_regmap_config and creating another private structure
> > called gpio_regmap used in callbacks that would only contain necessary
> > fields.
>
> something like the following?
>
> struct gpio_regmap *gpio_regmap_register(struct gpio_regmap_config *)
>
> but if that structure is private, how can a callback access individual
> elements? Or do you mean private in "local to the gpio drivers"?
>

Either making the structure local to drivers/gpio or making it
entirely opaque and providing accessor functions. Depending on how
much of the structure one may want to access.

> Also I was unsure about the naming, eg. some use
> stuff_register()/stuff_unregister() and some stuff_add()/stuff_remove().
>

register/unregister is fine with me.

Bart
