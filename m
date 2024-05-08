Return-Path: <linux-gpio+bounces-6262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E69868C0763
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 00:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53451B22EBA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 22:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F3F38397;
	Wed,  8 May 2024 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gvOyBGsQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519E1E89A
	for <linux-gpio@vger.kernel.org>; Wed,  8 May 2024 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715207875; cv=none; b=s1DLI75aMA+V89F3nlkSOpFRhXEIxwZXwWIS2zXHPPLgbdoWdefgfay7T26EbFGaS4qZhtxfPV1P+SkQx+zrncUzau5NIH4246LdaVQth+wS3MB2675Zv+4/Jz1C6NxOzMJpuWIwvPUNytKSs5o84/EhGwqTZEbW3rc+NengNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715207875; c=relaxed/simple;
	bh=gkiQnNwVQrsa+28STlZ5/i+j4rn304bwjnjT6RZAH8c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPA7XMnvmwEgGt6emKicJViD+O6NRBCrChN+d0P4aBdgEvxS4TXg9gP/Y83bGWGV9ixhhXZszKTjJNV3s9mJycx/mGOmL+nIRJZok8YgcjqVQIWZw9CFBFCxpLLs0LlPwQyZtFj6/up/GkxY70EwQFer6T7P7EH4Zb8FyfVwlQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gvOyBGsQ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-debaa161ae3so300443276.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2024 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715207872; x=1715812672; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQnhPPJLZqhiPyY2VjG7VAxW3Am1dwZRgVu5xvgsRfk=;
        b=gvOyBGsQA82/b71DKXWg3uNs5mjtvtzNHNn5Ta0OeOGNbmiikN/Z3qcIfA+1ip20TT
         J25zVD0K9+4d4bfOi7I3TXUTGfvRR4DDbzpI6a9vBw2g5GIMQenYIkhJfOyw0CTDqhiD
         z7PVwhy2hg/kG1aVfuNkeG+euOmvK/Y7GWlX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715207872; x=1715812672;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQnhPPJLZqhiPyY2VjG7VAxW3Am1dwZRgVu5xvgsRfk=;
        b=SyRAkW4uhSjmokwFr0qD/D1WAu733rpu1AN7Q/3hau/G10VKEr5e6XNbgxL4HD0sug
         AAOCaqcWVySL18O3+emhzV7tIBZX+x/G9yC4l9FiG71XkhRHNkfJ3YhizwU8TTvX4I13
         2kU2pAqdcfT7wKDCzkwrCP9aSQC3c9wEwMTBFxRoFN4Bhcj2cWRBnzVgn+Vaj5wuJu+h
         61vgVHaDqcloawcKmjk/PWWWc1SACBUiqLeguTLy/PXMqvtDRc6C2S53U40LXtnWPCLr
         HIo7wJeHIQQtkA9dDNT0NIwXdGE2w/g0TJalHyg2Z3mQ6YlqRWXzbWFBLukBMGwkOxfL
         EuyA==
X-Forwarded-Encrypted: i=1; AJvYcCWvTlW5JhDlCymZ0UsRcPt1XXrlSfaHi3WQks/kM5vLo2LvVNmZEzCPPWaK+38QGopEpuY/SfgEvKnbgkXh6vCsZO8jdmxmGjsbbQ==
X-Gm-Message-State: AOJu0Yy8oXcImvy9KEbWo7veSXYUdiAgpK+Uiok+ZtgN+COQhH4eQ7xe
	waBX/yrkMw54EcNBKcqTYMHy0JHUFsf0ztNAJcXV5wY4pfJEK+ZiOVLDAUDsEnLugY6oWQRmZrJ
	cK4bYlvuoypsnUTKCQbb1U6kYfCR12PLIta2g
X-Google-Smtp-Source: AGHT+IEDCFI8xn8l9izDfECjs69+U4QoPp9r27+Xw69iFeSo27F7rPihO9uzigfOROJXNOoUrDXWiJl7KN8VUyIrL2c=
X-Received: by 2002:a5b:811:0:b0:de5:4bb4:25b9 with SMTP id
 3f1490d57ef6-debb9ce095dmr4747797276.12.1715207871771; Wed, 08 May 2024
 15:37:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 22:37:51 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-13-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-13-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 22:37:50 +0000
Message-ID: <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:29)
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

Thanks. I had to remember this topic.

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
>
> [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> [ johan: rework probe to match new binding, amend commit message and
>          Kconfig entry]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
> new file mode 100644
> index 000000000000..51f1ce5e043c
> --- /dev/null
> +++ b/drivers/regulator/qcom-pm8008-regulator.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +
> +#define VSET_STEP_MV                   8
> +#define VSET_STEP_UV                   (VSET_STEP_MV * 1000)
> +
> +#define LDO_ENABLE_REG(base)           ((base) + 0x46)
> +#define ENABLE_BIT                     BIT(7)
> +
> +#define LDO_VSET_LB_REG(base)          ((base) + 0x40)
> +
> +#define LDO_STEPPER_CTL_REG(base)      ((base) + 0x3b)
> +#define DEFAULT_VOLTAGE_STEPPER_RATE   38400
> +#define STEP_RATE_MASK                 GENMASK(1, 0)

Include bits.h?

> +
> +#define NLDO_MIN_UV                    528000
> +#define NLDO_MAX_UV                    1504000
> +
> +#define PLDO_MIN_UV                    1504000
> +#define PLDO_MAX_UV                    3400000
> +
> +struct pm8008_regulator_data {
> +       const char                      *name;
> +       const char                      *supply_name;
> +       u16                             base;
> +       int                             min_dropout_uv;
> +       const struct linear_range       *voltage_range;
> +};
> +
> +struct pm8008_regulator {
> +       struct regmap           *regmap;
> +       struct regulator_desc   rdesc;
> +       u16                     base;
> +       int                     step_rate;

Is struct regulator_desc::vsel_step usable for this? If not, can it be
unsigned?

> +};
> +
> +static const struct linear_range nldo_ranges[] = {
> +       REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
> +};
> +
> +static const struct linear_range pldo_ranges[] = {
> +       REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
> +};
> +
> +static const struct pm8008_regulator_data reg_data[] = {
> +       /* name   parent       base    headroom_uv voltage_range */
> +       { "ldo1", "vdd_l1_l2", 0x4000, 225000, nldo_ranges, },
> +       { "ldo2", "vdd_l1_l2", 0x4100, 225000, nldo_ranges, },
> +       { "ldo3", "vdd_l3_l4", 0x4200, 300000, pldo_ranges, },
> +       { "ldo4", "vdd_l3_l4", 0x4300, 300000, pldo_ranges, },
> +       { "ldo5", "vdd_l5",    0x4400, 200000, pldo_ranges, },
> +       { "ldo6", "vdd_l6",    0x4500, 200000, pldo_ranges, },
> +       { "ldo7", "vdd_l7",    0x4600, 200000, pldo_ranges, },
> +};
> +
> +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +       __le16 mV;
> +       int uV;

Can this be unsigned? Doubt we have negative voltage and this would
match rdesc.min_uV type.

> +
> +       regmap_bulk_read(pm8008_reg->regmap,
> +                       LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);

Is struct regulator_desc::vsel_reg usable for this?

> +
> +       uV = le16_to_cpu(mV) * 1000;
> +       return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
> +}
> +
> +static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
> +                                                       int mV)
> +{
> +       __le16 vset_raw;
> +
> +       vset_raw = cpu_to_le16(mV);
> +
> +       return regmap_bulk_write(pm8008_reg->regmap,
> +                       LDO_VSET_LB_REG(pm8008_reg->base),
> +                       (const void *)&vset_raw, sizeof(vset_raw));

Is the cast to please sparse?

> +}
> +
> +static int pm8008_regulator_set_voltage_time(struct regulator_dev *rdev,
> +                               int old_uV, int new_uv)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +
> +       return DIV_ROUND_UP(abs(new_uv - old_uV), pm8008_reg->step_rate);
> +}
> +
> +static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
> +                                       unsigned int selector)
> +{
> +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> +       int rc, mV;
> +
> +       rc = regulator_list_voltage_linear_range(rdev, selector);
> +       if (rc < 0)
> +               return rc;
> +
> +       /* voltage control register is set with voltage in millivolts */
> +       mV = DIV_ROUND_UP(rc, 1000);
> +
> +       rc = pm8008_write_voltage(pm8008_reg, mV);
> +       if (rc < 0)
> +               return rc;
> +
> +       return 0;

Can be shorter to save lines

	return pm8008_write_voltage(pm8008_reg, mV);

> +}
> +
> +static const struct regulator_ops pm8008_regulator_ops = {
> +       .enable                 = regulator_enable_regmap,
> +       .disable                = regulator_disable_regmap,
> +       .is_enabled             = regulator_is_enabled_regmap,
> +       .set_voltage_sel        = pm8008_regulator_set_voltage,
> +       .get_voltage_sel        = pm8008_regulator_get_voltage,
> +       .list_voltage           = regulator_list_voltage_linear,
> +       .set_voltage_time       = pm8008_regulator_set_voltage_time,
> +};
> +
> +static int pm8008_regulator_probe(struct platform_device *pdev)
> +{
> +       struct regulator_config reg_config = {};
> +       struct pm8008_regulator *pm8008_reg;
> +       struct device *dev = &pdev->dev;
> +       struct regulator_desc *rdesc;
> +       struct regulator_dev *rdev;
> +       struct regmap *regmap;
> +       unsigned int val;
> +       int rc, i;
> +
> +       regmap = dev_get_regmap(dev->parent, "secondary");
> +       if (!regmap)
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(reg_data); i++) {
> +               pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
> +               if (!pm8008_reg)
> +                       return -ENOMEM;
> +
> +               pm8008_reg->regmap = regmap;
> +               pm8008_reg->base = reg_data[i].base;
> +
> +               /* get slew rate */
> +               rc = regmap_bulk_read(pm8008_reg->regmap,
> +                               LDO_STEPPER_CTL_REG(pm8008_reg->base), &val, 1);
> +               if (rc < 0) {
> +                       dev_err(dev, "failed to read step rate: %d\n", rc);

Is it step rate or slew rate? The comment doesn't agree with the error
message.

> +                       return rc;
> +               }
> +               val &= STEP_RATE_MASK;
> +               pm8008_reg->step_rate = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
> +
> +               rdesc = &pm8008_reg->rdesc;
> +               rdesc->type = REGULATOR_VOLTAGE;
> +               rdesc->ops = &pm8008_regulator_ops;
> +               rdesc->name = reg_data[i].name;
> +               rdesc->supply_name = reg_data[i].supply_name;
> +               rdesc->of_match = reg_data[i].name;
> +               rdesc->uV_step = VSET_STEP_UV;
> +               rdesc->linear_ranges = reg_data[i].voltage_range;
> +               rdesc->n_linear_ranges = 1;
> +               BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||

This should be an && not || right?

> +                               (ARRAY_SIZE(nldo_ranges) != 1));
> +
> +               if (reg_data[i].voltage_range == nldo_ranges) {
> +                       rdesc->min_uV = NLDO_MIN_UV;
> +                       rdesc->n_voltages = ((NLDO_MAX_UV - NLDO_MIN_UV) / rdesc->uV_step) + 1;
> +               } else {
> +                       rdesc->min_uV = PLDO_MIN_UV;
> +                       rdesc->n_voltages = ((PLDO_MAX_UV - PLDO_MIN_UV) / rdesc->uV_step) + 1;
> +               }
> +
> +               rdesc->enable_reg = LDO_ENABLE_REG(pm8008_reg->base);
> +               rdesc->enable_mask = ENABLE_BIT;
> +               rdesc->min_dropout_uV = reg_data[i].min_dropout_uv;
> +               rdesc->regulators_node = of_match_ptr("regulators");
> +
> +               reg_config.dev = dev->parent;
> +               reg_config.driver_data = pm8008_reg;
> +               reg_config.regmap = pm8008_reg->regmap;
> +
> +               rdev = devm_regulator_register(dev, rdesc, &reg_config);
> +               if (IS_ERR(rdev)) {
> +                       rc = PTR_ERR(rdev);
> +                       dev_err(dev, "failed to register regulator %s: %d\n",
> +                                       reg_data[i].name, rc);
> +                       return rc;

Could be return dev_err_probe() to simplify.

