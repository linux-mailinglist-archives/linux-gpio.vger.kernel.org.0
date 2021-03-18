Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E233405BA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 13:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhCRMlL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 08:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhCRMlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Mar 2021 08:41:01 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311CDC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 05:41:01 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u19so1343003pgh.10
        for <linux-gpio@vger.kernel.org>; Thu, 18 Mar 2021 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uoa+9hG0yVOM7cC3Xkalj2VEBTnYKyk+aB21qqFQcS8=;
        b=st7ehrjurQhJ+/5gL6Fb3oql2hSsr63Mp4ITWw4J3ni0X7CLc5Ip/0uwtNBBspjrjv
         yZjxJ68QRdKPUgBfLaeiHZV8I298ReD6j+idCNC6aj1S+Pdhv4nRTCSNzbnRL14CGknv
         FclBa2Ed7EF/70IYqHAK0iHP2s36aZ6qSgu458DAZ5WZWC8vRqE4HeZ5WcrlzBHrcv0i
         itkRu4X7LW23WoEid7ZsFiu3s2fY0P27oTHYLh1eQp8cNr/1h21AJ/tkL4eorGGINWBb
         phyAHWlL6yY3uIeaGXkrWwyOjeWEFvrzXkANHgCR26iKY5mYuD2vj31WFdRo5hnyX+Tl
         s5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uoa+9hG0yVOM7cC3Xkalj2VEBTnYKyk+aB21qqFQcS8=;
        b=dSd0ehJfanZURjMl91DFdu3daosl1RWYoyHi2zt7nqxvd98+YG1pb1NkSB1ZtknXpk
         2gvTXgd4QOjrsh9iS2aN2BU81d/IiHmkvIZDxYVuNABYmVJ68uu333BhmNClIl5ouwg+
         ac1tywnqq7KXlsZYO3E2qWmGazgQ9VYPxByakm5JZLVoaw328czUGt3uVhZgf8ckumgv
         ojNzvKy1OcC50toIMEfFw5mTnS8Ti5oiivZnxb5nG663ZvUWwaYZN0OIU2A1uBSWiHgl
         SPmLZssiD4P7HtTFN17wpPqHoEHscaWIV4IaqR3K1M2R0LqY1DffI6zAuwbueOBgbs2R
         yXKQ==
X-Gm-Message-State: AOAM533rvacHFMkICKGWGO0IBs9d85TtrjG4uoSEQQ+obwgVzaj7WmOc
        91a4/UJtH8QRX5Y7y5PDHnFuObVT6NkqNk9fS+8jF1mMfXMpDBGm
X-Google-Smtp-Source: ABdhPJy8gH5NvRo8D9IdXlpzwAfbgUdgqq4mGME6NCDVgQXvZVP5+vJhuLpmZLGYc9yyIX6hnZWeKSajU1QIHT6vbYQ=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr6812587pgf.4.1616071260548;
 Thu, 18 Mar 2021 05:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <946021874.11132.1615900079722@seven.thorsis.com>
 <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
 <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com> <854891727.11376.1616061014891@seven.thorsis.com>
In-Reply-To: <854891727.11376.1616061014891@seven.thorsis.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Mar 2021 14:40:44 +0200
Message-ID: <CAHp75Vftrq66SweYKYprWBoi9X8csxe9ROaMorRFUjGSD8gNSQ@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
To:     Alexander Dahl <ada@thorsis.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Kent (sorry, forgot to include you earlier)

On Thu, Mar 18, 2021 at 11:50 AM Alexander Dahl <ada@thorsis.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> hat am 17.03.2021 13:33 ges=
chrieben:
> > On Wed, Mar 17, 2021 at 1:22 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tuesday, March 16, 2021, Alexander Dahl <ada@thorsis.com> wrote:

...

> > >> for a Microchip SAMA5D2 SoC based device I try to set gpio-line-name=
s in .dts file like this:
> > >>
> > >> 257 &pioA {
> > >> 258         gpio-line-names =3D "",                   /* PA0  */
> > >> 259                           "",                   /* PA1  */
> > >> 260                           "",                   /* PA2  */
> > >> 261                           "FOO",                /* PA3  */
> > >> 262                           "BAR",                /* PA4  */
> > >> 263                           "",                   /* PA5  */
> > >>
> > >> =E2=80=A6 and so on for all 4 * 32 GPIO Pins. However when calling `=
gpioinfo` in userspace, I always get this:
> > >>
> > >> $ gpioinfo
> > >> gpiochip0 - 128 lines:
> > >>         line   0:        "PA0"       unused   input  active-high
> > >>         line   1:        "PA1"       unused   input  active-high
> > >>         line   2:        "PA2"       unused   input  active-high
> > >>         line   3:        "PA3"       unused   input  active-high
> > >>         line   4:        "PA4"       unused   input  active-high
> > >>         line   5:        "PA5"       unused   input  active-high
> > >>
> > >> =E2=80=A6 and so on. Those "PA0" line names are set by the pinctrl d=
river in drivers/pinctrl/pinctrl-at91-pio4.c before calling gpiochip_add_da=
ta() and from reading the code in drivers/gpio/gpiolib.c I suspect devprop_=
gpiochip_set_names() is never called then, so those names in .dts are simpl=
y ignored.
> > >>
> > >> Those default names from the at91 pio4 pinctrl driver are certainly =
correct speaking of pin names, but from a userspace point of view it would =
be better if I could override those from dts, so an application using libgp=
iod could look for a name like e.g. "VALVE7_EN" without caring to which pin=
 that's actually connected. Can I override those with a currently present k=
ernel?
>
> I don't think I can override with a recent kernel.
>
> >>> Or is it a problem in either the at91 pio4 driver or the gpiolib core=
? Or is that no real usecase and should I do it differently?
>
> If I disable the name assignment in the pinctrl-at91-pio4 driver, I get t=
he line names from the dts. I used the following diff:

...

> Now gpioinfo shows what I set in dts, more or less similar to this:
>
> gpiochip0 - 128 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed       unused   input  active-high
>         line   3:        "FOO"       unused   input  active-high
>         line   4:        "BAR"       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>
> > > I would like to know the consequences if allow this, but to me it sou=
nds like a bug in the gpiolib.c.
>
> At least the documentation recommends to not use pin names: https://www.k=
ernel.org/doc/Documentation/devicetree/bindings/gpio/gpio.txt
>
> If anyone has an idea how to fix this, let me know. I can try to make a p=
atch then. Currently however, I'm not familiar enough with the gpio subsyst=
em to just start that.

You may look into the commit
7cba1a4d5e16 ("gpiolib: generalize devprop_gpiochip_set_names() for
device properties")
which unifies the logic, but at the same time removed one comment:

-       /* If the chip defines names itself, these take precedence */

So, logic was that for a long time. And unfortunately I don't see how
we may change this without breakage. This backs us to the discussion
if the name of the line is ABI or not.

--=20
With Best Regards,
Andy Shevchenko
