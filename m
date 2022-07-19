Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3782579517
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 10:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiGSIRF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 04:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbiGSIRE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 04:17:04 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C793324970
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:17:02 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z22so5558473edd.6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 01:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXsZJsgsSiHl9h8RmO5qeLacMCfPdBxMaAGdhnsVAEI=;
        b=wDHr4F7sTbDK+tOafzkIIYA5Xc1iZGxmrC6Pi76n7uaHfMuTIwidIqjeGRB40fqnCK
         hB31oNLMZ6qNAuZEok/jWJMk4h1Zs4RPp/tHACBF6aqJgacAP7SM8KoK5LlESQ3BY3zR
         +2byXG0Fe9EstkciQN6oHNR0fuClRAvFE/vmW55SI9vPKc1RKWznzh0iZKzV524OhZdK
         kZqbV9VroCYE+PeL5rYKg5yMpIWEWHajN5Y/omP3JoDCNsW732wSZ+bMaW4uFV6riSM0
         eYMxv5pSO5CxFMM1F7QKnYrCoY6Js5Sqhh3vhbBgCIjVETwl4eqwjgxO+F0D82iDJ8VT
         h3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXsZJsgsSiHl9h8RmO5qeLacMCfPdBxMaAGdhnsVAEI=;
        b=eWnXiK/RmnO8Nror9DMuG24FXDh2xTls/6xOBge8mo1dxUAWsnOWRvoNuyn0z3mw1D
         ZifP3yCiG/j/ZGEb4SxgPp2Ckcd1bimamZEZmWdtL2G9MM9ZZMBNhP8uO7NCslp5of0Y
         NC2gN03YD784KG2ripJQYxafwlSNpiOKQ1xRx4eyFIsOFaPFgv+W2RiHsB2xdpj/MhJc
         Wmc6veC/fTSWikzcu2TEhK1oiycmJqEb/UChKuS/Us25RyGlTJycc5/icCVgS+q2H84i
         dvQz1t+6PEqvmh6rs29/e8Zx6z56lhZ/NhuPg46AS4Z9yShecMJyaXPJ2fJk4rB37lBG
         qGAw==
X-Gm-Message-State: AJIora/RQaqA2aKbynVS9uN80uB4N0EK2T11wXD/OOfuk6lnngz6exQ5
        vgJxS8xgkZFBvNw567Q/CF/7aH4bFgcN+iURQ2pb2aG0jl4=
X-Google-Smtp-Source: AGRyM1tkBVfbS/WPKnxaS2KbVDC/keFlDelm0NcUe5mIC0qaW1Ydh0VTld8nwZUz3COVJzBuqULd3kayOkDFMz4FOIQ=
X-Received: by 2002:a05:6402:4c3:b0:43a:f612:179d with SMTP id
 n3-20020a05640204c300b0043af612179dmr42516765edw.422.1658218621366; Tue, 19
 Jul 2022 01:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220718220252.16923-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220718220252.16923-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 10:16:50 +0200
Message-ID: <CAMRc=MfA7Bea3MHMx0Q0dyNa096po_Pcs54vtV+PQ6h4tMduPA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: 74xx-mmio: Make use of device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 19, 2022 at 12:02 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>
> Add mod_devicetable.h include.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index 173e06758e6c..5e3c948ddb73 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -6,10 +6,11 @@
>   */
>
>  #include <linux/err.h>
> -#include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>
>  #define MMIO_74XX_DIR_IN       (0 << 8)
>  #define MMIO_74XX_DIR_OUT      (1 << 8)
> @@ -112,7 +113,7 @@ static int mmio_74xx_gpio_probe(struct platform_device *pdev)
>         if (!priv)
>                 return -ENOMEM;
>
> -       priv->flags = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +       priv->flags = (uintptr_t)device_get_match_data(&pdev->dev);
>
>         dat = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(dat))
> --
> 2.35.1
>

All three applied, thanks!

Bart
