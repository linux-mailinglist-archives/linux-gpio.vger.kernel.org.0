Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47B23CCB96
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 01:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhGRXiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Jul 2021 19:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhGRXiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jul 2021 19:38:11 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DACC061762;
        Sun, 18 Jul 2021 16:35:12 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w188so18652208oif.10;
        Sun, 18 Jul 2021 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mHwcGS2ysH6z8g2U68l6pdbm2masP2qn+PDIg206EN0=;
        b=RmNb+70LbTthCKs32OMIBI/VlOkmFNkSgVWaQkxFFlXw4whim+aBFNu8BjS8S5m4Eu
         H6pdmmcXagAk7OkThNoYNQ1NfKZmB6o7G7VbhmsCWiLmn/kDbCRFXl8KRBDU8L/6AIGt
         kEcHRqGXTwLDmTRSa3Vd/1xf89nGAOyr6oEjoi290SeWYsiEYkC+5nQwzr1AtfdGM64q
         Y/j+MjBKrLD12tO7Uz55AFaiQRp8ItFB8QGA+ZtKHNObkZHt7tEtqSeSRLCyApn6iwg/
         O+f2ZWnt7XmUOMMbnpFGOEhGHULxDdrvQTLFsDsRjxkwIxUmYxIu1/uFWWfMILHi7CH/
         DwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=mHwcGS2ysH6z8g2U68l6pdbm2masP2qn+PDIg206EN0=;
        b=F512ATW19entb80jrgRBS9So8oDVlzrP0aDPFxKytT6xNfwz1+tQNoLU9WC2zvBwfu
         gxWU9niI3GrpCER+hNpNJ801Iof+PuBEwKVc7uvVgoAIEoelzqJmf5TiTxgd01qt5UqJ
         uzcBap/OS5ndRqA9x+A4JMafSbBJQuCb0s2qEa5r8320W/UBHBfV9em9PwDHeT/k4LSn
         U5ITPfj44i1cTBhw3lJASgOpS6aF3ssnpsF9K9vIlpgEm+u3+qNP1EluDLotnu2eJsU5
         k7IZcnbokq6ZXSBo6c15d6+MvDVdHW29uxAaXu30rbZV/qS9vtKo0imAg6S+aiqBbrlC
         NN8g==
X-Gm-Message-State: AOAM5316daBKPA5OHX18sJj68RVQf12Ztus1qZkpyoczl/nT0n7+8+6o
        DzXaG7d4cTaAP2M0s9D50WYpVPPVTHG/2XuagMU2/XP0hqkkbg==
X-Google-Smtp-Source: ABdhPJwPzaes+Ut/nQ9UxEH1qC0Iotkuf1w8a8Ty0fBonvFiOKqZa2FoZMErzSAE2pLpKFCZICbWcTYcfmwWvAjvD2U=
X-Received: by 2002:a54:4398:: with SMTP id u24mr15705649oiv.81.1626651312153;
 Sun, 18 Jul 2021 16:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210706184730.14951-1-chrisrblake93@gmail.com>
In-Reply-To: <20210706184730.14951-1-chrisrblake93@gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Sun, 18 Jul 2021 18:35:01 -0500
Message-ID: <CALpBJjqOYYwDuZXJHnCi23u9me5g=1UMV08U07=LzwLfNE=kPA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: add meraki-mx100 platform driver
To:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 6, 2021 at 1:47 PM Chris Blake <chrisrblake93@gmail.com> wrote:
>
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button. Note that this patch requires
> mfd: lpc_ich: Enable GPIO driver for DH89xxCC which has been accepted
> and is currently targeted for 5.15.
>
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/meraki-mx100.c | 185 ++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/platform/x86/meraki-mx100.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7d385c3b2239..8d70176e335f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -302,6 +302,19 @@ config ASUS_NB_WMI
>           If you have an ACPI-WMI compatible Asus Notebook, say Y or M
>           here.
>
> +config MERAKI_MX100
> +       tristate "Cisco Meraki MX100 Platform Driver"
> +       depends on GPIOLIB
> +       depends on GPIO_ICH
> +       depends on LEDS_CLASS
> +       select LEDS_GPIO
> +       help
> +         This driver provides support for the front button and LEDs on
> +         the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called meraki-mx100.
> +
>  config EEEPC_LAPTOP
>         tristate "Eee PC Hotkey Driver"
>         depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..25c5aee1cde7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)     += asus-nb-wmi.o
>  obj-$(CONFIG_EEEPC_LAPTOP)     += eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)                += eeepc-wmi.o
>
> +# Cisco/Meraki
> +obj-$(CONFIG_MERAKI_MX100)     += meraki-mx100.o
> +
>  # Dell
>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)                += dell/
>
> diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
> new file mode 100644
> index 000000000000..12b17ef06d14
> --- /dev/null
> +++ b/drivers/platform/x86/meraki-mx100.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Cisco Meraki MX100 (Tinkerbell) board platform driver
> + *
> + * Based off of arch/x86/platform/meraki/tink.c from the
> + * Meraki GPL release meraki-firmware-sources-r23-20150601
> + *
> + * Format inspired by platform/x86/pcengines-apuv2.c
> + *
> + * Copyright (C) 2021 Chris Blake <chrisrblake93@gmail.com>
> + */
> +
> +#define pr_fmt(fmt)    KBUILD_MODNAME ": " fmt
> +
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio_keys.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define TINK_GPIO_OFFSET       436
> +
> +/* LEDs */
> +static const struct gpio_led tink_leds[] = {
> +       {
> +               .name = "mx100:green:internet",
> +               .gpio = TINK_GPIO_OFFSET + 11,
> +               .active_low = 1,
> +               .default_trigger = "default-on",
> +       },
> +       {
> +               .name = "mx100:green:lan2",
> +               .gpio = TINK_GPIO_OFFSET + 18,
> +       },
> +       {
> +               .name = "mx100:green:lan3",
> +               .gpio = TINK_GPIO_OFFSET + 20,
> +       },
> +       {
> +               .name = "mx100:green:lan4",
> +               .gpio = TINK_GPIO_OFFSET + 22,
> +       },
> +       {
> +               .name = "mx100:green:lan5",
> +               .gpio = TINK_GPIO_OFFSET + 23,
> +       },
> +       {
> +               .name = "mx100:green:lan6",
> +               .gpio = TINK_GPIO_OFFSET + 32,
> +       },
> +       {
> +               .name = "mx100:green:lan7",
> +               .gpio = TINK_GPIO_OFFSET + 34,
> +       },
> +       {
> +               .name = "mx100:green:lan8",
> +               .gpio = TINK_GPIO_OFFSET + 35,
> +       },
> +       {
> +               .name = "mx100:green:lan9",
> +               .gpio = TINK_GPIO_OFFSET + 36,
> +       },
> +       {
> +               .name = "mx100:green:lan10",
> +               .gpio = TINK_GPIO_OFFSET + 37,
> +       },
> +       {
> +               .name = "mx100:green:lan11",
> +               .gpio = TINK_GPIO_OFFSET + 48,
> +       },
> +       {
> +               .name = "mx100:green:ha",
> +               .gpio = TINK_GPIO_OFFSET + 16,
> +               .active_low = 1,
> +       },
> +       {
> +               .name = "mx100:orange:ha",
> +               .gpio = TINK_GPIO_OFFSET + 7,
> +               .active_low = 1,
> +       },
> +       {
> +               .name = "mx100:green:usb",
> +               .gpio = TINK_GPIO_OFFSET + 21,
> +               .active_low = 1,
> +       },
> +       {
> +               .name = "mx100:orange:usb",
> +               .gpio = TINK_GPIO_OFFSET + 19,
> +               .active_low = 1,
> +       },
> +};
> +
> +static const struct gpio_led_platform_data tink_leds_pdata = {
> +       .num_leds       = ARRAY_SIZE(tink_leds),
> +       .leds           = tink_leds,
> +};
> +
> +/* Reset Button */
> +static struct gpio_keys_button tink_buttons[] = {
> +       {
> +               .desc                   = "Reset",
> +               .type                   = EV_KEY,
> +               .code                   = KEY_RESTART,
> +               .gpio                   = TINK_GPIO_OFFSET + 60,
> +               .active_low             = 1,
> +               .debounce_interval      = 100,
> +       },
> +};
> +
> +static const struct gpio_keys_platform_data tink_buttons_pdata = {
> +       .buttons        = tink_buttons,
> +       .nbuttons       = ARRAY_SIZE(tink_buttons),
> +       .poll_interval  = 20,
> +       .rep            = 0,
> +       .name           = "mx100-keys",
> +};
> +
> +/* Board setup */
> +
> +static struct platform_device *tink_leds_pdev;
> +static struct platform_device *tink_keys_pdev;
> +
> +static struct platform_device * __init tink_create_dev(
> +       const char *name,
> +       const void *pdata,
> +       size_t sz)
> +{
> +       struct platform_device *pdev;
> +
> +       pdev = platform_device_register_data(NULL,
> +               name,
> +               PLATFORM_DEVID_NONE,
> +               pdata,
> +               sz);
> +
> +       if (IS_ERR(pdev))
> +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> +
> +       return pdev;
> +}
> +
> +static int __init tink_board_init(void)
> +{
> +       if (!dmi_match(DMI_SYS_VENDOR, "Cisco") || !dmi_match(DMI_PRODUCT_NAME, "MX100-HW")) {
> +               return -ENODEV;
> +       }
> +
> +       /* We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +        */
> +       outl(inl(0x530) | BIT(28), 0x530);
> +
> +       tink_leds_pdev = tink_create_dev(
> +               "leds-gpio",
> +               &tink_leds_pdata,
> +               sizeof(tink_leds_pdata));
> +
> +       tink_keys_pdev = tink_create_dev(
> +               "gpio-keys-polled",
> +               &tink_buttons_pdata,
> +               sizeof(tink_buttons_pdata));
> +
> +       return 0;
> +}
> +
> +static void __exit tink_board_exit(void)
> +{
> +       platform_device_unregister(tink_keys_pdev);
> +       platform_device_unregister(tink_leds_pdev);
> +}
> +
> +module_init(tink_board_init);
> +module_exit(tink_board_exit);
> +
> +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:meraki-mx100");
> +MODULE_SOFTDEP("pre: platform:gpio_ich platform:leds-gpio platform:gpio_keys_polled");
> --
> 2.25.1
>

Hello,

Just following up to see what is required to get this reviewed. Thanks!

Regards,
Chris B
