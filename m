Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2523DD420
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 12:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbhHBKnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 06:43:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25812 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233081AbhHBKnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 06:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627900994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3ZvheEvjS6H+73wk+xpTkmC52dlRSibVtlXOvDF/Ock=;
        b=Jx1NmACZBYrHpyMKSOflbvQ3QaZ5wJaA8tFDpjMqes3j9QJp42EjnVCZ3YcBq3Lwp6QZhE
        u0zqOHhaMnhjdXzUTuUsoSr649YuiS0VmE6+75da4rgLsW3rNOalBxp9wyfn/cRA8q6I3w
        cj2xVk2rBqzb2QokEqT/C3O30E0lW/0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-Lsr2xH-LO2qNCraSpICusA-1; Mon, 02 Aug 2021 06:43:13 -0400
X-MC-Unique: Lsr2xH-LO2qNCraSpICusA-1
Received: by mail-ej1-f69.google.com with SMTP id rv22-20020a17090710d6b029058c69e3adbbso4464634ejb.6
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 03:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3ZvheEvjS6H+73wk+xpTkmC52dlRSibVtlXOvDF/Ock=;
        b=quV7Rqw3PBTeP1BwhEo87/CDyciFqByRRBYUP20/VX71VkJp2Ob8D+vgASOUW04V/h
         n6uy5wYBMH9be7PPQz0J+0MUzofFyGMRLxeFsjwSS8O2TH9qp1u9H1MuluKA829kuHsQ
         0tU15Fbfvx2uBPIiNU4mPqLE/YWC2LGakZfODJuD/LrjlOaBK8Ly82+EjDkD6nZOK+yn
         WNw7KiO1KbQwS7CJnt+1X9zq69QlWylgQgslfEZqBHSVNwzlXxfwHCBHN2CWXrIUA1Ka
         y8UWut9irUxhCmNvPozMGZaC1bZblUQWaovfrrmSoKbsczAMRJjxIPOgTpdB8D7m3UhX
         Wm2g==
X-Gm-Message-State: AOAM532UogFqGu2ZHYcYdy5RQfK7ElhPGt83DE1yqEQyt2ObOxZaFjYl
        IzYrKFBZ2Rg4igIr8yQ4W4LLZvOPGOD1j+FLlY+yjxhxjwbJFKTMaFNaguPND/a7NvRQtnMtrx2
        ZDIpB8G4LBDB4ENyVHJ3+3g==
X-Received: by 2002:a17:907:1b11:: with SMTP id mp17mr14883836ejc.1.1627900992452;
        Mon, 02 Aug 2021 03:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztIXVr6dbPLncd9+EjRRTGbdqqwbxHm7bbRzSId2YDFWMTG8bDcozL3+gAhF3Tt0ujPfaKTQ==
X-Received: by 2002:a17:907:1b11:: with SMTP id mp17mr14883818ejc.1.1627900992250;
        Mon, 02 Aug 2021 03:43:12 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id e27sm4390175ejc.41.2021.08.02.03.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 03:43:11 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add meraki-mx100 platform driver
To:     Chris Blake <chrisrblake93@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com
References: <20210706184730.14951-1-chrisrblake93@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e352bafc-cf31-4cd2-31c8-3c75a96b10d5@redhat.com>
Date:   Mon, 2 Aug 2021 12:43:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706184730.14951-1-chrisrblake93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

On 7/6/21 8:47 PM, Chris Blake wrote:
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
>  	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
>  	  here.
>  
> +config MERAKI_MX100
> +	tristate "Cisco Meraki MX100 Platform Driver"
> +	depends on GPIOLIB
> +	depends on GPIO_ICH
> +	depends on LEDS_CLASS
> +	select LEDS_GPIO
> +	help
> +	  This driver provides support for the front button and LEDs on
> +	  the Cisco Meraki MX100 (Tinkerbell) 1U appliance.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called meraki-mx100.
> +
>  config EEEPC_LAPTOP
>  	tristate "Eee PC Hotkey Driver"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..25c5aee1cde7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -39,6 +39,9 @@ obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
>  obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
>  
> +# Cisco/Meraki
> +obj-$(CONFIG_MERAKI_MX100)	+= meraki-mx100.o
> +
>  # Dell
>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)		+= dell/
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
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
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
> +#define TINK_GPIO_OFFSET	436
> +
> +/* LEDs */
> +static const struct gpio_led tink_leds[] = {
> +	{
> +		.name = "mx100:green:internet", 
> +		.gpio = TINK_GPIO_OFFSET + 11,
> +		.active_low = 1,

Unfortunately you cannot count on gpio-numbers on x86 devices being stable,
so you need to drop all the .gpio = *and active_low* settings here,
instead you need to create + add a gpiod lookup table looking like this:

static struct gpiod_lookup_table gpios_led_table = {
        .dev_id = "leds-gpio",
        .table = {
                GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 11,
                                NULL, 0, GPIO_ACTIVE_LOW),
                GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 18,
                                NULL, 1, GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP_IDX("<TINK-gpiochip-dev_id>", 20,
                                NULL, 2, GPIO_ACTIVE_HIGH),

Note the first set of numbers are the pin numbers on the
TINK gpiochip.

The second set of numbers simply goes 0,1,2,3,4...
and basically gives the indexes into your tink_leds[] array
for which this lookup is.

You can use e.g. gpiodetect from libgpiod-utils to find the
<TINK-gpiochip-dev_id>.

(I assume the GPIO_ACTIVE_FOO field explains itself)

Once you've created the table don't forget to register it
with gpiod_add_lookup_table() and unregister it again
on module remove.

> +		.default_trigger = "default-on",
> +	},
> +	{
> +		.name = "mx100:green:lan2",
> +		.gpio = TINK_GPIO_OFFSET + 18,
> +	},
> +	{
> +		.name = "mx100:green:lan3",
> +		.gpio = TINK_GPIO_OFFSET + 20,
> +	},
> +	{
> +		.name = "mx100:green:lan4",
> +		.gpio = TINK_GPIO_OFFSET + 22,
> +	},
> +	{
> +		.name = "mx100:green:lan5",
> +		.gpio = TINK_GPIO_OFFSET + 23,
> +	},
> +	{
> +		.name = "mx100:green:lan6",
> +		.gpio = TINK_GPIO_OFFSET + 32,
> +	},
> +	{
> +		.name = "mx100:green:lan7",
> +		.gpio = TINK_GPIO_OFFSET + 34,
> +	},
> +	{
> +		.name = "mx100:green:lan8",
> +		.gpio = TINK_GPIO_OFFSET + 35,
> +	},
> +	{
> +		.name = "mx100:green:lan9",
> +		.gpio = TINK_GPIO_OFFSET + 36,
> +	},
> +	{
> +		.name = "mx100:green:lan10",
> +		.gpio = TINK_GPIO_OFFSET + 37,
> +	},
> +	{
> +		.name = "mx100:green:lan11",
> +		.gpio = TINK_GPIO_OFFSET + 48,
> +	},
> +	{
> +		.name = "mx100:green:ha",
> +		.gpio = TINK_GPIO_OFFSET + 16,
> +		.active_low = 1,
> +	},
> +	{
> +		.name = "mx100:orange:ha",
> +		.gpio = TINK_GPIO_OFFSET + 7,
> +		.active_low = 1,
> +	},
> +	{
> +		.name = "mx100:green:usb",
> +		.gpio = TINK_GPIO_OFFSET + 21,
> +		.active_low = 1,
> +	},
> +	{
> +		.name = "mx100:orange:usb",
> +		.gpio = TINK_GPIO_OFFSET + 19,
> +		.active_low = 1,
> +	},
> +};
> +
> +static const struct gpio_led_platform_data tink_leds_pdata = {
> +	.num_leds	= ARRAY_SIZE(tink_leds),
> +	.leds		= tink_leds,
> +};
> +
> +/* Reset Button */
> +static struct gpio_keys_button tink_buttons[] = {
> +	{
> +		.desc			= "Reset",
> +		.type			= EV_KEY,
> +		.code			= KEY_RESTART,
> +		.gpio			= TINK_GPIO_OFFSET + 60,
> +		.active_low             = 1,

Same remark wrt hardcoding GPIO numbers. Note this needs a separate
lookup table, see the pcengines-apuv2.c code.

> +		.debounce_interval      = 100,
> +	},
> +};
> +
> +static const struct gpio_keys_platform_data tink_buttons_pdata = {
> +	.buttons	= tink_buttons,
> +	.nbuttons	= ARRAY_SIZE(tink_buttons),
> +	.poll_interval  = 20,
> +	.rep		= 0,
> +	.name		= "mx100-keys",
> +};
> +
> +/* Board setup */
> +
> +static struct platform_device *tink_leds_pdev;
> +static struct platform_device *tink_keys_pdev;
> +
> +static struct platform_device * __init tink_create_dev(
> +	const char *name,
> +	const void *pdata,
> +	size_t sz)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_data(NULL,
> +		name,
> +		PLATFORM_DEVID_NONE,
> +		pdata,
> +		sz);
> +
> +	if (IS_ERR(pdev))
> +		pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> +
> +	return pdev;
> +}
> +

You probably want to put the following here:

static const struct dmi_system_id tink_systems[] __initconst = {
	{
		.matches = {
			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
		},
	},
        {} /* Terminating entry */
};
MODULE_DEVICE_TABLE(dmi, tink_systems);

The MODULE_DEVICE_TABLE line will cause the module to get auto-loaded
on the systems in the table.

> +static int __init tink_board_init(void)
> +{
> +	if (!dmi_match(DMI_SYS_VENDOR, "Cisco") || !dmi_match(DMI_PRODUCT_NAME, "MX100-HW")) {
> +		return -ENODEV;
> +	}

And then replace this with:

	if (!dmi_first_match(tink_systems))
		return -ENODEV;

In case someone tries to load the module manually.

> +
> +	/* We need to make sure that GPIO60 isn't set to native mode as is default since it's our 
> +	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +	 */
> +	outl(inl(0x530) | BIT(28), 0x530);
> +
> +	tink_leds_pdev = tink_create_dev(
> +		"leds-gpio",
> +		&tink_leds_pdata,
> +		sizeof(tink_leds_pdata));
> +
> +	tink_keys_pdev = tink_create_dev(
> +		"gpio-keys-polled",
> +		&tink_buttons_pdata,
> +		sizeof(tink_buttons_pdata));
> +
> +	return 0;
> +}
> +
> +static void __exit tink_board_exit(void)
> +{
> +	platform_device_unregister(tink_keys_pdev);
> +	platform_device_unregister(tink_leds_pdev);
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

This softdep line should not be necessary (once you use GPIO lookups) the creation
of the platform devs will automatically cause the leds-gpio resp gpio_keyS_polled
modules to get loaded.

Other then the remarks above this looks good to me.

Regards,

Hans

