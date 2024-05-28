Return-Path: <linux-gpio+bounces-6774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A08D25AC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 22:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C31A285640
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 20:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354D6178CCD;
	Tue, 28 May 2024 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qCPDioOo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1B63A1A8;
	Tue, 28 May 2024 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927659; cv=none; b=SMwZTfWzPkQNNfVNYINmoDLuolFw42Mhs/nkZNCzLAH4K3LyJ/iXKf7wdFmgTkSkv3kHOoidwNbu1Pl91FNTwilU8V5w3DF9titJnqudVzj9aHTZ+XP3EwGM9NODJWwsIK+p77Vf2KvmLpwXJdnHI7rIWgas4Khf29PW74sCceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927659; c=relaxed/simple;
	bh=Cx19g39eIwMZcRAIH77mHZgMzukS6dMek4iKReia8hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYf1nmSgpW3B3M1ri8hsLisUL4ALpDD/3vA3S1SUaTBtyDBKWZtzJhRaay4yKVtJrw1dUeFuA6E5Novv/mGs+PcvEkVbMQHacsjIdQ4LyiVq2Lzj7haRqSuqKQNtlNOFNQIIuANaAZGV6TJ49Oivl5PwpPeehfWyGC1hihV2OPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qCPDioOo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CE83A2;
	Tue, 28 May 2024 22:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716927653;
	bh=Cx19g39eIwMZcRAIH77mHZgMzukS6dMek4iKReia8hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCPDioOoBLQSR7NJJyeAH/7ftfp/67Rlvsb1CHjM9Xlv8UKGv5M/kZqOOQyysRXUt
	 +njglS/571LXM+UY4zee2bywQFqUTSYfSjzM6rR7ojOaSHe5KNeTeW/1kk5Mn82x6k
	 MqDyCGhX19zSdSEZIAJ64l/Xlp/KRWiNR8hHc5+E=
Date: Tue, 28 May 2024 23:20:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v2 3/4] gpio: adp5585: Add Analog Devices ADP5585 support
Message-ID: <20240528202044.GB8500@pendragon.ideasonboard.com>
References: <20240528190315.3865-1-laurent.pinchart@ideasonboard.com>
 <20240528190315.3865-4-laurent.pinchart@ideasonboard.com>
 <ZlYyJpLeDLD_T5V6@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlYyJpLeDLD_T5V6@surfacebook.localdomain>

Hi Andy,

Thank you for the patch.

On Tue, May 28, 2024 at 10:36:06PM +0300, Andy Shevchenko wrote:
> Tue, May 28, 2024 at 10:03:13PM +0300, Laurent Pinchart kirjoitti:
> > From: Haibo Chen <haibo.chen@nxp.com>
> > 
> > The ADP5585 is a 10/11 input/output port expander with a built in keypad
> > matrix decoder, programmable logic, reset generator, and PWM generator.
> > This driver supports the GPIO function using the platform device
> > registered by the core MFD driver.
> > 
> > The driver is derived from an initial implementation from NXP, available
> > in commit 451f61b46b76 ("MLK-25917-2 gpio: adp5585-gpio: add
> > adp5585-gpio support") in their BSP kernel tree. It has been extensively
> > rewritten.
> 
> Why is this not using gpio-regmap?
> 
> ...
> 
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/mfd/adp5585.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> 
> + types.h
> 
> ...
> 
> > +	bit = off * 2 + (off > 5 ? 4 : 0);
> 
> Right, but can you use >= 6 here which immediately follows to the next
> question, i.e. why not use bank in this conditional?

The ADP5585_BANK() macro is meant to be used with ADP5585_BIT(), for a
set of registers with the same layout. Here the layout is different, the
registers contain multi-bit fields. I can't use ADP5585_BIT(), so I'd
rather not use ADP5585_BANK() either. I have decided to use > 5 instead
of >= 6 to match the R5 field name in the comment above:

        /*
         * The bias configuration fields are 2 bits wide and laid down in
         * consecutive registers ADP5585_RPULL_CONFIG_*, with a hole of 4 bits
         * after R5.
         */

> ...
> 
> > +	struct adp5585_dev *adp5585 = dev_get_drvdata(pdev->dev.parent);
> 
> (see below)
> 
> > +	struct adp5585_gpio_dev *adp5585_gpio;
> > +	struct device *dev = &pdev->dev;
> 
> 	struct adp5585_dev *adp5585 = dev_get_drvdata(dev->parent);

I prefer keeping the current ordering, with long lines first, I think
that's more readable.

> > +	struct gpio_chip *gc;
> > +	int ret;
> 
> ...
> 
> > +	platform_set_drvdata(pdev, adp5585_gpio);
> 
> Any use of driver data?

In v1, not v2. I'll drop it.

> ...
> 
> > +	device_set_of_node_from_dev(dev, dev->parent);
> 
> Why not device_set_node()?

Because device_set_of_node_from_dev() is meant for this exact use case,
where the same node is used for multiple devices. It also puts any
previous dev->of_node, ensuring proper refcounting when devices are
unbound and rebound, without being deleted.

-- 
Regards,

Laurent Pinchart

