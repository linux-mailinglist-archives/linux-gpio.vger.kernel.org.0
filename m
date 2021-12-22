Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA00147D196
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 13:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236053AbhLVMXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 07:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhLVMXb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 07:23:31 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0542FC061574;
        Wed, 22 Dec 2021 04:23:30 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id j21so7930271edt.9;
        Wed, 22 Dec 2021 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q94Bnc2rP/XhpTMvNUajGJr0uPmAgTJnbCPbQqUwwjI=;
        b=N5PvGz1wCnFE2hyp9GCR7u/7LG0Wjp7kxrtEJS0oR8iW8IZVj9OlzXVz7kU1DfnHfu
         94tMXU9DjvoJtX8EDvOJyJ2c5zJJhZMdJ4pyNDAnuoUAmyd+TN8CgiPQfE23uYTb2oGb
         1Gio1PhzYW4ljf9XhMjynh6nFPfHBBhi4vJuPXUHARFas+3rQ+q5zP8LU38I8ABf+bNb
         jLho5EkedhWIgIx8Oy5nPtpnNDy9MdS8zPAL1IE1ZSBouyLjN+EPCSvOMbb7ldyogXvs
         gTB3tWVLNSz5U2fMJmIMFqWS68P65Up5kVdP7yp4mYk+tXlbFfnL3PyVWXNTkKPG5hF5
         iBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q94Bnc2rP/XhpTMvNUajGJr0uPmAgTJnbCPbQqUwwjI=;
        b=mOvRlJIE6yjGtpDV275QV829u1IB7Qft3uWllZq+lVu2nuxAuacvnsO7cW1NZ5Ii2o
         CKArs6e1UP/3RLXBj2H0xCDOVc+J5lFNW1lDU9eO6SPiPnF3slhCVVNpYxc7hu5peEJi
         cIsHSeAO6kWJ8jm5uYU3a4B116E8xdVB+puG+6rWKSw/JVV1Q7vscwx8lBgn+24q6mDm
         qE4k54J0aDmemBqPo0ZsgNtCoBip3WeUxZcgrO1K5i759QcMlmaZCwOphtIeJ+yh0fQS
         VnwC8rm0j0/TBJF/zK8nR/nVCxbYnqjrKRR7/1wbHrYvFtIZP8cuiWYVL9uqoQVEd4i+
         M2bw==
X-Gm-Message-State: AOAM5339B2Yg6F2zEPdy949h9gWG4fF43YT2oWX6n92u2snRz6yjDEaM
        dC0i4Y8jI6+RI/OiI6v3XEbSZhJjw0bAmB0vJuU=
X-Google-Smtp-Source: ABdhPJzmIqnqmM6kOWOdB1cfGyyYGdlmnjBV++9SAYQv2jsF9U31R7GHyIbyTE5DsOtA6NzVNW3BoeUxST0GpOG5Hy0=
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr2213346ejj.636.1640175809308;
 Wed, 22 Dec 2021 04:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20211222111108.13260-1-zajec5@gmail.com> <20211222111108.13260-2-zajec5@gmail.com>
In-Reply-To: <20211222111108.13260-2-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 14:21:30 +0200
Message-ID: <CAHp75VfZTOi041zq9+Jq8-jVeRsMBqN60RH_G0FkL+MQ3yO4KQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 1:11 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> BCM4908 has its own pins layout so it needs a custom binding and a Linux
> driver.


Okay, I see that actually on some points you followed my advice, the
only ones at a glance are
- the blank line before module_platform_driver()
- grouping of pinctrl headers

Both of them are not critical, so FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> This patch targets linux-pinctrl.git for-next. It requires commit
> bd0aae66c482 ("pinctrl: add one more "const" for generic function groups"=
)
>
> V2: Formatting fixes
>     Kconfig fix
>     Cleanup of #include-s
>     Use devm_kasprintf_strarray()
> ---
>  MAINTAINERS                           |   1 +
>  drivers/pinctrl/bcm/Kconfig           |  14 +
>  drivers/pinctrl/bcm/Makefile          |   1 +
>  drivers/pinctrl/bcm/pinctrl-bcm4908.c | 563 ++++++++++++++++++++++++++
>  4 files changed, 579 insertions(+)
>  create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm4908.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e352991484e7..7c927fe25e64 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3674,6 +3674,7 @@ M:        bcm-kernel-feedback-list@broadcom.com
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.ya=
ml
> +F:     drivers/pinctrl/bcm/pinctrl-bcm4908.c
>
>  BROADCOM BCM5301X ARM ARCHITECTURE
>  M:     Hauke Mehrtens <hauke@hauke-m.de>
> diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
> index 5123f4c33854..57d5bfa5b5f2 100644
> --- a/drivers/pinctrl/bcm/Kconfig
> +++ b/drivers/pinctrl/bcm/Kconfig
> @@ -29,6 +29,20 @@ config PINCTRL_BCM2835
>         help
>            Say Y here to enable the Broadcom BCM2835 GPIO driver.
>
> +config PINCTRL_BCM4908
> +       tristate "Broadcom BCM4908 pinmux driver"
> +       depends on ARCH_BCM4908 || COMPILE_TEST
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       default ARCH_BCM4908
> +       help
> +         Driver for BCM4908 family SoCs with integrated pin controller.
> +
> +         If compiled as module it will be called pinctrl-bcm4908.
> +
>  config PINCTRL_BCM63XX
>         bool
>         select PINMUX
> diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
> index 00c7b7775e63..82b868ec1471 100644
> --- a/drivers/pinctrl/bcm/Makefile
> +++ b/drivers/pinctrl/bcm/Makefile
> @@ -3,6 +3,7 @@
>
>  obj-$(CONFIG_PINCTRL_BCM281XX)         +=3D pinctrl-bcm281xx.o
>  obj-$(CONFIG_PINCTRL_BCM2835)          +=3D pinctrl-bcm2835.o
> +obj-$(CONFIG_PINCTRL_BCM4908)          +=3D pinctrl-bcm4908.o
>  obj-$(CONFIG_PINCTRL_BCM63XX)          +=3D pinctrl-bcm63xx.o
>  obj-$(CONFIG_PINCTRL_BCM6318)          +=3D pinctrl-bcm6318.o
>  obj-$(CONFIG_PINCTRL_BCM6328)          +=3D pinctrl-bcm6328.o
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/=
pinctrl-bcm4908.c
> new file mode 100644
> index 000000000000..cdfa165fc033
> --- /dev/null
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
> @@ -0,0 +1,563 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2021 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string_helpers.h>
> +
> +#include "../core.h"
> +#include "../pinmux.h"
> +
> +#define BCM4908_NUM_PINS                       86
> +
> +#define BCM4908_TEST_PORT_BLOCK_EN_LSB                 0x00
> +#define BCM4908_TEST_PORT_BLOCK_DATA_MSB               0x04
> +#define BCM4908_TEST_PORT_BLOCK_DATA_LSB               0x08
> +#define  BCM4908_TEST_PORT_LSB_PINMUX_DATA_SHIFT       12
> +#define BCM4908_TEST_PORT_COMMAND                      0x0c
> +#define  BCM4908_TEST_PORT_CMD_LOAD_MUX_REG            0x00000021
> +
> +struct bcm4908_pinctrl {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct mutex mutex;
> +       struct pinctrl_dev *pctldev;
> +       struct pinctrl_desc pctldesc;
> +};
> +
> +/*
> + * Groups
> + */
> +
> +struct bcm4908_pinctrl_pin_setup {
> +       unsigned int number;
> +       unsigned int function;
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_0_pins_a[] =3D {
> +       { 0, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_1_pins_a[] =3D {
> +       { 1, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_2_pins_a[] =3D {
> +       { 2, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_3_pins_a[] =3D {
> +       { 3, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_4_pins_a[] =3D {
> +       { 4, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_5_pins_a[] =3D {
> +       { 5, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_6_pins_a[] =3D {
> +       { 6, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_7_pins_a[] =3D {
> +       { 7, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_8_pins_a[] =3D {
> +       { 8, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_9_pins_a[] =3D {
> +       { 9, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_10_pins_a[] =3D {
> +       { 10, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_11_pins_a[] =3D {
> +       { 11, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_12_pins_a[] =3D {
> +       { 12, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_13_pins_a[] =3D {
> +       { 13, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_14_pins_a[] =3D {
> +       { 14, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_15_pins_a[] =3D {
> +       { 15, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_16_pins_a[] =3D {
> +       { 16, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_17_pins_a[] =3D {
> +       { 17, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_18_pins_a[] =3D {
> +       { 18, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_19_pins_a[] =3D {
> +       { 19, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_20_pins_a[] =3D {
> +       { 20, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_21_pins_a[] =3D {
> +       { 21, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_22_pins_a[] =3D {
> +       { 22, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_23_pins_a[] =3D {
> +       { 23, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_24_pins_a[] =3D {
> +       { 24, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_25_pins_a[] =3D {
> +       { 25, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_26_pins_a[] =3D {
> +       { 26, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_27_pins_a[] =3D {
> +       { 27, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_28_pins_a[] =3D {
> +       { 28, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_29_pins_a[] =3D {
> +       { 29, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_30_pins_a[] =3D {
> +       { 30, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_31_pins_a[] =3D {
> +       { 31, 3 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_10_pins_b[] =3D {
> +       { 8, 2 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_11_pins_b[] =3D {
> +       { 9, 2 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_12_pins_b[] =3D {
> +       { 0, 2 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_13_pins_b[] =3D {
> +       { 1, 2 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup led_31_pins_b[] =3D {
> +       { 30, 2 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup hs_uart_pins[] =3D {
> +       { 10, 0 },      /* CTS */
> +       { 11, 0 },      /* RTS */
> +       { 12, 0 },      /* RXD */
> +       { 13, 0 },      /* TXD */
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup i2c_pins_a[] =3D {
> +       { 18, 0 },      /* SDA */
> +       { 19, 0 },      /* SCL */
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup i2c_pins_b[] =3D {
> +       { 22, 0 },      /* SDA */
> +       { 23, 0 },      /* SCL */
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup i2s_pins[] =3D {
> +       { 27, 0 },      /* MCLK */
> +       { 28, 0 },      /* LRCK */
> +       { 29, 0 },      /* SDATA */
> +       { 30, 0 },      /* SCLK */
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup nand_ctrl_pins[] =3D {
> +       { 32, 0 },
> +       { 33, 0 },
> +       { 34, 0 },
> +       { 43, 0 },
> +       { 44, 0 },
> +       { 45, 0 },
> +       { 56, 1 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup nand_data_pins[] =3D {
> +       { 35, 0 },
> +       { 36, 0 },
> +       { 37, 0 },
> +       { 38, 0 },
> +       { 39, 0 },
> +       { 40, 0 },
> +       { 41, 0 },
> +       { 42, 0 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup emmc_ctrl_pins[] =3D {
> +       { 46, 0 },
> +       { 47, 0 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup usb0_pwr_pins[] =3D {
> +       { 63, 0 },
> +       { 64, 0 },
> +};
> +
> +static const struct bcm4908_pinctrl_pin_setup usb1_pwr_pins[] =3D {
> +       { 66, 0 },
> +       { 67, 0 },
> +};
> +
> +struct bcm4908_pinctrl_grp {
> +       const char *name;
> +       const struct bcm4908_pinctrl_pin_setup *pins;
> +       const unsigned int num_pins;
> +};
> +
> +static const struct bcm4908_pinctrl_grp bcm4908_pinctrl_grps[] =3D {
> +       { "led_0_grp_a", led_0_pins_a, ARRAY_SIZE(led_0_pins_a) },
> +       { "led_1_grp_a", led_1_pins_a, ARRAY_SIZE(led_1_pins_a) },
> +       { "led_2_grp_a", led_2_pins_a, ARRAY_SIZE(led_2_pins_a) },
> +       { "led_3_grp_a", led_3_pins_a, ARRAY_SIZE(led_3_pins_a) },
> +       { "led_4_grp_a", led_4_pins_a, ARRAY_SIZE(led_4_pins_a) },
> +       { "led_5_grp_a", led_5_pins_a, ARRAY_SIZE(led_5_pins_a) },
> +       { "led_6_grp_a", led_6_pins_a, ARRAY_SIZE(led_6_pins_a) },
> +       { "led_7_grp_a", led_7_pins_a, ARRAY_SIZE(led_7_pins_a) },
> +       { "led_8_grp_a", led_8_pins_a, ARRAY_SIZE(led_8_pins_a) },
> +       { "led_9_grp_a", led_9_pins_a, ARRAY_SIZE(led_9_pins_a) },
> +       { "led_10_grp_a", led_10_pins_a, ARRAY_SIZE(led_10_pins_a) },
> +       { "led_11_grp_a", led_11_pins_a, ARRAY_SIZE(led_11_pins_a) },
> +       { "led_12_grp_a", led_12_pins_a, ARRAY_SIZE(led_12_pins_a) },
> +       { "led_13_grp_a", led_13_pins_a, ARRAY_SIZE(led_13_pins_a) },
> +       { "led_14_grp_a", led_14_pins_a, ARRAY_SIZE(led_14_pins_a) },
> +       { "led_15_grp_a", led_15_pins_a, ARRAY_SIZE(led_15_pins_a) },
> +       { "led_16_grp_a", led_16_pins_a, ARRAY_SIZE(led_16_pins_a) },
> +       { "led_17_grp_a", led_17_pins_a, ARRAY_SIZE(led_17_pins_a) },
> +       { "led_18_grp_a", led_18_pins_a, ARRAY_SIZE(led_18_pins_a) },
> +       { "led_19_grp_a", led_19_pins_a, ARRAY_SIZE(led_19_pins_a) },
> +       { "led_20_grp_a", led_20_pins_a, ARRAY_SIZE(led_20_pins_a) },
> +       { "led_21_grp_a", led_21_pins_a, ARRAY_SIZE(led_21_pins_a) },
> +       { "led_22_grp_a", led_22_pins_a, ARRAY_SIZE(led_22_pins_a) },
> +       { "led_23_grp_a", led_23_pins_a, ARRAY_SIZE(led_23_pins_a) },
> +       { "led_24_grp_a", led_24_pins_a, ARRAY_SIZE(led_24_pins_a) },
> +       { "led_25_grp_a", led_25_pins_a, ARRAY_SIZE(led_25_pins_a) },
> +       { "led_26_grp_a", led_26_pins_a, ARRAY_SIZE(led_26_pins_a) },
> +       { "led_27_grp_a", led_27_pins_a, ARRAY_SIZE(led_27_pins_a) },
> +       { "led_28_grp_a", led_28_pins_a, ARRAY_SIZE(led_28_pins_a) },
> +       { "led_29_grp_a", led_29_pins_a, ARRAY_SIZE(led_29_pins_a) },
> +       { "led_30_grp_a", led_30_pins_a, ARRAY_SIZE(led_30_pins_a) },
> +       { "led_31_grp_a", led_31_pins_a, ARRAY_SIZE(led_31_pins_a) },
> +       { "led_10_grp_b", led_10_pins_b, ARRAY_SIZE(led_10_pins_b) },
> +       { "led_11_grp_b", led_11_pins_b, ARRAY_SIZE(led_11_pins_b) },
> +       { "led_12_grp_b", led_12_pins_b, ARRAY_SIZE(led_12_pins_b) },
> +       { "led_13_grp_b", led_13_pins_b, ARRAY_SIZE(led_13_pins_b) },
> +       { "led_31_grp_b", led_31_pins_b, ARRAY_SIZE(led_31_pins_b) },
> +       { "hs_uart_grp", hs_uart_pins, ARRAY_SIZE(hs_uart_pins) },
> +       { "i2c_grp_a", i2c_pins_a, ARRAY_SIZE(i2c_pins_a) },
> +       { "i2c_grp_b", i2c_pins_b, ARRAY_SIZE(i2c_pins_b) },
> +       { "i2s_grp", i2s_pins, ARRAY_SIZE(i2s_pins) },
> +       { "nand_ctrl_grp", nand_ctrl_pins, ARRAY_SIZE(nand_ctrl_pins) },
> +       { "nand_data_grp", nand_data_pins, ARRAY_SIZE(nand_data_pins) },
> +       { "emmc_ctrl_grp", emmc_ctrl_pins, ARRAY_SIZE(emmc_ctrl_pins) },
> +       { "usb0_pwr_grp", usb0_pwr_pins, ARRAY_SIZE(usb0_pwr_pins) },
> +       { "usb1_pwr_grp", usb1_pwr_pins, ARRAY_SIZE(usb1_pwr_pins) },
> +};
> +
> +/*
> + * Functions
> + */
> +
> +struct bcm4908_pinctrl_function {
> +       const char *name;
> +       const char * const *groups;
> +       const unsigned int num_groups;
> +};
> +
> +static const char * const led_0_groups[] =3D { "led_0_grp_a" };
> +static const char * const led_1_groups[] =3D { "led_1_grp_a" };
> +static const char * const led_2_groups[] =3D { "led_2_grp_a" };
> +static const char * const led_3_groups[] =3D { "led_3_grp_a" };
> +static const char * const led_4_groups[] =3D { "led_4_grp_a" };
> +static const char * const led_5_groups[] =3D { "led_5_grp_a" };
> +static const char * const led_6_groups[] =3D { "led_6_grp_a" };
> +static const char * const led_7_groups[] =3D { "led_7_grp_a" };
> +static const char * const led_8_groups[] =3D { "led_8_grp_a" };
> +static const char * const led_9_groups[] =3D { "led_9_grp_a" };
> +static const char * const led_10_groups[] =3D { "led_10_grp_a", "led_10_=
grp_b" };
> +static const char * const led_11_groups[] =3D { "led_11_grp_a", "led_11_=
grp_b" };
> +static const char * const led_12_groups[] =3D { "led_12_grp_a", "led_12_=
grp_b" };
> +static const char * const led_13_groups[] =3D { "led_13_grp_a", "led_13_=
grp_b" };
> +static const char * const led_14_groups[] =3D { "led_14_grp_a" };
> +static const char * const led_15_groups[] =3D { "led_15_grp_a" };
> +static const char * const led_16_groups[] =3D { "led_16_grp_a" };
> +static const char * const led_17_groups[] =3D { "led_17_grp_a" };
> +static const char * const led_18_groups[] =3D { "led_18_grp_a" };
> +static const char * const led_19_groups[] =3D { "led_19_grp_a" };
> +static const char * const led_20_groups[] =3D { "led_20_grp_a" };
> +static const char * const led_21_groups[] =3D { "led_21_grp_a" };
> +static const char * const led_22_groups[] =3D { "led_22_grp_a" };
> +static const char * const led_23_groups[] =3D { "led_23_grp_a" };
> +static const char * const led_24_groups[] =3D { "led_24_grp_a" };
> +static const char * const led_25_groups[] =3D { "led_25_grp_a" };
> +static const char * const led_26_groups[] =3D { "led_26_grp_a" };
> +static const char * const led_27_groups[] =3D { "led_27_grp_a" };
> +static const char * const led_28_groups[] =3D { "led_28_grp_a" };
> +static const char * const led_29_groups[] =3D { "led_29_grp_a" };
> +static const char * const led_30_groups[] =3D { "led_30_grp_a" };
> +static const char * const led_31_groups[] =3D { "led_31_grp_a", "led_31_=
grp_b" };
> +static const char * const hs_uart_groups[] =3D { "hs_uart_grp" };
> +static const char * const i2c_groups[] =3D { "i2c_grp_a", "i2c_grp_b" };
> +static const char * const i2s_groups[] =3D { "i2s_grp" };
> +static const char * const nand_ctrl_groups[] =3D { "nand_ctrl_grp" };
> +static const char * const nand_data_groups[] =3D { "nand_data_grp" };
> +static const char * const emmc_ctrl_groups[] =3D { "emmc_ctrl_grp" };
> +static const char * const usb0_pwr_groups[] =3D { "usb0_pwr_grp" };
> +static const char * const usb1_pwr_groups[] =3D { "usb1_pwr_grp" };
> +
> +static const struct bcm4908_pinctrl_function bcm4908_pinctrl_functions[]=
 =3D {
> +       { "led_0", led_0_groups, ARRAY_SIZE(led_0_groups) },
> +       { "led_1", led_1_groups, ARRAY_SIZE(led_1_groups) },
> +       { "led_2", led_2_groups, ARRAY_SIZE(led_2_groups) },
> +       { "led_3", led_3_groups, ARRAY_SIZE(led_3_groups) },
> +       { "led_4", led_4_groups, ARRAY_SIZE(led_4_groups) },
> +       { "led_5", led_5_groups, ARRAY_SIZE(led_5_groups) },
> +       { "led_6", led_6_groups, ARRAY_SIZE(led_6_groups) },
> +       { "led_7", led_7_groups, ARRAY_SIZE(led_7_groups) },
> +       { "led_8", led_8_groups, ARRAY_SIZE(led_8_groups) },
> +       { "led_9", led_9_groups, ARRAY_SIZE(led_9_groups) },
> +       { "led_10", led_10_groups, ARRAY_SIZE(led_10_groups) },
> +       { "led_11", led_11_groups, ARRAY_SIZE(led_11_groups) },
> +       { "led_12", led_12_groups, ARRAY_SIZE(led_12_groups) },
> +       { "led_13", led_13_groups, ARRAY_SIZE(led_13_groups) },
> +       { "led_14", led_14_groups, ARRAY_SIZE(led_14_groups) },
> +       { "led_15", led_15_groups, ARRAY_SIZE(led_15_groups) },
> +       { "led_16", led_16_groups, ARRAY_SIZE(led_16_groups) },
> +       { "led_17", led_17_groups, ARRAY_SIZE(led_17_groups) },
> +       { "led_18", led_18_groups, ARRAY_SIZE(led_18_groups) },
> +       { "led_19", led_19_groups, ARRAY_SIZE(led_19_groups) },
> +       { "led_20", led_20_groups, ARRAY_SIZE(led_20_groups) },
> +       { "led_21", led_21_groups, ARRAY_SIZE(led_21_groups) },
> +       { "led_22", led_22_groups, ARRAY_SIZE(led_22_groups) },
> +       { "led_23", led_23_groups, ARRAY_SIZE(led_23_groups) },
> +       { "led_24", led_24_groups, ARRAY_SIZE(led_24_groups) },
> +       { "led_25", led_25_groups, ARRAY_SIZE(led_25_groups) },
> +       { "led_26", led_26_groups, ARRAY_SIZE(led_26_groups) },
> +       { "led_27", led_27_groups, ARRAY_SIZE(led_27_groups) },
> +       { "led_28", led_28_groups, ARRAY_SIZE(led_28_groups) },
> +       { "led_29", led_29_groups, ARRAY_SIZE(led_29_groups) },
> +       { "led_30", led_30_groups, ARRAY_SIZE(led_30_groups) },
> +       { "led_31", led_31_groups, ARRAY_SIZE(led_31_groups) },
> +       { "hs_uart", hs_uart_groups, ARRAY_SIZE(hs_uart_groups) },
> +       { "i2c", i2c_groups, ARRAY_SIZE(i2c_groups) },
> +       { "i2s", i2s_groups, ARRAY_SIZE(i2s_groups) },
> +       { "nand_ctrl", nand_ctrl_groups, ARRAY_SIZE(nand_ctrl_groups) },
> +       { "nand_data", nand_data_groups, ARRAY_SIZE(nand_data_groups) },
> +       { "emmc_ctrl", emmc_ctrl_groups, ARRAY_SIZE(emmc_ctrl_groups) },
> +       { "usb0_pwr", usb0_pwr_groups, ARRAY_SIZE(usb0_pwr_groups) },
> +       { "usb1_pwr", usb1_pwr_groups, ARRAY_SIZE(usb1_pwr_groups) },
> +};
> +
> +/*
> + * Groups code
> + */
> +
> +static const struct pinctrl_ops bcm4908_pinctrl_ops =3D {
> +       .get_groups_count =3D pinctrl_generic_get_group_count,
> +       .get_group_name =3D pinctrl_generic_get_group_name,
> +       .get_group_pins =3D pinctrl_generic_get_group_pins,
> +       .dt_node_to_map =3D pinconf_generic_dt_node_to_map_group,
> +       .dt_free_map =3D pinconf_generic_dt_free_map,
> +};
> +
> +/*
> + * Functions code
> + */
> +
> +static int bcm4908_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
> +                             unsigned int func_selector,
> +                             unsigned int group_selector)
> +{
> +       struct bcm4908_pinctrl *bcm4908_pinctrl =3D pinctrl_dev_get_drvda=
ta(pctrl_dev);
> +       const struct bcm4908_pinctrl_grp *group;
> +       struct group_desc *group_desc;
> +       int i;
> +
> +       group_desc =3D pinctrl_generic_get_group(pctrl_dev, group_selecto=
r);
> +       if (!group_desc)
> +               return -EINVAL;
> +       group =3D group_desc->data;
> +
> +       mutex_lock(&bcm4908_pinctrl->mutex);
> +       for (i =3D 0; i < group->num_pins; i++) {
> +               u32 lsb =3D 0;
> +
> +               lsb |=3D group->pins[i].number;
> +               lsb |=3D group->pins[i].function << BCM4908_TEST_PORT_LSB=
_PINMUX_DATA_SHIFT;
> +
> +               writel(0x0, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLO=
CK_DATA_MSB);
> +               writel(lsb, bcm4908_pinctrl->base + BCM4908_TEST_PORT_BLO=
CK_DATA_LSB);
> +               writel(BCM4908_TEST_PORT_CMD_LOAD_MUX_REG,
> +                      bcm4908_pinctrl->base + BCM4908_TEST_PORT_COMMAND)=
;
> +       }
> +       mutex_unlock(&bcm4908_pinctrl->mutex);
> +
> +       return 0;
> +}
> +
> +static const struct pinmux_ops bcm4908_pinctrl_pmxops =3D {
> +       .get_functions_count =3D pinmux_generic_get_function_count,
> +       .get_function_name =3D pinmux_generic_get_function_name,
> +       .get_function_groups =3D pinmux_generic_get_function_groups,
> +       .set_mux =3D bcm4908_pinctrl_set_mux,
> +};
> +
> +/*
> + * Controller code
> + */
> +
> +static struct pinctrl_desc bcm4908_pinctrl_desc =3D {
> +       .name =3D "bcm4908-pinctrl",
> +       .pctlops =3D &bcm4908_pinctrl_ops,
> +       .pmxops =3D &bcm4908_pinctrl_pmxops,
> +};
> +
> +static const struct of_device_id bcm4908_pinctrl_of_match_table[] =3D {
> +       { .compatible =3D "brcm,bcm4908-pinctrl", },
> +       { }
> +};
> +
> +static int bcm4908_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct bcm4908_pinctrl *bcm4908_pinctrl;
> +       struct pinctrl_desc *pctldesc;
> +       struct pinctrl_pin_desc *pins;
> +       char **pin_names;
> +       int i;
> +
> +       bcm4908_pinctrl =3D devm_kzalloc(dev, sizeof(*bcm4908_pinctrl), G=
FP_KERNEL);
> +       if (!bcm4908_pinctrl)
> +               return -ENOMEM;
> +       pctldesc =3D &bcm4908_pinctrl->pctldesc;
> +       platform_set_drvdata(pdev, bcm4908_pinctrl);
> +
> +       /* Set basic properties */
> +
> +       bcm4908_pinctrl->dev =3D dev;
> +
> +       bcm4908_pinctrl->base =3D devm_platform_ioremap_resource(pdev, 0)=
;
> +       if (IS_ERR(bcm4908_pinctrl->base))
> +               return PTR_ERR(bcm4908_pinctrl->base);
> +
> +       mutex_init(&bcm4908_pinctrl->mutex);
> +
> +       memcpy(pctldesc, &bcm4908_pinctrl_desc, sizeof(*pctldesc));
> +
> +       /* Set pinctrl properties */
> +
> +       pin_names =3D devm_kasprintf_strarray(dev, "pin", BCM4908_NUM_PIN=
S);
> +       if (IS_ERR(pin_names))
> +               return PTR_ERR(pin_names);
> +
> +       pins =3D devm_kcalloc(dev, BCM4908_NUM_PINS, sizeof(*pins), GFP_K=
ERNEL);
> +       if (!pins)
> +               return -ENOMEM;
> +       for (i =3D 0; i < BCM4908_NUM_PINS; i++) {
> +               pins[i].number =3D i;
> +               pins[i].name =3D pin_names[i];
> +       }
> +       pctldesc->pins =3D pins;
> +       pctldesc->npins =3D BCM4908_NUM_PINS;
> +
> +       /* Register */
> +
> +       bcm4908_pinctrl->pctldev =3D devm_pinctrl_register(dev, pctldesc,=
 bcm4908_pinctrl);
> +       if (IS_ERR(bcm4908_pinctrl->pctldev))
> +               return dev_err_probe(dev, PTR_ERR(bcm4908_pinctrl->pctlde=
v),
> +                                    "Failed to register pinctrl\n");
> +
> +       /* Groups */
> +
> +       for (i =3D 0; i < ARRAY_SIZE(bcm4908_pinctrl_grps); i++) {
> +               const struct bcm4908_pinctrl_grp *group =3D &bcm4908_pinc=
trl_grps[i];
> +               int *pins;
> +               int j;
> +
> +               pins =3D devm_kcalloc(dev, group->num_pins, sizeof(*pins)=
, GFP_KERNEL);
> +               if (!pins)
> +                       return -ENOMEM;
> +               for (j =3D 0; j < group->num_pins; j++)
> +                       pins[j] =3D group->pins[j].number;
> +
> +               pinctrl_generic_add_group(bcm4908_pinctrl->pctldev, group=
->name,
> +                                         pins, group->num_pins, (void *)=
group);
> +       }
> +
> +       /* Functions */
> +
> +       for (i =3D 0; i < ARRAY_SIZE(bcm4908_pinctrl_functions); i++) {
> +               const struct bcm4908_pinctrl_function *function =3D &bcm4=
908_pinctrl_functions[i];
> +
> +               pinmux_generic_add_function(bcm4908_pinctrl->pctldev,
> +                                           function->name,
> +                                           function->groups,
> +                                           function->num_groups, NULL);
> +       }
> +
> +       return 0;
> +}
> +
> +static struct platform_driver bcm4908_pinctrl_driver =3D {
> +       .probe =3D bcm4908_pinctrl_probe,
> +       .driver =3D {
> +               .name =3D "bcm4908-pinctrl",
> +               .of_match_table =3D bcm4908_pinctrl_of_match_table,
> +       },
> +};
> +
> +module_platform_driver(bcm4908_pinctrl_driver);
> +
> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
> --
> 2.31.1
>


--=20
With Best Regards,
Andy Shevchenko
