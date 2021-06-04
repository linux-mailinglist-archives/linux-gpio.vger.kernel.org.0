Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB939B5FD
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhFDJdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 05:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDJdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 05:33:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299CAC061761
        for <linux-gpio@vger.kernel.org>; Fri,  4 Jun 2021 02:31:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t7so5970045lff.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jun 2021 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WqJtAEUyp1Bxzc5hAO9Tv+8VBm2svR4HUjAof0o85e0=;
        b=qkwDxkW1kfmJwJ7ndr3HTnaDKSWLTjA6xKL8JMiX1eMOCXTTZGQ2m2TgMArQ4L4aXx
         uHsCtRSZH0GDtdg9QSVua6H+8pssQAPi1mIXM5IdlJQIbbp+X2PtZ/0NJw/GKmUKJUnn
         AgTD1opvfRSRWW7crbgeuj+mZEvYOP1GlPBNudcy8ToaiQIIjg3X+AIYg8FiMnqa1ClK
         SlYcnbfJnns9hZuETArk9zBRx98aTc1TVlv4iSS70t/HuBQrZ115S+5m6U7nQVauO00X
         U3+ZzTu/8Zlu0wgE1HWNZT0iqO1CrUcWA3ZCpG7qhK0xMEP4l1CnYrigYuNIil6dEGde
         NejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WqJtAEUyp1Bxzc5hAO9Tv+8VBm2svR4HUjAof0o85e0=;
        b=CqCGzgi582S0EDj+LpERkNU5WSNvH/kAJsFP+7GiWIqZmM+LBlsVvrg7meNdVIkIoG
         2D05fcsHGeqU0E2SPUdeDmgLw2Ahhxj5it9R98zficRFfBIbVrJGQNNljz7zTn5fPJtH
         p6KjyoDrYkBgIRStdKFJB+pXexCJ1aC51laNf5yEGu6lI+pEkB94TsHLt49EnvUA/PDW
         EVHYbD3hb0fTawU0spB0jJyWxPGTMy9HMmENeO54goVvI9YwF+izFDInPJusxAE0RLgO
         Cj39aNM8nAoVTN1VlXbyRkndTtmO6KEzMh6DAzKM3xJasfwfnCcWP9D5kCHXUO8xa+zL
         W7gw==
X-Gm-Message-State: AOAM532EP/WcPCg6pXejCVuXsizETenmNEHYnMUPCOPTb4VaZ7goCfFi
        YDHQN2BMP6D6DzpdRgzqH5DeTKkozA17DGC1Ou0nmw==
X-Google-Smtp-Source: ABdhPJwjZUEUDLRMcFr5fmvHzeRRlf27zfb0dhKyXB4D2fLxv43UZy+tITmNzSY/BfIouz9XXQhzAbVXMbqMYiWx1qI=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr2110635lfr.649.1622799078510;
 Fri, 04 Jun 2021 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net> <20210602120329.2444672-6-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-6-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 11:31:07 +0200
Message-ID: <CACRpkdb=8e=D9JdwxA+oPGj80WnsV86apuECBp1m-Edd+hKPFQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jonathan!

thanks for your patch!

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> This driver is heavily based on the one for NPCM7xx, because the WPCM450
> is a predecessor of those SoCs.
>
> The biggest difference is in how the GPIO controller works. In the
> WPCM450, the GPIO registers are not organized in multiple banks, but
> rather placed continually into the same register block, and the driver
> reflects this.

This is unfortunate because now you can't use GPIO_GENERIC anymore.

> Some functionality implemented in the hardware was (for now) left unused
> in the driver, specifically blinking and pull-up/down.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

(...)

> +config PINCTRL_WPCM450
> +       bool "Pinctrl and GPIO driver for Nuvoton WPCM450"
> +       depends on (ARCH_WPCM450 || COMPILE_TEST) && OF
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIO_GENERIC

You are not using GPIO_GENERIC

> +struct wpcm450_port {
> +       /* Range of GPIOs in this port */
> +       u8 base;
> +       u8 length;
> +
> +       /* Register offsets (0 =3D register doesn't exist in this port) *=
/
> +       u8 cfg0, cfg1, cfg2;
> +       u8 blink;
> +       u8 dataout, datain;
> +};

If you used to have "GPIO banks" and you now have
"GPIO ports" what is the difference? Why can't these ports
just be individula gpio_chip:s with their own device tree
nodes inside the pin controller node?

If you split it up then you can go back to using
GPIO_GENERIC with bgpio_init() again which is a
big win.

All you seem to be doing is setting consecutive
bits in a register by offset, which is what GPIO_GENERIC
is for, just that it assumes offset is always from zero.
If you split it into individual gpio_chips per register
then you get this nice separation and code reuse.

> +static const struct wpcm450_port *to_port(int offset)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(wpcm450_ports); i++)
> +               if (offset >=3D wpcm450_ports[i].base &&
> +                   offset - wpcm450_ports[i].base < wpcm450_ports[i].len=
gth)
> +                       return &wpcm450_ports[i];
> +       return NULL;
> +}

Then you would also get away from this awkward thing.

> +static u32 port_mask(const struct wpcm450_port *port, int offset)
> +{
> +       return BIT(offset - port->base);
> +}

And awkwardness like this.

Generally splitting up gpio_chips is a very good idea.

> +static int event_bitmask(int gpio)
> +{
> +       if (gpio >=3D 0 && gpio < 16)
> +               return BIT(gpio);
> +       if (gpio =3D=3D 24 || gpio =3D=3D 25)
> +               return BIT(gpio - 8);
> +       return -EINVAL;
> +}
> +
> +static int event_bitnum_to_gpio(int num)
> +{
> +       if (num >=3D 0 && num < 16)
> +               return num;
> +       if (num =3D=3D 16 || num =3D=3D 17)
> +               return num + 8;
> +       return -EINVAL;
> +}

This is also a sign that you have several gpio_chips in practice
and now you need all this awkwardness to get back to which
GPIO is which instead of handling it in a per-chip manner.

This can be done in different ways, the most radical is to have
the pin control driver spawn child devices for each GPIO
block/bank/port with its own driver, but it can also just register
the individual gpio_chips.

Yours,
Linus Walleij
