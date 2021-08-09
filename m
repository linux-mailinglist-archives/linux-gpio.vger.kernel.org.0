Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200163E459E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 14:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbhHIM3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 08:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbhHIM3z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 08:29:55 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FBFC0613D3;
        Mon,  9 Aug 2021 05:29:34 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so17755439oti.0;
        Mon, 09 Aug 2021 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thN/ZoRccLpd+EQuYlB78wUqMWe7rTdx7KWd0VrKeLI=;
        b=KQMOlm0JQLotKfMrdQcX3inY5NTX3C8IzvcN2BsVOVCIOUNZiW9WgwCwOCrJ6NhUXd
         /aQy3yRknG+JmRjN1oNX/sSQWg8jPDd9M/Btpu8qau8nCThc1KQcEvxrqRAsk8AM62Pk
         PCU8AyINXnHJFGJMtesZlr+tejto27EiOqw4PVf+iBlfANXARVvgJPMzpuxNAOlW+VIO
         pZ8udv1lg9PCHtBoRjQNWf/dkUVrDx0/ntY0Z0PqWZL2FJ0iTgw41cmQqbaGUY5uMdV7
         DWNP0XavfogEChbLjJ5NbaxzHFiluBdLHuOdyVsJPiqRrgORh2Wof86/23fulivkYtxB
         pYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thN/ZoRccLpd+EQuYlB78wUqMWe7rTdx7KWd0VrKeLI=;
        b=RsdHyq+XxquUSHRRj1Ga9fzyY8OYUFgERcJAcGssNQK2lat3KODU4kvl3Fj64jhCeh
         qKN9aOXWlytmWPrA/jTADLECea+OxC37fhS7XPZ8NtJDEPN/YMNOclhsGMEIf++BMPRk
         nX70mGknNosDv6fjN/JZGQ8a/BDHhcixwRYes+22gEOtau+uunYeBfFMsendsD9zBgDy
         LPD3Jo6PMCLUMB7wMbQuFb4q5lS1oMWA23aOFXLW1wQgJQNOanIrDlAXtYbZ9ZnrGkTJ
         313OjY8FRwRjWuC+KylZxyqQ+/1ATtsaiXsGO8BZm4Se4Z1PSQK5RFeJvdfch8r++1ha
         bYiA==
X-Gm-Message-State: AOAM531IUullL4QMWCq4CrNTxzJPuoLi+ffhbdkeM28M5Nqc1wOMSOXB
        +S3qXyt1k0D409RF0dYncrbw+CuQJ8v4TUzO6Xc=
X-Google-Smtp-Source: ABdhPJxJETnrKNlA+hdYmtT0K1Wzuay1vMo3ze1lfgU1rcjg/dwUzqbdEZnXT76Q+a0EHed++X3hUrfNfDM93mWQ1P4=
X-Received: by 2002:a9d:2609:: with SMTP id a9mr521165otb.365.1628512174038;
 Mon, 09 Aug 2021 05:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210809121345.967597-1-chrisrblake93@gmail.com> <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com>
In-Reply-To: <CAHp75VfQr6XKQ0UDQDq0pH7TK=_WUGBhRKcC_=-zzUGOwO8tWQ@mail.gmail.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Mon, 9 Aug 2021 07:29:23 -0500
Message-ID: <CALpBJjpSJQquzaT14TkoEbTHrvtN8kiQWKLs3n0ZNiziB=iwCA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: add meraki-mx100 platform driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 9, 2021 at 7:22 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Aug 9, 2021 at 3:13 PM Chris Blake <chrisrblake93@gmail.com> wrote:
> >
> > This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> > network appliance. This sets up the network LEDs and Reset
> > button.
>
> Almost good to me, see below for some comments. After addressing them
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
>
> > Depends-on: ef0eea5b151ae ("mfd: lpc_ich: Enable GPIO driver for DH89xxCC")
> > Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> > Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> > ---
> >
> > Changelog:
> > V3: Additional cleanups, formatting changes
> > V2: Move to using gpiod lookup tables, misc cleanups
> > V1: Initial Patch
> >
> >  drivers/platform/x86/Kconfig        |  13 ++
> >  drivers/platform/x86/Makefile       |   3 +
> >  drivers/platform/x86/meraki-mx100.c | 202 ++++++++++++++++++++++++++++
> >  3 files changed, 218 insertions(+)
> >  create mode 100644 drivers/platform/x86/meraki-mx100.c
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 7d385c3b2239..8d70176e335f 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -302,6 +302,19 @@ config ASUS_NB_WMI
> >           If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> >           here.
> >
> > +config MERAKI_MX100
> > +       tristate "Cisco Meraki MX100 Platform Driver"
> > +       depends on GPIOLIB
> > +       depends on GPIO_ICH
> > +       depends on LEDS_CLASS
> > +       select LEDS_GPIO
> > +       help
> > +         This driver provides support for the front button and LEDs on
> > +         the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
> > +
> > +         To compile this driver as a module, choose M here: the module
> > +         will be called meraki-mx100.
> > +
> >  config EEEPC_LAPTOP
> >         tristate "Eee PC Hotkey Driver"
> >         depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 7ee369aab10d..25c5aee1cde7 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)     += asus-nb-wmi.o
> >  obj-$(CONFIG_EEEPC_LAPTOP)     += eeepc-laptop.o
> >  obj-$(CONFIG_EEEPC_WMI)                += eeepc-wmi.o
> >
> > +# Cisco/Meraki
> > +obj-$(CONFIG_MERAKI_MX100)     += meraki-mx100.o
> > +
> >  # Dell
> >  obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)                += dell/
> >
> > diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
> > new file mode 100644
> > index 000000000000..eebbd0a3d806
> > --- /dev/null
> > +++ b/drivers/platform/x86/meraki-mx100.c
> > @@ -0,0 +1,202 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Cisco Meraki MX100 (Tinkerbell) board platform driver
> > + *
> > + * Based off of arch/x86/platform/meraki/tink.c from the
> > + * Meraki GPL release meraki-firmware-sources-r23-20150601
> > + *
> > + * Format inspired by platform/x86/pcengines-apuv2.c
> > + *
> > + * Copyright (C) 2021 Chris Blake <chrisrblake93@gmail.com>
> > + */
> > +
> > +#define pr_fmt(fmt)    KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/dmi.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio_keys.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/input.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define TINK_GPIO_DRIVER_NAME "gpio_ich"
> > +
> > +/* LEDs */
> > +static const struct gpio_led tink_leds[] = {
> > +       {
> > +               .name = "mx100:green:internet",
> > +               .default_trigger = "default-on",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan2",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan3",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan4",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan5",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan6",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan7",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan8",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan9",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan10",
> > +       },
> > +       {
> > +               .name = "mx100:green:lan11",
> > +       },
> > +};
> > +
> > +static const struct gpio_led_platform_data tink_leds_pdata = {
> > +       .num_leds       = ARRAY_SIZE(tink_leds),
> > +       .leds           = tink_leds,
> > +};
> > +
> > +static struct gpiod_lookup_table tink_leds_table = {
> > +       .dev_id = "leds-gpio",
> > +       .table = {
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 11,
> > +                               NULL, 0, GPIO_ACTIVE_LOW),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 18,
> > +                               NULL, 1, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 20,
> > +                               NULL, 2, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 22,
> > +                               NULL, 3, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 23,
> > +                               NULL, 4, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 32,
> > +                               NULL, 5, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 34,
> > +                               NULL, 6, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 35,
> > +                               NULL, 7, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 36,
> > +                               NULL, 8, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 37,
> > +                               NULL, 9, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 48,
> > +                               NULL, 10, GPIO_ACTIVE_HIGH),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 16,
> > +                               NULL, 11, GPIO_ACTIVE_LOW),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 7,
> > +                               NULL, 12, GPIO_ACTIVE_LOW),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 21,
> > +                               NULL, 13, GPIO_ACTIVE_LOW),
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 19,
> > +                               NULL, 14, GPIO_ACTIVE_LOW),
> > +               {} /* Terminating entry */
> > +       }
> > +};
> > +
> > +/* Reset Button */
> > +static struct gpio_keys_button tink_buttons[] = {
> > +       {
> > +               .desc                   = "Reset",
> > +               .type                   = EV_KEY,
> > +               .code                   = KEY_RESTART,
> > +               .active_low             = 1,
> > +               .debounce_interval      = 100,
> > +       },
> > +};
> > +
> > +static const struct gpio_keys_platform_data tink_buttons_pdata = {
> > +       .buttons        = tink_buttons,
> > +       .nbuttons       = ARRAY_SIZE(tink_buttons),
> > +       .poll_interval  = 20,
> > +       .rep            = 0,
> > +       .name           = "mx100-keys",
> > +};
> > +
> > +static struct gpiod_lookup_table tink_keys_table = {
> > +       .dev_id = "gpio-keys-polled",
> > +       .table = {
> > +               GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 60,
> > +                               NULL, 0, GPIO_ACTIVE_LOW),
> > +               {} /* Terminating entry */
> > +       }
> > +};
> > +
> > +/* Board setup */
> > +static const struct dmi_system_id tink_systems[] __initconst = {
> > +       {
> > +               .matches = {
> > +                       DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
> > +                       DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
> > +               },
> > +       },
> > +       {} /* Terminating entry */
> > +};
> > +MODULE_DEVICE_TABLE(dmi, tink_systems);
> > +
> > +static struct platform_device *tink_leds_pdev;
> > +static struct platform_device *tink_keys_pdev;
> > +
> > +static struct platform_device * __init tink_create_dev(
> > +       const char *name, const void *pdata, size_t sz)
> > +{
> > +       struct platform_device *pdev;
> > +
> > +       pdev = platform_device_register_data(NULL,
> > +               name, PLATFORM_DEVID_NONE, pdata, sz);
> > +       if (IS_ERR(pdev))
> > +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> > +
> > +       return pdev;
> > +}
> > +
> > +static int __init tink_board_init(void)
> > +{
> > +       if (!dmi_first_match(tink_systems))
> > +               return -ENODEV;
> > +
> > +       /*
> > +        * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> > +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> > +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> > +        */
> > +       outl(inl(0x530) | BIT(28), 0x530);
> > +
> > +       gpiod_add_lookup_table(&tink_leds_table);
> > +       gpiod_add_lookup_table(&tink_keys_table);
> > +
> > +       tink_leds_pdev = tink_create_dev("leds-gpio",
> > +               &tink_leds_pdata, sizeof(tink_leds_pdata));
>
> Seems you forgot to add
> if (IS_ERR())
>   return PTR_ERR();
>
> here...
>
> > +       tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> > +               &tink_buttons_pdata, sizeof(tink_buttons_pdata));
>
> and
>
> if (IS_ERR()) {
>  pdev_unreg();
>  return PTR_ERR();
> }
>
> here.
>

Are these IS_ERR catches needed since they are done in the
tink_create_dev struct? This is the same structure as currently done
in drivers/platform/x86/pcengines-apuv2.c. Adding these 2x additions
feels a bit redundant, but if I am wrong please correct me.

> > +       return 0;
> > +}
> > +module_init(tink_board_init);
> > +
> > +static void __exit tink_board_exit(void)
> > +{
> > +       platform_device_unregister(tink_keys_pdev);
> > +       platform_device_unregister(tink_leds_pdev);
> > +       gpiod_remove_lookup_table(&tink_keys_table);
> > +       gpiod_remove_lookup_table(&tink_leds_table);
> > +}
> > +module_exit(tink_board_exit);
> > +
> > +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> > +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:meraki-mx100");
> > --
> > 2.25.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
