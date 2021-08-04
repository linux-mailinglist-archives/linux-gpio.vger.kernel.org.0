Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A397D3DF98E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 04:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbhHDCFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 22:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhHDCFC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 22:05:02 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBB8C06175F;
        Tue,  3 Aug 2021 19:04:50 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id q6so1114379oiw.7;
        Tue, 03 Aug 2021 19:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKs0X7dUIccGN0W9nXMTN6gb6W2IWChrqW9qf0zzkAw=;
        b=YlkrcCa0s2gRPcyTEDcOa/Rjv8JIRhwhAlIjKnIoCMyDw0Ux54BBhIEeqjH4zmVoSh
         cuKb4D7Cesr4R4/z24TrlqGf5jyglxdRbbiidmSMj1r8qJ+gI4xSQiFffZv6TcGQJ1MQ
         oS+wevYHmrL4j73WKS5wrSg9BN099igBQEvJHSR7OjYahwkTS2q/NwxLouSLw0Oy+SQT
         qb85jjtO3fm5HR93N1XP6i3iqIpcQzF7G2lLg27d3IHr7pPmOULEsvgwCu+I2p+U+c8j
         u8q0zsa+gJ2HHDP2/vG0+Fp4OTFKHXCwxVMyqcDeq7vhYTuH8ABdCI2GyJpneDLjcE2e
         EvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKs0X7dUIccGN0W9nXMTN6gb6W2IWChrqW9qf0zzkAw=;
        b=jQWs6XdetgxpIVU/xr588/LbBZuI3eQ0G4Hg5qTdW06j3LLWD+sRfQHGr4lfLZUA3g
         qCPlfMMLvMhyocdPtlMyhyEHjHCbUAqeZv5zwLi5IvkN5UbfWzWMcg1jFHAJelBD0LS/
         e9tpqe0TknnpV06QTQOOt2FXy6m+FIfuyi1FJC2WR9I1wq/O/2kWAdgaf0bP8/tdjUYv
         EGDy3wFAtYncO3IEYwNZa1YU4t29eUycwIYK++KX7yLbKGysps1zHer6PkUMkTK1Nks7
         DgAKybqTad5RuDjVaxDWoIVOP7IcJIzeB6K7cUuP/SwcMsAsjakz2gAgCqYuPiMSocLM
         Y8RA==
X-Gm-Message-State: AOAM531QRj5Dci+sFqM02+rbZQ3jBr9L916KLsG7g3pzMKqnYNI5DGAZ
        c50CdPc2lO1v7shxZPPCxtAeTDCTxSAvMIAVCmc=
X-Google-Smtp-Source: ABdhPJw2gwAgEgLGuKQpS5ztLQOxIF1a8lo1kQ2qHqaeQJ9v5vRoC5YRg+NrS82wVIkQYiGovkckHgFyEFxo+WZWrR8=
X-Received: by 2002:aca:dac1:: with SMTP id r184mr3615221oig.81.1628042690135;
 Tue, 03 Aug 2021 19:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210706184730.14951-1-chrisrblake93@gmail.com> <e352bafc-cf31-4cd2-31c8-3c75a96b10d5@redhat.com>
In-Reply-To: <e352bafc-cf31-4cd2-31c8-3c75a96b10d5@redhat.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Tue, 3 Aug 2021 21:04:39 -0500
Message-ID: <CALpBJjrZsHHcB=5iyfJUBSKmdrbBBc9gworu+tK_Z_0Tojc4Sg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: add meraki-mx100 platform driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 5:43 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Chris,
>
> On 7/6/21 8:47 PM, Chris Blake wrote:
> > This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> > network appliance. This sets up the network LEDs and Reset
> > button. Note that this patch requires
> > mfd: lpc_ich: Enable GPIO driver for DH89xxCC which has been accepted
> > and is currently targeted for 5.15.
> >
> > Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> > Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig        |  13 ++
> >  drivers/platform/x86/Makefile       |   3 +
> >  drivers/platform/x86/meraki-mx100.c | 185 ++++++++++++++++++++++++++++
> >  3 files changed, 201 insertions(+)
> >  create mode 100644 drivers/platform/x86/meraki-mx100.c
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 7d385c3b2239..8d70176e335f 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -302,6 +302,19 @@ config ASUS_NB_WMI
> >         If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> >         here.
> >
> > +config MERAKI_MX100
> > +     tristate "Cisco Meraki MX100 Platform Driver"
> > +     depends on GPIOLIB
> > +     depends on GPIO_ICH
> > +     depends on LEDS_CLASS
> > +     select LEDS_GPIO
> > +     help
> > +       This driver provides support for the front button and LEDs on
> > +       the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called meraki-mx100.
> > +
> >  config EEEPC_LAPTOP
> >       tristate "Eee PC Hotkey Driver"
> >       depends on ACPI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 7ee369aab10d..25c5aee1cde7 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)   += asus-nb-wmi.o
> >  obj-$(CONFIG_EEEPC_LAPTOP)   += eeepc-laptop.o
> >  obj-$(CONFIG_EEEPC_WMI)              += eeepc-wmi.o
> >
> > +# Cisco/Meraki
> > +obj-$(CONFIG_MERAKI_MX100)   += meraki-mx100.o
> > +
> >  # Dell
> >  obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)              += dell/
> >
> > diff --git a/drivers/platform/x86/meraki-mx100.c b/drivers/platform/x86/meraki-mx100.c
> > new file mode 100644
> > index 000000000000..12b17ef06d14
> > --- /dev/null
> > +++ b/drivers/platform/x86/meraki-mx100.c
> > @@ -0,0 +1,185 @@
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
> > +#define pr_fmt(fmt)  KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/dmi.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio.h>
> > +#include <linux/gpio_keys.h>
> > +#include <linux/input.h>
> > +#include <linux/kernel.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define TINK_GPIO_OFFSET     436
> > +
> > +/* LEDs */
> > +static const struct gpio_led tink_leds[] = {
> > +     {
> > +             .name = "mx100:green:internet",
> > +             .gpio = TINK_GPIO_OFFSET + 11,
> > +             .active_low = 1,
>
> Unfortunately you cannot count on gpio-numbers on x86 devices being stable,
> so you need to drop all the .gpio = *and active_low* settings here,
> instead you need to create + add a gpiod lookup table looking like this:
>
> static struct gpiod_lookup_table gpios_led_table = {
>         .dev_id = "leds-gpio",
>         .table = {
>                 GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 11,
>                                 NULL, 0, GPIO_ACTIVE_LOW),
>                 GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 18,
>                                 NULL, 1, GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 20,
>                                 NULL, 2, GPIO_ACTIVE_HIGH),
>
> Note the first set of numbers are the pin numbers on the
> TINK gpiochip.
>
> The second set of numbers simply goes 0,1,2,3,4...
> and basically gives the indexes into your tink_leds[] array
> for which this lookup is.
>
> You can use e.g. gpiodetect from libgpiod-utils to find the
> <TINK-gpiochip-dev_id>.
>
> (I assume the GPIO_ACTIVE_FOO field explains itself)
>
> Once you've created the table don't forget to register it
> with gpiod_add_lookup_table() and unregister it again
> on module remove.
>
> > +             .default_trigger = "default-on",
> > +     },
> > +     {
> > +             .name = "mx100:green:lan2",
> > +             .gpio = TINK_GPIO_OFFSET + 18,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan3",
> > +             .gpio = TINK_GPIO_OFFSET + 20,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan4",
> > +             .gpio = TINK_GPIO_OFFSET + 22,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan5",
> > +             .gpio = TINK_GPIO_OFFSET + 23,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan6",
> > +             .gpio = TINK_GPIO_OFFSET + 32,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan7",
> > +             .gpio = TINK_GPIO_OFFSET + 34,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan8",
> > +             .gpio = TINK_GPIO_OFFSET + 35,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan9",
> > +             .gpio = TINK_GPIO_OFFSET + 36,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan10",
> > +             .gpio = TINK_GPIO_OFFSET + 37,
> > +     },
> > +     {
> > +             .name = "mx100:green:lan11",
> > +             .gpio = TINK_GPIO_OFFSET + 48,
> > +     },
> > +     {
> > +             .name = "mx100:green:ha",
> > +             .gpio = TINK_GPIO_OFFSET + 16,
> > +             .active_low = 1,
> > +     },
> > +     {
> > +             .name = "mx100:orange:ha",
> > +             .gpio = TINK_GPIO_OFFSET + 7,
> > +             .active_low = 1,
> > +     },
> > +     {
> > +             .name = "mx100:green:usb",
> > +             .gpio = TINK_GPIO_OFFSET + 21,
> > +             .active_low = 1,
> > +     },
> > +     {
> > +             .name = "mx100:orange:usb",
> > +             .gpio = TINK_GPIO_OFFSET + 19,
> > +             .active_low = 1,
> > +     },
> > +};
> > +
> > +static const struct gpio_led_platform_data tink_leds_pdata = {
> > +     .num_leds       = ARRAY_SIZE(tink_leds),
> > +     .leds           = tink_leds,
> > +};
> > +
> > +/* Reset Button */
> > +static struct gpio_keys_button tink_buttons[] = {
> > +     {
> > +             .desc                   = "Reset",
> > +             .type                   = EV_KEY,
> > +             .code                   = KEY_RESTART,
> > +             .gpio                   = TINK_GPIO_OFFSET + 60,
> > +             .active_low             = 1,
>
> Same remark wrt hardcoding GPIO numbers. Note this needs a separate
> lookup table, see the pcengines-apuv2.c code.
>
> > +             .debounce_interval      = 100,
> > +     },
> > +};
> > +
> > +static const struct gpio_keys_platform_data tink_buttons_pdata = {
> > +     .buttons        = tink_buttons,
> > +     .nbuttons       = ARRAY_SIZE(tink_buttons),
> > +     .poll_interval  = 20,
> > +     .rep            = 0,
> > +     .name           = "mx100-keys",
> > +};
> > +
> > +/* Board setup */
> > +
> > +static struct platform_device *tink_leds_pdev;
> > +static struct platform_device *tink_keys_pdev;
> > +
> > +static struct platform_device * __init tink_create_dev(
> > +     const char *name,
> > +     const void *pdata,
> > +     size_t sz)
> > +{
> > +     struct platform_device *pdev;
> > +
> > +     pdev = platform_device_register_data(NULL,
> > +             name,
> > +             PLATFORM_DEVID_NONE,
> > +             pdata,
> > +             sz);
> > +
> > +     if (IS_ERR(pdev))
> > +             pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> > +
> > +     return pdev;
> > +}
> > +
>
> You probably want to put the following here:
>
> static const struct dmi_system_id tink_systems[] __initconst = {
>         {
>                 .matches = {
>                         DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
>                         DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
>                 },
>         },
>         {} /* Terminating entry */
> };
> MODULE_DEVICE_TABLE(dmi, tink_systems);
>
> The MODULE_DEVICE_TABLE line will cause the module to get auto-loaded
> on the systems in the table.
>
> > +static int __init tink_board_init(void)
> > +{
> > +     if (!dmi_match(DMI_SYS_VENDOR, "Cisco") || !dmi_match(DMI_PRODUCT_NAME, "MX100-HW")) {
> > +             return -ENODEV;
> > +     }
>
> And then replace this with:
>
>         if (!dmi_first_match(tink_systems))
>                 return -ENODEV;
>
> In case someone tries to load the module manually.
>
> > +
> > +     /* We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> > +      * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> > +      * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> > +      */
> > +     outl(inl(0x530) | BIT(28), 0x530);
> > +
> > +     tink_leds_pdev = tink_create_dev(
> > +             "leds-gpio",
> > +             &tink_leds_pdata,
> > +             sizeof(tink_leds_pdata));
> > +
> > +     tink_keys_pdev = tink_create_dev(
> > +             "gpio-keys-polled",
> > +             &tink_buttons_pdata,
> > +             sizeof(tink_buttons_pdata));
> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit tink_board_exit(void)
> > +{
> > +     platform_device_unregister(tink_keys_pdev);
> > +     platform_device_unregister(tink_leds_pdev);
> > +}
> > +
> > +module_init(tink_board_init);
> > +module_exit(tink_board_exit);
> > +
> > +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> > +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:meraki-mx100");
>
> > +MODULE_SOFTDEP("pre: platform:gpio_ich platform:leds-gpio platform:gpio_keys_polled");
>
> This softdep line should not be necessary (once you use GPIO lookups) the creation
> of the platform devs will automatically cause the leds-gpio resp gpio_keyS_polled
> modules to get loaded.
>
> Other then the remarks above this looks good to me.
>
> Regards,
>
> Hans
>

Hello Hans,

Thank you so much for the feedback. I'll try to get a version 2 of
this patch out sometime in the next week or so. I appreciate you
taking the time to review this for me.

Regards,
Chris Blake
