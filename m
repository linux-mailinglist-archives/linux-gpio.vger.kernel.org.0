Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888B65B753D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236637AbiIMPhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbiIMPgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:36:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1944880F59
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:43:06 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id u6so17888994eda.12
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=LYv/1/ou2dunxakJdUfB+aFqC8x+bI9QUcYy5F4Yyxk=;
        b=zqsYiggjJtqn+iC7H8LDslxU5Bq0dDBnl1zcS6U9Skyswsej8GAAKavPN+eots7rKz
         ozV2darukxpvoJIqV+2EAl563oo75/6UqpImm3MB767ZLNAFhnvotANjwK40jM6z8cbq
         Rg9DqP56+lOpiJtUKSK21Fpycmt7jSRH8x/AiUFPXJKFOZ+na0gcIZzAVRevh86Pc2PI
         ShuSW1+7E6nMMhXS7E9oSWNubRYmfT9WSe+fEqOamlmO4d4NDSplnZH2pxhGZqIGe6dW
         YD8jtAZw1RPHcI737o9Mv7ZHMoqwTsdH/sJXpjGe4aRhvO7nFGPjYm/O/8lF9xJJry4j
         +kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LYv/1/ou2dunxakJdUfB+aFqC8x+bI9QUcYy5F4Yyxk=;
        b=ZKqA/WAtvD81roKbRbOpWJX4rCTsky8IK+QI+NKcKeI7K6KUjt3ogXf92Yx9S8tFxi
         bPUThFYQLdL5MvUZxWhP6W5/QRvap0lUXMfdUHz9rvnfmjxbTzhOT3/mIu4vS09U4Y/W
         R3xZAfZOG2aOzpGHzuplWOIaFblwjBIMjG5Fxf34+bzFsDsBAS/8e7FIFHfQFXCugc/h
         V463jP1EGkU+SsvkzlnNa1dkz7JKFLQZuQ098DJuseS5pvj1Tzct2Ka/HDeiQ+pKDoa9
         ExVI6qQ2cQZWcnuCN0gkmzEqc/7JdA5ong0C/QANNylSdNr2dmwpAGmeKwBCFRqbJaMj
         AncQ==
X-Gm-Message-State: ACgBeo2PGiVfSo7u3/bq7YhYLWTMoqQP6GYY3A2h1YCcssKWG+5mRvui
        RsNWf34QH7DnZTyhb5ZBdfXTIoToB5GVAHJmm+iFxwOCCQu1SQ==
X-Google-Smtp-Source: AA6agR5hS+mj9ue6hHSbX4Wj3kOc6fg9CO1DSi1pJJuM5BdWFeBLjHmHil/+L5aBjQ+4S4aIYtbZUnHKb/VVx4pnPfs=
X-Received: by 2002:a05:6402:5243:b0:451:6d52:5928 with SMTP id
 t3-20020a056402524300b004516d525928mr11986100edd.328.1663080093586; Tue, 13
 Sep 2022 07:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:41:22 +0200
Message-ID: <CAMRc=MdG6bLmdLuZhyPRwDv88C92870Q1x4u0gVyrasxbu=65A@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mt7621: Switch to use fwnode instead of of_node
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        arinc.unal@arinc9.com, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 9, 2022 at 11:56 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it.
>
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/gpio/gpio-mt7621.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index d8a26e503ca5..05891dd3f96e 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -9,7 +9,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>
> @@ -205,7 +204,8 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
>  }
>
>  static int
> -mediatek_gpio_bank_probe(struct device *dev, int bank)
> +mediatek_gpio_bank_probe(struct device *dev,
> +                        struct fwnode_handle *fwnode, int bank)
>  {
>         struct mtk *mtk =3D dev_get_drvdata(dev);
>         struct mtk_gc *rg;
> @@ -216,6 +216,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank=
)
>         memset(rg, 0, sizeof(*rg));
>
>         spin_lock_init(&rg->lock);
> +       rg->chip.fwnode =3D fwnode;
>         rg->bank =3D bank;
>
>         dat =3D mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE)=
;
> @@ -290,7 +291,7 @@ static int
>  mediatek_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *np =3D dev->of_node;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         struct mtk *mtk;
>         int i;
>         int ret;
> @@ -303,12 +304,12 @@ mediatek_gpio_probe(struct platform_device *pdev)
>         if (IS_ERR(mtk->base))
>                 return PTR_ERR(mtk->base);
>
> -       mtk->gpio_irq =3D irq_of_parse_and_map(np, 0);
> +       mtk->gpio_irq =3D fwnode_irq_get(fwnode, 0);

You can do even better and just use platform_get_irq().

Bart

>         mtk->dev =3D dev;
>         platform_set_drvdata(pdev, mtk);
>
>         for (i =3D 0; i < MTK_BANK_CNT; i++) {
> -               ret =3D mediatek_gpio_bank_probe(dev, i);
> +               ret =3D mediatek_gpio_bank_probe(dev, fwnode, i);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.25.1
>
