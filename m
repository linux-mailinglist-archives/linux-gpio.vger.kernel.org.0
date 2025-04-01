Return-Path: <linux-gpio+bounces-18146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36885A77A7D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 14:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524FA188EE2B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 12:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07AC202C4F;
	Tue,  1 Apr 2025 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="BI8ZYVDD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4342A94;
	Tue,  1 Apr 2025 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509762; cv=none; b=PbAexvRjWaP294M8e5iP1m0UeZixMQ02UV/awGxX2BHcXaQn+qiw3Df0qgODfKH5bWVx0TJN96hz5vXBjfegyQkZjf17YBSuSEkFOjr7+Gy3z9WOz9tOyV3Ypdlf9Nmx9UH2JrdbEPrZYCjRMg9SNvwJCthkslsoZCYLS2K4r1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509762; c=relaxed/simple;
	bh=tJ/nY5DmjGkUEyUIKawES06pKMf+xtUebkpWoQY+V7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubZD3U+Pb8lMhg2FAWOWsZ+3oYsQWb3x+ckuo+y4yfh/RszD2l4Q3oClKXJVIOXTjC6T/26K6PCjKKMbnAqNlLGLyqOM/c/LPBAXjp5TNvGK98eikKWxSu6RaQpE09idcr9whdT64ai46dfQW/ytZ5ewBKpSsF0T1Lcgtz+H2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=BI8ZYVDD; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=cpHa3hRcyYE+oveSMpWWau+9FeOL1orHAEbMAeTSCY0=; b=BI8ZYVDD+A/bplQt
	Lxzx6WknmOncFAkzbg2GZCQjMX0EAq3hUE9F4Aes1QlpQGYc2jv803aIWQnkSeu1SB4HcnYScO+yg
	vxZPEWAte1PAaam76hgaooRGKH/oYX6y6tnP4nfGIO/WmayF48Jf/Y+bbe+FDkYOV0L7ozJaO7fF4
	cxqDUiRvIoIGCHx3CjyqPfvSEXQ/zYYbs4d642O+Op3BWzlkgU8N8wRfC0Bt6yr30AMrT3jketCEJ
	sRmONLJWJkJ+tiAsl0gyRjWasE+3VPQ2kYY994EuQop1SvJlb/h7dGwe9C/0e3Ijd/HG6FuSc006A
	tJHj4XYIBZWId1R7kw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tzZpw-008Jmf-0j;
	Tue, 01 Apr 2025 11:31:20 +0000
Date: Tue, 1 Apr 2025 11:31:20 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com,
	sre@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, danielt@kernel.org,
	jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
	brgl@bgdev.pl, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] Input: pcf50633-input - Remove
Message-ID: <Z-vOiJ9tdovS-Guq@gallifrey>
References: <20250311014959.743322-1-linux@treblig.org>
 <20250311014959.743322-5-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250311014959.743322-5-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:28:53 up 327 days, 22:42,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Has anyone got this input patch lined up?
I think most of the other parts are there; the rtc I see in next.
Then once those go there is a core.h that needs nuking.

Dave

> ---
>  drivers/input/misc/Kconfig          |   7 --
>  drivers/input/misc/Makefile         |   1 -
>  drivers/input/misc/pcf50633-input.c | 113 ----------------------------
>  3 files changed, 121 deletions(-)
>  delete mode 100644 drivers/input/misc/pcf50633-input.c
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 13d135257e06..62819144bd8c 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -584,13 +584,6 @@ config INPUT_PALMAS_PWRBUTTON
>  	  To compile this driver as a module, choose M here. The module will
>  	  be called palmas_pwrbutton.
>  
> -config INPUT_PCF50633_PMU
> -	tristate "PCF50633 PMU events"
> -	depends on MFD_PCF50633
> -	help
> -	 Say Y to include support for delivering  PMU events via  input
> -	 layer on NXP PCF50633.
> -
>  config INPUT_PCF8574
>  	tristate "PCF8574 Keypad input device"
>  	depends on I2C
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 6d91804d0a6f..d468c8140b93 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -59,7 +59,6 @@ obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
>  obj-$(CONFIG_INPUT_MMA8450)		+= mma8450.o
>  obj-$(CONFIG_INPUT_PALMAS_PWRBUTTON)	+= palmas-pwrbutton.o
>  obj-$(CONFIG_INPUT_PCAP)		+= pcap_keys.o
> -obj-$(CONFIG_INPUT_PCF50633_PMU)	+= pcf50633-input.o
>  obj-$(CONFIG_INPUT_PCF8574)		+= pcf8574_keypad.o
>  obj-$(CONFIG_INPUT_PCSPKR)		+= pcspkr.o
>  obj-$(CONFIG_INPUT_PM8941_PWRKEY)	+= pm8941-pwrkey.o
> diff --git a/drivers/input/misc/pcf50633-input.c b/drivers/input/misc/pcf50633-input.c
> deleted file mode 100644
> index 6d046e236ba6..000000000000
> --- a/drivers/input/misc/pcf50633-input.c
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/* NXP PCF50633 Input Driver
> - *
> - * (C) 2006-2008 by Openmoko, Inc.
> - * Author: Balaji Rao <balajirrao@openmoko.org>
> - * All rights reserved.
> - *
> - * Broken down from monstrous PCF50633 driver mainly by
> - * Harald Welte, Andy Green and Werner Almesberger
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/device.h>
> -#include <linux/platform_device.h>
> -#include <linux/input.h>
> -#include <linux/slab.h>
> -
> -#include <linux/mfd/pcf50633/core.h>
> -
> -#define PCF50633_OOCSTAT_ONKEY	0x01
> -#define PCF50633_REG_OOCSTAT	0x12
> -#define PCF50633_REG_OOCMODE	0x10
> -
> -struct pcf50633_input {
> -	struct pcf50633 *pcf;
> -	struct input_dev *input_dev;
> -};
> -
> -static void
> -pcf50633_input_irq(int irq, void *data)
> -{
> -	struct pcf50633_input *input;
> -	int onkey_released;
> -
> -	input = data;
> -
> -	/* We report only one event depending on the key press status */
> -	onkey_released = pcf50633_reg_read(input->pcf, PCF50633_REG_OOCSTAT)
> -						& PCF50633_OOCSTAT_ONKEY;
> -
> -	if (irq == PCF50633_IRQ_ONKEYF && !onkey_released)
> -		input_report_key(input->input_dev, KEY_POWER, 1);
> -	else if (irq == PCF50633_IRQ_ONKEYR && onkey_released)
> -		input_report_key(input->input_dev, KEY_POWER, 0);
> -
> -	input_sync(input->input_dev);
> -}
> -
> -static int pcf50633_input_probe(struct platform_device *pdev)
> -{
> -	struct pcf50633_input *input;
> -	struct input_dev *input_dev;
> -	int ret;
> -
> -
> -	input = kzalloc(sizeof(*input), GFP_KERNEL);
> -	if (!input)
> -		return -ENOMEM;
> -
> -	input_dev = input_allocate_device();
> -	if (!input_dev) {
> -		kfree(input);
> -		return -ENOMEM;
> -	}
> -
> -	platform_set_drvdata(pdev, input);
> -	input->pcf = dev_to_pcf50633(pdev->dev.parent);
> -	input->input_dev = input_dev;
> -
> -	input_dev->name = "PCF50633 PMU events";
> -	input_dev->id.bustype = BUS_I2C;
> -	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_PWR);
> -	set_bit(KEY_POWER, input_dev->keybit);
> -
> -	ret = input_register_device(input_dev);
> -	if (ret) {
> -		input_free_device(input_dev);
> -		kfree(input);
> -		return ret;
> -	}
> -	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYR,
> -				pcf50633_input_irq, input);
> -	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYF,
> -				pcf50633_input_irq, input);
> -
> -	return 0;
> -}
> -
> -static void pcf50633_input_remove(struct platform_device *pdev)
> -{
> -	struct pcf50633_input *input  = platform_get_drvdata(pdev);
> -
> -	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYR);
> -	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYF);
> -
> -	input_unregister_device(input->input_dev);
> -	kfree(input);
> -}
> -
> -static struct platform_driver pcf50633_input_driver = {
> -	.driver = {
> -		.name = "pcf50633-input",
> -	},
> -	.probe = pcf50633_input_probe,
> -	.remove = pcf50633_input_remove,
> -};
> -module_platform_driver(pcf50633_input_driver);
> -
> -MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
> -MODULE_DESCRIPTION("PCF50633 input driver");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:pcf50633-input");
> -- 
> 2.48.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

