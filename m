Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2E83A5779
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Jun 2021 12:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhFMKIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 06:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhFMKIf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 06:08:35 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11526C061574;
        Sun, 13 Jun 2021 03:06:35 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v13so5064685ple.9;
        Sun, 13 Jun 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dmdhVPXKoyiUaz/UceIGPTISFReWjVbR2rEWBrtoQCw=;
        b=NxjIvQScwkUpIMuR4wM1STfFJqTO/L9Ii2gEjfu97ZCVjUJ+/8jvX5jAya7aWesdL4
         YIkPKVyxLR0mXeQegdROBKDqnV/T2tSQv/o6WF/rvxW2UB6/sDRT6gmuJBVIIqtbRQZr
         RII9iOGRvQDQPr5iycrIrFy/vLLMuT6KQfVH1vDAdKACfLGXvIMRpZQ4Dgv6kghV4sDO
         wZivgvsNvJZZjNwsFXZTUVVVJ5jR3+wdHWE5Qf882t3M54q7PvkMKZkob8Kty2obISU/
         zbkuH5IVG2o12rkszy113co1/eB2d1OVl96VfwjTjymWlZ0e7jNlYoiTrKd4MGE1P+nq
         7BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dmdhVPXKoyiUaz/UceIGPTISFReWjVbR2rEWBrtoQCw=;
        b=ju5l6Lm/4GMRTGvCXs/gRNb1j2rBDLqTx+9vlpbeJx8pu++26pWnW6Xy6d5lGZwHM9
         GH0n+QwizYdaS0WM4J7DQsOwJpIaFnEYXE0XN/UXy+ZYUTn/hmCH5aSIJnO9d62a4kYf
         myPX27AjY5pIrnhxXF+AsRA8BLmuLCbEXTTP7M2ke2Ha/a7qvqdjqnV+pbTcHaXoTcrH
         8/0COdZsM4RWb4M27qysPo8aR9gv4V2hj1v6UAZ0u+RfECH2G9C5POqTI8i7EEg6RGpY
         FUV0/lk+OprplHZWfe+IpMqMNUDb5k0OZV1lKLmLzoBmjsA3RJDDjHvSRN/BV4pC5stA
         Qb/Q==
X-Gm-Message-State: AOAM530qDqxZBpqxDXn6qAPWOAOm+AHOXAxUlwAbRktZKnpOfTVsUZbB
        pGlpyhcxPzt7fcd2fsdZZ94uvqLxEJOQn7yTKKY=
X-Google-Smtp-Source: ABdhPJw+csIyisxCvQnicRcCuZFcFFbK0WZBj7GREsXw4jVsdK9NKeXC9g9iPo1rxyW16nk7M2r0Sas5hn3Vvb3DbhM=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr2545061pjq.129.1623578792162;
 Sun, 13 Jun 2021 03:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net> <CAHp75Vci1DSFu-tpgwQZfuVycqHYmhGhLDDCOH_dX8HKvqpY_A@mail.gmail.com>
 <YMVBTp4VaSilFi0H@latitude>
In-Reply-To: <YMVBTp4VaSilFi0H@latitude>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Jun 2021 13:06:15 +0300
Message-ID: <CAHp75Vd9FEGuaVbRUK67uzRoeQSXQUGAhXExHgJvkDd585kxwA@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 13, 2021 at 2:20 AM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Wed, Jun 02, 2021 at 03:50:39PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 2, 2021 at 3:05 PM Jonathan Neusch=C3=A4fer
> > <j.neuschaefer@gmx.net> wrote:

...

> > > +       help
> > > +         Say Y here to enable pin controller and GPIO support
> > > +         for the Nuvoton WPCM450 SoC.
> >
> > >From this help it's not clear why user should or shouldn't enable it.
> > Please, elaborate (and hence fix checkpatch warning).
>
> I'll try something like this, but I'm open for better ideas:
>
>         help
>           Say Y or M here to enable pin controller and GPIO support for
>           the Nuvoton WPCM450 SoC. This is strongly recommended when
>           building a kernel that will run on this chip.
>
>           If this driver is compiled as a module, it will be named
>           pinctrl-wpcm450.

This looks good enough.

> I could mention some examples of functionality enabled by this driver:
> LEDs, host power control, Ethernet.
>
> (LEDs and host power control use GPIOs, at least on the Supermicro X9
>  board I've been using. Ethernet MDIO must be enabled through the
>  pinctrl driver, unless the bootloader has done so already; on my board
>  the bootloader doesn't do this.)

...

> > > +static int wpcm450_gpio_get_direction(struct gpio_chip *chip,
> > > +                                     unsigned int offset)
> > > +{
> > > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > > +       const struct wpcm450_port *port =3D to_port(offset);
> > > +       unsigned long flags;
> > > +       u32 cfg0;
> > > +       int dir;
> > > +
> > > +       spin_lock_irqsave(&pctrl->lock, flags);
> > > +       if (port->cfg0) {
> > > +               cfg0 =3D ioread32(pctrl->gpio_base + port->cfg0);
> >
> > > +               dir =3D !(cfg0 & port_mask(port, offset));
> > > +       } else {
> > > +               /* If cfg0 is unavailable, the GPIO is always an inpu=
t */
> > > +               dir =3D 1;
> > > +       }
> >
> > Why above is under spin lock?
> > Same question for all other similar places in different functions, if a=
ny.
>
> My intention was to protect the ioread32. But given that it's just a
> single MMIO read, this might be unnecessary.

Sometimes it's necessary and I'm not talking about it. (I put blank
lines around the code I was commenting on)

So, What I meant above is to get something like this

if (port->cfg0) {
  spin lock
  ...
  spin unlock
} else {
  ...
}

or equivalent ideas.

> > > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > > +       return dir;
> > > +}

...

> > > +static int wpcm450_gpio_direction_output(struct gpio_chip *chip,
> > > +                                        unsigned int offset, int val=
ue)
> > > +{
> > > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > > +       const struct wpcm450_port *port =3D to_port(offset);
> > > +       unsigned long flags;
> > > +       u32 dataout, cfg0;
> >
> > > +       int ret =3D 0;
> >
> > Redundant. Can do it without it.
> >
> > > +       spin_lock_irqsave(&pctrl->lock, flags);
> > > +       if (port->cfg0) {
> >
> > > +       } else {
> > > +               ret =3D -EINVAL;
> > > +       }
> > > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > > +       return ret;
> > > +}
>
> I'll refactor it to return -EINVAL early.

Here a similar approach can be used.

...

> > What about the GPIO library API that does some additional stuff?
>
> I don't know which gpiolib function would be appropriate here, sorry.

When you leave those request and release callbacks untouched the GPIO
library will assign default ones. You may see what they do.

...

> > > +       if (!of_find_property(np, "gpio-controller", NULL))
> > > +               return -ENODEV;
> >
> > Dead code?
>
> The point here was to check if the node is marked as a GPIO controller,
> with the boolean property "gpio-controller" (so device_property_read_bool
> would probably be more appropriate).
>
> However, since the gpio-controller property is already defined as
> required in the DT binding, I'm not sure it's worth checking here.

Exactly my point.

--=20
With Best Regards,
Andy Shevchenko
