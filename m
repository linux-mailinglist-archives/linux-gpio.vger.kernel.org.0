Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250EC22818E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgGUODG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgGUODF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:03:05 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE788C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:03:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so10776250pfm.4
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vMy0jowKuKG9iOwg5BzKHvER052rqqm9MnIHKRam7bg=;
        b=dXMsOqXFkabLJXBnul9OKAXGVAEmQTQH/XCpFw9GqHQx4f6475NOs2J7WGZgdhFEtO
         Zamu1+BNk7F1q/GoRPsoQERjM1qc0G7A05Za/FifKwKxU8ebAYNu6URwSF1mxuCBLYIh
         tKWNmR4olUxqEfBiP1vzHuWJ2NMYLMt0XMi/FmnDkKI/cTVYEm++ObsNLFwqUM1lzHll
         q1Ss3MCIP3XfEcDTU3XJ0RjyvBcUqEkGl+MKmb40SX6E7m0HxEHmtgMcujIlgkNgkojQ
         RC4Hx3c6Mu1wxrBof0hCVI4lpj6AiKwoBIl+5LjAW3wxNsOc5DqKSfXgyf8dEFggZ+jX
         UkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vMy0jowKuKG9iOwg5BzKHvER052rqqm9MnIHKRam7bg=;
        b=bIEy95eRx7cuRx2MbPJqha5KGSB6bVhHub/SkY1AifF0no0nWdPi0Qbmbb54z77wQ/
         cV0wTYF6sW5vSsCAVrxmqWKE/wF9o9kb4zWfPVt+fJs7huFxR/q3Cx5A4CBfpOz94V/k
         5YHmffwhye8Y9REvw2PrUIzUgKmOvbDfRPLFfsLdP6YG356hL7moIeBqLmt2XtvcKiVg
         1rEOnKqHYLGDEKunB0aSwGNQMS3O4OhpgvMANoTq7llf+W8qGM7DL3LygSgl2ExXULur
         sygejybhxfd7HCccfVftbBfa/kfuVFMgX51OAtSdXkPQTU8nAendZTTFExy0XgKYuRt0
         v/uA==
X-Gm-Message-State: AOAM5307W7W6sbw+TlFRFsCIb1inaJZU6u6SZjcEtYJfMvK6MULVvMKM
        RDtASaAD0uIpCUn4OJWV0OwG9W4nl81VOw48/xAgwxFc
X-Google-Smtp-Source: ABdhPJwgMZwOZNHwgSCAsKkE2St0wGd1/rMx0V6WXecRUEAJvLq7XfNEFVhi9872FSuac+i8kbwIx9rvoYydrg1np6M=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr22118140pgn.4.1595340185271;
 Tue, 21 Jul 2020 07:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200721125223.344411-1-linus.walleij@linaro.org>
In-Reply-To: <20200721125223.344411-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Jul 2020 17:02:50 +0300
Message-ID: <CAHp75VfNcKfa6x43bq7E7QQLiPfNkqwbzZBaa816NbC-SYsjjg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>,
        Lars Poeschel <poeschel@lemonage.de>,
        Jason Kridner <jkridner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 21, 2020 at 3:53 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
>
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add_nested() and
> gpiochip_set_nested_irqchip(). The irqchip is instead
> added while adding the gpiochip.

For the code
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
I can't test right now, though.

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: Phil Reid <preid@electromag.com.au>
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Cc: Jason Kridner <jkridner@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 44 ++++++++++--------------------
>  1 file changed, 14 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 151931b593f6..42b12ea14d6b 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -522,29 +522,6 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
>         return 0;
>  }
>
> -static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
> -{
> -       struct gpio_chip *chip =3D &mcp->chip;
> -       int err;
> -
> -       err =3D  gpiochip_irqchip_add_nested(chip,
> -                                          &mcp->irq_chip,
> -                                          0,
> -                                          handle_simple_irq,
> -                                          IRQ_TYPE_NONE);
> -       if (err) {
> -               dev_err(chip->parent,
> -                       "could not connect irqchip to gpiochip: %d\n", er=
r);
> -               return err;
> -       }
> -
> -       gpiochip_set_nested_irqchip(chip,
> -                                   &mcp->irq_chip,
> -                                   mcp->irq);
> -
> -       return 0;
> -}
> -
>  /*----------------------------------------------------------------------=
*/
>
>  int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
> @@ -589,10 +566,6 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct =
device *dev,
>         if (ret < 0)
>                 goto fail;
>
> -       ret =3D devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> -       if (ret < 0)
> -               goto fail;
> -
>         mcp->irq_controller =3D
>                 device_property_read_bool(dev, "interrupt-controller");
>         if (mcp->irq && mcp->irq_controller) {
> @@ -629,11 +602,22 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct=
 device *dev,
>         }
>
>         if (mcp->irq && mcp->irq_controller) {
> -               ret =3D mcp23s08_irqchip_setup(mcp);
> -               if (ret)
> -                       goto fail;
> +               struct gpio_irq_chip *girq =3D &mcp->chip.irq;
> +
> +               girq->chip =3D &mcp->irq_chip;
> +               /* This will let us handle the parent IRQ in the driver *=
/
> +               girq->parent_handler =3D NULL;
> +               girq->num_parents =3D 0;
> +               girq->parents =3D NULL;
> +               girq->default_type =3D IRQ_TYPE_NONE;
> +               girq->handler =3D handle_simple_irq;
> +               girq->threaded =3D true;
>         }
>
> +       ret =3D devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> +       if (ret < 0)
> +               goto fail;
> +
>         mcp->pinctrl_desc.pctlops =3D &mcp_pinctrl_ops;
>         mcp->pinctrl_desc.confops =3D &mcp_pinconf_ops;
>         mcp->pinctrl_desc.npins =3D mcp->chip.ngpio;
> --
> 2.26.2
>


--=20
With Best Regards,
Andy Shevchenko
