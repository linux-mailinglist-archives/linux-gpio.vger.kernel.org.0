Return-Path: <linux-gpio+bounces-27761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A9C13E90
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 10:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3885B58437B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 09:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DF6277035;
	Tue, 28 Oct 2025 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XSurtNpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271130170C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644780; cv=none; b=a26+09CN3TBZmuXNf1MvPvKH59LDUtjIE8rRLb5fTUTjwDsQwsNxbFkoRoYc2D1Jx1whSd3FBd1GqxdqBdknwQjz02LIjqyeKkAv4RUsWpt4aEF1hzoFRvz+tWA48hxmm04kzYa+a0wBoZbCiog6Wusr22IjR7ofR/Kh6Me473w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644780; c=relaxed/simple;
	bh=OT2+jFI/YLcUsa+0OyKU16yFnU1E6S0GNBybbl27ZT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFRMN/yd1s8YYuB2AeinGn4YoTQxPMaedYApJsZo3QR471KFmUZeYCPubB8YC7L0wIOvTrBdsk2ziZUhrJ5HFxG6Ik1cBsNKDdIMfcDshfpr5Oi6lans547WhOMKNgvI5DZ+53jyM5s1GjhYqme5+X08nJHOl50rSlEePnXJJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XSurtNpm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 949CBC0C408;
	Tue, 28 Oct 2025 09:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C88606AB;
	Tue, 28 Oct 2025 09:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9C3A102F7D13;
	Tue, 28 Oct 2025 10:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761644775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qrmD6ydD+NSerYcuNmCUq7TCcf6nIj8tuamajs7tnRE=;
	b=XSurtNpmjqi+tgymRylUbFuEGodNKUhy71rlYfRqeL7dxe15nk5bupWzG2L0QqvN6PiFUr
	bUnCiHNUpDAUH4eoQh4HjvVGCeOm6Bgf+drAaI2QTuZFlcuhg/7Mj7eh71zm6FfOjDlRKs
	oVAIdjeXa9dUvFeLayXGWPjFMY67cI5o4Xfy8LzVhKr6DZhOb3Gnn+PhPLKjsAN0oXYRIe
	+BShfCe69u6ySdotRSLAPKzdMbriwtIzl1jbP6Wzras+ZhS6dAoC9h5cxI1e1Pt7yI9wNZ
	5+oVozseiuktHBH+BRpt0n27Obj4NlJvDN0+WzZ1685ByX7rIIRg56MlphuudA==
Message-ID: <50646b88-5746-4665-8085-09e394aa291f@bootlin.com>
Date: Tue, 28 Oct 2025 10:45:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpio: add gpio-line-mux driver
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251026231754.2368904-1-jelonek.jonas@gmail.com>
 <20251026231754.2368904-3-jelonek.jonas@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251026231754.2368904-3-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jonas,

Linus mentioned gpio forwarder in the previous iteration, this caught my
attention. So I had a look to your series.

On 10/27/25 12:17 AM, Jonas Jelonek wrote:
> Add a new driver which provides a 1-to-many mapping for a single real
> GPIO using a multiplexer. Each virtual GPIO corresponds to a multiplexer
> state which, if set for the multiplexer, connects the real GPIO to the
> corresponding virtual GPIO.
> 
> For now, this doesn't support advanced features like IRQs, just normal
> IN and OUT functionality of GPIOs.
> 
> This can help in various usecases. One practical case is the special
> hardware design of the Realtek-based XS1930-10 switch from Zyxel. It
> features two SFP+ ports/cages whose signals are wired to directly to the
> switch SoC. Although Realtek SoCs are short on GPIOs, there are usually
> enough the fit the SFP signals without any hacks.
> 
> However, Zyxel did some weird design and connected RX_LOS, MOD_ABS and
> TX_FAULT of one SFP cage onto a single GPIO line controlled by a
> multiplexer (the same for the other SFP cage). The single multiplexer
> controls the lines for both SFP and depending on the state, the
> designated 'signal GPIO lines' are connected to one of the three SFP
> signals.
> 
> Because the SFP core/driver doesn't support multiplexer but needs single
> GPIOs for each of the signals, this driver fills the gap between both.
> It registers a gpio_chip, provides multiple virtual GPIOs and sets the
> backing multiplexer accordingly.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  MAINTAINERS                  |   6 ++
>  drivers/gpio/Kconfig         |  10 ++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-line-mux.c | 194 +++++++++++++++++++++++++++++++++++
>  4 files changed, 211 insertions(+)
>  create mode 100644 drivers/gpio/gpio-line-mux.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..4d75253fe451 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10647,6 +10647,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.yaml
>  F:	drivers/media/rc/gpio-ir-tx.c
>  
> +GPIO LINE MUX
> +M:	Jonas Jelonek <jelonek.jonas@gmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
> +F:	drivers/gpio/gpio-line-mux.c
> +
>  GPIO MOCKUP DRIVER
>  M:	Bamvor Jian Zhang <bamv2005@gmail.com>
>  L:	linux-gpio@vger.kernel.org
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ce237398fa00..93695b86a955 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1986,6 +1986,16 @@ config GPIO_LATCH
>  	  Say yes here to enable a driver for GPIO multiplexers based on latches
>  	  connected to other GPIOs.
>  
> +config GPIO_LINE_MUX
> +	tristate "GPIO line mux driver"
> +	depends on OF_GPIO
> +	select GPIO_AGGREGATOR

You don't need GPIO_AGGREGATOR.

> +	select MULTIPLEXER
> +	help
> +	  Say Y here to support the GPIO line mux, which can provide virtual
> +	  GPIOs backed by a shared real GPIO and a multiplexer in a 1-to-many
> +	  fashion.
> +
>  config GPIO_MOCKUP
>  	tristate "GPIO Testing Driver (DEPRECATED)"
>  	select IRQ_SIM
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ee260a0809d3..6caee52b0356 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
>  obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
>  obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
>  obj-$(CONFIG_GPIO_LATCH)		+= gpio-latch.o
> +obj-$(CONFIG_GPIO_LINE_MUX)		+= gpio-line-mux.o
>  obj-$(CONFIG_GPIO_LJCA) 		+= gpio-ljca.o
>  obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
>  obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> new file mode 100644
> index 000000000000..a367e8f585c6
> --- /dev/null
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPIO line mux which acts as virtual gpiochip and provides a 1-to-many
> + * mapping between virtual GPIOs and a real GPIO + multiplexer. 
> + *
> + * Copyright (c) 2025 Jonas Jelonek <jelonek.jonas@gmail.com>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/mux/consumer.h>
> +#include <linux/mux/driver.h>
> +#include <linux/platform_device.h>
> +
> +struct gpio_lmux {
> +	struct gpio_chip gc;
> +	struct mux_control *mux;
> +	struct device *dev;

not used

> +
> +	struct mutex lock;
> +
> +	struct gpio_desc *shared_gpio;
> +	/* dynamically sized, must be last */
> +	unsigned int gpio_mux_states[];
> +};
> +
> +DEFINE_GUARD(gpio_lmux, struct gpio_lmux *, mutex_lock(&_T->lock), mutex_unlock(&_T->lock))
> +
> +static int gpio_lmux_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_lmux *glm = (struct gpio_lmux *)gpiochip_get_data(gc);
> +	int ret;
> +
> +	if (offset > gc->ngpio)
> +		return -EINVAL;
> +
> +	guard(gpio_lmux)(glm);
> +
> +	ret = mux_control_select(glm->mux, glm->gpio_mux_states[offset]);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = gpiod_get_raw_value_cansleep(glm->shared_gpio);

Why ignoring ACTIVE_LOW status ?
And cansleep depends on your shared_gpio line, maybe it is not the case.

> +	mux_control_deselect(glm->mux);
> +	return ret;
> +}
> +

[...]

> +
> +static int gpio_lmux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_lmux *glm;
> +	unsigned int ngpio, size;
> +	int ret;

nitpick: reverse xmas tree

> +
> +	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
> +	if (!ngpio)
> +		return -EINVAL;
> +
> +	size = sizeof(*glm) + (sizeof(unsigned int) * ngpio);

use struct_size() macro

> +	glm = devm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!glm)
> +		return -ENOMEM;
> +
> +	mutex_init(&glm->lock);
> +
> +	glm->dev = dev;
> +	glm->gc.base = -1;
> +	glm->gc.can_sleep = true;

depends on your shared_gpio line. Use gpiod_cansleep() like in the
gpio-aggregator driver to know if your shared_gpio can sleep.

> +	glm->gc.fwnode = dev_fwnode(dev);
> +	glm->gc.label = "gpio-line-mux";

dev_name() ?

> +	glm->gc.ngpio = ngpio;
> +	glm->gc.owner = THIS_MODULE;
> +	glm->gc.parent = dev;
> +
> +	glm->gc.get = gpio_lmux_gpio_get;
> +	glm->gc.set = gpio_lmux_gpio_set;
> +	glm->gc.get_direction = gpio_lmux_gpio_get_direction;
> +	glm->gc.direction_input = gpio_lmux_gpio_direction_input;
> +	glm->gc.direction_output = gpio_lmux_gpio_direction_output;
> +
> +	glm->mux = devm_mux_control_get(dev, NULL);
> +	if (IS_ERR(glm->mux)) {
> +		if (PTR_ERR(glm->mux) == -EPROBE_DEFER) {
> +			dev_err(dev, "mux-controller not ready, deferring probe\n");
> +			return -EPROBE_DEFER;
> +		}
> +
> +		dev_err(dev, "could not get mux-controller\n");
> +		return PTR_ERR(glm->mux);
> +	}

You can replace the if statement by:

if (IS_ERR(glm->mux))
	return dev_err_probe(dev, PTR_ERR(glm->mux), "could not ...");

> +
> +	glm->shared_gpio = devm_gpiod_get(dev, "shared", GPIOD_ASIS);
> +	if (IS_ERR(glm->shared_gpio)) {
> +		dev_err(dev, "could not get shared-gpio\n");
> +		return PTR_ERR(glm->shared_gpio);
> +	}

ditto

> +
> +	ret = device_property_read_u32_array(dev, "gpio-line-mux-states",
> +					     &glm->gpio_mux_states[0], ngpio);
> +	if (ret) {
> +		dev_err(dev, "could not get mux states\n");
> +		return ret;
> +	}

ditto

> +		
> +	ret = devm_gpiochip_add_data(dev, &glm->gc, glm);
> +	if (ret) {
> +		dev_err(dev, "failed to add gpiochip: %d\n", ret);
> +		return ret;
> +	}

ditto

> +
> +	dev_info(dev, "providing %u virtual GPIOs for real GPIO %u\n", ngpio,
> +		 desc_to_gpio(glm->shared_gpio));

No logs if device probes successfully

> +	return 0;
> +}
> +
> +static const struct of_device_id gpio_lmux_of_match[] = {
> +	{ .compatible = "gpio-line-mux" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, gpio_lmux_of_match);
> +
> +static struct platform_driver gpio_lmux_driver = {
> +	.driver = {
> +		.name = "gpio-line-mux",
> +		.of_match_table = gpio_lmux_of_match,
> +	},
> +	.probe = gpio_lmux_probe,
> +};
> +module_platform_driver(gpio_lmux_driver);
> +
> +MODULE_AUTHOR("Jonas Jelonek <jelonek.jonas@gmail.com>");
> +MODULE_DESCRIPTION("GPIO line mux driver");
> +MODULE_LICENSE("GPL");

The advantage of the forwarder is that it handles if the shared GPIO is
sleeping or not.
But I think the forwarder shall have ngpio, not 1. You will have to add
ngpio times the same GPIO desc. Also unsupported operations shall be unset.
So I don't really know if it shall be used in this case.

Best Regards,

Thomas

