Return-Path: <linux-gpio+bounces-30792-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFi+MRyCcWk1IAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30792-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:49:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 155AB6081E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 02:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 021EA861202
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C109E4219F0;
	Tue, 20 Jan 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bxqg/Cwf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81071342505
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910644; cv=none; b=Mpby+/DJpxKDQlmd5H4L18RKyGqK02kpoaJpK8Cv4E+h4Q5OT6q3QoWsvlTEEarxGAFXOSYEqocqUXAumeEJ9BEEqz+6KByKsuQO1B/ocCIAtvLzcgQ7dW9O9NsM/kVJ5//f1XQLorLu9VMIvnn3NRwZnxsQdDVc1LRxePH7xFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910644; c=relaxed/simple;
	bh=p9d6LakFYKaOF+FR5vT9INwm4NnQ4cVQwluda9YDdLI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTBFxSB6YC4Yy3NIi9YmECyNGadDy8C/H5yBQk8juxAdxG6UG641XJ9nkvzeiRQGKu5AS5wH9C3CqmMjepFHR5RvpsRKTG0jX+TqISmTNqEMGv2xIoW5ICwQHnY5ZVkXtdF57P0txi35APlYfNRh7u82qPs1ut6n7RLH8TiEoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bxqg/Cwf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15775C16AAE
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910644;
	bh=p9d6LakFYKaOF+FR5vT9INwm4NnQ4cVQwluda9YDdLI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Bxqg/Cwf8cCDixc4DhCyDikAuBAJRSzUY4anYoaWTIXnlHvwjxWCqOgFCdG+3wI6D
	 EKrWwRoZxMKi6p+h10uKdQ8B6+Gkw02RXfY1M6GNWYFzPiYW7gRi8svaPsWg93ltq0
	 DWaeTPyixP8dgMdR1eL+N0TyLodycidYZZdHQW+OqlgeJEVj+hF4mCSpCL5zIadgrY
	 YhHXiuqBM7d8RAT/UK7nr8pnchmDvW3s1xQAp8JU7noZz50XkYPrcH1fYLxEopl+p6
	 N8NXAa+5QQF/bkACsMvcP/gVfMbvs3NJ43PJwCPBA6J0YSTGUlo7UBeq420yLY9d7f
	 fpO3StVJ4PZWg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b6c905a46so5437088e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 04:04:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnXMejQiFTTqgwzIMUPo9Zb9ATwm0dPbRZSaGjWPmYKgovyzD15J8YhdccP1Gz8YFPOeTB7LIg91OT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz87sQZOyrXorRE3qLcT6oIpvtMvMrroOFgMx/ur1vrlgj141Ef
	UPf7oth4pLn2VunJXuM4oxdxpEZjmL5/WWSNLXJIiaWJnEriYjsAU8rhck72cbQyZmRT65O+q+d
	KvQU/MMi1jxdKfm2L2wdlqm3qm4bodhdfu+X3AxbBdg==
X-Received: by 2002:ac2:4f14:0:b0:59b:7c78:a9c3 with SMTP id
 2adb3069b0e04-59baeebad7amr4060447e87.1.1768910642665; Tue, 20 Jan 2026
 04:04:02 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:04:01 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Jan 2026 06:04:01 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260120115923.3463866-5-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-5-khristineandreea.barbulescu@oss.nxp.com>
Date: Tue, 20 Jan 2026 06:04:01 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfH427jyVosqa1qzE9yAoH9jZkiv3mxPEtcUGR=4MibHw@mail.gmail.com>
X-Gm-Features: AZwV_Qgqo3z9o-DsAb1ExxLJ6yhYuf67su5n9ktf7Dr6yJtAkW9SfUF-2_57DZo
Message-ID: <CAMRc=MfH427jyVosqa1qzE9yAoH9jZkiv3mxPEtcUGR=4MibHw@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[37];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30792-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155AB6081E
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 12:59:16 +0100, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path. Moreover, add/fix some comments and print
> statements.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 106 +++++++++++++++-------------
>  1 file changed, 55 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 35511f83d056..a98f8e7c2768 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024 NXP
> + * Copyright 2017-2022,2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
>  	return pinmux & GENMASK(3, 0);
>  }
>
> +/**
> + * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
> + * @map: regmap used for this range
> + * @pin_range: the pins controlled by these registers
> + * @name: name of the current range
> + */

This should be a separate commit, it has nothing to do with dev_err_probe().

Same elsewhere, just add a commit fixing kerneldocs in this driver.

>  struct s32_pinctrl_mem_region {
>  	struct regmap *map;
>  	const struct s32_pin_range *pin_range;
>  	char name[8];
>  };
>
> -/*
> - * Holds pin configuration for GPIO's.
> +/**
> + * struct gpio_pin_config - holds pin configuration for GPIO's
>   * @pin_id: Pin ID for this GPIO
>   * @config: Pin settings
>   * @list: Linked list entry for each gpio pin
> @@ -78,21 +84,23 @@ struct gpio_pin_config {
>  	struct list_head list;
>  };
>
> -/*
> - * Pad config save/restore for power suspend/resume.
> +/**
> + * struct s32_pinctrl_context - pad config save/restore for suspend/resume
> + * @pads: saved values for the pards
>   */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };
>
> -/*
> +/**
> + * struct s32_pinctrl - private driver data
>   * @dev: a pointer back to containing device
>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin
> - * @gpio_configs: Saved configurations for GPIO pins
> - * @gpiop_configs_lock: lock for the `gpio_configs` list
> - * @s32_pinctrl_context: Configuration saved over system sleep
> + * @gpio_configs: saved configurations for GPIO pins
> + * @gpio_configs_lock: lock for the `gpio_configs` list
> + * @saved_context: configuration saved over system sleep
>   */
>  struct s32_pinctrl {
>  	struct device *dev;
> @@ -123,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
>  	return NULL;
>  }
>
> -static inline int s32_check_pin(struct pinctrl_dev *pctldev,
> -				unsigned int pin)
> +static int s32_check_pin(struct pinctrl_dev *pctldev,
> +			 unsigned int pin)

Likewise, this merits a separate patch.

>  {
>  	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
>  }
>
> -static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
> +static int s32_regmap_read(struct pinctrl_dev *pctldev,
>  			   unsigned int pin, unsigned int *val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -145,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
>  	return regmap_read(region->map, offset, val);
>  }
>
> -static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
> +static int s32_regmap_write(struct pinctrl_dev *pctldev,
>  			    unsigned int pin,
>  			    unsigned int val)
>  {
> @@ -163,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
>
>  }
>
> -static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
> +static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
>  			     unsigned int mask, unsigned int val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -236,10 +244,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
>  	}
>
>  	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
> -	if (ret) {
> -		dev_err(dev, "%pOF: could not parse node property\n", np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "%pOF: could not parse node property\n",
> +				     np);
>
>  	if (n_cfgs)
>  		reserve++;
> @@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
>  	/* Check beforehand so we don't have a partial config. */
>  	for (i = 0; i < grp->data.npins; i++) {
>  		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
> -			dev_err(info->dev, "invalid pin: %u in group: %u\n",
> +			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
>  				grp->data.pins[i], group);
>  			return -EINVAL;
>  		}
> @@ -476,8 +484,8 @@ static int s32_get_slew_regval(int arg)
>  	return -EINVAL;
>  }
>
> -static inline void s32_pin_set_pull(enum pin_config_param param,
> -				   unsigned int *mask, unsigned int *config)
> +static void s32_pin_set_pull(enum pin_config_param param,
> +			     unsigned int *mask, unsigned int *config)
>  {
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> @@ -763,15 +771,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
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
> +
> +	if (!npins)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The group %s has no pins\n",
> +				     grp->data.name);
>
>  	grp->data.npins = npins;
>
> @@ -812,10 +820,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  	/* Initialise function */
>  	func->name = np->name;
>  	func->ngroups = of_get_child_count(np);
> -	if (func->ngroups == 0) {
> -		dev_err(info->dev, "no groups defined in %pOF\n", np);
> -		return -EINVAL;
> -	}
> +	if (func->ngroups == 0)
> +		return dev_err_probe(info->dev, -EINVAL,
> +				     "No groups defined in %pOF\n", np);
>
>  	groups = devm_kcalloc(info->dev, func->ngroups,
>  				    sizeof(*func->groups), GFP_KERNEL);
> @@ -886,10 +893,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  	}
>
>  	nfuncs = of_get_child_count(np);
> -	if (nfuncs <= 0) {
> -		dev_err(&pdev->dev, "no functions defined\n");
> -		return -EINVAL;
> -	}
> +	if (nfuncs <= 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "No functions defined\n");
>
>  	info->nfunctions = nfuncs;
>  	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
> @@ -919,18 +925,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  int s32_pinctrl_probe(struct platform_device *pdev,
>  		      const struct s32_pinctrl_soc_data *soc_data)
>  {
> -	struct s32_pinctrl *ipctl;
> -	int ret;
> -	struct pinctrl_desc *s32_pinctrl_desc;
> -	struct s32_pinctrl_soc_info *info;
>  #ifdef CONFIG_PM_SLEEP
>  	struct s32_pinctrl_context *saved_context;
>  #endif
> +	struct pinctrl_desc *s32_pinctrl_desc;
> +	struct s32_pinctrl_soc_info *info;
> +	struct s32_pinctrl *ipctl;
> +	int ret;
>
> -	if (!soc_data || !soc_data->pins || !soc_data->npins) {
> -		dev_err(&pdev->dev, "wrong pinctrl info\n");
> -		return -EINVAL;
> -	}
> +	if (!soc_data || !soc_data->pins || !soc_data->npins)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Wrong pinctrl info\n");
>
>  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
> @@ -965,16 +970,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  	s32_pinctrl_desc->owner = THIS_MODULE;
>
>  	ret = s32_pinctrl_probe_dt(pdev, ipctl);
> -	if (ret) {
> -		dev_err(&pdev->dev, "fail to probe dt properties\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Fail to probe dt properties\n");
>
>  	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
>  					    ipctl);
>  	if (IS_ERR(ipctl->pctl))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> -				     "could not register s32 pinctrl driver\n");
> +				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
>  	saved_context = &ipctl->saved_context;
> --
> 2.50.1
>
>

Bart

