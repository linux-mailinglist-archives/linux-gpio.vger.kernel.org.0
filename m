Return-Path: <linux-gpio+bounces-16867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86644A4AB37
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 14:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E4861712AF
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 13:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447F1D6DC5;
	Sat,  1 Mar 2025 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+kBdduh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159679CD;
	Sat,  1 Mar 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740835948; cv=none; b=XGJWoBgXYPdgc0mVQS/f9dVsmVihaajahpZk2svZaMfio2H5TcAnZnAGs9ZKM4FntvcyX2k5ydqypCoj/n7qr/aqzfDxGg78t5GTx7HrFp5qbeXSs3U0K8XdYVjfYDLUw/92FdzcBRNlrebf2OTNPbt3SHSt6hHUpaC5JK0p9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740835948; c=relaxed/simple;
	bh=a8sSWALZJp0voKvpOq/O9Tg6TzzuHl7HNst/Ok4tmD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qI9Uasbkl+BMMFl9dHQfCWN34N7I4mSYKlM4/XgEIGwKqCw2GN3HHON+/pvW5kyZsRtBTwa2i1O39fy9GzMdD53wj0LnVuGiCmzaLiNPM9TBFY3qO9KZOgsMRscKCmab1JWAKYhUb8VHRDRqTIfkZnLkWT5pa9z/VOgCRPPazr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+kBdduh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A047AC4CEDD;
	Sat,  1 Mar 2025 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740835947;
	bh=a8sSWALZJp0voKvpOq/O9Tg6TzzuHl7HNst/Ok4tmD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+kBdduhw94SUPEGOTGTnYvs/Hz0cvWr7sVxVlzJVIgLo4+FL4xa0jcNnoCX0aV1T
	 qjARMMJmmq5zTWOo2+HWFLVrI1E8wukPaX3FlfzghLwM69ulEny4lVLWK8sPZV7bFB
	 KYmGbodjlDYounEPQB7DuNVharEMmb1IEfAviGdnEVPu0ezWZWYcrmNmIUFbMo6DTe
	 7gOEQfHgWN2jpad20+IzSkHLM409R4z8u5eFp3jcWNhp7L5+OFsk+WvIWLudhs5ySc
	 xKL4f0DgCYb6Tal4n4+KTVd4UuBVC4uG37yNamgx6+Imuhkr1oJxboIFAx37LOI0JF
	 pjvnXibmN7gRA==
Message-ID: <a2aceff9-5b44-405c-814a-0ad71da28168@kernel.org>
Date: Sat, 1 Mar 2025 14:32:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: amd: isp411: Add amdisp GPIO pinctrl
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com
References: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250228165749.3476210-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/02/2025 17:57, Pratap Nirujogi wrote:
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index fba1c56624c0..ac27e88677d1 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
>  obj-$(CONFIG_OF)		+= devicetree.o
>  
>  obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
> +obj-$(CONFIG_PINCTRL_AMDISP)	+= pinctrl-amdisp.o
>  obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
>  obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
>  obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
> diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
> new file mode 100644
> index 000000000000..659406586cb2
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-amdisp.c
> @@ -0,0 +1,290 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.

Same problems as with rest of AMD patches.

> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Where do you use it?

> +#include <linux/platform_device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/interrupt.h>

Where do you use half of these headers?

> +#include "core.h"
> +#include "pinctrl-utils.h"
> +#include "pinctrl-amd.h"
> +#include "pinctrl-amdisp.h"
> +
> +#define DRV_NAME		"amdisp-pinctrl"
> +#define GPIO_CONTROL_PIN	4
> +#define GPIO_OFFSET_0		0x0
> +#define GPIO_OFFSET_1		0x4
> +#define GPIO_OFFSET_2		0x50

...

> +static int amdisp_gpiochip_add(struct platform_device *pdev,
> +			       struct amdisp_pinctrl *pctrl)
> +{
> +	struct gpio_chip *gc = &pctrl->gc;
> +	struct pinctrl_gpio_range *grange = &pctrl->gpio_range;
> +	int ret;
> +
> +	gc->label		= dev_name(pctrl->dev);
> +	gc->owner		= THIS_MODULE;
> +	gc->parent		= &pdev->dev;
> +	gc->names		= amdisp_range_pins_name;
> +	gc->request		= gpiochip_generic_request;
> +	gc->free		= gpiochip_generic_free;
> +	gc->get_direction	= amdisp_gpio_get_direction;
> +	gc->direction_input	= amdisp_gpio_direction_input;
> +	gc->direction_output	= amdisp_gpio_direction_output;
> +	gc->get			= amdisp_gpio_get;
> +	gc->set			= amdisp_gpio_set;
> +	gc->set_config		= amdisp_gpio_set_config;
> +	gc->base		= -1;
> +	gc->ngpio		= ARRAY_SIZE(amdisp_range_pins);
> +#if defined(CONFIG_OF_GPIO)
> +	gc->of_node		= pdev->dev.of_node;
> +	gc->of_gpio_n_cells	= 2;
> +#endif
> +
> +	grange->id		= 0;
> +	grange->pin_base	= 0;
> +	grange->base		= 0;
> +	grange->pins		= amdisp_range_pins;
> +	grange->npins		= ARRAY_SIZE(amdisp_range_pins);
> +	grange->name		= gc->label;
> +	grange->gc		= gc;
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, gc, pctrl);
> +	if (ret)
> +		return ret;
> +
> +	pinctrl_add_gpio_range(pctrl->pctrl, grange);
> +
> +	dev_info(&pdev->dev, "register amdisp gpio controller\n");

Drop

> +	return 0;
> +}
> +#endif
> +
> +static int amdisp_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct amdisp_pinctrl *pctrl;
> +	struct resource *res;
> +	int ret;
> +
> +	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	pdev->dev.init_name = DRV_NAME;
> +#ifdef CONFIG_GPIOLIB
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (IS_ERR(res))
> +		return PTR_ERR(res);
> +
> +	pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(pctrl->gpiobase))
> +		return PTR_ERR(pctrl->gpiobase);
> +#endif
> +	platform_set_drvdata(pdev, pctrl);
> +
> +	pctrl->dev = &pdev->dev;
> +	pctrl->data = &amdisp_pinctrl_data;
> +	pctrl->desc.owner = THIS_MODULE;
> +	pctrl->desc.pctlops = &amdisp_pinctrl_ops;
> +	pctrl->desc.pmxops = NULL;
> +	pctrl->desc.name = dev_name(&pdev->dev);
> +	pctrl->desc.pins = pctrl->data->pins;
> +	pctrl->desc.npins = pctrl->data->npins;
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
> +					     pctrl, &pctrl->pctrl);
> +	if (ret)
> +		return ret;
> +
> +	ret = pinctrl_enable(pctrl->pctrl);
> +	if (ret)
> +		return ret;
> +
> +#ifdef CONFIG_GPIOLIB
> +	ret = amdisp_gpiochip_add(pdev, pctrl);
> +	if (ret)
> +		return ret;
> +#endif
> +	dev_info(&pdev->dev, "amdisp pinctrl init successful\n");

Drop, useless. Not mentioning that drivers should be silent on success.

> +	return 0;
> +}
> +
> +static struct platform_driver amdisp_pinctrl_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +	},
> +	.probe = amdisp_pinctrl_probe,
> +};
> +
> +static int __init amdisp_pinctrl_init(void)
> +{
> +	return platform_driver_register(&amdisp_pinctrl_driver);
> +}
> +arch_initcall(amdisp_pinctrl_init);
> +
> +static void __exit amdisp_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&amdisp_pinctrl_driver);
> +}
> +module_exit(amdisp_pinctrl_exit);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMDISP pinctrl driver");
> +MODULE_LICENSE("GPL and additional rights");

No, that's not true. Just like in other patch...

> +MODULE_ALIAS("platform:" DRV_NAME);



Best regards,
Krzysztof

