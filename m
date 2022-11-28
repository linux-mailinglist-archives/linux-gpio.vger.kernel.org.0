Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E786E63B121
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 19:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234280AbiK1SVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 13:21:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbiK1SVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 13:21:12 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9991A24F21
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 10:08:15 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id 128so11406976vsz.12
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 10:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XiKD6ppGzG5ZpI3cTFBiLcU8vTXLdTb3vib9toIv4h8=;
        b=kZVXla1pGI1G/+OHC2g0O2VBAu1aLsZtDuRFOiKZ+VXGSlVP1HWYVhNbUvgVv7WCCq
         4AvwjmttHrl9vu4qR/yjzvjP0Rm85PECb/90hUfLNnuk4XVUOtALxI/3j3fm/NBrsFJF
         mcmvFe4ExxMR/h447GvPvMsBH5+iDsdAwQumXH0NYpwewwJaH8sdkkwWLowTO9cNz1k5
         0qRpQUA4SYxasVWlpwJKsgFI9HZjKxoPhtX8cxC59yur/shZCZeSRsw/BCn4uTuRXn1F
         PFdwhpAUlyoRMgCBkKoKlwy2EZJLkcMsgmjaKsCG3czxQ4P7wB35vmpuBgBPuRth7Ol0
         NcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiKD6ppGzG5ZpI3cTFBiLcU8vTXLdTb3vib9toIv4h8=;
        b=G9nTrRTISuM9/z40phMyqhXsU7UEcbccsFis0owXbevRB2QOS9deIbfzNfmsGoZZya
         jO3Fpj+kLzFk72LNF7MaiBCPDCHeKtdxGcG5ZN1NbtaoJFG3yQN1pyocrNAFDm5y9J4d
         FwZn2+RKwpC0aR7PN30wZXi0wQO+OEGzUbPHR4f9iFH3/+WkciIE1j2Kz2cKEHQu+ALF
         9J0+JMxmVdYckWORjO9RR7b5/9aoQ4iawh/KJ4XiR79wP8Htp96ln5QaD4O1j5hxdaaD
         LVXf0zdNHUo5aGSp5JG0+3pNsayDzgwWVnxc6PK4pd8o2UpWXquiRBi9xnZnn8urOxfc
         OVAg==
X-Gm-Message-State: ANoB5pmdy4Xrh2sctVSfbBhxxOBwMnNYY03KpFs4Wg0A4vbbr3kS20ta
        86Z1COyThM7jvuLgcQmCP454+BeygRRlZZE8CZBe8w==
X-Google-Smtp-Source: AA0mqf6fPFJYgunNTLJH3p4ifumRkKwZ6waXF0adKpQmLaXx0pegGIEWEUuxjiyBpumotWSqLhYVGQLH0+SKWW5pPoA=
X-Received: by 2002:a67:e8d7:0:b0:3b0:767f:e291 with SMTP id
 y23-20020a67e8d7000000b003b0767fe291mr14518815vsn.47.1669658892929; Mon, 28
 Nov 2022 10:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20221118092218.480147-1-mranostay@ti.com> <20221118092218.480147-5-mranostay@ti.com>
In-Reply-To: <20221118092218.480147-5-mranostay@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Nov 2022 19:08:01 +0100
Message-ID: <CAMRc=Mf1wSHfBhJz4z+SS3gH+ZKa5Hyar-gziteyfoOy8s7tsg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpio: gpio-tps6594x: add GPIO support for TPS6594x PMIC
To:     Matt Ranostay <mranostay@ti.com>
Cc:     vigneshr@ti.com, robh@kernel.org, krzysztof.kozlowski@linaro.org,
        a.zummo@towertech.it, linus.walleij@linaro.org, lee@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 10:22 AM Matt Ranostay <mranostay@ti.com> wrote:
>
> Add support for TPS6594X PMICs GPIO interface that has 11 that can be
> configured as input or outputs.
>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  drivers/gpio/Kconfig         |  9 +++++
>  drivers/gpio/Makefile        |  1 +
>  drivers/gpio/gpio-tps6594x.c | 78 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tps6594x.h |  4 ++
>  4 files changed, 92 insertions(+)
>  create mode 100644 drivers/gpio/gpio-tps6594x.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ec7cfd4f52b1..6b65c790efe7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1405,6 +1405,15 @@ config GPIO_TPS65912
>         help
>           This driver supports TPS65912 GPIO chip.
>
> +config GPIO_TPS6594X
> +       tristate "TI TPS6594X GPIO driver"
> +       depends on MFD_TPS6594X || COMPILE_TEST
> +       select REGMAP
> +       select GPIO_REGMAP
> +       help
> +         Select this option to enable GPIO driver for the TPS6954X
> +         PMIC chip family. There are 11 GPIOs that can be configured.
> +
>  config GPIO_TPS68470
>         tristate "TPS68470 GPIO"
>         depends on INTEL_SKL_INT3472
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 010587025fc8..9892f9adc5b5 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_TPS65218)         += gpio-tps65218.o
>  obj-$(CONFIG_GPIO_TPS6586X)            += gpio-tps6586x.o
>  obj-$(CONFIG_GPIO_TPS65910)            += gpio-tps65910.o
>  obj-$(CONFIG_GPIO_TPS65912)            += gpio-tps65912.o
> +obj-$(CONFIG_GPIO_TPS6594X)            += gpio-tps6594x.o
>  obj-$(CONFIG_GPIO_TPS68470)            += gpio-tps68470.o
>  obj-$(CONFIG_GPIO_TQMX86)              += gpio-tqmx86.o
>  obj-$(CONFIG_GPIO_TS4800)              += gpio-ts4800.o
> diff --git a/drivers/gpio/gpio-tps6594x.c b/drivers/gpio/gpio-tps6594x.c
> new file mode 100644
> index 000000000000..733fedba70cb
> --- /dev/null
> +++ b/drivers/gpio/gpio-tps6594x.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPIO driver for TI TPS6594x PMICs
> + *
> + * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/gpio/regmap.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/tps6594x.h>
> +
> +#define GPIO_BANK_SIZE 8
> +#define GPIO_CFG_MASK  BIT(0)
> +
> +static int tps6594x_regmap_xlate(struct gpio_regmap *gpio,
> +                                   unsigned int base, unsigned int offset,
> +                                   unsigned int *reg, unsigned int *mask)
> +{
> +       if (base == TPS6594X_GPIO_CONF) {
> +               *reg = base + offset;
> +               *mask = GPIO_CFG_MASK;
> +       } else {
> +               unsigned int line = offset % GPIO_BANK_SIZE;
> +               unsigned int stride = offset / GPIO_BANK_SIZE;
> +
> +               *reg = base + stride;
> +               *mask = BIT(line);
> +       }
> +
> +       return 0;
> +}
> +
> +static int tps6594x_gpio_probe(struct platform_device *pdev)
> +{
> +       struct gpio_regmap_config config = {0};
> +       struct regmap *regmap;
> +
> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       config.regmap = regmap;
> +       config.parent = &pdev->dev;
> +       config.ngpio = 11;
> +       config.ngpio_per_reg = GPIO_BANK_SIZE;
> +
> +       config.reg_dat_base = TPS6594X_GPIO_IN;
> +       config.reg_set_base = TPS6594X_GPIO_OUT;
> +       config.reg_dir_out_base = TPS6594X_GPIO_CONF;
> +       config.reg_mask_xlate = tps6594x_regmap_xlate;
> +
> +       return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
> +}
> +
> +static const struct of_device_id of_tps6594x_gpio_match[] = {
> +       { .compatible = "ti,tps6594-gpio", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, of_tps6594x_gpio_match);
> +
> +static struct platform_driver tps6594x_gpio_driver = {
> +       .driver = {
> +               .name = "tps6594-gpio",
> +               .of_match_table = of_tps6594x_gpio_match,
> +       },
> +       .probe = tps6594x_gpio_probe,
> +};
> +module_platform_driver(tps6594x_gpio_driver);
> +
> +MODULE_ALIAS("platform:tps6594-gpio");
> +MODULE_AUTHOR("Matt Ranostay <mranostay@ti.com>");
> +MODULE_DESCRIPTION("TPS6594X GPIO driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/tps6594x.h b/include/linux/mfd/tps6594x.h
> index 5a6af0da9223..155618e4d5d0 100644
> --- a/include/linux/mfd/tps6594x.h
> +++ b/include/linux/mfd/tps6594x.h
> @@ -21,6 +21,10 @@
>  #define TPS6594X_FSM_I2C_TRIGGERS              0x85
>  #define TPS6594X_FSM_NSLEEP_TRIGGERS           0x86
>
> +#define TPS6594X_GPIO_CONF                     0x31
> +#define TPS6594X_GPIO_OUT                      0x3d
> +#define TPS6594X_GPIO_IN                       0x3f
> +
>  #define TPS6594X_RTC_SECONDS                   0xb5
>  #define TPS6594X_RTC_MINUTES                   0xb6
>  #define TPS6594X_RTC_HOURS                     0xb7
> --
> 2.38.GIT
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
