Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5A45B7561
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiIMPl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbiIMPkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:40:51 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D394D82852
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:45:35 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id x94so640648ede.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4shadGKlKLbZWpoeI99+/msiJkg+/KoZvSj2fxjEELE=;
        b=NsmNT7RRecBMSlDpThp9+H2aYFzNXFUijIK5oX+vhf94Dn5BveHgvFDmfm5QnVp1WN
         rm8JwkoipnEQlwBdBwNFbKbmUr+HJZ74EpSNEJTC+G2f6j/2b4NEDmSzpJNeVb/LJjmc
         iEqkO/jDmLHPMTL4IwvOAzk1JGBrBwV7tcLijJPgEsYd6ucKO6fhoM6HW6H+5sHrgTK8
         SHvvxl3FtiYZYcwDy5JjHq6B4ZVhOZVSN5iJNFk8omELkX1bjUH9bjvZpMHIXv8npoRR
         4R8tIkSyM5stAQh1aeJp38N7tF4f+iXnIjhOQLJHRC2iMy+PuHctNue4AM5TIbmEiw0m
         jnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4shadGKlKLbZWpoeI99+/msiJkg+/KoZvSj2fxjEELE=;
        b=1loWp7PnyX8gOLd45VMBPhhfQmktVN+nSS+Sm6QKrNBTT+EHty438pig4rvM5ONdMM
         TMQnekY/mzlnIO6/XLogqywP0Ea1da9tdcQ2NmKr5XvRLg4VOCKj6xlUvtvKdeC40SlL
         bhg8LbB4rarbE921kAP7hcFqOOfoomo+1x60vG8Pc3fzpOCJ80BVyKfOqHndeDXcucjz
         DIlsboJNxkhAZqwMgpNqWTqD7j57p/hPWpEpFA58xCHBC3nITXrlKfSbrFp8bgWuk4cj
         Cjqf1L1HpB7JRdm4M2uX+PTnpopzI2Fq87aYuISURoxrAT2C1U+x0xbSY+asdp9j0TvC
         xTcA==
X-Gm-Message-State: ACgBeo11MStr9w/M6LRp4dr9gN7MaNM1MnB5iSqyEvT/hKt5S5GOanLb
        EU04bxpWL2/YS+Xelk7VcWqBW7vCh/ZmbMXBUfDWrg==
X-Google-Smtp-Source: AA6agR6RILAUPG0NngeiqgcBo7YTDrfgbgcCleE9rux0FNMuoqKxgm1TeUQfuh2pOMjpDjp6UiHTTwTcSXS4e3tiRC8=
X-Received: by 2002:a05:6402:5243:b0:451:6d52:5928 with SMTP id
 t3-20020a056402524300b004516d525928mr11992866edd.328.1663080199831; Tue, 13
 Sep 2022 07:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220909095632.2056143-1-sergio.paracuellos@gmail.com> <20220909095632.2056143-2-sergio.paracuellos@gmail.com>
In-Reply-To: <20220909095632.2056143-2-sergio.paracuellos@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:43:09 +0200
Message-ID: <CAMRc=MeH-f9xt1SAA4rq0SZ8VjtVuh5cuoDfRSK7CM2HQ==scA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mt7621: Make the irqchip immutable
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        arinc.unal@arinc9.com, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 9, 2022 at 11:56 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warnings
> are now observed for the mt7621 driver:
>
> gpio gpiochip0: (1e000600.gpio-bank0): not an immutable chip, please cons=
ider fixing it!
> gpio gpiochip1: (1e000600.gpio-bank1): not an immutable chip, please cons=
ider fixing it!
> gpio gpiochip2: (1e000600.gpio-bank2): not an immutable chip, please cons=
ider fixing it!
>
> Fix this by making the irqchip in the mt7621 driver immutable.
>
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/gpio/gpio-mt7621.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 05891dd3f96e..729cc8f72343 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -111,6 +111,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
>         unsigned long flags;
>         u32 rise, fall, high, low;
>
> +       gpiochip_enable_irq(gc, d->hwirq);
> +
>         spin_lock_irqsave(&rg->lock, flags);
>         rise =3D mtk_gpio_r32(rg, GPIO_REG_REDGE);
>         fall =3D mtk_gpio_r32(rg, GPIO_REG_FEDGE);
> @@ -142,6 +144,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
>         mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
>         mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
>         spin_unlock_irqrestore(&rg->lock, flags);
> +
> +       gpiochip_disable_irq(gc, d->hwirq);
>  }
>
>  static int
> @@ -203,6 +207,16 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
>         return gpio % MTK_BANK_WIDTH;
>  }
>
> +static const struct irq_chip mt7621_irq_chip =3D {
> +       .name           =3D "mt7621-gpio",
> +       .irq_mask_ack   =3D mediatek_gpio_irq_mask,
> +       .irq_mask       =3D mediatek_gpio_irq_mask,
> +       .irq_unmask     =3D mediatek_gpio_irq_unmask,
> +       .irq_set_type   =3D mediatek_gpio_irq_type,
> +       .flags          =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
>  static int
>  mediatek_gpio_bank_probe(struct device *dev,
>                          struct fwnode_handle *fwnode, int bank)
> @@ -239,11 +253,6 @@ mediatek_gpio_bank_probe(struct device *dev,
>                 return -ENOMEM;
>
>         rg->chip.offset =3D bank * MTK_BANK_WIDTH;
> -       rg->irq_chip.name =3D dev_name(dev);
> -       rg->irq_chip.irq_unmask =3D mediatek_gpio_irq_unmask;
> -       rg->irq_chip.irq_mask =3D mediatek_gpio_irq_mask;
> -       rg->irq_chip.irq_mask_ack =3D mediatek_gpio_irq_mask;
> -       rg->irq_chip.irq_set_type =3D mediatek_gpio_irq_type;
>
>         if (mtk->gpio_irq) {
>                 struct gpio_irq_chip *girq;
> @@ -263,7 +272,7 @@ mediatek_gpio_bank_probe(struct device *dev,
>                 }
>
>                 girq =3D &rg->chip.irq;
> -               girq->chip =3D &rg->irq_chip;
> +               gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
>                 /* This will let us handle the parent IRQ in the driver *=
/
>                 girq->parent_handler =3D NULL;
>                 girq->num_parents =3D 0;
> --
> 2.25.1
>

This should go into fixes but depends on the other patch which is
material for the next release cycle. Can you resend this separately?

Bart
