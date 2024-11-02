Return-Path: <linux-gpio+bounces-12484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D536C9B9DFF
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 09:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16E311C2106C
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 08:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2836A158D80;
	Sat,  2 Nov 2024 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnetYMcx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC41136351;
	Sat,  2 Nov 2024 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730537470; cv=none; b=KDXkjJHuCnxYTS0atESs8CvR7G6e+AzcOLAnUatGA7YTWEsF2Qf3hQyZgI+2bZcTkVRNd8YlQxXkYlwE6IeOjP6c95+DSELUGkHEn0vPBoXuRCQqj9inrf8XqRa83WRR1Urj/GxM0y9Gb2RgZ1nWCkmXe5mZSQV/S54UzSmLq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730537470; c=relaxed/simple;
	bh=njAvedrSitInShPszOayXefFcXhSEvi9AH1Gu+jbW6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdEIZbL8mnZInKwpkGE7BEOXFg9MaKKd6Aby4AhhBhkRqSNRGnflKtQf2vrujEzV5gOnw6kpTPFrZn5G7gqz8xrsTmRBmx3+qdgKm/5ajehJzhKN2eRGgj7yKDHtOm8DR7yy91KgnLdiwCa/fFvBGQpK8SpxAgpPr1LqtdSj9e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnetYMcx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66ACEC4CEC3;
	Sat,  2 Nov 2024 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537470;
	bh=njAvedrSitInShPszOayXefFcXhSEvi9AH1Gu+jbW6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnetYMcxdkzPOQG/JS1PIS7Ia2DrTgNM2VyGYT/4hVlYKKcBZ2j7/7I2xT+tLNowP
	 gAOe4uF1IKElJZ6vxg9uDMETem0QBrwuA9D8zdNWx9WUdrRmfQtP54eMoBqPn/iC9e
	 a7piVFmgOxXqJRclbb9RzaRm8fmN/sRI86TtC5gfSjmWLFXtNEV3Z4Dbr4jl0CyprE
	 GLCfVZ45gnvd7pqUV3m5tr6/q/8bLrfvK66LOTBZMqdlYQAdsthhAN0YWOP5sfGxFh
	 SOuIQOGPBhmhb0CCoP7jkkgKWgp4V3IbhdsKA6bNsgLcbHNR8CNEtoES1eDNrFuD1S
	 KiDeAr+cf0L1g==
Date: Sat, 2 Nov 2024 09:51:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
Message-ID: <5lgrrlmn3lgk7wtkxcujdtp47fslxxtt2gcaqqarpestswyorm@6fnlwtmxlvbe>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>

On Fri, Nov 01, 2024 at 10:06:10AM +0200, Andrei Stefanescu wrote:
> +	/* Order is MSCR regions first, then IMCR ones */
>  	for (i = 0; i < mem_regions; i++) {
> -		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
> -		if (IS_ERR(base))
> -			return PTR_ERR(base);
> -
> -		snprintf(ipctl->regions[i].name,
> -			 sizeof(ipctl->regions[i].name), "map%u", i);
> -
> -		s32_regmap_config.name = ipctl->regions[i].name;
> -		s32_regmap_config.max_register = resource_size(res) -
> -						 s32_regmap_config.reg_stride;
> -
> -		map = devm_regmap_init_mmio(&pdev->dev, base,
> -						&s32_regmap_config);
> -		if (IS_ERR(map)) {
> -			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
> -			return PTR_ERR(map);
> -		}
> -
> -		ipctl->regions[i].map = map;
> +		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
> +		j = i % mfd->num_siul2;
> +		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
>  		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];

This looks like breaking all the users. Nothing in commit msg about
this: about rationale, impact or backwards compatibility.

Nothing in changelog in cover letter explaining such sudden change in
approach.

Sorry, that's a NAK.

Best regards,
Krzysztof


