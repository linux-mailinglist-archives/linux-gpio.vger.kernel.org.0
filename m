Return-Path: <linux-gpio+bounces-6754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4D88D24B6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF2F5B28C5C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA6A177986;
	Tue, 28 May 2024 19:36:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AD176FA1
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924970; cv=none; b=tPJLhmGu9dAT7RqMUatWq7uKa5M1OyQWLzC7UJVfQhBh/wsbslyS3qZMc3PyhaMQUsuw/s/pWpUPqyLx15v7suNdk9akRuvRChX4g+th3/POr7El2SXsg5XL+806BGOpPB3PYsdiQBIzkFaOj6JfokeST1pd/BeOwmw8JXqcMqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924970; c=relaxed/simple;
	bh=mcRUMZ4dwHJV5/dMwob3lapuhQw0EPjhT9rLeKNTsfc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRYCPRKneiAXkHXeQ1cMa83cwQ8/3Zk6MtEasdefH8AOVec9TcRs4Cx5xjd1121Oj2TdcW7VuI2oN04j6yp32+doDGuN8R4CXnGUyhgkpSRfNuW5Fhay7cLbNmcmKHryWYLRpGYX+Uko7uA8cPQ2LuUwkwTCQQp9/pkEmZHhFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 8703f71f-1d29-11ef-80c1-005056bdfda7;
	Tue, 28 May 2024 22:36:06 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 May 2024 22:36:06 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	Alexandru Ardelean <alexandru.ardelean@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 3/4] gpio: adp5585: Add Analog Devices ADP5585 support
Message-ID: <ZlYyJpLeDLD_T5V6@surfacebook.localdomain>
References: <20240528190315.3865-1-laurent.pinchart@ideasonboard.com>
 <20240528190315.3865-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528190315.3865-4-laurent.pinchart@ideasonboard.com>

Tue, May 28, 2024 at 10:03:13PM +0300, Laurent Pinchart kirjoitti:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> The ADP5585 is a 10/11 input/output port expander with a built in keypad
> matrix decoder, programmable logic, reset generator, and PWM generator.
> This driver supports the GPIO function using the platform device
> registered by the core MFD driver.
> 
> The driver is derived from an initial implementation from NXP, available
> in commit 451f61b46b76 ("MLK-25917-2 gpio: adp5585-gpio: add
> adp5585-gpio support") in their BSP kernel tree. It has been extensively
> rewritten.

Why is this not using gpio-regmap?

...

> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/adp5585.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

+ types.h

...

> +	bit = off * 2 + (off > 5 ? 4 : 0);

Right, but can you use >= 6 here which immediately follows to the next
question, i.e. why not use bank in this conditional?

...

> +	struct adp5585_dev *adp5585 = dev_get_drvdata(pdev->dev.parent);

(see below)

> +	struct adp5585_gpio_dev *adp5585_gpio;
> +	struct device *dev = &pdev->dev;

	struct adp5585_dev *adp5585 = dev_get_drvdata(dev->parent);

> +	struct gpio_chip *gc;
> +	int ret;

...

> +	platform_set_drvdata(pdev, adp5585_gpio);

Any use of driver data?

...

> +	device_set_of_node_from_dev(dev, dev->parent);

Why not device_set_node()?

-- 
With Best Regards,
Andy Shevchenko



