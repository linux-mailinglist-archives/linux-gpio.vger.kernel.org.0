Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D5D5B75FC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 18:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbiIMQAp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 12:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbiIMP7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:59:45 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A222295681
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:58:17 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-346cd4c3d7aso143251997b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=XMXLsnSWPK2mcDb0zEAX0OOnVB7hMDHTLXTgeJCHe3g=;
        b=cjXmT2+943hbSBR2sJayByv29xqLa4BVZOyPrrUS/p7QRpZxyZ6HzETWOcp3ph8EAf
         PXDUsdXpNZ27Ru2sUYi85zYqlHKUFcpDSDEl+ugDBWsieHLSBEB5BGqQbbfvKnAPH7OW
         unQc5QO2qHFE9p+SMNWsEO0HrgYvefdbtGGJwHF2fAZsaAdBuqUvBnmBizr+O7ijTT/A
         B7B5qzG8O6Z+J1FOv8o+sWaiTQW9kasQfRmjDSp96e4Rhoy94/URFWTW7TDOIR7k5lNY
         uD69cDsC5fhQ53jNm0whSEJlCV5NvGZ51aW876KsIQUnRW11g1KDlE9uij1M1tYx6596
         8pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XMXLsnSWPK2mcDb0zEAX0OOnVB7hMDHTLXTgeJCHe3g=;
        b=ozYs9qNZoZNr2vThUP6fk/ueRodpYSKM5XcxTOCvK7oUhF1w0ZXAbNiH0O7jo53sBd
         rpy06HscJMr+mjsitU6S2hy9bTi9XuoypQNW+fQJllicrsadyE3ISeasj22ebXvuLmXf
         pjiOoB2y7+et5/1HwwiBXAV4ddipqS7dfeWJOyFUChGSoQdcexK/5709vGMcVLzI8m59
         7ILdJXyjXZjIe9D5TVcLkUw9EuBWMr1TC1/hKyuJh35V+1Ally1WTUoj4flZEus7V69Z
         4l383rqpTWZwWw76bkcdBLW0i09CbRr7x5sLmr1ip36X8jCcRaJ+e+67HZMJLCSUWNq8
         YGnQ==
X-Gm-Message-State: ACgBeo1czbVFQFLipfsjoekaEoBl9fTMguu4/OfsOKFRq3JZ8HGOCZZ4
        Y4rWj5MRZaVVkABbs38mZ4R8+QlaLMVZTe0/o0oxzsPuLYI=
X-Google-Smtp-Source: AA6agR4VjpCb4x7KELs8ugMh/b69BuitVneISWfbf/GBvEfBbTOBCEu+lNPg0SV14JHJSQ96vTsvnxXqtArhQbX5XXw=
X-Received: by 2002:a9d:7550:0:b0:655:bcdc:f546 with SMTP id
 b16-20020a9d7550000000b00655bcdcf546mr7279184otl.304.1663080435678; Tue, 13
 Sep 2022 07:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220909095632.2056143-1-sergio.paracuellos@gmail.com> <CAMRc=MdG6bLmdLuZhyPRwDv88C92870Q1x4u0gVyrasxbu=65A@mail.gmail.com>
In-Reply-To: <CAMRc=MdG6bLmdLuZhyPRwDv88C92870Q1x4u0gVyrasxbu=65A@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Sep 2022 16:47:04 +0200
Message-ID: <CAMhs-H8LcqdVLZ+-3WqF2oE1eQ+4Ew0U7nCs4nvnH_ZMm1tLfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mt7621: Switch to use fwnode instead of of_node
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

On Tue, Sep 13, 2022 at 4:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Sep 9, 2022 at 11:56 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > GPIO library now accepts fwnode as a firmware node, so
> > switch the driver to use it.
> >
> > Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/gpio/gpio-mt7621.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > index d8a26e503ca5..05891dd3f96e 100644
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -9,7 +9,6 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > -#include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/spinlock.h>
> >
> > @@ -205,7 +204,8 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
> >  }
> >
> >  static int
> > -mediatek_gpio_bank_probe(struct device *dev, int bank)
> > +mediatek_gpio_bank_probe(struct device *dev,
> > +                        struct fwnode_handle *fwnode, int bank)
> >  {
> >         struct mtk *mtk =3D dev_get_drvdata(dev);
> >         struct mtk_gc *rg;
> > @@ -216,6 +216,7 @@ mediatek_gpio_bank_probe(struct device *dev, int ba=
nk)
> >         memset(rg, 0, sizeof(*rg));
> >
> >         spin_lock_init(&rg->lock);
> > +       rg->chip.fwnode =3D fwnode;
> >         rg->bank =3D bank;
> >
> >         dat =3D mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRID=
E);
> > @@ -290,7 +291,7 @@ static int
> >  mediatek_gpio_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev =3D &pdev->dev;
> > -       struct device_node *np =3D dev->of_node;
> > +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> >         struct mtk *mtk;
> >         int i;
> >         int ret;
> > @@ -303,12 +304,12 @@ mediatek_gpio_probe(struct platform_device *pdev)
> >         if (IS_ERR(mtk->base))
> >                 return PTR_ERR(mtk->base);
> >
> > -       mtk->gpio_irq =3D irq_of_parse_and_map(np, 0);
> > +       mtk->gpio_irq =3D fwnode_irq_get(fwnode, 0);
>
> You can do even better and just use platform_get_irq().

Will change this and send v2 of this patch alone for the next cycle.

Thanks,
    Sergio Paracuellos

>
> Bart
>
> >         mtk->dev =3D dev;
> >         platform_set_drvdata(pdev, mtk);
> >
> >         for (i =3D 0; i < MTK_BANK_CNT; i++) {
> > -               ret =3D mediatek_gpio_bank_probe(dev, i);
> > +               ret =3D mediatek_gpio_bank_probe(dev, fwnode, i);
> >                 if (ret)
> >                         return ret;
> >         }
> > --
> > 2.25.1
> >
