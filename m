Return-Path: <linux-gpio+bounces-6202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D78BE7A7
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57161C21A71
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 15:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0C71649DE;
	Tue,  7 May 2024 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4lOqjEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146015F30F;
	Tue,  7 May 2024 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715096695; cv=none; b=q+zmP32jd6SZZ5SWwqkQiatQTpi1S/461EiHsaFIl1BvJKHGjwBtcR00g8lIBehPMecR7/X1YSUjV1ZFKpt4pI0jHYBVcpdcOTrD4dW+PMIiXKte9CX6IXWP6zfZ7tl4ns7qzA+711Tsvpe6OLQs1Kj3WbQRW5Zlx6KRluMIhGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715096695; c=relaxed/simple;
	bh=yFzbHrUIErgI/K91OQv9I/OpYVQQJu7B8yxVKKO+SzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gifa4UlwrBUF5AbeyhTGERM/Txl2Mb61LXaxTO6El4NXqAbBcM1M09e6KPpT2rAuYAHtf8j5Ovf7pfhPPAFeqNARg9VoCEF/UD32OS/gDd0KjxDcvz32Ph4p9dnrt++7JiuX0eNq9qHrp5KJPDoNeaY5JE5j+RnmB1php9KB83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4lOqjEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEA0C2BBFC;
	Tue,  7 May 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715096695;
	bh=yFzbHrUIErgI/K91OQv9I/OpYVQQJu7B8yxVKKO+SzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4lOqjENPtah9e5qgGQEp/wINkms6VgwKnJh9NPCBjGY+i/g/SrwKxIl9X0D4ZjPL
	 qFJcLf5k1dq+jjf+7ASYn9kBNmp9/1j+kI6eaNsJNH983lp0jKo5ERRmH54k+UXWo0
	 KYvc8ce2T1UNM7+ZoYOma7FhZdNNyT9PSFymDGR457iL6GhHqyJb0KoLSMJg4cXjSC
	 i6x0ld8brNqNY6ledquErLyFDvzG2F6iQ3LQgbykcSvyTyP9q2n1HArF3xrd3tYNaq
	 tES8Q9NVC0+kh/K2LTeaNnsK0QXQD4Ul6RRKI+w7tTgc29reP88Uih6isPu3ZMA0zt
	 GV4nUy8grFExg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4Mzx-0000000051g-16t0;
	Tue, 07 May 2024 17:44:57 +0200
Date: Tue, 7 May 2024 17:44:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>

On Mon, May 06, 2024 at 10:09:50PM +0300, Andy Shevchenko wrote:
> Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:
> > From: Satya Priya <quic_c_skakit@quicinc.com>
> > 
> > Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
> > seven LDO regulators. Add a PM8008 regulator driver to support PMIC
> > regulator management via the regulator framework.
> > 
> > Note that this driver, originally submitted by Satya Priya [1], has been
> > reworked to match the new devicetree binding which no longer describes
> > each regulator as a separate device.

> > [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
> 
> Make it Link: tag?
> 
> Link: URL [1]

Sure.

> > [ johan: rework probe to match new binding, amend commit message and
> >          Kconfig entry]
> 
> Wouldn't be better on one line?

Now you're really nit picking. ;) I think I prefer to stay within 72
columns.

> + array_size.h
> + bits.h

Ok.

> > +#include <linux/device.h>
> 
> > +#include <linux/kernel.h>
> 
> What is this header for?

Probably the ones that are not explicitly included.

> + math.h
> 
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> 
> + asm/byteorder.h

Ok, thanks.

> > +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> > +{
> > +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> > +	__le16 mV;
> > +	int uV;
> > +
> > +	regmap_bulk_read(pm8008_reg->regmap,
> > +			LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
> 
> Why casting?

I tried not change things in the v15 from Qualcomm that I based this
on. I couldn't help cleaning up a few things in probe, which I was
touching anyway, but I left it there.

I'll drop the unnecessary cast.

> > +	uV = le16_to_cpu(mV) * 1000;
> > +	return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
> > +}
> > +
> > +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
> > +							int mV)
> > +{
> > +	__le16 vset_raw;
> > +
> > +	vset_raw = cpu_to_le16(mV);
> 
> Can be joined to a single line.

Sure.

> > +	return regmap_bulk_write(pm8008_reg->regmap,
> > +			LDO_VSET_LB_REG(pm8008_reg->base),
> > +			(const void *)&vset_raw, sizeof(vset_raw));
> 
> Why casting?

Same answer as above. Will drop.

> > +}
> 
> ...
> 
> > +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
> > +					unsigned int selector)
> > +{
> > +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> > +	int rc, mV;
> > +
> > +	rc = regulator_list_voltage_linear_range(rdev, selector);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	/* voltage control register is set with voltage in millivolts */
> > +	mV = DIV_ROUND_UP(rc, 1000);
> 
> > +	rc = pm8008_write_voltage(pm8008_reg, mV);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	return 0;
> 
> 	return pm8008_write_voltage(pm8008_reg, mV);

Possibly, but I tend to prefer explicit error paths.

> > +}
> 
> > +
> > +	regmap = dev_get_regmap(dev->parent, "secondary");
> > +	if (!regmap)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(reg_data); i++) {
> > +		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> > +		if (!pm8008_reg)
> > +			return -ENOMEM;
> > +
> > +		pm8008_reg->regmap = regmap;
> > +		pm8008_reg->base = reg_data[i].base;
> > +
> > +		/* get slew rate */
> > +		rc = regmap_bulk_read(pm8008_reg->regmap,
> > +				LDO_STEPPER_CTL_REG(pm8008_reg->base), &val, 1);
> > +		if (rc < 0) {
> > +			dev_err(dev, "failed to read step rate: %d\n", rc);
> > +			return rc;
> 
> 			return dev_err_probe(...);

Nah, regmap won't trigger a probe deferral.

> > +static struct platform_driver pm8008_regulator_driver = {
> > +	.driver	= {
> > +		.name = "qcom-pm8008-regulator",
> > +	},
> > +	.probe = pm8008_regulator_probe,
> > +};
> 
> > +
> 
> Unneeded blank line.

I noticed that one too, but such things are up the author to decide.

> > +module_platform_driver(pm8008_regulator_driver);
> 
> ...
> 
> > +MODULE_ALIAS("platform:qcom-pm8008-regulator");
> 
> Use ID table instead.

No, the driver is not using an id-table for matching so the alias is
needed for module auto-loading.

Johan

