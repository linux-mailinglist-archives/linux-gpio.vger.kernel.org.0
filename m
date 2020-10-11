Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40A628A988
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 21:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgJKTDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Oct 2020 15:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbgJKTDe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2020 15:03:34 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9359C0613CE;
        Sun, 11 Oct 2020 12:03:32 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u17so16431699oie.3;
        Sun, 11 Oct 2020 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yHtnE/V52IDcckuvY5tih+ml1RcygXz06+BOJ8YunTE=;
        b=ecUzN/Y2fFPyBq+CAonoTQZAp6EbypqdGrCG6p9IGiSPQyvL6noOfEmT6mqUU/FJhw
         SR/IDio/HsqH/uzorc+KYbGr1WcxnGEmiqdjHwI8qOQfvgBhCgKCUvnjVWK6LAR2Pd/a
         AbfyznsanNLBaViUHKxCQ9hLxwRcB5DPvmNWKZqG+1E3mvRFD91thtuKwUgwMMLdxIzM
         7WyLXcF8kPzzzfL26D3bknQ/rTRJnvyRa/IKhDPpqxMOj349yQi+0pNHMHJEEMR28MJk
         IQMXxuWQXtWOkERCevrHHFU6xx9wgZWnuNFP2mHVI7bS5Z7yFUjCoo09gi0xkP0qjK0O
         UKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=yHtnE/V52IDcckuvY5tih+ml1RcygXz06+BOJ8YunTE=;
        b=baRMyhAF+Fw3RrhtS6Rux0S3b8LXNZy6HLkpI18tGtfz0fWbKuvtUrlNOvqrPw0BFX
         eufHSR5b0g0Km2RwV9rRPsoFf3NMXbUR5GkMtk6JbLVkGV7CAIpT6oLlFNlO3azI8jnH
         uAco68fMmPi+YDi+glU/xXqY0hssvHjoMmfm+oBazB+JgPYqlFBqHhwAlNGpmXqXx6Ef
         cPgij+Xe8OqeBA6Ell+Q5Trp9NRxs2nse7akSVeRDCUW2rsQUpycUlqB0oQNKc56FnOZ
         WsnycFseHe3vAJwoNyepfnX9gvkonItU1P55meNrSyC0MckbEGsfD3+Ev2WxzoaVL/LD
         rsWA==
X-Gm-Message-State: AOAM5307fMFarglW6+AtigJZXOoz22asDETlbkpv5TZpy/H7ULCAYl3o
        k0Si+UC1btHDxCBNNynMcDc=
X-Google-Smtp-Source: ABdhPJxBGMHIkKKvYUBtQUiqyp9AUxBqpVne/JRhUcwYjxDxZlXHUWWkLGZ8oz6q1A7KEs/0lXltsA==
X-Received: by 2002:a05:6808:3bc:: with SMTP id n28mr6705173oie.171.1602443011771;
        Sun, 11 Oct 2020 12:03:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d22sm8882591oij.53.2020.10.11.12.03.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 12:03:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 11 Oct 2020 12:03:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, krzk@kernel.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/4] gpio: mxc: Support module build
Message-ID: <20201011190329.GA119453@roeck-us.net>
References: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600320829-1453-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 01:33:46PM +0800, Anson Huang wrote:
> Change config to tristate, add module device table, module author,
> description and license to support module build for i.MX GPIO driver.
> 
> As this is a SoC GPIO module, it provides common functions for most
> of the peripheral devices, such as GPIO pins control, secondary
> interrupt controller for GPIO pins IRQ etc., without GPIO driver, most
> of the peripheral devices will NOT work properly, so GPIO module is
> similar with clock, pinctrl driver that should be loaded ONCE and
> never unloaded.
> 
> Since MXC GPIO driver needs to have init function to register syscore
> ops once, here still use subsys_initcall(), NOT module_platform_driver().
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

This patch made it into linux-next, but none of the other patches in
the series did. This results in a variety of boot failures in -next.

Not that it is my concern, but "without GPIO driver, most of the peripheral
devices will NOT work properly" makes me wonder if building this driver
as module is really expected to work anywhere.

Guenter

> ---
> no change.
> ---
>  drivers/gpio/Kconfig    | 2 +-
>  drivers/gpio/gpio-mxc.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5cfdaf3..c7292a5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -397,7 +397,7 @@ config GPIO_MVEBU
>  	select REGMAP_MMIO
>  
>  config GPIO_MXC
> -	def_bool y
> +	tristate "i.MX GPIO support"
>  	depends on ARCH_MXC || COMPILE_TEST
>  	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 64278a4..643f4c55 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -15,6 +15,7 @@
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/syscore_ops.h>
> @@ -158,6 +159,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
>  	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
>  
>  /*
>   * MX2 has one interrupt *for all* gpio ports. The list is used
> @@ -604,3 +606,7 @@ static int __init gpio_mxc_init(void)
>  	return platform_driver_register(&mxc_gpio_driver);
>  }
>  subsys_initcall(gpio_mxc_init);
> +
> +MODULE_AUTHOR("Shawn Guo <shawn.guo@linaro.org>");
> +MODULE_DESCRIPTION("i.MX GPIO Driver");
> +MODULE_LICENSE("GPL");
