Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923F63E2BEE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 15:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhHFNvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 09:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43690 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231602AbhHFNvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 09:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628257889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nw68kDHTcATm8sB9PesF3bShhnQk2ljyyEgouTwbuoo=;
        b=D3SDW6LAZMNdyW+ut5I8FtxfZ4QIabDSruesBaA4fcaJ2c5dOltW2igtlW52K9+nPORAN9
        tX7PAkJYqS3om05lW5KB3SZxeL0OXRlQnUGhHXworHqDpIuZpee8chOEzlpoO3OSySJZfD
        XppwKB6T/kMsGhRwZYpuJCO+ivRxnKo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-s0XnHq4tNm64LO2eGpcY-A-1; Fri, 06 Aug 2021 09:51:26 -0400
X-MC-Unique: s0XnHq4tNm64LO2eGpcY-A-1
Received: by mail-ed1-f69.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so4984331edu.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nw68kDHTcATm8sB9PesF3bShhnQk2ljyyEgouTwbuoo=;
        b=GtO/z4e3GWIOFC14p9Ly5q6R7+rdGXL0/FovPuXZg7sC5++5DXJXpCtM0zIwWSj3Zx
         Oujvqp8isI6C5jFsrekzynZZTP/V8Na9NJvcwN60NrVOxI/Fdz1nKSl6jy5uqg/yJ1Wn
         ALJ9L/t5TMgN8Ey5RznwX/tWNsDvKBLz9V3b8RNm9Orq+e08+57EuhJig+Qgb+h2InwI
         raBXhIaI1kvY9J4qTy6jWurJgefQA4UWZRUUyXL40JOTcbcQp6DZu/Y/gCQMFQ52Cm2T
         2PLHN2/dD87ioiDlxFBQyltSIGhSb34D+/m8A8l+KAzWFYNElX1x1lGmO67r4/1LCJFq
         yKMA==
X-Gm-Message-State: AOAM5327Oiz6s68yFfJBudG8DakT+eGpIGds/HhhDboAIAmgyVIL/3dO
        w3YtJZQqa1butQd8b493JVNAEEfF/+o+xyLU4Zpcu+QMx8OS+oNQqIu19isqevNd7CBaQ4HKsnT
        JlX/E0eNlzMAOHwnAClwTOg==
X-Received: by 2002:aa7:c3d1:: with SMTP id l17mr13314408edr.299.1628257884836;
        Fri, 06 Aug 2021 06:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx4dMyWGtp7i3NKj4IMuXGl85by4ZX6+7Nmnwc+JH5+mXaY4AYwYzxaVjQtpomrgX4Gs4rmg==
X-Received: by 2002:aa7:c3d1:: with SMTP id l17mr13314377edr.299.1628257884643;
        Fri, 06 Aug 2021 06:51:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t15sm2885916ejf.119.2021.08.06.06.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:51:24 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Chris Blake <chrisrblake93@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <48cb89ce-bfdb-882d-1f33-d130467d4b88@redhat.com>
Date:   Fri, 6 Aug 2021 15:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806005755.2295193-1-chrisrblake93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

On 8/6/21 2:57 AM, Chris Blake wrote:
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button. Note that this patch requires
> mfd: lpc_ich: Enable GPIO driver for DH89xxCC which has been accepted
> and is currently targeted for 5.15.
> 
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> 
> Changelog:
> V2: Move to using gpiod lookup tables, misc cleanups

Thank you, I've 2 small remarks and Andy has a couple of remarks
as well. If you can do a v3 with our remarks addressed then I believe
that that v3 will be ready for merging.

> V1: Initial Patch
> 
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/meraki-mx100.c | 212 ++++++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
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
> index 000000000000..d64508aeb92c
> --- /dev/null
> +++ b/drivers/platform/x86/meraki-mx100.c
> @@ -0,0 +1,212 @@
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
> +#include <linux/gpio/machine.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define TINK_GPIO_DRIVER_NAME "gpio_ich"
> +
> +/* LEDs */
> +static const struct gpio_led tink_leds[] = {
> +	{
> +		.name = "mx100:green:internet",
> +		.default_trigger = "default-on",
> +	},
> +	{
> +		.name = "mx100:green:lan2",
> +	},
> +	{
> +		.name = "mx100:green:lan3",
> +	},
> +	{
> +		.name = "mx100:green:lan4",
> +	},
> +	{
> +		.name = "mx100:green:lan5",
> +	},
> +	{
> +		.name = "mx100:green:lan6",
> +	},
> +	{
> +		.name = "mx100:green:lan7",
> +	},
> +	{
> +		.name = "mx100:green:lan8",
> +	},
> +	{
> +		.name = "mx100:green:lan9",
> +	},
> +	{
> +		.name = "mx100:green:lan10",
> +	},
> +	{
> +		.name = "mx100:green:lan11",
> +	},
> +};
> +
> +static const struct gpio_led_platform_data tink_leds_pdata = {
> +	.num_leds	= ARRAY_SIZE(tink_leds),
> +	.leds		= tink_leds,
> +};
> +
> +static struct gpiod_lookup_table tink_leds_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 11,
> +				NULL, 0, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 18,
> +				NULL, 1, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 20,
> +				NULL, 2, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 22,
> +				NULL, 3, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 23,
> +				NULL, 4, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 32,
> +				NULL, 5, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 34,
> +				NULL, 6, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 35,
> +				NULL, 7, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 36,
> +				NULL, 8, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 37,
> +				NULL, 9, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 48,
> +				NULL, 10, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 16,
> +				NULL, 11, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 7,
> +				NULL, 12, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 21,
> +				NULL, 13, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 19,
> +				NULL, 14, GPIO_ACTIVE_LOW),

gpiod_lookup_table.table-s needed to be terminated with an
empty entry, add a line like this, like how it is done for
the dmi_system_id table:

		{} /* Terminating entry */


> +	}
> +};
> +
> +/* Reset Button */
> +static struct gpio_keys_button tink_buttons[] = {
> +	{
> +		.desc			= "Reset",
> +		.type			= EV_KEY,
> +		.code			= KEY_RESTART,
> +		.active_low             = 1,
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
> +static struct gpiod_lookup_table tink_keys_table = {
> +	.dev_id = "gpio-keys-polled",
> +	.table = {
> +		GPIO_LOOKUP_IDX(TINK_GPIO_DRIVER_NAME, 60,
> +				NULL, 0, GPIO_ACTIVE_LOW),

Idem.

> +	}
> +};
> +
> +/* Board setup */
> +
> +static const struct dmi_system_id tink_systems[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
> +		},
> +	},
> +	{} /* Terminating entry */
> +};
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
> +static int __init tink_board_init(void)
> +{
> +	if (!dmi_first_match(tink_systems))
> +                return -ENODEV;
> +
> +	/* We need to make sure that GPIO60 isn't set to native mode as is default since it's our 
> +	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +	 */
> +	outl(inl(0x530) | BIT(28), 0x530);
> +
> +	gpiod_add_lookup_table(&tink_leds_table);
> +	gpiod_add_lookup_table(&tink_keys_table);
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
> +	gpiod_remove_lookup_table(&tink_keys_table);
> +	gpiod_remove_lookup_table(&tink_leds_table);
> +}
> +
> +module_init(tink_board_init);
> +module_exit(tink_board_exit);
> +
> +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:meraki-mx100");
> +MODULE_DEVICE_TABLE(dmi, tink_systems);
> +MODULE_SOFTDEP("pre: platform:" TINK_GPIO_DRIVER_NAME);

This SOFTDEP should not be necessary, the platform devices
will be created regardless of the GPIO driver already having
loaded and if the request_gpio in the gpio_keys/_leds fails,
then it should fail with -EPROBE_DEFER and then the kernel
will retry to bind those drivers to the created platform-
devices later (until it succeeds).

So please give things a try without this line.

Regards,

Hans

