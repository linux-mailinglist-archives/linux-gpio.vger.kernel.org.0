Return-Path: <linux-gpio+bounces-6269-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285F8C0D2D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 11:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E2E1C2112F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 09:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8A614A4D0;
	Thu,  9 May 2024 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoDFPdH7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D464D1D6A5;
	Thu,  9 May 2024 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715245839; cv=none; b=DVd1IqpTzDKGQVihARKjpYrtkiIPwzMKPxHHf/PnNXeti66GIHKydSuk9f4KG2BxKjWoKZmXrwCsi1LQCyp7pDiSERoAAcD6y1hxz9ZBmMPCeOnmhXiVDNGYTCOThv3ihUZHwiICpMBoXG3Q+SFNuqc5YCZMhs7FRaXE/5GwzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715245839; c=relaxed/simple;
	bh=hqYhMZFB4vwEaqLFO2/9GxxXt3cS9l57q33LQ/qDguA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSknIBSoeXuTnyMlbUoV5KY2jpR7JqPJGRPhqXxAUDE23415JKKRmGrrcepUCy95bNM5EQOEegGLAEkTNbnJldXu7vxPZh2GYZHJccriq1gy/h398pL411n+SVChdOzAQ0LT13hj9SJXUoPTZUFROiyXdFBRlZPxIzu5LfrhB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoDFPdH7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A6AC2BBFC;
	Thu,  9 May 2024 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715245838;
	bh=hqYhMZFB4vwEaqLFO2/9GxxXt3cS9l57q33LQ/qDguA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoDFPdH7chISRHv6KWxEzweAJ2pwIBZZU7uDWsR+qaEMOfppd1/FCaebggTB/HZJl
	 R/RgIivTx0uGWweeuVpHx8HLOO4RM6cdI1aVfQbuCTEijyGAaGeHStjBD9e/Si4ZUZ
	 YXcZ9gj4znGdDMSJSzgwzlH/gvkGUQN5cN7E5fTNuPMml/lvgpqE+xXpWZWVE6E+am
	 4y+oBvRu+6dop1DY1SR1KTnddhIuaBrsmy51ypsEC4pxSecQmT1oGafK7S5aYe5QBH
	 EwfAw+ASgz3trpRu2FZRK4dx07Qss3yt4K/pW7KDFQ4OIbMjztFe1ZqQ1FIhm+H05Y
	 +8rzihU/ngLsQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4znV-000000000qd-0y1B;
	Thu, 09 May 2024 11:10:42 +0200
Date: Thu, 9 May 2024 11:10:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjyTEVLp8VAhQfT5@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>

On Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd wrote:
> Quoting Johan Hovold (2024-05-06 08:08:29)

> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +
> > +#define VSET_STEP_MV                   8
> > +#define VSET_STEP_UV                   (VSET_STEP_MV * 1000)
> > +
> > +#define LDO_ENABLE_REG(base)           ((base) + 0x46)
> > +#define ENABLE_BIT                     BIT(7)
> > +
> > +#define LDO_VSET_LB_REG(base)          ((base) + 0x40)
> > +
> > +#define LDO_STEPPER_CTL_REG(base)      ((base) + 0x3b)
> > +#define DEFAULT_VOLTAGE_STEPPER_RATE   38400
> > +#define STEP_RATE_MASK                 GENMASK(1, 0)
> 
> Include bits.h?

Sure.

I wanted to avoid changing Qualcomm's v15 driver too much and
essentially submitted it unchanged except for the probe rework. I'll
take closer look at things like this for v2.

> > +struct pm8008_regulator {
> > +       struct regmap           *regmap;
> > +       struct regulator_desc   rdesc;
> > +       u16                     base;
> > +       int                     step_rate;
> 
> Is struct regulator_desc::vsel_step usable for this? If not, can it be
> unsigned?

Not sure, I'll take a look when respinning.

> > +};

> > +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> > +{
> > +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> > +       __le16 mV;
> > +       int uV;
> 
> Can this be unsigned? Doubt we have negative voltage and this would
> match rdesc.min_uV type.

Makes sense.

> > +
> > +       regmap_bulk_read(pm8008_reg->regmap,
> > +                       LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
> 
> Is struct regulator_desc::vsel_reg usable for this?

Will look into that.
 
> > +
> > +       uV = le16_to_cpu(mV) * 1000;
> > +       return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
> > +}
> > +
> > +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
> > +                                                       int mV)
> > +{
> > +       __le16 vset_raw;
> > +
> > +       vset_raw = cpu_to_le16(mV);
> > +
> > +       return regmap_bulk_write(pm8008_reg->regmap,
> > +                       LDO_VSET_LB_REG(pm8008_reg->base),
> > +                       (const void *)&vset_raw, sizeof(vset_raw));
> 
> Is the cast to please sparse?

No idea, I think it's just a stylistic preference that can be dropped.

> > +}

> > +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
> > +                                       unsigned int selector)
> > +{
> > +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> > +       int rc, mV;
> > +
> > +       rc = regulator_list_voltage_linear_range(rdev, selector);
> > +       if (rc < 0)
> > +               return rc;
> > +
> > +       /* voltage control register is set with voltage in millivolts */
> > +       mV = DIV_ROUND_UP(rc, 1000);
> > +
> > +       rc = pm8008_write_voltage(pm8008_reg, mV);
> > +       if (rc < 0)
> > +               return rc;
> > +
> > +       return 0;
> 
> Can be shorter to save lines
> 
> 	return pm8008_write_voltage(pm8008_reg, mV);

Possibly, but I tend to prefer explicit error paths (e.g. for symmetry).

> > +}

> > +static int pm8008_regulator_probe(struct platform_device *pdev)
> > +{
> > +       struct regulator_config reg_config = {};
> > +       struct pm8008_regulator *pm8008_reg;
> > +       struct device *dev = &pdev->dev;
> > +       struct regulator_desc *rdesc;
> > +       struct regulator_dev *rdev;
> > +       struct regmap *regmap;
> > +       unsigned int val;
> > +       int rc, i;
> > +
> > +       regmap = dev_get_regmap(dev->parent, "secondary");
> > +       if (!regmap)
> > +               return -EINVAL;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(reg_data); i++) {
> > +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> > +               if (!pm8008_reg)
> > +                       return -ENOMEM;
> > +
> > +               pm8008_reg->regmap = regmap;
> > +               pm8008_reg->base = reg_data[i].base;
> > +
> > +               /* get slew rate */
> > +               rc = regmap_bulk_read(pm8008_reg->regmap,
> > +                               LDO_STEPPER_CTL_REG(pm8008_reg->base), &val, 1);
> > +               if (rc < 0) {
> > +                       dev_err(dev, "failed to read step rate: %d\n", rc);
> 
> Is it step rate or slew rate? The comment doesn't agree with the error
> message.

Noticed that too, can update the comment.

> > +                       return rc;
> > +               }
> > +               val &= STEP_RATE_MASK;
> > +               pm8008_reg->step_rate = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
> > +
> > +               rdesc = &pm8008_reg->rdesc;
> > +               rdesc->type = REGULATOR_VOLTAGE;
> > +               rdesc->ops = &pm8008_regulator_ops;
> > +               rdesc->name = reg_data[i].name;
> > +               rdesc->supply_name = reg_data[i].supply_name;
> > +               rdesc->of_match = reg_data[i].name;
> > +               rdesc->uV_step = VSET_STEP_UV;
> > +               rdesc->linear_ranges = reg_data[i].voltage_range;
> > +               rdesc->n_linear_ranges = 1;
> > +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
> 
> This should be an && not || right?

No, I think this is correct as it stands if the intention is to prevent
anyone from extending either pldo_ranges or nldo_ranges.

> > +                               (ARRAY_SIZE(nldo_ranges) != 1));
> > +
> > +               if (reg_data[i].voltage_range == nldo_ranges) {
> > +                       rdesc->min_uV = NLDO_MIN_UV;
> > +                       rdesc->n_voltages = ((NLDO_MAX_UV - NLDO_MIN_UV) / rdesc->uV_step) + 1;
> > +               } else {
> > +                       rdesc->min_uV = PLDO_MIN_UV;
> > +                       rdesc->n_voltages = ((PLDO_MAX_UV - PLDO_MIN_UV) / rdesc->uV_step) + 1;
> > +               }
> > +
> > +               rdesc->enable_reg = LDO_ENABLE_REG(pm8008_reg->base);
> > +               rdesc->enable_mask = ENABLE_BIT;
> > +               rdesc->min_dropout_uV = reg_data[i].min_dropout_uv;
> > +               rdesc->regulators_node = of_match_ptr("regulators");
> > +
> > +               reg_config.dev = dev->parent;
> > +               reg_config.driver_data = pm8008_reg;
> > +               reg_config.regmap = pm8008_reg->regmap;
> > +
> > +               rdev = devm_regulator_register(dev, rdesc, &reg_config);
> > +               if (IS_ERR(rdev)) {
> > +                       rc = PTR_ERR(rdev);
> > +                       dev_err(dev, "failed to register regulator %s: %d\n",
> > +                                       reg_data[i].name, rc);
> > +                       return rc;
> 
> Could be return dev_err_probe() to simplify.

Possibly, but I think I prefer not using it when there is nothing that
can trigger a probe deferral.

Johan

