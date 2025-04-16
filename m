Return-Path: <linux-gpio+bounces-18917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932BA8B284
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 09:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6981900DC6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 07:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4372206BD;
	Wed, 16 Apr 2025 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaiV2Fgl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE31535D8;
	Wed, 16 Apr 2025 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789564; cv=none; b=kCRQevdosTkioW3IXBxJ+iVpkTYQ4tN1PhG8zeGeFeE/mC5xRICs7fANkOhOkJs1zy6WejuT1T+sy1qVWkhJfhNMQsdiG802iNmvNRxpLFHEeydzSB/XClvC0DUQQgHXr/7dPAMfSO7AEuZPxfnhsb3Pc1VXAfghndLOH0ZsOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789564; c=relaxed/simple;
	bh=RuLI89G/q8WF22X0RbBSM1kbJ+40i2ORYQM5YQqYAzI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YuUF9Xocm88LJ3bCq/ICd481IO5DUHr9ZPTlLPbk7j/C7EZTYmGMNfFgI0K+1uWZ05iCIJanJYLksMJ8eeAq4gPclsWy1nQQSTNTd069x2RNTpA3vmpgkBfvVxx9YywGriwIgcU3D0/3OQzriFYmzt9raESu49TrhR4ZmRkJaeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaiV2Fgl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744789562; x=1776325562;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RuLI89G/q8WF22X0RbBSM1kbJ+40i2ORYQM5YQqYAzI=;
  b=DaiV2FglL0/u0utldvImr3L67/4jVW70+xsNuOF+ItLQLnadPP6SgZHe
   IagmMo47dOQIOaQ7Wxqd7mAoo2IpzsUYv8ZMlz2djY/fe3B8KSYaQ69Xk
   PGtRxeCRl1ZwBZJez3j0i342V041Xg0bx+Ny6BMnqjUo9bbkRmG5YRINa
   6wKSUQO9wNNtsejAb/pJ1UJgRkY0obOWh6coKfaRNIquLtGokk1u5tF7j
   lwxP/viH545pHvXT7k61C6hasTIvEAjDN2k5d7ueLMq+n+PL4jA83RzjU
   5vDJbc6Vc+3SCy2IOv4Rv7/gYpeBPTpFbo9kLOYrxgOpmG9spGyyA7VWG
   A==;
X-CSE-ConnectionGUID: X8DTcYxERuS6/1Sj49y4cw==
X-CSE-MsgGUID: bfeqPvnnRqufRWzViiS6sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="68813494"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="68813494"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:46:01 -0700
X-CSE-ConnectionGUID: /7rYNyiTSBOOrPKKKeqC5g==
X-CSE-MsgGUID: 4LsHH130T+yXensmxxQ/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="134460509"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.243])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:45:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Apr 2025 10:45:04 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Hans de Goede <hdegoede@redhat.com>, linus.walleij@linaro.org, 
    brgl@bgdev.pl, wim@linux-watchdog.org, linux@roeck-us.net, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
    jay.chen@canonical.com
Subject: Re: [PATCH v4] platform/x86: portwell-ec: Add GPIO and WDT driver
 for Portwell EC
In-Reply-To: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
Message-ID: <35bcd82d-c417-0b93-f2e7-03fa8fe1e0c4@linux.intel.com>
References: <3096e0c7-f215-4a51-9a84-b2b64514ffd6@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Yen-Chi Huang wrote:

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
> 
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
> 
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
> 
> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
> ---
> V3->V4:
>   - Added select WATCHDOG_CORE in Kconfig
>   - Removed redundant retry logic from pwec_wdt_trigger()
>   - Added pwec_wdt_write_timeout() helper
>   - Handled second wraparound when reading min/sec in get_timeleft()
>   - Reworked DMI check and force parameter logic
>   - Fixed error handling for GPIO and platform device registration
>   - Fixed typos, log messages, and formatting issues
>   
> V2->V3:
>   - Reworked based on review from Bartosz Golaszewski
>   - Changed to use platform_driver and platform_device
>   - Updated GPIO to use .set_rv() instead of .set()
>   - Used devm_ helpers for request_region, GPIO and watchdog registration
> 
> V1->V2:
>   - Addressed review comments from Ilpo Jarvinen
>   - Add DMI system check to avoid running on unsupported platforms
>   - Add 'force' module parameter to override DMI matching
>   - Use request_region() to claim I/O port access
>   - Extend WDT timeout handling to use both minute and second registers
>   - Increase WDT max timeout from 255s to 15300s
>   - Use named defines for WDT enable/disable
>   - Remove dummy pr_info() messages
>   - Fix several coding style issues (comments, alignment, spacing)
> 
> ---
>  MAINTAINERS                        |   6 +
>  drivers/platform/x86/Kconfig       |  15 ++
>  drivers/platform/x86/Makefile      |   3 +
>  drivers/platform/x86/portwell-ec.c | 298 +++++++++++++++++++++++++++++
>  4 files changed, 322 insertions(+)
>  create mode 100644 drivers/platform/x86/portwell-ec.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5dfb9186962..c52f819786dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
>  F:	kernel/time/posix-*
>  F:	kernel/time/namespace.c
>  
> +PORTWELL EC DRIVER
> +M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/portwell-ec.c
> +
>  POWER MANAGEMENT CORE
>  M:	"Rafael J. Wysocki" <rafael@kernel.org>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..3ceeb70897eb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -779,6 +779,21 @@ config PCENGINES_APU2
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pcengines-apuv2.
>  
> +config PORTWELL_EC
> +	tristate "Portwell Embedded Controller driver"
> +	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
> +	select WATCHDOG_CORE
> +	help
> +	  This driver provides support for the GPIO pins and watchdog timer
> +	  embedded in Portwell's EC.
> +
> +	  Theoretically, this driver should work on multiple Portwell platforms,
> +	  but it has only been tested on the Portwell NANO-6064 board.
> +	  If you encounter any issues on other boards, please report them.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called portwell-ec.
> +
>  config BARCO_P50_GPIO
>  	tristate "Barco P50 GPIO driver for identify LED/button"
>  	depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 650dfbebb6c8..83dd82e04457 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>  # PC Engines
>  obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>  
> +# Portwell
> +obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
> +
>  # Barco
>  obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
>  
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> new file mode 100644
> index 000000000000..a16dcd96eab2
> --- /dev/null
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * portwell-ec.c: Portwell embedded controller driver.
> + *
> + * Tested on:
> + *  - Portwell NANO-6064
> + *
> + * This driver provides support for GPIO and Watchdog Timer
> + * functionalities of the Portwell boards with ITE embedded controller (EC).
> + * The EC is accessed through I/O ports and provides:
> + *  - 8 GPIO pins for control and monitoring
> + *  - Hardware watchdog with 1-15300 second timeout range
> + *
> + * It integrates with the Linux GPIO and Watchdog subsystems, allowing
> + * userspace interaction with EC GPIO pins and watchdog control,
> + * ensuring system stability and configurability.
> + *
> + * (C) Copyright 2025 Portwell, Inc.
> + * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/sizes.h>
> +#include <linux/string.h>
> +#include <linux/watchdog.h>
> +
> +#define PORTWELL_EC_IOSPACE              0xe300
> +#define PORTWELL_EC_IOSPACE_LEN          SZ_256
> +
> +#define PORTWELL_GPIO_PINS               8
> +#define PORTWELL_GPIO_DIR_REG            0x2b
> +#define PORTWELL_GPIO_VAL_REG            0x2c
> +
> +#define PORTWELL_WDT_EC_CONFIG_ADDR      0x06
> +#define PORTWELL_WDT_CONFIG_ENABLE       0x1
> +#define PORTWELL_WDT_CONFIG_DISABLE      0x0
> +#define PORTWELL_WDT_EC_COUNT_MIN_ADDR   0x07
> +#define PORTWELL_WDT_EC_COUNT_SEC_ADDR   0x08
> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND (255 * 60)
> +
> +#define PORTWELL_EC_FW_VENDOR_ADDRESS    0x4d
> +#define PORTWELL_EC_FW_VENDOR_LENGTH     3
> +#define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
> +
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
> +
> +static const struct dmi_system_id pwec_dmi_table[] = {
> +	{
> +		.ident = "NANO-6064 series",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
> +
> +/* Functions for access EC via IOSPACE */
> +
> +static void pwec_write(u8 index, u8 data)
> +{
> +	outb(data, PORTWELL_EC_IOSPACE + index);
> +}
> +
> +static u8 pwec_read(u8 address)
> +{
> +	return inb(PORTWELL_EC_IOSPACE + address);
> +}
> +
> +/* GPIO functions */
> +
> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
> +}
> +
> +static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
> +{
> +	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
> +
> +	if (val)
> +		tmp |= (1 << offset);
> +	else
> +		tmp &= ~(1 << offset);
> +	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> +
> +	return 0;
> +}
> +
> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
> +
> +	if (direction)
> +		return GPIO_LINE_DIRECTION_IN;
> +	else
> +		return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +/*
> + * Changing direction causes issues on some boards,
> + * so direction_input and direction_output are disabled for now.
> + */
> +
> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static struct gpio_chip pwec_gpio_chip = {
> +	.label = "portwell-ec-gpio",
> +	.get_direction = pwec_gpio_get_direction,
> +	.direction_input = pwec_gpio_direction_input,
> +	.direction_output = pwec_gpio_direction_output,
> +	.get = pwec_gpio_get,
> +	.set_rv = pwec_gpio_set_rv,
> +	.base = -1,
> +	.ngpio = PORTWELL_GPIO_PINS,
> +};
> +
> +/* Watchdog functions */
> +
> +static void pwec_wdt_write_timeout(unsigned int timeout)
> +{
> +	pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, timeout / 60);
> +	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, timeout % 60);
> +}
> +
> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
> +{
> +	pwec_wdt_write_timeout(wdd->timeout);
> +	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int pwec_wdt_start(struct watchdog_device *wdd)
> +{
> +	return pwec_wdt_trigger(wdd);
> +}
> +
> +static int pwec_wdt_stop(struct watchdog_device *wdd)
> +{
> +	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_DISABLE);
> +	return 0;
> +}
> +
> +static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
> +{
> +	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
> +		return -EINVAL;
> +
> +	wdd->timeout = timeout;
> +	pwec_wdt_write_timeout(wdd->timeout);
> +
> +	return 0;
> +}
> +
> +/* Ensure consistent min/sec read in case of second rollover. */
> +static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
> +{
> +	u8 min, sec1, sec2;
> +
> +	sec1 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);

This is not a safe way to do rollover correction. Lets say rollover 
happens at this point.

> +	min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
> +	sec2 = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
> +
> +	if (sec2 > sec1) {
> +		min--;

...This is subtracting from the post-rollover value.

This is roughly how drivers/clocksource/ drivers handle rollovers:

	min = readmin();
	do {
		old_min = min;
		sec = readsec();
		min = readmin();
	} while (min != old_min);

> +		sec1 = sec2;
> +	}
> +
> +	return min * 60 + sec1;
> +}
> +
> +static const struct watchdog_ops pwec_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = pwec_wdt_start,
> +	.stop = pwec_wdt_stop,
> +	.ping = pwec_wdt_trigger,
> +	.set_timeout = pwec_wdt_set_timeout,
> +	.get_timeleft = pwec_wdt_get_timeleft,
> +};
> +
> +static struct watchdog_device ec_wdt_dev = {
> +	.info = &(struct watchdog_info){
> +		.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +		.identity = "Portwell EC watchdog",
> +	},
> +	.ops = &pwec_wdt_ops,
> +	.timeout = 60,
> +	.min_timeout = 1,
> +	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
> +};
> +
> +static int pwec_firmware_vendor_check(void)
> +{
> +	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
> +	u8 i;
> +
> +	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
> +		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS + i);
> +	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
> +
> +	return (!strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf)) ? 0 : -ENODEV;

Those parenthesis are unnecessary.

> +}
> +
> +static int pwec_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!devm_request_region(&pdev->dev, PORTWELL_EC_IOSPACE,
> +				PORTWELL_EC_IOSPACE_LEN, dev_name(&pdev->dev))) {
> +		dev_err(&pdev->dev, "I/O region 0xE300-0xE3FF busy\n");
> +		return -EBUSY;
> +	}
> +
> +	ret = pwec_firmware_vendor_check();
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, &pwec_gpio_chip, NULL);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register Portwell EC GPIO\n");
> +		return ret;
> +	}
> +
> +	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pwec_driver = {
> +	.driver = {
> +		.name = "portwell-ec",
> +	},
> +	.probe = pwec_probe

Please include the comma to any entry that is not a terminator entry to 
make diffs cleaner if another member is added here later.

> +};
> +
> +static struct platform_device *pwec_dev;
> +
> +static int __init pwec_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(pwec_dmi_table)) {
> +		if (!force)
> +			return -ENODEV;
> +		pr_warn("force load portwell-ec without DMI check\n");
> +	}
> +
> +	ret = platform_driver_register(&pwec_driver);
> +	if (ret)
> +		return ret;
> +
> +	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
> +	if (IS_ERR(pwec_dev)) {
> +		platform_driver_unregister(&pwec_driver);
> +		return PTR_ERR(pwec_dev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit pwec_exit(void)
> +{
> +	if (pwec_dev)

How can pmec_dev be NULL if init always sets it or returns error?

> +		platform_device_unregister(pwec_dev);
> +	platform_driver_unregister(&pwec_driver);
> +}
> +
> +module_init(pwec_init);
> +module_exit(pwec_exit);
> +
> +MODULE_AUTHOR("Yen-Chi Huang <jesse.huang@portwell.com.tw>");
> +MODULE_DESCRIPTION("Portwell EC Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.


