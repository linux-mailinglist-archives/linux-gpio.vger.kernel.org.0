Return-Path: <linux-gpio+bounces-15528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4DA2C10F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 11:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AE20188BC4F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702781DEFD7;
	Fri,  7 Feb 2025 10:56:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CDD1DEFCC;
	Fri,  7 Feb 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925791; cv=none; b=KnwJ2k58wY92xuAcoZgrkNQJW2qj1u6QyKWMVLaPVE9P+Q6UtjzyPx2UwproJ59J7ALB7wVtQ76JE6b3tK2k4f66pluxg2SMn/Fh2XS/M4RXZaAUDBu2YSLjvobDpiFN+7pB1c+tfrZOBix4b89dpi6ZI0ucpYJw4bbJe8VZAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925791; c=relaxed/simple;
	bh=Xcznz2lX3okQkW4/VUpMRZwtt4DZP48B241K95Ky2zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA7WDq52oA52DrAVkFrt90qtaeanKGURJE0LgXmNMpM+UDhRAk2AJ4OxmohYJOryhCP1DEuyksAyJRMTxOBz5s/gAIp8x1+GDqdK8huky3exeLJGdF6csxQWbRPaKfNsMNsrJ2Ocv2jUWPLj4YOSBRxzmCEx5eO0orl2iV+E4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 73D1C340CC9;
	Fri, 07 Feb 2025 10:56:28 +0000 (UTC)
Date: Fri, 7 Feb 2025 10:56:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
Message-ID: <20250207105617-GYC5367@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>

On 11:38 Tue 21 Jan     , Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/Kconfig            |   7 +
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 303 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
>  	  where only several fields in register belong to GPIO lines and
>  	  each GPIO line owns a field with different length and on/off value.
>  
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the SpacemiT's K1 GPIO device.
> +
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>  obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>  obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> +obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
>  obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
>  obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
>  obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..de0491af494c10f528095efee9b3a140bdcc0b0d
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
omit ..
> +static int spacemit_gpio_get_ports(struct device *dev, struct spacemit_gpio *gpio,
> +				   void __iomem *regs)
> +{
> +	struct spacemit_gpio_port *port;
> +	u32 i = 0, offset;
> +
> +	gpio->nr_ports = device_get_child_node_count(dev);
> +	if (gpio->nr_ports == 0)
> +		return -ENODEV;
> +
> +	gpio->ports = devm_kcalloc(dev, gpio->nr_ports, sizeof(*gpio->ports), GFP_KERNEL);
> +	if (!gpio->ports)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node_scoped(dev, fwnode)  {
> +		port		= &gpio->ports[i];
> +		port->fwnode	= fwnode;
> +		port->index	= i++;
> +
> +		if (fwnode_property_read_u32(fwnode, "reg", &offset))
> +			return -EINVAL;
> +
> +		port->base	= regs + offset;
> +		port->irq	= fwnode_irq_get(fwnode, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spacemit_gpio_add_port(struct spacemit_gpio *gpio, int index)
> +{
> +	struct spacemit_gpio_port *port;
> +	struct device *dev = gpio->dev;
> +	struct gpio_irq_chip *girq;
> +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> +	int ret;
> +
> +	port = &gpio->ports[index];
> +	port->gpio = gpio;
> +
> +	dat	= port->base + GPLR;
> +	set	= port->base + GPSR;
> +	clr	= port->base + GPCR;
> +	dirin	= port->base + GCDR;
> +	dirout	= port->base + GSDR;
> +
> +	/* This registers 32 GPIO lines per port */
> +	ret = bgpio_init(&port->gc, dev, 4, dat, set, clr, dirout, dirin,
> +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);

Esmil point out bgpio_init() require a GPIO_GENERIC dependency, will fix it

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

