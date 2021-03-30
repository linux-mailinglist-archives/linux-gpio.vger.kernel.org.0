Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428C934E55E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhC3KXY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbhC3KXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:23:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB3FC061574;
        Tue, 30 Mar 2021 03:23:01 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v23so5921441ple.9;
        Tue, 30 Mar 2021 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=loVQVK73ZAxb2aZgHiSlAzK7vAqbOdexSFs2htiWZjU=;
        b=tcbGLRVpaEdSRaWfXQare5GYcOukSynk37LJ95QxnztkuC7+KlkGUB188crfgA4KJ7
         +P7zRJ9PGxi1BNZQFW+N+a6iHfycp8hq0FY6GSz3bTVxVnl/7ws7+0sygb9Nce048aVI
         lezkqfeS1r8ufSqFTpAinRd95oTpr/dNziWNI/NtdHYkiWVAgq3uVIuq/UhPECsDIltN
         2/EDSONvWLGnIlnRhsaJNhPrAhsyeFqcXrq5YF2xtkQfE2jKTac9GWBOvcfAzkgNqGM6
         XySmwZlzhXBPPn0X7Y2qRCvY7+8Ltajmrl77vvekKGqiFIZzRUVyaLDeKVv5cwYcpnCO
         WcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=loVQVK73ZAxb2aZgHiSlAzK7vAqbOdexSFs2htiWZjU=;
        b=CkPoTPQC25W8fpGjq7B9Q56Vb+lArF89g/QZmpeq1S8BQNLFGukQVB1YdbRCiv69D3
         l+etw+HltPUz+w3YFB1o+dZ0QNiqCmPrmEZ6TlpmMkwjUaS/Op4GjZ90Oh067aSAwwgg
         Rbo3d5563VcA7eY+WquHJPkQVViBjidbMP7V/k/AZS2PwJlcVFZ6ZC5KWGOfd/Uufqc/
         NUW2TqLdoPmkOXpJ8gNS60UovEot+ONQPRHW+H/hCgvhSnpBm6/COuKAqjiRvHf0xygQ
         QzjsmhJg+aNnIrvUXR5Cye7iLo2Zmw4RfI8WrM+Zg5XIBw4c1JJ4cdYVNmq2vWQfPOoq
         pxEA==
X-Gm-Message-State: AOAM531OrO/bHzTLgY3+CkLqiIjJU8v7hksjPpmPnEoO60tk5MwBd7YJ
        3+bAJUcJV42XBJe0J3Tm9yvgb68LxDI9GRgzieE=
X-Google-Smtp-Source: ABdhPJy8WaHfbziKRLgkNd2XcbtuyNeiyFHn00zpYZg9nPTkbkKtoO4fHJrjxmZ6rFzJKfhsh/hXD8MmSU4gRcnp9P4=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr33046398plb.21.1617099780998; Tue, 30
 Mar 2021 03:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210330083254.15817-1-noltari@gmail.com>
In-Reply-To: <20210330083254.15817-1-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:22:45 +0300
Message-ID: <CAHp75VeVJHt+jja614VN2eqJeaH=kP-qw5kTbLgDsg05_CWT3A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: bcm6362: fix warning
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 11:34 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> The current implementation of bcm6362_set_gpio() produces the following
> warning on x86_64:
> drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
> drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
>   503 |        (uint32_t) desc->drv_data, 0);
>       |        ^
>
> Modify the code to make it similar to bcm63268_set_gpio() in order to fix=
 the
> warning.
>
> Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm6362.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/=
pinctrl-bcm6362.c
> index eb7ec80353e9..6b5a1dfc2367 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
> @@ -496,11 +496,12 @@ static int bcm6362_pinctrl_get_groups(struct pinctr=
l_dev *pctldev,
>  static void bcm6362_set_gpio(struct bcm63xx_pinctrl *pc, unsigned pin)
>  {
>         const struct pinctrl_pin_desc *desc =3D &bcm6362_pins[pin];
> +       unsigned int basemode =3D (unsigned long) desc->drv_data;

Space between ) and d is not needed.
Usually we use uintptr_t for casting pointers to the integers.

>         unsigned int mask =3D bcm63xx_bank_pin(pin);
>
> -       if (desc->drv_data)
> -               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
> -                                  (uint32_t) desc->drv_data, 0);
> +       if (basemode)

> +               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG, basemo=
de,
> +                                  0);

Put it on one line for sake of the readability.

>
>         if (pin < BCM63XX_BANK_GPIOS) {
>                 /* base mode 0 =3D> gpio 1 =3D> mux function */
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
