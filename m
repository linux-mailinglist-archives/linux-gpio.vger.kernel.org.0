Return-Path: <linux-gpio+bounces-25024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECACB37E55
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27DFA178080
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632243112A5;
	Wed, 27 Aug 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEAdeLoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162AE2F3C3A;
	Wed, 27 Aug 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285649; cv=none; b=EhxpgyzPSgt4SONW53da/uhHAxL7F0nZDQO6OWq0DIRfwTeeDcvgWVjOeEfZLRPjF2luKprHfzur0RtWJkMVkdJDftZPnxJ/qBL9cYLQ4KZwTo91AhgHGUP1rIBdq67GQXbBzQbnQlHx9yPkHwifl2jMWhU3U8o533Xfg6XdCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285649; c=relaxed/simple;
	bh=DD3hUwbc/+02ei6HB9G/urgZFuIL+Udl7hUqiqFgcDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udCkcYvbVc1liUFJ3oA/6TlEfRoRfBwp32tzgysHdNGHPdir0bUh45fTMXTIlsVHN28jsSdvT3j/E9Pj4rigjUoqAmq763UFDJH1e0vhfn/h6j/4TfiAPwCEB3HjAyCUm2MvbEjsoyKMaRrVWWuypikjdm8jjjZ5uIzJ+pQSYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEAdeLoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF71C4CEEB;
	Wed, 27 Aug 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756285648;
	bh=DD3hUwbc/+02ei6HB9G/urgZFuIL+Udl7hUqiqFgcDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pEAdeLoVmA9mg5lCQpCgrpz4+IjxY4NDShrID+wm6joLaPoQeSIoNeEDLGe+mcq1G
	 e0ztdLRb1mp+wPbEdJ9KiYLQ7xvWzY0eppTsA2H6m5OuxTrqNG5f8XZkhE/EbS8B3D
	 Y6m3lEC+fIE9b4/kRXp6OcgCBVvTy4SEITROc641316NVGJq2hA96P3/dC2VkrlQQ7
	 Nq/sszftF46jj8iCxCpvHokWdUlydt41ogZy5TuWWt3iVcxA6KxYwCjlM06QgQYdqo
	 wvMyGwN2/YlxZgWFhWI/gIcVId3Lt6+MiDWlShK0XVZ8yuq5ehhxTg4Zih8alW2KVP
	 dqg8O3cuDqESw==
Message-ID: <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
Date: Wed, 27 Aug 2025 11:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250827024222.588082-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2025 04:42, Gary Yang wrote:
> +
> +static int sky1_pinctrl_probe_dt(struct platform_device *pdev,
> +				struct sky1_pinctrl *spctl)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *child;
> +	struct pinctrl_dev *pctl = spctl->pctl;
> +	u32 nfuncs = 0;
> +	u32 i = 0;
> +	bool flat_funcs;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	flat_funcs = sky1_pinctrl_dt_is_flat_functions(np);
> +	if (flat_funcs) {
> +		nfuncs = 1;
> +	} else {
> +		nfuncs = of_get_child_count(np);
> +		if (nfuncs == 0) {
> +			dev_err(&pdev->dev, "no functions defined\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for (i = 0; i < nfuncs; i++) {
> +		struct function_desc *function;
> +
> +		function = devm_kzalloc(&pdev->dev, sizeof(*function),
> +					GFP_KERNEL);
> +		if (!function)
> +			return -ENOMEM;
> +
> +		mutex_lock(&spctl->mutex);
> +		radix_tree_insert(&pctl->pin_function_tree, i, function);
> +		mutex_unlock(&spctl->mutex);
> +	}
> +	pctl->num_functions = nfuncs;
> +
> +	spctl->group_index = 0;
> +	if (flat_funcs) {
> +		pctl->num_groups = of_get_child_count(np);
> +	} else {
> +		pctl->num_groups = 0;
> +		for_each_child_of_node(np, child)
> +			pctl->num_groups += of_get_child_count(child);
> +	}
> +
> +	if (flat_funcs) {
> +		sky1_pinctrl_parse_functions(np, spctl, 0);
> +	} else {
> +		i = 0;
> +		for_each_child_of_node(np, child)
> +			sky1_pinctrl_parse_functions(child, spctl, i++);
> +	}
> +
> +	return 0;
> +}
> +
> +int sky1_base_pinctrl_probe(struct platform_device *pdev,
> +		      const struct sky1_pinctrl_soc_info *info)
> +{
> +	struct pinctrl_desc *sky1_pinctrl_desc;
> +	struct sky1_pinctrl *spctl;
> +	int ret, i;
> +
> +	if (!info || !info->pins || !info->npins) {
> +		dev_err(&pdev->dev, "wrong pinctrl info\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Create state holders etc for this driver */
> +	spctl = devm_kzalloc(&pdev->dev, sizeof(*spctl), GFP_KERNEL);
> +	if (!spctl)
> +		return -ENOMEM;
> +
> +	spctl->pin_regs = devm_kmalloc_array(&pdev->dev, info->npins,
> +					    sizeof(*spctl->pin_regs),
> +					    GFP_KERNEL);
> +	if (!spctl->pin_regs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < info->npins; i++)
> +		spctl->pin_regs[i] = -1;
> +
> +	spctl->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(spctl->base))
> +		return PTR_ERR(spctl->base);
> +
> +	sky1_pinctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*sky1_pinctrl_desc),
> +					GFP_KERNEL);
> +	if (!sky1_pinctrl_desc)
> +		return -ENOMEM;
> +
> +	sky1_pinctrl_desc->name = dev_name(&pdev->dev);
> +	sky1_pinctrl_desc->pins = info->pins;
> +	sky1_pinctrl_desc->npins = info->npins;
> +	sky1_pinctrl_desc->pctlops = &sky1_pctrl_ops;
> +	sky1_pinctrl_desc->pmxops = &sky1_pmx_ops;
> +	sky1_pinctrl_desc->confops = &sky1_pinconf_ops;
> +	sky1_pinctrl_desc->owner = THIS_MODULE;
> +
> +	mutex_init(&spctl->mutex);
> +
> +	spctl->info = info;
> +	spctl->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, spctl);
> +	ret = devm_pinctrl_register_and_init(&pdev->dev,
> +					     sky1_pinctrl_desc, spctl,
> +					     &spctl->pctl);
> +	if (ret) {
> +		dev_err(&pdev->dev, "could not register SKY1 pinctrl driver\n");
> +		return ret;
> +	}
> +
> +	ret = sky1_pinctrl_probe_dt(pdev, spctl);
> +

No blank line here.

> +	if (ret) {
> +		dev_err(&pdev->dev, "fail to probe dt properties\n");

You are printing same error twice. Drop this and just handle error
printing in sky1_pinctrl_probe_dt().
Especially that you now print errors on ENOMEM.

> +		return ret;
> +	}
> +
> +	pinctrl_provide_dummies();
> +	dev_info(&pdev->dev, "initialized SKY1 pinctrl driver\n");


No, please drop. Drivers should be silent on success.

> +
> +	return pinctrl_enable(spctl->pctl);
> +}
> +EXPORT_SYMBOL_GPL(sky1_base_pinctrl_probe);
> +



..

> +
> +static struct platform_driver sky1_pinctrl_driver = {
> +	.driver = {
> +		.name = "sky1-pinctrl",
> +		.of_match_table = of_match_ptr(sky1_pinctrl_of_match),


You have a warning here - please drop of_match_ptr.

> +		.pm = &sky1_pinctrl_pm_ops,
> +	},
> +	.probe = sky1_pinctrl_probe,
> +};
> +
> +static int __init sky1_pinctrl_init(void)
> +{
> +	return platform_driver_register(&sky1_pinctrl_driver);
> +}
> +arch_initcall(sky1_pinctrl_init);
> +
> +MODULE_AUTHOR("Jerry Zhu <Jerry.Zhu@cixtech.com>");
> +MODULE_DESCRIPTION("Cix Sky1 pinctrl driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/cix/pinctrl-sky1.h b/drivers/pinctrl/cix/pinctrl-sky1.h
> new file mode 100644
> index 000000000000..09b25dbb6db3
> --- /dev/null
> +++ b/drivers/pinctrl/cix/pinctrl-sky1.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
> + */
> +
> +#ifndef __DRIVERS_PINCTRL_SKY1_H
> +#define __DRIVERS_PINCTRL_SKY1_H
> +
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinmux.h>

Are you sure you use both headers in this header?

Best regards,
Krzysztof

