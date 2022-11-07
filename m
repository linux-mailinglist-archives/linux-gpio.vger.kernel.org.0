Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 173B261FFA2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 21:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbiKGUiI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 15:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiKGUiG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 15:38:06 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3653A264A1
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 12:38:05 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id z189so11775310vsb.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 12:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHQPm0wu+YpCSjSEGUCLAXG8G/dftjICDA1Cd0hRfeQ=;
        b=v5sI0kcBdDoCOkZIGxqhb4rT9YpWXWkK5YNai2ZsI0LwkhX4FRfRZdOHhe+XFMtmO2
         KWo5ymx5sn82nITWbEgRXOiY4GNydpVeDWlQWWwd1ft3/KcBqIsbeNFhjPEb7fW15ccT
         nhAKNcu5c10qRwFFHodMHjfBi8eE2d/EyAEqiOO0T/m6niREitOTyB6hlrffalAotlXu
         q7/p7Nwow85rgPMixcCaB1gp3SYzvYPLZwU12im9h+ff+caINUpx95pr7YCGyzqCvy9H
         SPGt3JDP1X6pnExIK98tIRBCtVsF6n1gjBh3wAnukW3ER2VLyAassxHVe6FXyFgNFR0w
         Zhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHQPm0wu+YpCSjSEGUCLAXG8G/dftjICDA1Cd0hRfeQ=;
        b=bZmBLcGS6e88eqVyKmsha3PKVNeHbmzEud7g+2rkNBzpbLYGfUvcgZfpMV/tGJzF/e
         xYw/JNcWN5ViCmLvIqWkpVOHt5gwJyGyNkZ4Datp8IlZJSQ/u0uhynXeS9QmFSfY9gmm
         uxbXIB37ervn1uIwaAauF1BodKcV2q4z8kdrcUmbvBH4xzkqxHUMvnHrbSrjIjCrCXfm
         ul4IUV6IRqCjabp/xFiikchRgZdL8vl1pmja5ItXVramyu0LaU7RV/IgDSgtP1zE3XYD
         5D5SY7hCpry3tLDnnV1SGazxmed5wKSf66GvN4k9swBVyARio2ytY1qtoHh5IGLYPHhd
         twWg==
X-Gm-Message-State: ACrzQf3793wEIQE74v/K106OgbJ8sx9ENi65aO/HpsjMlx9E92I8YxUy
        zvboCsDx/Z3twQIBWqxu+y/GjU03GVeBXz5TK2BaFQ==
X-Google-Smtp-Source: AMsMyM7HKtwdW6lovqXQpX0baiK/2edNiHMRZe7qPwavV5oUB/CVeT9TRpDCXiaPRYKoPRZKiDdMY609XkAwj6FX7iE=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr26672223vse.9.1667853484301; Mon, 07
 Nov 2022 12:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20221101082442.263448-1-chenweilong@huawei.com> <9824fa76-89cc-6c17-9c4a-d37524a30a92@huawei.com>
In-Reply-To: <9824fa76-89cc-6c17-9c4a-d37524a30a92@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Nov 2022 21:37:53 +0100
Message-ID: <CAMRc=Mdw=45_oEzO-4ix5Nhm2tnSJRrPmLjnzkp4GeYGbDPeVQ@mail.gmail.com>
Subject: Re: [PATCH next v3 1/2] gpio: hisi: Add initial device tree support
To:     chenweilong <chenweilong@huawei.com>
Cc:     f.fangjian@huawei.com, linus.walleij@linaro.org,
        yangyicong@hisilicon.com, xuwei5@huawei.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 3, 2022 at 9:51 AM chenweilong <chenweilong@huawei.com> wrote:
>
> On 2022/11/1 16:24, Weilong Chen wrote:
>
> This is the latest version for the patch, I used the v3 version number incorrectly.
> Sorry for the mistake. I will pay attention next time.
>
> > Add support for HiSilicon GPIO controller in embedded platform, which
> > boot from devicetree.
> >
> > Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> > ---
> > Change since v2:
> > - Drop wrong use ACPI_PTR/of_match_ptr
> > Link: https://lore.kernel.org/lkml/20221028022453.163186-1-chenweilong@huawei.com/
> >
> >  drivers/gpio/Kconfig     | 2 +-
> >  drivers/gpio/gpio-hisi.c | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index e034f752e7ce..71a7880af59d 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -310,7 +310,7 @@ config GPIO_GRGPIO
> >
> >  config GPIO_HISI
> >       tristate "HiSilicon GPIO controller driver"
> > -     depends on (ARM64 && ACPI) || COMPILE_TEST
> > +     depends on ARM64 || COMPILE_TEST
> >       select GPIO_GENERIC
> >       select GPIOLIB_IRQCHIP
> >       help
> > diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
> > index 3caabef5c7a2..55bd69043bf4 100644
> > --- a/drivers/gpio/gpio-hisi.c
> > +++ b/drivers/gpio/gpio-hisi.c
> > @@ -221,6 +221,12 @@ static const struct acpi_device_id hisi_gpio_acpi_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
> >
> > +static const struct of_device_id hisi_gpio_dts_match[] = {
> > +     { .compatible = "hisilicon,ascend910-gpio", },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, hisi_gpio_dts_match);
> > +
> >  static void hisi_gpio_get_pdata(struct device *dev,
> >                               struct hisi_gpio *hisi_gpio)
> >  {
> > @@ -311,6 +317,7 @@ static struct platform_driver hisi_gpio_driver = {
> >       .driver         = {
> >               .name   = HISI_GPIO_DRIVER_NAME,
> >               .acpi_match_table = hisi_gpio_acpi_match,
> > +             .of_match_table = hisi_gpio_dts_match,
> >       },
> >       .probe          = hisi_gpio_probe,
> >  };
>
>

I applied both, but reversed the order as dt bindings should come first. Thanks!

Bart
