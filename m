Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03C056883A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbiGFMXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiGFMXe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:23:34 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739C21F2D1
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:23:32 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id dn9so21525890ejc.7
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 05:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VB+XA3IDxavpwM2kvuBHOGhKgs/Fp62gFOkSUsNaL9U=;
        b=d7b0mvt0tmPB0Hv2G7+i/1v4vEYW4HbPR/vPJLf71SuekB3D2OTNw77f3ifEgGrWZC
         HQaZovmO9gIF+IvsNWEUXksIF1VBKaKQQl2qiJEdACJlc1AILOCUxBJKO8soewc8RiMx
         KfAxBxK6bsztCDS0FSBoRgPr9Ng78IEKMjQTH5KGj68ilrQna8Y9kY2CmDgsxoonYu4q
         PkStO51Xu5X+xGqDvhFRH6gKmoPC4crs9pwIciEV2QTRpnk9kF0rta0Ax7Atjj/K0qr0
         SgIyUbPnjCS87PpjsCyal1n97+RELqA9v95obMmt8IvJ1IjVNssktZ1pljy4pRuO1lKv
         noeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VB+XA3IDxavpwM2kvuBHOGhKgs/Fp62gFOkSUsNaL9U=;
        b=dFlrqn6zfRiCzX/FimzvZemhlOZsNakFV0tY87DWx7UWbIPzyQc+2QVpop1NVZuYb3
         Nf79p0tLNMOqxUPgU7a1je2Q91WTgnwM4apJNZhFBfpjp2BZxqLpdjv6nGRP+zGuBwzQ
         2ayf0SjE72XU24IBDSLKZ7Evy+uXL95gV+l+e1eQ8StOPExmR3J6hWU2T6Flw+eFRy5T
         2ZN1mQJ/cxsSFqnqapUhHtxwgcDqMMFMb4UTtyPAnN2brRcztDQTJ7ew5rXc3Dc3OKmj
         FtjPUfqhYduNX90FsPajSG0loVN5atE06PhVk6YC6T3jxb4H/qQ8Fu4YOh08W8qzc0PK
         5FUQ==
X-Gm-Message-State: AJIora+0ZaKY/ay0NNHOlOeawkh5p7uSJYq6d8NEZxTCiuiOuLf9A1uQ
        CDO3lnRjhybzheze6Bme+ZvLr2jSY9JhNoqxNBnjaA==
X-Google-Smtp-Source: AGRyM1vH/+0ZXb9W2eBjdOWVBTZhDKCk9PWkosN1gAB42wcg7fQjA1ljF4k4oumEqyqyZLDTEIGxzNPQKw/NNgYwrT0=
X-Received: by 2002:a17:907:2bd0:b0:72a:7a08:aeb5 with SMTP id
 gv16-20020a1709072bd000b0072a7a08aeb5mr30097464ejc.492.1657110211045; Wed, 06
 Jul 2022 05:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220628193906.36350-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220628193906.36350-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jul 2022 14:23:20 +0200
Message-ID: <CAMRc=MdHYfT3rMrYurEn1wXGZ=vgiorK8Awc+gOqCPUfjCFXvA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: adp5588: Switch from of headers to mod_devicetable.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 9:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is nothing directly using of specific interfaces in this driver,
> so lets not include the headers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-adp5588.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index e388e75103f4..51ed23ba4645 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -6,7 +6,6 @@
>   * Copyright 2009-2010 Analog Devices Inc.
>   */
>
> -#include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> @@ -14,7 +13,8 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
>
>  #include <linux/platform_data/adp5588.h>
>
> @@ -427,18 +427,16 @@ static const struct i2c_device_id adp5588_gpio_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, adp5588_gpio_id);
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id adp5588_gpio_of_id[] = {
>         { .compatible = "adi," DRV_NAME, },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, adp5588_gpio_of_id);
> -#endif
>
>  static struct i2c_driver adp5588_gpio_driver = {
>         .driver = {
>                 .name = DRV_NAME,
> -               .of_match_table = of_match_ptr(adp5588_gpio_of_id),
> +               .of_match_table = adp5588_gpio_of_id,
>         },
>         .probe_new = adp5588_gpio_probe,
>         .remove = adp5588_gpio_remove,
> --
> 2.35.1
>

Applied all three, thanks!

Bart
