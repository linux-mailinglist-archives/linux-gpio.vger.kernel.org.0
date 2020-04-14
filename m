Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334F01A7FA4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 16:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390483AbgDNOYc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 10:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390473AbgDNOY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Apr 2020 10:24:29 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC1CC061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 07:24:29 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id m67so13298316qke.12
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2020 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aHMG1MBm2+eY7DZ7w29/ct753fdWwUDHfMh7HNQa9t0=;
        b=iMAP5uwgcly9r2gkaFDpYbu73VUWTbXekUVskHZg52P+dq0OwNFmyEv54Bc96Vv+HI
         M6Mo+ATdcCnAQhOAND5lOpFlW/+zsORUYKnPkUsLmAjispiRcndRp0K3XwnrGHL2s2if
         cIt7lBAwPnJR0U1sxm5RqFPYec52whWoJlHskR7med0h4+IHLaB5AzcOSwLz2WKwNIs/
         SPwDf0AKXFvpjq3/Rv09Y0Vq3tDDiyiIVRFLslVsFb/nIhejpVwHCXCi5VfOyrT8bWJv
         mveRr3FJkG4W4psM23mHAHUP8A0fiHKoh18CtIFmyHsYyancVzQ4B0F7/M6qfbUTGjy2
         PMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aHMG1MBm2+eY7DZ7w29/ct753fdWwUDHfMh7HNQa9t0=;
        b=e9ooPvreowIztC7lSozBE0bXQXTKtLg2TvpBj5ZXs0tRs0d7y6WAmZONhA2Wx4FYG9
         w18xughlDDr7Q2mKl8VVTVUPaiadzK0XhDCch8wiAt0i7lJ7+66loe1Vevm6fB8QD3dY
         R2YXoG/eF/CJ54knmoEUnuBzj24EAR7wm9jsPU02YGrSTN5TgQ6K2GIvuPNvVvyU9HV+
         xU+L/Hy8CGsEcQKzphZnD5yU1B04enf7RLIOhszCtwIQY6T9UXQx9Z9kh1NGV7KCJsbk
         7zW+12JsUpucbDC7/YaW5ihoJVHw9tb7yQ+BGplA2RqtmlqUc/NboEYmVlrofOLFUezG
         RYJQ==
X-Gm-Message-State: AGi0PuYGw0EXqTMHQkrgKxFF1pcr4p9U6yqMluqd6ZDsXJdYCZdnznad
        5ROdcqhlGhg9cocVZMk7Hib0V4em5BHK7M6ps6FgiotK
X-Google-Smtp-Source: APiQypKXMFL+nPHG1X3l6FewljijlVfYWCUn1vyYvkrVjlozePAkAbyqKeymEQQQxrvn3junboHcAXvC1yTWWGV1/68=
X-Received: by 2002:a05:620a:5f1:: with SMTP id z17mr17484327qkg.21.1586874267950;
 Tue, 14 Apr 2020 07:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200409014110.27254-1-robh@kernel.org>
In-Reply-To: <20200409014110.27254-1-robh@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 14 Apr 2020 16:24:17 +0200
Message-ID: <CAMpxmJV-usbuEuXjwYXb9_o77VeJC+G8ED6OWAF9O_N7UzKG8w@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support building as module
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 9 kwi 2020 o 03:41 Rob Herring <robh@kernel.org> napisa=C5=82(a):
>
> Enable building the PL061 GPIO driver as a module.
>
> This does change the initcall level when built-in. This shouldn't be a
> problem as any user should support deferred probe by now. A scan of DT
> based platforms at least didn't reveal any users that would be a
> problem.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpio/Kconfig      | 2 +-
>  drivers/gpio/gpio-pl061.c | 9 ++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b8013cf90064..f1ef878f615b 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -422,7 +422,7 @@ config GPIO_OMAP
>           Say yes here to enable GPIO support for TI OMAP SoCs.
>
>  config GPIO_PL061
> -       bool "PrimeCell PL061 GPIO support"
> +       tristate "PrimeCell PL061 GPIO support"
>         depends on ARM_AMBA
>         select IRQ_DOMAIN
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 5df7782e348f..cf0d5e9b6f2c 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -16,6 +16,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/module.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/device.h>
> @@ -413,6 +414,7 @@ static const struct amba_id pl061_ids[] =3D {
>         },
>         { 0, 0 },
>  };
> +MODULE_DEVICE_TABLE(amba, pl061_ids);
>
>  static struct amba_driver pl061_gpio_driver =3D {
>         .drv =3D {
> @@ -424,9 +426,6 @@ static struct amba_driver pl061_gpio_driver =3D {
>         .id_table       =3D pl061_ids,
>         .probe          =3D pl061_probe,
>  };
> +module_amba_driver(pl061_gpio_driver);
>
> -static int __init pl061_gpio_init(void)
> -{
> -       return amba_driver_register(&pl061_gpio_driver);
> -}
> -device_initcall(pl061_gpio_init);
> +MODULE_LICENSE("GPL v2");
> --
> 2.20.1
>

Patch applied, thanks!

Bart
