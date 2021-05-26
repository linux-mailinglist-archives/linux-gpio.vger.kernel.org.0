Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1294039172C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 14:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhEZMPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 08:15:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:52344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233766AbhEZMPl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 08:15:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 949CB613E1
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622031250;
        bh=5DOy1bNEKFf9vIGiiM6wZJfQ0MuF8meKnD0SY6EvZfQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=USuojgZvI/uEUVd6yUInuRNgAsTdOZbeixpH+3xu5GiwOH5ro2fvna068q6dsfMU9
         KK7/DExz8sLF3+JieHAts1uF3oipkRkLE0+Am4XAa3E0/WtritMRhlBTfTqaQRknm7
         RLoE/IY4yNN8Fh8aoLFnytVbrpVaQ/J9Tg98Xg68mWVe/8hgNf6Qn1R9L/qS0kv3IP
         GK6ebCTHI4oV/voTWW93b3ky/Ld+MA9mPCdqrgPdVPnZf8MjvokPthwyhOniA57HmV
         5YLdXG1qYOkIXnu7dPsig4O164txhnqthzJZqwlaJXNPvesNERbwYeTh/leTQiXCqw
         /twkfrwtSOQxg==
Received: by mail-ed1-f50.google.com with SMTP id y7so1193149eda.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 05:14:10 -0700 (PDT)
X-Gm-Message-State: AOAM532hcxb4g8tJv6s1aiNeK/03y7D3tnc7h0iWqW0V3w1TevOLEqyV
        B4tzIFncuEiZ1oB6Qij54rEZrV9C9poq1VcEqbc=
X-Google-Smtp-Source: ABdhPJzUYHLtCpkSxBrw2TFxqPuK0sTNrTYyKU6Zfaw8KktPPR3S6HkAbRKrB/Vd2N4bk+ZCvj8sRAJc/yFEgdU7H/o=
X-Received: by 2002:a05:6402:40d0:: with SMTP id z16mr37887989edb.104.1622031249234;
 Wed, 26 May 2021 05:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210525054149.1792-1-kunyang_fan@asus.com> <20210525054149.1792-5-kunyang_fan@asus.com>
In-Reply-To: <20210525054149.1792-5-kunyang_fan@asus.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 26 May 2021 08:13:55 -0400
X-Gmail-Original-Message-ID: <CAJKOXPfcC=cqka2fgvcgVuKnAJWAS2yga6Qj_PpKN9twUPGf0A@mail.gmail.com>
Message-ID: <CAJKOXPfcC=cqka2fgvcgVuKnAJWAS2yga6Qj_PpKN9twUPGf0A@mail.gmail.com>
Subject: Re: [PATCH 5/5] leds: add driver for AAEON devices
To:     aaeon.asus@gmail.com, andyshevchenko@gmail.com
Cc:     linux-gpio@vger.kernel.org, acelan.kao@canonical.com,
        Kunyang_Fan <kunyang_fan@asus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 25 May 2021 at 01:42, <aaeon.asus@gmail.com> wrote:
>
> From: Kunyang_Fan <kunyang_fan@asus.com>
>
> This patch adds support for the led devices which can
> be controlled from sysfs through ASUS WMI interface.
>
> Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
> ---
>  drivers/leds/Kconfig      |  11 +++
>  drivers/leds/Makefile     |   1 +
>  drivers/leds/leds-aaeon.c | 142 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/leds/leds-aaeon.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index be4536eef1fe..34d1b80855af 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -49,6 +49,17 @@ config LEDS_88PM860X
>           This option enables support for on-chip LED drivers found on Marvell
>           Semiconductor 88PM8606 PMIC.
>
> +config LEDS_AAEON
> +       tristate "AAEON LED driver"
> +       depends on X86
> +       select MFD_AAEON
> +       help
> +         This led driver adds support for LED brightness control on Single
> +         Board Computers produced by AAEON.
> +
> +         This driver leverages the ASUS WMI interface to access device
> +         resources.
> +
>  config LEDS_AAT1290
>         tristate "LED support for the AAT1290"
>         depends on LEDS_CLASS_FLASH
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d6b8a792c936..a8a77acc5e11 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)             += led-triggers.o
>
>  # LED Platform Drivers (keep this sorted, M-| sort)
>  obj-$(CONFIG_LEDS_88PM860X)            += leds-88pm860x.o
> +obj-$(CONFIG_LEDS_AAEON)               += leds-aaeon.o
>  obj-$(CONFIG_LEDS_AAT1290)             += leds-aat1290.o
>  obj-$(CONFIG_LEDS_ADP5520)             += leds-adp5520.o
>  obj-$(CONFIG_LEDS_AN30259A)            += leds-an30259a.o
> diff --git a/drivers/leds/leds-aaeon.c b/drivers/leds/leds-aaeon.c
> new file mode 100644
> index 000000000000..10090a4bff65
> --- /dev/null
> +++ b/drivers/leds/leds-aaeon.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AAEON LED driver
> + *
> + * Copyright (c) 2021, AAEON Ltd.
> + *
> + * Author: Kunyang Fan <kunyang_fan@aaeon.com.tw>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/x86/asus-wmi.h>
> +#include <linux/platform_device.h>
> +
> +#define DRVNAME "led_aaeon"
> +#define ASUS_NB_WMI_EVENT_GUID   "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
> +#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
> +
> +#define GET_LED_NUMBER_ID        0x00060000
> +#define GET_LED_METHOD_ID        0x00060001
> +#define SET_LED_METHOD_ID        0x00060002
> +#define GET_LED_NUMBER_METHOD_ID 0x10
> +
> +

Previous patches apply here as well (no double blank lines, missing
SoB, missing CC to maintainers, not needed license text).

> +struct aaeon_led_data {
> +       int id;
> +       struct led_classdev cdev;
> +};
> +
> +static int aaeon_led_get_number(void)
> +{
> +       int err, retval;
> +
> +       err = asus_wmi_evaluate_method(GET_LED_NUMBER_ID,
> +                                      GET_LED_NUMBER_METHOD_ID,
> +                                      0, &retval);
> +       if (err)
> +               return err;
> +
> +       return retval;
> +}
> +
> +static enum led_brightness aaeon_led_brightness_get(struct led_classdev
> +                                                     *cdev)
> +{
> +       int err, brightness;
> +       struct aaeon_led_data *led =
> +                       container_of(cdev, struct aaeon_led_data, cdev);
> +       u32 arg0;
> +
> +       arg0 = (u32)(led->id & 0xF);

Hm, why do you need a cast here?

> +       err = asus_wmi_evaluate_method(GET_LED_METHOD_ID, arg0, 0, &brightness);
> +       if (err)
> +               return err;
> +
> +       return brightness;
> +};
> +
> +static void aaeon_led_brightness_set(struct led_classdev *cdev,
> +                                      enum led_brightness brightness)
> +{
> +       int err, retval;
> +       struct aaeon_led_data *led =
> +                       container_of(cdev, struct aaeon_led_data, cdev);
> +       u32 arg0;
> +
> +       arg0 = (u32)(led->id & 0xF);
> +       if (brightness != LED_OFF)
> +               arg0 |= BIT(16);
> +
> +       err = asus_wmi_evaluate_method(SET_LED_METHOD_ID, arg0, 0, &retval);
> +};
> +
> +static int __init aaeon_add_led_device(struct platform_device *pdev,
> +                                          int id)
> +{
> +       struct aaeon_led_data *led;
> +
> +       led = devm_kzalloc(&pdev->dev, sizeof(struct aaeon_led_data), GFP_KERNEL);

sizeof(*led)

> +       if (!led)
> +               return -ENOMEM;
> +
> +       led->id = id;
> +       led->cdev.brightness_get = aaeon_led_brightness_get;
> +       led->cdev.brightness_set = aaeon_led_brightness_set;
> +       led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "led:%d:", id);
> +
> +       if (!led->cdev.name)
> +               return -ENOMEM;
> +
> +       return devm_led_classdev_register(&pdev->dev, &led->cdev);
> +}
> +
> +static int aaeon_led_probe(struct platform_device *pdev)
> +{
> +       int err = -ENODEV, i;

Split declaration of initialized and uninitialized variables.

> +       int led_number = 0;
> +
> +       pr_debug("aaeon led device probe!\n");

No printks for simple probes. This pollutes the dmesg without any benefit.

Best regards,
Krzysztof
