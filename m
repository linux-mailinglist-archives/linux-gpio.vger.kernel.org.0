Return-Path: <linux-gpio+bounces-7317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8789024F6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 17:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05E01C22D09
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 15:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B675613959A;
	Mon, 10 Jun 2024 15:06:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A198132132
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032016; cv=none; b=rgS4HJXoVE8nOGGGFhyxR+xPLZx2bCd1TYhaIv9wiDmDyCbWq8WhMU/kOonsH9DUT5OGPG9Z50A/oM8nLQ8l7cfw9g+/1d0Uxg31fd8QvBJGvxOldjLQHRyly2p+gG3i0jxVls8BZTCDpq54mDs0PpRhnkJpKD5oJLTdkLymiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032016; c=relaxed/simple;
	bh=lP4D/6CUbp58ZTTFmh0d16ZZx+1hFGVtBydbFM8/4uw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpNbhyWpefn11OqCM4AYkj99+BLORAm32rl16YQmJKVC3edfgYuBMLMl4Vi/nOF4lJt9mATnYSK8diXa2Ej8Eo+FD2sKYwe9whgi0USJbqyjdwXfM3LJr3UDs0WS8dwrMxNorQbp0VKoF9UIYMlRY1NiBItkXEIko3yqfqQ5hqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 1151c7ca-273b-11ef-8d66-005056bd6ce9;
	Mon, 10 Jun 2024 18:06:52 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 18:06:51 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH v4 4/4] pwm: adp5585: Add Analog Devices ADP5585 support
Message-ID: <ZmcWi08u6-u4MyKu@surfacebook.localdomain>
References: <20240608141633.2562-1-laurent.pinchart@ideasonboard.com>
 <20240608141633.2562-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240608141633.2562-5-laurent.pinchart@ideasonboard.com>

Sat, Jun 08, 2024 at 05:16:33PM +0300, Laurent Pinchart kirjoitti:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> The ADP5585 is a 10/11 input/output port expander with a built in keypad
> matrix decoder, programmable logic, reset generator, and PWM generator.
> This driver supports the PWM function using the platform device
> registered by the core MFD driver.
> 
> The driver is derived from an initial implementation from NXP, available
> in commit 113113742208 ("MLK-25922-1 pwm: adp5585: add adp5585 PWM
> support") in their BSP kernel tree. It has been extensively rewritten.

...

> +#define ADP5585_PWM_OSC_FREQ_HZ		1000000U

(1 * HZ_PER_MHZ) ?

Variant to use MEGA. Or even #define MHz in units.h if you wish.
Putting a few 0:s in a row is error prone.

...

> +	ret = regmap_write(regmap, ADP5585_PWM_OFFT_LOW,
> +			   off & 0xff);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(regmap, ADP5585_PWM_OFFT_HIGH,
> +			   (off >> 8) & 0xff);
> +	if (ret)
> +		return ret;

This is regular I�C regmap, why do you avoid using regmap bulk APIs?

> +	ret = regmap_write(regmap, ADP5585_PWM_ONT_LOW,
> +			   on & 0xff);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(regmap, ADP5585_PWM_ONT_HIGH,
> +			   (on >> 8) & 0xff);
> +	if (ret)
> +		return ret;

Ditto.

...

> +static int pwm_adp5585_get_state(struct pwm_chip *chip,
> +				 struct pwm_device *pwm,
> +				 struct pwm_state *state)
> +{
> +	struct regmap *regmap = pwmchip_get_drvdata(chip);
> +	unsigned int on, off;
> +	unsigned int val;
> +
> +	regmap_read(regmap, ADP5585_PWM_OFFT_LOW, &off);
> +	regmap_read(regmap, ADP5585_PWM_OFFT_HIGH, &val);
> +	off |= val << 8;

Ditto.

> +	regmap_read(regmap, ADP5585_PWM_ONT_LOW, &on);
> +	regmap_read(regmap, ADP5585_PWM_ONT_HIGH, &val);
> +	on |= val << 8;

Ditto.

> +	state->duty_cycle = on * (NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ);
> +	state->period = (on + off) * (NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ);
> +
> +	state->polarity = PWM_POLARITY_NORMAL;
> +
> +	regmap_read(regmap, ADP5585_PWM_CFG, &val);
> +	state->enabled = !!(val & ADP5585_PWM_EN);
> +
> +	return 0;

Besides that, how do you guarantee that no IO may happen in between of those
calls? Probably you want a driver explicit lock? In that case, would you still
want to have a regmap internal lock?

> +}

...

> +static int adp5585_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct adp5585_dev *adp5585 = dev_get_drvdata(dev->parent);
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	chip = devm_pwmchip_alloc(dev, ADP5585_PWM_CHAN_NUM, 0);
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);

> +	device_set_of_node_from_dev(dev, dev->parent);

Still unclear to me why only few drivers use this.

> +	pwmchip_set_drvdata(chip, adp5585->regmap);
> +	chip->ops = &adp5585_pwm_ops;
> +
> +	ret = devm_pwmchip_add(dev, chip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add PWM chip\n");
> +
> +	return 0;
> +}

...

> +static const struct platform_device_id adp5585_pwm_id_table[] = {
> +	{ "adp5585-pwm" },
> +	{ /* Sentinel */ },

Drop comma. Otherwise it's not a sentinel strictly speaking.

> +};

-- 
With Best Regards,
Andy Shevchenko



