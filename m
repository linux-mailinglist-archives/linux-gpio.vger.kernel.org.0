Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A917340276
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 10:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhCRJum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 05:50:42 -0400
Received: from mail.thorsis.com ([92.198.35.195]:55708 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhCRJuW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 05:50:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 43A0FCFA
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 10:50:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o7qCYSbmDQ5G for <linux-gpio@vger.kernel.org>;
        Thu, 18 Mar 2021 10:50:21 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 21EA22A82; Thu, 18 Mar 2021 10:50:21 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
Date:   Thu, 18 Mar 2021 10:50:14 +0100 (CET)
From:   Alexander Dahl <ada@thorsis.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Message-ID: <854891727.11376.1616061014891@seven.thorsis.com>
In-Reply-To: <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
References: <946021874.11132.1615900079722@seven.thorsis.com>
 <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
 <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hei hei,

meanwhile I tried to proof my hypothesis. See below.

> Andy Shevchenko <andy.shevchenko@gmail.com> hat am 17.03.2021 13:33 gesch=
rieben:
>=20
> =20
> +Cc: Bart, Linus
>=20
> On Wed, Mar 17, 2021 at 1:22 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> >
> >
> > On Tuesday, March 16, 2021, Alexander Dahl <ada@thorsis.com> wrote:
> >>
> >> Hei hei,
> >>
> >> for a Microchip SAMA5D2 SoC based device I try to set gpio-line-names =
in .dts file like this:
> >>
> >> 257 &pioA {
> >> 258         gpio-line-names =3D "",                   /* PA0  */
> >> 259                           "",                   /* PA1  */
> >> 260                           "",                   /* PA2  */
> >> 261                           "FOO",                /* PA3  */
> >> 262                           "BAR",                /* PA4  */
> >> 263                           "",                   /* PA5  */
> >>
> >> =E2=80=A6 and so on for all 4 * 32 GPIO Pins. However when calling `gp=
ioinfo` in userspace, I always get this:
> >>
> >> $ gpioinfo
> >> gpiochip0 - 128 lines:
> >>         line   0:        "PA0"       unused   input  active-high
> >>         line   1:        "PA1"       unused   input  active-high
> >>         line   2:        "PA2"       unused   input  active-high
> >>         line   3:        "PA3"       unused   input  active-high
> >>         line   4:        "PA4"       unused   input  active-high
> >>         line   5:        "PA5"       unused   input  active-high
> >>
> >> =E2=80=A6 and so on. Those "PA0" line names are set by the pinctrl dri=
ver in drivers/pinctrl/pinctrl-at91-pio4.c before calling gpiochip_add_data=
() and from reading the code in drivers/gpio/gpiolib.c I suspect devprop_gp=
iochip_set_names() is never called then, so those names in .dts are simply =
ignored.
> >>
> >> Those default names from the at91 pio4 pinctrl driver are certainly co=
rrect speaking of pin names, but from a userspace point of view it would be=
 better if I could override those from dts, so an application using libgpio=
d could look for a name like e.g. "VALVE7_EN" without caring to which pin t=
hat's actually connected. Can I override those with a currently present ker=
nel?=20

I don't think I can override with a recent kernel.

>>> Or is it a problem in either the at91 pio4 driver or the gpiolib core? =
Or is that no real usecase and should I do it differently?

If I disable the name assignment in the pinctrl-at91-pio4 driver, I get the=
 line names from the dts. I used the following diff:


diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-=
at91-pio4.c
index 578b387100d9..f994a2468cc3 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1095,7 +1095,9 @@ static int atmel_pinctrl_probe(struct platform_device=
 *pdev)
        atmel_pioctrl->gpio_chip->ngpio =3D atmel_pioctrl->npins;
        atmel_pioctrl->gpio_chip->label =3D dev_name(dev);
        atmel_pioctrl->gpio_chip->parent =3D dev;
+#if 0
        atmel_pioctrl->gpio_chip->names =3D atmel_pioctrl->group_names;
+#endif
=20
        atmel_pioctrl->pm_wakeup_sources =3D devm_kcalloc(dev,
                        atmel_pioctrl->nbanks,


Now gpioinfo shows what I set in dts, more or less similar to this:

gpiochip0 - 128 lines:
        line   0:      unnamed       unused   input  active-high=20
        line   1:      unnamed       unused   input  active-high=20
        line   2:      unnamed       unused   input  active-high=20
        line   3:        "FOO"       unused   input  active-high=20
        line   4:        "BAR"       unused   input  active-high=20
        line   5:      unnamed       unused   input  active-high=20

> >
> >
> > I would like to know the consequences if allow this, but to me it sound=
s like a bug in the gpiolib.c.

At least the documentation recommends to not use pin names: https://www.ker=
nel.org/doc/Documentation/devicetree/bindings/gpio/gpio.txt

If anyone has an idea how to fix this, let me know. I can try to make a pat=
ch then. Currently however, I'm not familiar enough with the gpio subsystem=
 to just start that.

Greets
Alex
