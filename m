Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A473E5E2C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 16:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241332AbhHJOnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 10:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241168AbhHJOnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Aug 2021 10:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628606563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Dc26PGvhWfJCbpEYmmOqvpg1pULUQMdUnO3A+JmJuk=;
        b=dw8R0GhWcyq0uVRbHtufCjmYIuP9nn/Ki2CHDSERFOwljvwPmMyeC30+vTpUVAzNvkMe0h
        3DgKcwHy83VCm30u0Esn/rGyvDRhmONl3Cw0rGKnmGP/JLO2piZqNm6oqOUYz7T/9PNrLf
        y+6isiYCYP5epjvsmi7a0NKi7RH80Q4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-bwxNHBSTNQ2UT4UfU2Fpqw-1; Tue, 10 Aug 2021 10:42:42 -0400
X-MC-Unique: bwxNHBSTNQ2UT4UfU2Fpqw-1
Received: by mail-ej1-f72.google.com with SMTP id ci25-20020a1709072679b029058e79f6c38aso5673117ejc.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Dc26PGvhWfJCbpEYmmOqvpg1pULUQMdUnO3A+JmJuk=;
        b=pToxfmO9X66enLSlVI8Dpccn7WHagI0QVmrMqVcIQV3BhufVYtyGlLV3MsOrPBTwA0
         HSF5BeTJSUNma/L+OVm1LdgT/PCv/MMKgo3Nbjb7vx3l5dJYW3yMCcv1LfE13FxPWIes
         EMUjulfTV6vqCPtCxmqkc406I76D5yKXFFW6Dk4elB3sbj0L8tEEpW4t9vPUlqq+G1vh
         AxMcB7heHzugvATWEJvqDux08KzIiYYLFZkJesEwDHxrIrkvufmpXKXLAov0GoMJKb+S
         83g4fJ/eDZsjWImsapGNsljRKVUBogX0H/yc6yMCa2kRjRIit+nQ0EUOGHlkAcrfIRyf
         mO6g==
X-Gm-Message-State: AOAM530nAo5mstAixpEltW3brAWgUiJJhD3hgDYabKRtkmw9HqNmL2Pr
        bIzOiBO/anXLwWQpFiEapCBRogO0gYPAxEXEyIcglP4VNb8ZarH8D4IYSg91rfy80piIbXaCqv4
        PltJsypKuiaQLnVKcsWFY5Q==
X-Received: by 2002:a17:906:1784:: with SMTP id t4mr20330940eje.445.1628606561124;
        Tue, 10 Aug 2021 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOCYJLlnR5LAEZ34Aiz0Xhgni3OxEGPFJCeIgt08sVruHV7L2EXNi1MUKP9e3xd3cVhZ/cag==
X-Received: by 2002:a17:906:1784:: with SMTP id t4mr20330912eje.445.1628606560895;
        Tue, 10 Aug 2021 07:42:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hb7sm6887368ejc.33.2021.08.10.07.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 07:42:40 -0700 (PDT)
Subject: Re: [PATCH v4] platform/x86: add meraki-mx100 platform driver
To:     Chris Blake <chrisrblake93@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        chunkeey@gmail.com, andy.shevchenko@gmail.com
References: <20210810004021.2538308-1-chrisrblake93@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9efa5687-f35c-bfcc-43e9-58becbb69d68@redhat.com>
Date:   Tue, 10 Aug 2021 16:42:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810004021.2538308-1-chrisrblake93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/10/21 2:40 AM, Chris Blake wrote:
> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
> network appliance. This sets up the network LEDs and Reset
> button.
> 
> Depends-on: ef0eea5b151ae ("mfd: lpc_ich: Enable GPIO driver for DH89xxCC")
> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> 
> Changelog:
> v4: Added missing LEDs, better error handling on pdev register

Unfortunately there is an error in the better error handling,
see comments inline. Note for me this gives a compiler warning,
next time please check for compiler warnings.

This is trivial to fix though and everything else looks good,
so I've fixed this locally and added the patch to my review-hans
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.



> V3: Additional cleanups, formatting changes
> V2: Move to using gpiod lookup tables, misc cleanups
> V1: Initial Patch
> 
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/meraki-mx100.c | 230 ++++++++++++++++++++++++++++
>  3 files changed, 246 insertions(+)
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
> index 000000000000..1235529483cb
> --- /dev/null
> +++ b/drivers/platform/x86/meraki-mx100.c
> @@ -0,0 +1,230 @@
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
> +#include <linux/gpio_keys.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/input.h>
> +#include <linux/io.h>
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
> +	{
> +		.name = "mx100:green:ha",
> +	},
> +	{
> +		.name = "mx100:orange:ha",
> +	},
> +	{
> +		.name = "mx100:green:usb",
> +	},
> +	{
> +		.name = "mx100:orange:usb",
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
> +		{} /* Terminating entry */
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
> +		{} /* Terminating entry */
> +	}
> +};
> +
> +/* Board setup */
> +static const struct dmi_system_id tink_systems[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
> +		},
> +	},
> +	{} /* Terminating entry */
> +};
> +MODULE_DEVICE_TABLE(dmi, tink_systems);
> +
> +static struct platform_device *tink_leds_pdev;
> +static struct platform_device *tink_keys_pdev;
> +
> +static struct platform_device * __init tink_create_dev(
> +	const char *name, const void *pdata, size_t sz)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_data(NULL,
> +		name, PLATFORM_DEVID_NONE, pdata, sz);
> +	if (IS_ERR(pdev))
> +		pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
> +
> +	return pdev;
> +}
> +
> +static int __init tink_board_init(void)
> +{
> +	int ret = 0;
> +
> +	if (!dmi_first_match(tink_systems))
> +		return -ENODEV;
> +
> +	/*
> +	 * We need to make sure that GPIO60 isn't set to native mode as is default since it's our
> +	 * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
> +	 * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
> +	 */
> +	outl(inl(0x530) | BIT(28), 0x530);
> +
> +	gpiod_add_lookup_table(&tink_leds_table);
> +	gpiod_add_lookup_table(&tink_keys_table);
> +
> +	tink_leds_pdev = tink_create_dev("leds-gpio",
> +		&tink_leds_pdata, sizeof(tink_leds_pdata));
> +	if (IS_ERR(tink_leds_pdev)) {
> +		ret = ERR_PTR(tink_leds_pdev);

This should be PTR_ERR (pointer-to-error).

> +		goto err;
> +	}
> +
> +	tink_keys_pdev = tink_create_dev("gpio-keys-polled",
> +		&tink_buttons_pdata, sizeof(tink_buttons_pdata));
> +	if (IS_ERR(tink_keys_pdev)) {
> +		ret = ERR_PTR(tink_keys_pdev);

idem.

> +		platform_device_unregister(tink_leds_pdev);
> +		goto err;
> +	}
> +
> +	return ret;

You can just use "return 0" here.

> +
> +err:
> +	gpiod_remove_lookup_table(&tink_keys_table);
> +	gpiod_remove_lookup_table(&tink_leds_table);
> +	return ret;
> +}
> +module_init(tink_board_init);
> +
> +static void __exit tink_board_exit(void)
> +{
> +	platform_device_unregister(tink_keys_pdev);
> +	platform_device_unregister(tink_leds_pdev);
> +	gpiod_remove_lookup_table(&tink_keys_table);
> +	gpiod_remove_lookup_table(&tink_leds_table);
> +}
> +module_exit(tink_board_exit);
> +
> +MODULE_AUTHOR("Chris Blake <chrisrblake93@gmail.com>");
> +MODULE_DESCRIPTION("Cisco Meraki MX100 Platform Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:meraki-mx100");
> 


Regards,

Hans

