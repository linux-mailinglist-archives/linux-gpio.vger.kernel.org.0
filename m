Return-Path: <linux-gpio+bounces-6226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFDA8BF8E5
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 10:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F039FB21A96
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C802473509;
	Wed,  8 May 2024 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZloNqAA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64F73183;
	Wed,  8 May 2024 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715157589; cv=none; b=RtIJJgZMKVqIUPi8xYzQNbp43qqhM3l3n3DZwXLgIUv5sdzLG1bj9hcFyvRomeHm6R3QZ520UcYFMNFLxeEPGrAIVeHOSyUmgjzyD3EK3w7SXh5woIFBXXa7zRblKT+YPxjQi/TbDst888eskviltVgV1prUsf90z/ZWjscCBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715157589; c=relaxed/simple;
	bh=fpfoyvGAo8rgtxrV0ptJKUnqoFRr6tBhPAvhu2ZfmLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkQ2sj8H5QSRPERizQ+QFMYWyO5LcPImyB3bbWUrOf7zsqWV3RL5mCRgKAMoa7x4LKGUO1dE3mFZcFo8q3+Va71+5WG+dAkTg/4G5GBWOSy5/dg+JI6WaeneeyozHidDd8c9XMhXTf0GHdEHmmv+UibDq3+/PBb+v1hZVnZmz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZloNqAA9; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 4cohsbWRTpZiP4cohsPYlD; Wed, 08 May 2024 10:38:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715157509;
	bh=ZWKsOUbnWU24pwAjgnk1ET/TShN+k9FGrXZfA6NJA+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZloNqAA99SHDCaXuu6P684ZKNm5KaI5rpMJ4QWGSvtzElns8NGSfYYFjWfpW7YH3p
	 tksmN5/2TaXieWmIcBeUt0BfT/Cl9EQRobLDDYakRId0ukw4vyqZduNFXvDwnV/mH1
	 ZxxfjgVxGV9JNBtg6urU2ou1CNsohYA1kf+b+dpRyFW/sRS5dcgLi7XdCAHCD/lHd5
	 JgMPoqjcU6cWAOvrhutxK3KWkWXh3I+APfqm7keOxtKMzr07fKEH++5wLA9RAwYlPj
	 P+jy1/ztgN4fbX/k0rgmSIRzRJ85Pfm9aqHhI4b1t+HUK4crt7HDdjIaAuQToSIaLB
	 85mPEocEG1R1A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 08 May 2024 10:38:29 +0200
X-ME-IP: 86.243.17.157
Message-ID: <39ff586c-24fc-4987-bf5b-c99f0b2ae8f9@wanadoo.fr>
Date: Wed, 8 May 2024 10:38:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO
 driver
To: Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com
References: <20240508065141.565848-1-ychuang570808@gmail.com>
 <20240508065141.565848-4-ychuang570808@gmail.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240508065141.565848-4-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/05/2024 à 08:51, Jacky Huang a écrit :
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
> add support for ma35d1 pinctrl.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---

...

> +static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinctrl *npctl)
> +{
> +	struct ma35_pin_ctrl *ctrl = npctl->ctrl;
> +	struct ma35_pin_bank *bank = ctrl->pin_banks;
> +	int ret;
> +	int i;
> +
> +	for (i = 0; i < ctrl->nr_banks; i++, bank++) {
> +		if (!bank->valid) {
> +			dev_warn(&pdev->dev, "%pfw: bank is not valid\n", bank->fwnode);
> +			continue;
> +		}
> +		bank->irqtype = 0;
> +		bank->irqinten = 0;
> +		bank->chip.label = bank->name;
> +		bank->chip.of_gpio_n_cells = 2;
> +		bank->chip.parent = &pdev->dev;
> +		bank->chip.request = ma35_gpio_core_to_request;
> +		bank->chip.direction_input = ma35_gpio_core_direction_in;
> +		bank->chip.direction_output = ma35_gpio_core_direction_out;
> +		bank->chip.get = ma35_gpio_core_get;
> +		bank->chip.set = ma35_gpio_core_set;
> +		bank->chip.base = -1;
> +		bank->chip.ngpio = bank->nr_pins;
> +		bank->chip.can_sleep = false;
> +
> +		if (bank->irq > 0) {
> +			struct gpio_irq_chip *girq;
> +
> +			girq = &bank->chip.irq;
> +			gpio_irq_chip_set_chip(girq, &ma35_gpio_irqchip);
> +			girq->parent_handler = ma35_irq_demux_intgroup;
> +			girq->num_parents = 1;
> +
> +			girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
> +						     sizeof(*girq->parents), GFP_KERNEL);
> +			if (!girq->parents) {
> +				ret = -ENOMEM;
> +				goto fail;
> +			}
> +
> +			girq->parents[0] = bank->irq;
> +			girq->default_type = IRQ_TYPE_NONE;
> +			girq->handler = handle_bad_irq;
> +		}
> +
> +		ret = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
> +				bank->chip.label, ret);
> +			goto fail;
> +		}
> +	}
> +	return 0;
> +
> +fail:
> +	while (i--) {
> +		bank--;
> +		if (!bank->valid)
> +			continue;
> +		gpiochip_remove(&bank->chip);
> +	}

I don't think this is correct. This is to undo the 
devm_gpiochip_add_data(), right?
Because of the devm_, no need to explicityl call gpiochip_remove()

(more over, it should have been --i and not i-- in the while)

> +	return ret;
> +}

...

> +static int ma35_pinconf_set_drive_strength(struct ma35_pinctrl *npctl, unsigned int pin,
> +					   int strength)
> +{
> +	unsigned int port, group_num;
> +	void __iomem *base;
> +	int i, ds_val = -1;
> +	u32 regval;
> +
> +	if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800) {
> +		for (i = 0; i < ARRAY_SIZE(ds_1800mv_tbl); i++) {
> +			if (ds_1800mv_tbl[i] == strength) {
> +				ds_val = i;
> +				break;
> +			}
> +		}
> +	} else {
> +		for (i = 0; i < ARRAY_SIZE(ds_3300mv_tbl); i++) {
> +			if (ds_3300mv_tbl[i] == strength) {
> +				ds_val = i;
> +				continue;

break; ?

> +			}
> +		}
> +	}
> +	if (ds_val == -1)
> +		return -EINVAL;
> +
> +	ma35_gpio_cla_port(pin, &group_num, &port);
> +	base = npctl->ctrl->pin_banks[group_num].reg_base;
> +
> +	regval = readl(base + MA35_GP_DS_REG(port));
> +	regval &= ~MA35_GP_DS_MASK(port);
> +	regval |= field_prep(MA35_GP_DS_MASK(port), ds_val);
> +
> +	writel(regval, base + MA35_GP_DS_REG(port));
> +
> +	return 0;
> +}

...

> +static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinctrl *npctl)
> +{
> +	struct fwnode_handle *child;
> +	u32 idx = 0;
> +	int ret;
> +
> +	device_for_each_child_node(&pdev->dev, child) {
> +		if (fwnode_property_present(child, "gpio-controller"))
> +			continue;
> +		npctl->nfunctions++;
> +		npctl->ngroups += of_get_child_count(to_of_node(child));
> +	}
> +
> +	if (!npctl->nfunctions)
> +		return -EINVAL;
> +
> +	npctl->functions = devm_kcalloc(&pdev->dev, npctl->nfunctions,
> +					sizeof(*npctl->functions), GFP_KERNEL);
> +	if (!npctl->functions)
> +		return -ENOMEM;
> +
> +	npctl->groups = devm_kcalloc(&pdev->dev, npctl->ngroups,
> +				     sizeof(*npctl->groups), GFP_KERNEL);
> +	if (!npctl->groups)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node(&pdev->dev, child) {
> +		if (fwnode_property_present(child, "gpio-controller"))
> +			continue;
> +
> +		ret = ma35_pinctrl_parse_functions(to_of_node(child), npctl, idx++);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse function\n");

Missing fwnode_handle_put(child); ?
(or a scoped version of device_for_each_child_node() if it exists)

> +			return ret;
> +		}
> +	}
> +	return 0;
> +

...

CJ

