Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7C761EE77
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbiKGJOo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbiKGJOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:14:42 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A281F5FAA
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:14:41 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id k67so9978259vsk.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9MKh6klOzZy2yvpmFQ7mydJ7MsIEBGNpCK4rmHVmgus=;
        b=dtmaub/bSr63Lpkpd11spZNzm+NW5E/PqJvSDcDwTk34Hh8ffZvMGhH/6aUMZ7LkG5
         Xd/Qr0HB3701gczKiZT2Pc5R5ksZHjxrXFoC2c51aeMLIiFnnyBTQ83BfNwQVWGOmiB1
         sLaOdDs//jAaJZf6SSAjMsOKU18pGBV6U2xxwFyB9uSwxEnGHL0HQrTMmwNB/IipyQJL
         6rm2t0CbODAHwWikHlEf/UJsCiU28Kn1OxnAPkPFY5/8VTAgZ+uIJcvr4IKXfUpyiRHy
         v0kSbJji84wJPRe2oOywQZT5x2DHR+Guebpb23q761bWVpUiKLUwheirzDuevUlWhfCg
         TZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MKh6klOzZy2yvpmFQ7mydJ7MsIEBGNpCK4rmHVmgus=;
        b=OT8HQQe4bv7GW4G1gKhJNNf0+ATDt9lfQzV+a6gzKeQSVY4KN9tdS18zS91BvX6HJ9
         W7PP2J610iJpqJAj5MF+nAYKhYuYA1ZVTVtNIwVEqMiJaI4l7jWK2CId9D5ZK85WcRTM
         qywsFUV5CCrtic1dcUK1g5TSzq5BNGnwiVLQ9E7vd+0wqeA8KQ/V71xCK5aE5ueTXpRE
         Bls1EZCM3aZurAnxMQ2MQXpoDA9nu3egIoHwPOIIKs2YZ+VxgsTw5TA24p454+yR2MXv
         i74njvwQwkvjAFq9XdmcQ4ZsQWnVs5U8D3rZcEjuA1dMsoCe6Se03NjyTWVSagAaCj8Y
         gwGw==
X-Gm-Message-State: ACrzQf32R/dbHvCL1H50efQ01G86gFMl7CwXdXDE0OSMmnQQ/RHi+nGA
        jU1m42KkTR3NXrOn/Vzj/yVfqyrGR8g9LbnMyJ9vzQ==
X-Google-Smtp-Source: AMsMyM51DJ9B8belX6slH5wGiRwbMyfWWpCrO+TRVVJW89Xtkw2b57U2obKZky04LgvIt4HWi3y6yJLKvsPmfqfNxvI=
X-Received: by 2002:a05:6102:5788:b0:3a6:764d:1382 with SMTP id
 dh8-20020a056102578800b003a6764d1382mr25704898vsb.13.1667812480822; Mon, 07
 Nov 2022 01:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20221026203539.517886-1-nfrayer@baylibre.com>
In-Reply-To: <20221026203539.517886-1-nfrayer@baylibre.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Nov 2022 10:14:30 +0100
Message-ID: <CAMRc=MfVqBVv9byXvimpYUtvs1OXqh5608AZ0_L=zw7q6rOo9A@mail.gmail.com>
Subject: Re: [PATCH] gpio: davinci: add support of module build
To:     Nicolas Frayer <nfrayer@baylibre.com>
Cc:     j-keerthy@ti.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        khilman@baylibre.com, glaroque@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 10:35 PM Nicolas Frayer <nfrayer@baylibre.com> wrote:
>
> From: Guillaume La Roque <glaroque@baylibre.com>
>
> Added module build support for the davinci gpio driver
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
> ---
>  drivers/gpio/Kconfig        |  2 +-
>  drivers/gpio/gpio-davinci.c | 15 ++++++---------
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a01af1180616..f8bace51c2d0 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -219,7 +219,7 @@ config GPIO_CLPS711X
>           Say yes here to support GPIO on CLPS711X SoCs.
>
>  config GPIO_DAVINCI
> -       bool "TI Davinci/Keystone GPIO support"
> +       tristate "TI Davinci/Keystone GPIO support"
>         default y if ARCH_DAVINCI
>         depends on (ARM || ARM64) && (ARCH_DAVINCI || ARCH_KEYSTONE || ARCH_K3)
>         help
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index 59c4c48d8296..def87b99691f 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -721,12 +721,9 @@ static struct platform_driver davinci_gpio_driver = {
>         },
>  };
>
> -/**
> - * GPIO driver registration needs to be done before machine_init functions
> - * access GPIO. Hence davinci_gpio_drv_reg() is a postcore_initcall.
> - */
> -static int __init davinci_gpio_drv_reg(void)
> -{
> -       return platform_driver_register(&davinci_gpio_driver);
> -}
> -postcore_initcall(davinci_gpio_drv_reg);
> +module_platform_driver(davinci_gpio_driver);

I'm sure there was a reason to register the driver early (at postcore)
for some platforms. This moves the registration to module_init which
is the last initcall to call. What HW did you test this on?

Bart

> +
> +MODULE_AUTHOR("Jan Kotas <jank@cadence.com>");
> +MODULE_DESCRIPTION("DAVINCI GPIO driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-davinci");
> --
> 2.25.1
>
