Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83D95B758A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiIMPtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbiIMPsI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:48:08 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9106E80356
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:50:26 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1225219ee46so32758735fac.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=abpTDteMaNzUauZQOOp6B9AfUlRWm5WvSegIIQxWNq4=;
        b=Om5uKWXQfzRy/RN5hzM58Mf2S3iyv51ZiosHbaP1aGZSA+hZcopzTdS6US3jelrjgj
         Ql0LcSMBTSahsQwL+EcVjEMvtoDzLWEOE3NSCVBnUrLqOo7X4feWKScPqsF2+7YaClrl
         Ov+UeQT825VOHVl2UjSFOOZzCWYdXI1KbRN3t+s9usLAa1KC3tnZwf4Fp7uL49D/p2k2
         lbb4tfmJpjC3QUO2QZ+ap4thw/IXAthVQDlN8RoDDFobQzE2uvRwa17Gchppu43hkOZR
         C3JQu+rMyuLrjg9v59mt8lUasryNsihr6qhaYzOBSA+5iQtXA1iNgaIAjdSWz1MlCzk9
         wW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=abpTDteMaNzUauZQOOp6B9AfUlRWm5WvSegIIQxWNq4=;
        b=PFUd+htTtrIcK2FVBwzYKoiOC2X6yS0rekkdBWqxRYT/PsZ68vagvlNGIc0zk1rlGp
         KI/q5lo0nNDNlKj/ika9H43nRTprgE9w/UBmfSAkPz6y/G/OdN1QUc4ME2/iA/VoBTAS
         P9sPhvrtA3aLK4Q+2vl5VwmG3bghN4V6RvN3aoNad7Wyfuk/jl8RzoFfM/PfoqLyEkwm
         3JlCm90C7Z2+FUrT8tHfWJ3vA68QfxJih1Bt8R1mKhU09TcIWxtUJT4uz7O0y3IdLSbU
         y+mWOgDzBDbvOYIT/Zg/fuoJ7PN1XdXIlZwR8qgCiFGWM834N6ALpHX0EaACxi5tRulS
         xbLA==
X-Gm-Message-State: ACgBeo3IdxEzosvqAb0Wg/PiR32j34VVr1Bm1GqplStlUfLwX0AEf6VX
        B0SRXeYz2OSwwh5bsWZg/SwTvMOhBM14wlRZGqY=
X-Google-Smtp-Source: AA6agR7jmC25X0NUYcmTRV9C9C72TkJzPM614dMY7acBBNYGJV/D2y1YqgKp3mejmGjUfUgruFqEm6ggoaeJdfVaPaU=
X-Received: by 2002:a05:6870:f5a7:b0:12b:4a0d:57c6 with SMTP id
 eh39-20020a056870f5a700b0012b4a0d57c6mr2035145oab.83.1663080523916; Tue, 13
 Sep 2022 07:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
 <20220909095632.2056143-2-sergio.paracuellos@gmail.com> <CAMRc=MeH-f9xt1SAA4rq0SZ8VjtVuh5cuoDfRSK7CM2HQ==scA@mail.gmail.com>
In-Reply-To: <CAMRc=MeH-f9xt1SAA4rq0SZ8VjtVuh5cuoDfRSK7CM2HQ==scA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Sep 2022 16:48:32 +0200
Message-ID: <CAMhs-H_BfBvOyF0wyB09p7BXMqT3PQFxjDfO5zeBwkZ02EABdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mt7621: Make the irqchip immutable
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 4:43 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Sep 9, 2022 at 11:56 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.  Following this change the following warnings
> > are now observed for the mt7621 driver:
> >
> > gpio gpiochip0: (1e000600.gpio-bank0): not an immutable chip, please co=
nsider fixing it!
> > gpio gpiochip1: (1e000600.gpio-bank1): not an immutable chip, please co=
nsider fixing it!
> > gpio gpiochip2: (1e000600.gpio-bank2): not an immutable chip, please co=
nsider fixing it!
> >
> > Fix this by making the irqchip in the mt7621 driver immutable.
> >
> > Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/gpio/gpio-mt7621.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > index 05891dd3f96e..729cc8f72343 100644
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -111,6 +111,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
> >         unsigned long flags;
> >         u32 rise, fall, high, low;
> >
> > +       gpiochip_enable_irq(gc, d->hwirq);
> > +
> >         spin_lock_irqsave(&rg->lock, flags);
> >         rise =3D mtk_gpio_r32(rg, GPIO_REG_REDGE);
> >         fall =3D mtk_gpio_r32(rg, GPIO_REG_FEDGE);
> > @@ -142,6 +144,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
> >         mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
> >         mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
> >         spin_unlock_irqrestore(&rg->lock, flags);
> > +
> > +       gpiochip_disable_irq(gc, d->hwirq);
> >  }
> >
> >  static int
> > @@ -203,6 +207,16 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
> >         return gpio % MTK_BANK_WIDTH;
> >  }
> >
> > +static const struct irq_chip mt7621_irq_chip =3D {
> > +       .name           =3D "mt7621-gpio",
> > +       .irq_mask_ack   =3D mediatek_gpio_irq_mask,
> > +       .irq_mask       =3D mediatek_gpio_irq_mask,
> > +       .irq_unmask     =3D mediatek_gpio_irq_unmask,
> > +       .irq_set_type   =3D mediatek_gpio_irq_type,
> > +       .flags          =3D IRQCHIP_IMMUTABLE,
> > +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> > +
> >  static int
> >  mediatek_gpio_bank_probe(struct device *dev,
> >                          struct fwnode_handle *fwnode, int bank)
> > @@ -239,11 +253,6 @@ mediatek_gpio_bank_probe(struct device *dev,
> >                 return -ENOMEM;
> >
> >         rg->chip.offset =3D bank * MTK_BANK_WIDTH;
> > -       rg->irq_chip.name =3D dev_name(dev);
> > -       rg->irq_chip.irq_unmask =3D mediatek_gpio_irq_unmask;
> > -       rg->irq_chip.irq_mask =3D mediatek_gpio_irq_mask;
> > -       rg->irq_chip.irq_mask_ack =3D mediatek_gpio_irq_mask;
> > -       rg->irq_chip.irq_set_type =3D mediatek_gpio_irq_type;
> >
> >         if (mtk->gpio_irq) {
> >                 struct gpio_irq_chip *girq;
> > @@ -263,7 +272,7 @@ mediatek_gpio_bank_probe(struct device *dev,
> >                 }
> >
> >                 girq =3D &rg->chip.irq;
> > -               girq->chip =3D &rg->irq_chip;
> > +               gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
> >                 /* This will let us handle the parent IRQ in the driver=
 */
> >                 girq->parent_handler =3D NULL;
> >                 girq->num_parents =3D 0;
> > --
> > 2.25.1
> >
>
> This should go into fixes but depends on the other patch which is
> material for the next release cycle. Can you resend this separately?

Sure, I will!

Thanks,
    Sergio Paracuellos

>
> Bart
