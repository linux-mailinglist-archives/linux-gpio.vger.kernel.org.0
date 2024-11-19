Return-Path: <linux-gpio+bounces-13097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5A9D2273
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 10:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A5942826EA
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 09:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CB41A705C;
	Tue, 19 Nov 2024 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHfigUYs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5D146A73;
	Tue, 19 Nov 2024 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008377; cv=none; b=Q/JLxtNNV+3za0tZB3S4udYPy4EonDy2i/l0euMsmpGCbL3BbJGiZmZoaA9QfcFDmDVkTWd7CWDdm4SaIXbQxt8Y3yirs6mxgQbugfDNcBoGPSpwWNvfvSOvsDZvp7kfSo6Nhs8St5TLUwdIGUZ4qLMcvkHY171orHFtJsqnt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008377; c=relaxed/simple;
	bh=7mePgQRSkpmfIveXMK9lb5lPmV+fFAPKdLmVe2Fi60A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbK2CBYiGA1O+Q44t7OL3pwOkkxxYsXrKbxu3DMYt4w2/v9bfszo9DVuzMjCU7T3Nmo42Ve10BsGpPzJMXIzLjn48mwNn4c3tLCdqvIuscK+wQZuoDIX5XH3xom+gkOQNvHiz5AOxFAJhUCL/T0I0fBTD3Jnfm6AtLbfbhSHlcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHfigUYs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCD8C4CECF;
	Tue, 19 Nov 2024 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732008377;
	bh=7mePgQRSkpmfIveXMK9lb5lPmV+fFAPKdLmVe2Fi60A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GHfigUYs7mnM49q4h+91RIdknDmcVyeysT+2BAWJW5HgPzkbL01OM+N8KUiqTTQwR
	 gIpcLQPuilmBvDRcjlo6g1idMTOyNOjyS2MFOaEfaYDBaYekxgCiCr9m4Oe2kDowh4
	 B3hmjuH6pqBJiHSYsfju8/mhCcbfKEtZEHuBR1587M5gkhEJuuTCb0rmdtsMy5UjBM
	 +a185obDtQ/DDZ85J79VFpJGTYyYnPPKAF76eIUJIE9qlzzngnQvk588ApeOAaNdOa
	 Juu7yfodN5ccE3sk/ztOa12A1TX0aAml6kPVo6cTsf289SGESEUQb7Y3WjJi96blk+
	 OZu0t1Td0ClDQ==
Message-ID: <2ccbf862-2b3e-4c08-b6bd-d9571e88a675@kernel.org>
Date: Tue, 19 Nov 2024 10:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241113101124.1279648-5-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2024 11:10, Andrei Stefanescu wrote:
>  
> -static inline void s32_pin_set_pull(enum pin_config_param param,
> -				   unsigned int *mask, unsigned int *config)
> +static void s32_pin_set_pull(enum pin_config_param param,
> +			     unsigned int *mask, unsigned int *config)
>  {
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> @@ -762,15 +757,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
>  	grp->data.name = np->name;
>  
>  	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
> -	if (npins < 0) {
> -		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
> -			grp->data.name);
> -		return -EINVAL;
> -	}
> -	if (!npins) {
> -		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
> -		return -EINVAL;
> -	}
> +	if (npins < 0)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to read 'pinmux' in node %s\n",
> +				     grp->data.name);

I do not see how this change is related. Looks you are mixing cleanups
with refactoring into MFD cell. These are two different things.

> +
> +	if (!npins)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The group %s has no pins\n",
> +				     grp->data.name);
>  
>  	grp->data.npins = npins;
>  
> @@ -811,11 +806,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  	/* Initialise function */
>  	func->name = np->name;
>  	func->ngroups = of_get_child_count(np);
> -	if (func->ngroups == 0) {
> -		dev_err(info->dev, "no groups defined in %pOF\n", np);
> -		return -EINVAL;
> -	}
> -
> +	if (func->ngroups == 0)
> +		return dev_err_probe(info->dev, -EINVAL,
> +				     "No groups defined in %pOF\n", np);
>  	groups = devm_kcalloc(info->dev, func->ngroups,
>  				    sizeof(*func->groups), GFP_KERNEL);
>  	if (!groups)
> @@ -838,57 +831,42 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  				struct s32_pinctrl *ipctl)
>  {
> +	struct nxp_siul2_mfd *mfd = dev_get_drvdata(pdev->dev.parent);
>  	struct s32_pinctrl_soc_info *info = ipctl->info;
> -	struct device_node *np = pdev->dev.of_node;
> -	struct resource *res;
> -	struct regmap *map;
> -	void __iomem *base;
> -	unsigned int mem_regions = info->soc_data->mem_regions;
> +	unsigned int mem_regions;
> +	struct device_node *np;
> +	u32 nfuncs = 0, i = 0, j;
> +	u8 regmap_type;
>  	int ret;
> -	u32 nfuncs = 0;
> -	u32 i = 0;
>  
> +	np = pdev->dev.parent->of_node;
>  	if (!np)
>  		return -ENODEV;
>  
> -	if (mem_regions == 0 || mem_regions >= 10000) {
> -		dev_err(&pdev->dev, "mem_regions is invalid: %u\n", mem_regions);
> -		return -EINVAL;
> -	}
> +	/* one MSCR and one IMCR region per SIUL2 module */

How is this related to converion into MFD cell?

Still looks like an ABI break.


Best regards,
Krzysztof


