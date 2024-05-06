Return-Path: <linux-gpio+bounces-6164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A53678BD54C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 21:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464FD1F22B15
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010081591F6;
	Mon,  6 May 2024 19:19:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF61591E0
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023143; cv=none; b=NVf/tOXVBZjXv5kL96iefkr1KSbDFqJ7SLOpPmAg5stdo1WY8+kt3cMRG9jQoQYEP7Y5ennu00oZH0dk1bqgTHsnVtIeQb52YfF+jTCR+RkXD/iNYfrYEZT4ebIFbmaV3ScT1/1uqLuOzBM6Wa1WBTWI/WGLH6h7N04B60t3BFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023143; c=relaxed/simple;
	bh=iLuv/RrdkCRleNf8Bzi0oI0hYiMT/yyTAH48drrVY34=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFhaI7vDPARxPwXq3LB5Ds62iqbHHOcSS1if9cWcPoh5DvFNydHI55BjDuMIOfqQ7h+RkYfuBCXXWajUhFlwQpoQQZITolCNxaZz4HnGZ6ASExUuTHAtefuXwRLJlm7NPhFb6J2r0uu2uwc9z2VVCUgPIDSiFB40ulLN9aVR6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 7d5a15ba-0bdd-11ef-abf4-005056bdd08f;
	Mon, 06 May 2024 22:18:59 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 22:18:58 +0300
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
Message-ID: <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506150830.23709-12-johan+linaro@kernel.org>

Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:
> Rework the pm8008 driver to match the new binding which no longer
> describes internal details like interrupts and register offsets
> (including which of the two consecutive I2C addresses the registers
> belong two).
> 
> Instead make the interrupt controller implementation internal and pass
> interrupts to the subdrivers using MFD cell resources.
> 
> Note that subdrivers may either get their resources, like register block
> offsets, from the parent MFD or this can be included in the subdrivers
> directly.
> 
> In the current implementation, the temperature alarm driver is generic
> enough to just get its base address and alarm interrupt from the parent
> driver, which already uses this information to implement the interrupt
> controller.
> 
> The regulator driver, however, needs additional information like parent
> supplies and regulator characteristics so in that case it is easier to
> just augment its table with the regulator register base addresses.
> 
> Similarly, the current GPIO driver already holds the number of pins and
> that lookup table can therefore also be extended with register offsets.
> 
> Note that subdrivers can now access the two regmaps by name, even if the
> primary regmap is registered last so that it's returned by default when
> no name is provided in lookups.
> 
> Finally, note that the current QPNP GPIO and temperature alarm
> subdrivers need some minor rework before they can be used with non-SPMI
> devices like the PM8008. The MFD cell names therefore use a "qpnp"
> rather than "spmi" prefix to prevent binding until the drivers have been
> updated.

...

> +static void devm_irq_domain_fwnode_release(void *res)
> +{

> +	struct fwnode_handle *fwnode = res;

Unneeded line, can be

static void devm_irq_domain_fwnode_release(void *fwnode)

> +	irq_domain_free_fwnode(fwnode);
> +}

...

> +	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
> +	if (IS_ERR(dummy)) {
> +		rc = PTR_ERR(dummy);
> +		dev_err(&client->dev, "failed to claim second address: %d\n", rc);
> +		return rc;

		return dev_err_probe(...);

> +	}

...

> +	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);

You are using fwnode for IRQ domain and IRQ domain core uses fwnode, why OF here?

	name = devm_kasprintf(dev, GFP_KERNEL, "%pfw-internal", dev_fwnode(dev));

> +	if (!name)
> +		return -ENOMEM;
> +
> +	name = strreplace(name, '/', ':');

> +	fwnode = irq_domain_alloc_named_fwnode(name);
> +	if (!fwnode)
> +		return -ENOMEM;

...

> +	rc = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
>  				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -		if (rc)
> -			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> +	if (rc) {
> +		dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> +		return rc;

		return dev_err_probe(...);

>  	}

-- 
With Best Regards,
Andy Shevchenko



