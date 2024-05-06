Return-Path: <linux-gpio+bounces-6163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2B8BD539
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 21:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B491F229E5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5857D13DDD8;
	Mon,  6 May 2024 19:11:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809FD158DB9
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715022663; cv=none; b=eoWOwpallk42IEz3SklJhuaIvEGwjrgTE4RQW9t7t78IsDcNusW2j3vATzN/GkaBkbxxNpERGvRtSjZsmhKBRrEYiKb/9zWi+2kilA0OdKVjK6rPKdrlpcRS/Long1YFYOXXJATAOMQvXHGSH76mDW2Z/hp1UWJYVG5e1Djravo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715022663; c=relaxed/simple;
	bh=JIKf26avKHFUsAxYVf4PKmxyPhPHiGPrHENS53o1oT8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJjNvq51M+At2F1fG6Vnns5XEm743p/25TkqxPsB/biP5qTU5aNs4GsrlpetpqvYuA4EJS0wpBXBoG5tAiLrcAExT0f4o+f0fBSSyfG4y1AaK16E7jQbrfuryih1sipzWYIFgp5VVp0i9xWEa7I/uGOHm/ZHL/r9yZNRuWBoHIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 36c02e2c-0bdc-11ef-a9de-005056bdf889;
	Mon, 06 May 2024 22:09:51 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 22:09:50 +0300
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
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506150830.23709-13-johan+linaro@kernel.org>

Mon, May 06, 2024 at 05:08:29PM +0200, Johan Hovold kirjoitti:
> From: Satya Priya <quic_c_skakit@quicinc.com>
> 
> Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
> seven LDO regulators. Add a PM8008 regulator driver to support PMIC
> regulator management via the regulator framework.
> 
> Note that this driver, originally submitted by Satya Priya [1], has been
> reworked to match the new devicetree binding which no longer describes
> each regulator as a separate device.
> 
> This avoids describing internal details like register offsets in the
> devicetree and allows for extending the implementation with features
> like over-current protection without having to update the binding.
> 
> Specifically note that the regulator interrupts are shared between all
> regulators.
> 
> Note that the secondary regmap is looked up by name and that if the
> driver ever needs to be generalised to support regulators provided by
> the primary regmap (I2C address) such information could be added to a
> driver lookup table matching on the parent compatible.
> 
> This also fixes the original implementation, which looked up regulators
> by 'regulator-name' property rather than devicetree node name and which
> prevented the regulators from being named to match board schematics.

> [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com

Make it Link: tag?

Link: URL [1]

...

> [ johan: rework probe to match new binding, amend commit message and
>          Kconfig entry]

Wouldn't be better on one line?

...

+ array_size.h
+ bits.h

> +#include <linux/device.h>

> +#include <linux/kernel.h>

What is this header for?

+ math.h

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>

+ asm/byteorder.h

...

> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +	__le16 mV;
> +	int uV;
> +
> +	regmap_bulk_read(pm8008_reg->regmap,
> +			LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);

Why casting?

> +	uV = le16_to_cpu(mV) * 1000;
> +	return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
> +}
> +
> +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
> +							int mV)
> +{
> +	__le16 vset_raw;
> +
> +	vset_raw = cpu_to_le16(mV);

Can be joined to a single line.

> +	return regmap_bulk_write(pm8008_reg->regmap,
> +			LDO_VSET_LB_REG(pm8008_reg->base),
> +			(const void *)&vset_raw, sizeof(vset_raw));

Why casting?

> +}

...

> +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
> +					unsigned int selector)
> +{
> +	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +	int rc, mV;
> +
> +	rc = regulator_list_voltage_linear_range(rdev, selector);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* voltage control register is set with voltage in millivolts */
> +	mV = DIV_ROUND_UP(rc, 1000);

> +	rc = pm8008_write_voltage(pm8008_reg, mV);
> +	if (rc < 0)
> +		return rc;
> +
> +	return 0;

	return pm8008_write_voltage(pm8008_reg, mV);

?

> +}

> +
> +	regmap = dev_get_regmap(dev->parent, "secondary");
> +	if (!regmap)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(reg_data); i++) {
> +		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> +		if (!pm8008_reg)
> +			return -ENOMEM;
> +
> +		pm8008_reg->regmap = regmap;
> +		pm8008_reg->base = reg_data[i].base;
> +
> +		/* get slew rate */
> +		rc = regmap_bulk_read(pm8008_reg->regmap,
> +				LDO_STEPPER_CTL_REG(pm8008_reg->base), &val, 1);
> +		if (rc < 0) {
> +			dev_err(dev, "failed to read step rate: %d\n", rc);
> +			return rc;

			return dev_err_probe(...);

> +		}
> +		val &= STEP_RATE_MASK;
> +		pm8008_reg->step_rate = DEFAULT_VOLTAGE_STEPPER_RATE >> val;

> +		rdesc = &pm8008_reg->rdesc;
> +		rdesc->type = REGULATOR_VOLTAGE;
> +		rdesc->ops = &pm8008_regulator_ops;
> +		rdesc->name = reg_data[i].name;
> +		rdesc->supply_name = reg_data[i].supply_name;
> +		rdesc->of_match = reg_data[i].name;
> +		rdesc->uV_step = VSET_STEP_UV;
> +		rdesc->linear_ranges = reg_data[i].voltage_range;
> +		rdesc->n_linear_ranges = 1;
> +		BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
> +				(ARRAY_SIZE(nldo_ranges) != 1));
> +
> +		if (reg_data[i].voltage_range == nldo_ranges) {
> +			rdesc->min_uV = NLDO_MIN_UV;
> +			rdesc->n_voltages = ((NLDO_MAX_UV - NLDO_MIN_UV) / rdesc->uV_step) + 1;
> +		} else {
> +			rdesc->min_uV = PLDO_MIN_UV;
> +			rdesc->n_voltages = ((PLDO_MAX_UV - PLDO_MIN_UV) / rdesc->uV_step) + 1;
> +		}
> +
> +		rdesc->enable_reg = LDO_ENABLE_REG(pm8008_reg->base);
> +		rdesc->enable_mask = ENABLE_BIT;
> +		rdesc->min_dropout_uV = reg_data[i].min_dropout_uv;
> +		rdesc->regulators_node = of_match_ptr("regulators");
> +
> +		reg_config.dev = dev->parent;
> +		reg_config.driver_data = pm8008_reg;
> +		reg_config.regmap = pm8008_reg->regmap;
> +
> +		rdev = devm_regulator_register(dev, rdesc, &reg_config);
> +		if (IS_ERR(rdev)) {

> +			rc = PTR_ERR(rdev);
> +			dev_err(dev, "failed to register regulator %s: %d\n",
> +					reg_data[i].name, rc);
> +			return rc;

			return dev_err_probe(...);

> +		}
> +	}
> +
> +	return 0;
> +}

...

> +static struct platform_driver pm8008_regulator_driver = {
> +	.driver	= {
> +		.name = "qcom-pm8008-regulator",
> +	},
> +	.probe = pm8008_regulator_probe,
> +};

> +

Unneeded blank line.

> +module_platform_driver(pm8008_regulator_driver);

...

> +MODULE_ALIAS("platform:qcom-pm8008-regulator");

Use ID table instead.

-- 
With Best Regards,
Andy Shevchenko



