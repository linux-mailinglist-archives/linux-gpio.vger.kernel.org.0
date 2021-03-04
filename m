Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A86C32D112
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238977AbhCDKpT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbhCDKoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:44:54 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90171C061574;
        Thu,  4 Mar 2021 02:44:14 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id jx13so6303636pjb.1;
        Thu, 04 Mar 2021 02:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SLFL8rzRY2STH4EMGAgJ5usZ36sACoBvlyeWGMYpsKc=;
        b=s5LUZwikmDSvmQmiBsTyqazXNMvwI6KBM4+4HuNKZBZU8N4BaB06RzspWrA4WOU7RL
         CrNKZ0U0/LCf5kYLSbEkXufhMuobArjPQa19Ffgt7dpsIuuSPFmiplIZJy+v/o0ECjjn
         qtQgdz/OHCIcEhpzXuX8PiuSPQpMmmSM7cIYdvdyw6yBBHv6mG9kENwV5tuReRMz4Rqg
         AlUuV5hR6nyjvzRv+kZtTBQzqA3mnfxoiakaziiSekrZoGGgn729BES9QNonohgqmMBw
         CqiKvdhnLjhUCjoGBIl8FbohrX7P03Iee6nT4OnISMdGtOva3nH6VTuknXn+spqUbXyP
         s//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SLFL8rzRY2STH4EMGAgJ5usZ36sACoBvlyeWGMYpsKc=;
        b=kSilvNjL0rljr9tYYTzTVdBkRUp9cvgbX8gxq8MYZnX1bfQZHFfOWR7IzfPLFvcJFv
         0uh3wrszUfhuL0h9leu7sn7BDKXmKGvU8+F9IBfh96LMR8pnv9CjqpF7raZG/YvjzbXG
         vGHTN1oMPyqNcbMjRS2d/9u65r55FenIS9nu7+MhCywNNFO5tvuBUdr5i4JSwInCHMrN
         nyvwEmfAI9Fp12s+A9f4fHIgQHLRZubYVmbWeJ6jtlTQk7ybIPtcXSlyTqHFokNh3ivS
         WlCdTT3IBZTOpCfyJ/L0H8DuokXzA8otmKhaSJR+G2DXYxMlGg2xGu1U/A+AGJ2/ZptC
         Jocg==
X-Gm-Message-State: AOAM533FpenavtGe+E1lM4GLkJPP6+PrLzgK2Ka4WwUpHMw8yHsALtOx
        87wclx4yXVaLRFfWUNZzDe8LIndomXZfKwPfIgM=
X-Google-Smtp-Source: ABdhPJzY96CZ08bwe8vzX8X3R2EoDlQQCOukVs7j9FIkMpYxCx7XcMhiXGgRbAknr4ixK9mol7vBg+3DCednUyZAY+s=
X-Received: by 2002:a17:902:a710:b029:e3:b18:7e5b with SMTP id
 w16-20020a170902a710b02900e30b187e5bmr3258185plq.17.1614854654024; Thu, 04
 Mar 2021 02:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-4-noltari@gmail.com>
In-Reply-To: <20210304085710.7128-4-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 12:43:57 +0200
Message-ID: <CAHp75Vc_v5M9XjWei09KzXo_oo95b2WQSamMjdQvxkCzNXrSXg@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add a helper for registering BCM63XX pin controllers.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

This SoB is in a strange place.

The order is wrong taking into account the From header (committer). So,
it's not clear who is the author, who is a co-developer, and who is
the committer (one person may utilize few roles).
Check for the rest of the series as well (basically this is the rule
of thumb to recheck entire code for the comment you have got at any
single place of it).

...

> +static const struct of_device_id bcm63xx_gpio_of_match[] =3D {
> +       { .compatible =3D "brcm,bcm6318-gpio", },
> +       { .compatible =3D "brcm,bcm6328-gpio", },
> +       { .compatible =3D "brcm,bcm6358-gpio", },
> +       { .compatible =3D "brcm,bcm6362-gpio", },
> +       { .compatible =3D "brcm,bcm6368-gpio", },
> +       { .compatible =3D "brcm,bcm63268-gpio", },

> +       { /* sentinel */ },

Comma is not needed in terminator line

> +};

...

> +       dev_info(dev, "registered\n");

Unneeded noise.

...

> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/regmap.h>

The rule of thumb is to include only the headers that the below code
is direct user of.

The above are not used anyhow, while missed types.h and several
forward declarations.

> +#include "../core.h"

Seems the same.

> +#define BCM63XX_BANK_GPIOS 32
> +
> +struct bcm63xx_pinctrl_soc {
> +       struct pinctrl_ops *pctl_ops;
> +       struct pinmux_ops *pmx_ops;
> +
> +       const struct pinctrl_pin_desc *pins;
> +       unsigned npins;
> +
> +       unsigned int ngpios;
> +};
> +
> +struct bcm63xx_pinctrl {
> +       struct device *dev;
> +       struct regmap *regs;
> +
> +       struct pinctrl_desc pctl_desc;
> +       struct pinctrl_dev *pctl_dev;
> +
> +       void *driver_data;
> +};


--
With Best Regards,
Andy Shevchenko
