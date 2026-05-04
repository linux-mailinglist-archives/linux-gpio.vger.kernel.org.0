Return-Path: <linux-gpio+bounces-36080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKAXBy+y+Gl2zAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:50:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD64C010E
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27CBF3034BFC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 14:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5681C3DE431;
	Mon,  4 May 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioPITAQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D134DCE3
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906170; cv=none; b=Ix/A0vsUvk7rNcRrmROSgmAN0grbCT0rMSqq12bK5ilIsI+R3RPH6DApVFlbkCeGVWVw3DLI8y3w//HSQQDfy2qM90/8RpfuE6hdq8eDZ18rbnVbGlIU3GU435jUvIRuC3+Q2MIEkf9HrUkZP334m69zy/gakPhecmgsastENBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906170; c=relaxed/simple;
	bh=e8dA+224ilunkVHtXb15F3k4EW0iTNw77ciicxoNYj0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzLanGxrpUc5R4O8JNnqYURfGnlqXJtN/mCXTVVhOh4DfNq65BTlveNBRyEs3f+NfXi57z2dk5riFC4ccZMeLsydNR1FI4p0+jg5p7qqidfNhoBBZ4QnrtcgxRS+aXuidBfveTpVsGQu7JUVY3wLtTbtNJhZ96NulN5plk6KF00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioPITAQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85BFC4AF0C
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777906169;
	bh=e8dA+224ilunkVHtXb15F3k4EW0iTNw77ciicxoNYj0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ioPITAQSa10RD40H3saKuHUeovfkSFx83CZdj1dtFuFf5R/dJ+tsxDawytopk07Q2
	 e1Zyxcd4S6ecp0f2rsp+RyZQ/HD7LR0Br4Rpdt/HXCZ1zDmdV5kAeWVqQSRyux/M42
	 g5IFoNOA9YvP+ZI8gs85zpXy3Vxvz5oRZB/opNnCT92jN7JZkbtXUzsi4vzCyUMhip
	 HSxXfgezMdgKj0u3SLL/DzEtYGMzQjhcn4cyDmBDDWig++Lw0sc73/6w4oujRRC3hD
	 5Xwmy6DmSZGPP4wV+Tv0unegVIcNe844MaRMEBdH2adU9u1ynGcA+EAya6MNXFJkGq
	 hhT1MUn09pXEA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40502e63bso4218211e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:49:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZMaR3H2goXGdCJ+b5Omf9xXd8mYzCVQbq3UMefioiPzQiyzYTrYnif4iN1RCY7pDjeAiF6gc5JTIo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2INyRdDWjKASRzbxVOxkdhUauSP9id1POhg79oPVICAEbV6O
	Dc7D/1jpla1U1ulJJ95DGBMPkAIQz+TXFWKVk+51Gmtc4yl9MY7XESCJN66UXFp541Y/21nqS+M
	JzJq9NM+ORN4LC42lpCgItMh/NQX1eVKFU2yU8VVzBg==
X-Received: by 2002:a05:6512:39cd:b0:5a4:19df:48de with SMTP id
 2adb3069b0e04-5a8631bb8fbmr3913651e87.26.1777906168125; Mon, 04 May 2026
 07:49:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:49:26 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:49:26 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 14:49:26 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc93NYJZr8O4+44CnPS56s4rtWm7qGOVW4oa+oW2xkgiA@mail.gmail.com>
X-Gm-Features: AVHnY4JkcVyxi4y6LcUzdAf0ho4qNeSh7a2uWkgn08xoRxzXPZoOy3UQI5h1Glg
Message-ID: <CAMRc=Mc93NYJZr8O4+44CnPS56s4rtWm7qGOVW4oa+oW2xkgiA@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B8CD64C010E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36080-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,cfg.name:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 4 May 2026 15:11:47 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32.h   |  15 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 527 ++++++++++++++++++++++++----
>  drivers/pinctrl/nxp/pinctrl-s32g2.c |  25 +-
>  3 files changed, 499 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinc=
trl-s32.h
> index 8715befd5f05..d33f4d631dd6 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32.h
> +++ b/drivers/pinctrl/nxp/pinctrl-s32.h
> @@ -2,7 +2,7 @@
>   *
>   * S32 pinmux core definitions
>   *
> - * Copyright 2016-2020, 2022 NXP
> + * Copyright 2016-2020, 2022, 2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   * Copyright (C) 2012 Linaro Ltd.
> @@ -34,11 +34,23 @@ struct s32_pin_range {
>  	unsigned int end;
>  };
>
> +/**
> + * struct s32_gpio_range - contiguous GPIO pin range within a SIUL2 modu=
le
> + * @gpio_base: first pinctrl pin number in the GPIO range
> + * @gpio_num: number of consecutive GPIO pins in the range
> + */
> +struct s32_gpio_range {
> +	unsigned int gpio_base;
> +	unsigned int gpio_num;
> +};
> +
>  struct s32_pinctrl_soc_data {
>  	const struct pinctrl_pin_desc *pins;
>  	unsigned int npins;
>  	const struct s32_pin_range *mem_pin_ranges;
>  	unsigned int mem_regions;
> +	const struct s32_gpio_range *gpio_ranges;
> +	unsigned int num_gpio_ranges;
>  };
>
>  struct s32_pinctrl_soc_info {
> @@ -53,6 +65,7 @@ struct s32_pinctrl_soc_info {
>
>  #define S32_PINCTRL_PIN(pin)	PINCTRL_PIN(pin, #pin)
>  #define S32_PIN_RANGE(_start, _end) { .start =3D _start, .end =3D _end }
> +#define S32_GPIO_RANGE(_base, _num) { .gpio_base =3D _base, .gpio_num =
=3D _num }
>
>  int s32_pinctrl_probe(struct platform_device *pdev,
>  		      const struct s32_pinctrl_soc_data *soc_data);
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index 27757f2c5570..2d9b14792cf4 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024-2025 NXP
> + * Copyright 2017-2022,2024-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -39,6 +39,14 @@
>  #define S32_MSCR_ODE		BIT(20)
>  #define S32_MSCR_OBE		BIT(21)
>
> +/* PGPDOs are 16bit registers that come in big endian

Use:

/*
 * text
 */

style for comments please.

> + * order if they are grouped in pairs of two.
> + *
> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
> + */
> +#define S32_PGPD(N)		(((N) ^ 1) * 2)
> +#define S32_PGPD_SIZE		16
> +
>  enum s32_write_type {
>  	S32_PINCONF_UPDATE_ONLY,
>  	S32_PINCONF_OVERWRITE,
> @@ -72,6 +80,18 @@ struct s32_pinctrl_mem_region {
>  	char name[8];
>  };
>
> +/**
> + * struct s32_gpio_regmaps - GPIO register maps for a SIUL2 instance
> + * @pgpdo: regmap for Parallel GPIO Pad Data Out registers
> + * @pgpdi: regmap for Parallel GPIO Pad Data In registers
> + * @range: GPIO range info
> + */
> +struct s32_gpio_regmaps {
> +	struct regmap *pgpdo;
> +	struct regmap *pgpdi;
> +	const struct s32_gpio_range *range;
> +};
> +
>  /**
>   * struct gpio_pin_config - holds pin configuration for GPIO's
>   * @pin_id: Pin ID for this GPIO
> @@ -96,8 +116,11 @@ struct s32_pinctrl_context {
>   * struct s32_pinctrl - private driver data
>   * @dev: a pointer back to containing device
>   * @pctl: a pointer to the pinctrl device structure
> + * @gc: a pointer to the gpio_chip
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin
> + * @gpio_regmaps: PGPDO/PGPDI regmaps for each SIUL2 module
> + * @num_gpio_regmaps: number of GPIO regmap entries
>   * @gpio_configs: saved configurations for GPIO pins
>   * @gpio_configs_lock: lock for the `gpio_configs` list
>   * @saved_context: configuration saved over system sleep
> @@ -105,8 +128,11 @@ struct s32_pinctrl_context {
>  struct s32_pinctrl {
>  	struct device *dev;
>  	struct pinctrl_dev *pctl;
> +	struct gpio_chip gc;
>  	struct s32_pinctrl_mem_region *regions;
>  	struct s32_pinctrl_soc_info *info;
> +	struct s32_gpio_regmaps *gpio_regmaps;
> +	unsigned int num_gpio_regmaps;
>  	struct list_head gpio_configs;
>  	spinlock_t gpio_configs_lock;
>  #ifdef CONFIG_PM_SLEEP
> @@ -379,67 +405,6 @@ static int s32_pmx_get_groups(struct pinctrl_dev *pc=
tldev,
>  	return 0;
>  }
>
> -static int s32_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
> -				       struct pinctrl_gpio_range *range,
> -				       unsigned int offset)
> -{
> -	struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct gpio_pin_config *gpio_pin;
> -	unsigned int config;
> -	unsigned long flags;
> -	int ret;
> -
> -	ret =3D s32_regmap_read(pctldev, offset, &config);

These are all mmio regmaps, right? You probably don't need to check the ret=
urn
values of regmap ops in this driver.

> -	if (ret)
> -		return ret;
> -
> -	/* Save current configuration */
> -	gpio_pin =3D kmalloc_obj(*gpio_pin);
> -	if (!gpio_pin)
> -		return -ENOMEM;
> -
> -	gpio_pin->pin_id =3D offset;
> -	gpio_pin->config =3D config;
> -	INIT_LIST_HEAD(&gpio_pin->list);
> -
> -	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> -	list_add(&gpio_pin->list, &ipctl->gpio_configs);
> -	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> -
> -	/* GPIO pin means SSS =3D 0 */
> -	config &=3D ~S32_MSCR_SSS_MASK;
> -
> -	return s32_regmap_write(pctldev, offset, config);
> -}
> -
> -static void s32_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
> -				      struct pinctrl_gpio_range *range,
> -				      unsigned int offset)
> -{
> -	struct s32_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> -	struct gpio_pin_config *gpio_pin, *tmp;
> -	unsigned long flags;
> -	int ret;
> -
> -	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> -
> -	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
> -		if (gpio_pin->pin_id =3D=3D offset) {
> -			ret =3D s32_regmap_write(pctldev, gpio_pin->pin_id,
> -						 gpio_pin->config);
> -			if (ret !=3D 0)
> -				goto unlock;
> -
> -			list_del(&gpio_pin->list);
> -			kfree(gpio_pin);
> -			break;
> -		}
> -	}
> -
> -unlock:
> -	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> -}
> -
>  static int s32_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>  				      struct pinctrl_gpio_range *range,
>  				      unsigned int offset,
> @@ -463,8 +428,6 @@ static const struct pinmux_ops s32_pmx_ops =3D {
>  	.get_function_name =3D s32_pmx_get_func_name,
>  	.get_function_groups =3D s32_pmx_get_groups,
>  	.set_mux =3D s32_pmx_set,
> -	.gpio_request_enable =3D s32_pmx_gpio_request_enable,
> -	.gpio_disable_free =3D s32_pmx_gpio_disable_free,
>  	.gpio_set_direction =3D s32_pmx_gpio_set_direction,
>  };
>
> @@ -683,6 +646,397 @@ static const struct pinconf_ops s32_pinconf_ops =3D=
 {
>  	.pin_config_group_dbg_show =3D s32_pinconf_group_dbg_show,
>  };
>
> +static struct s32_pinctrl *to_s32_pinctrl(struct gpio_chip *chip)
> +{
> +	return container_of(chip, struct s32_pinctrl, gc);
> +}
> +
> +static struct regmap *s32_gpio_get_pgpd_regmap(struct gpio_chip *chip,
> +					       unsigned int gpio,
> +					       bool output,
> +						   unsigned int *relative_pin)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +	const struct s32_gpio_range *range;
> +	int i;
> +
> +	for (i =3D 0; i < ipctl->num_gpio_regmaps; i++) {
> +		range =3D ipctl->gpio_regmaps[i].range;
> +		if (gpio >=3D range->gpio_base &&
> +		    gpio < range->gpio_base + range->gpio_num) {
> +			if (relative_pin)
> +				*relative_pin =3D gpio - range->gpio_base;
> +			return output ? ipctl->gpio_regmaps[i].pgpdo :
> +					ipctl->gpio_regmaps[i].pgpdi;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(gc);
> +	struct pinctrl_dev *pctldev =3D ipctl->pctl;
> +	struct gpio_pin_config *gpio_pin;
> +	unsigned int config;
> +	int ret;
> +
> +	ret =3D s32_regmap_read(pctldev, gpio, &config);
> +	if (ret)
> +		return ret;
> +
> +	/* Save current configuration */
> +	gpio_pin =3D kmalloc(sizeof(*gpio_pin), GFP_KERNEL);
> +	if (!gpio_pin)
> +		return -ENOMEM;
> +
> +	gpio_pin->pin_id =3D gpio;
> +	gpio_pin->config =3D config;
> +	INIT_LIST_HEAD(&gpio_pin->list);

This is only needed on the list *head*, not on nodes you add.

> +
> +	/* GPIO pin means SSS =3D 0 */
> +	config &=3D ~S32_MSCR_SSS_MASK;
> +
> +	ret =3D s32_regmap_write(pctldev, gpio, config);
> +	if (ret) {
> +		kfree(gpio_pin);

Maybe __free(kfree) and no_free_ptr()?

> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock_irqsave, &ipctl->gpio_configs_lock)
> +		list_add(&gpio_pin->list, &ipctl->gpio_configs);
> +
> +	return 0;
> +}
> +
> +static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(gc);
> +	struct pinctrl_dev *pctldev =3D ipctl->pctl;
> +	struct gpio_pin_config *gpio_pin, *tmp;
> +	int ret;
> +
> +	guard(spinlock_irqsave)(&ipctl->gpio_configs_lock);
> +
> +	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
> +		if (gpio_pin->pin_id =3D=3D gpio) {
> +			list_del(&gpio_pin->list);
> +			ret =3D s32_regmap_write(pctldev, gpio_pin->pin_id,
> +					       gpio_pin->config);
> +			if (ret)
> +				dev_warn(gc->parent, "Failed to restore config for pin %u\n", gpio);
> +			kfree(gpio_pin);
> +			return;
> +		}
> +	}
> +}
> +
> +static int s32_gpio_get_dir(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +	unsigned int reg_value;
> +	int ret;
> +
> +	ret =3D s32_regmap_read(ipctl->pctl, gpio, &reg_value);
> +	if (ret)
> +		return ret;
> +
> +	if (!(reg_value & S32_MSCR_IBE))
> +		return -EIO;
> +
> +	return reg_value & S32_MSCR_OBE ? GPIO_LINE_DIRECTION_OUT :
> +					  GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static unsigned int s32_pin2pad(unsigned int pin)
> +{
> +	return pin / S32_PGPD_SIZE;
> +}
> +
> +static u16 s32_pin2mask(unsigned int pin)
> +{
> +	/*
> +	 * From Reference manual :
> +	 * PGPDOx[PPDOy] =3D GPDO(x =C3=97 16) + (15 - y)[PDO_(x =C3=97 16) + (=
15 - y)]
> +	 */
> +	return BIT(S32_PGPD_SIZE - 1 - pin % S32_PGPD_SIZE);
> +}
> +
> +static struct regmap *s32_gpio_get_regmap_offset_mask(struct gpio_chip *=
chip,
> +						      unsigned int gpio,
> +						      unsigned int *reg_offset,
> +						      u16 *mask,
> +						      bool output)
> +{
> +	struct regmap *regmap;
> +	unsigned int pad, relative_pin;
> +
> +	regmap =3D s32_gpio_get_pgpd_regmap(chip, gpio, output, &relative_pin);
> +	if (!regmap)
> +		return NULL;
> +
> +	*mask =3D s32_pin2mask(relative_pin);
> +	pad =3D s32_pin2pad(relative_pin);
> +
> +	*reg_offset =3D S32_PGPD(pad);
> +
> +	return regmap;
> +}
> +
> +static int s32_gpio_set_val(struct gpio_chip *chip, unsigned int gpio,
> +			    int value)
> +{
> +	unsigned int reg_offset;
> +	struct regmap *regmap;
> +	u16 mask;
> +
> +	regmap =3D s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
> +						 &mask, true);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	value =3D value ? mask : 0;
> +
> +	return regmap_update_bits(regmap, reg_offset, mask, value);
> +}
> +
> +static int s32_gpio_set(struct gpio_chip *chip, unsigned int gpio,
> +			int value)
> +{
> +	return s32_gpio_set_val(chip, gpio, value);
> +}
> +
> +static int s32_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	unsigned int reg_offset, value;
> +	struct regmap *regmap;
> +	u16 mask;
> +	int ret;
> +
> +	regmap =3D s32_gpio_get_regmap_offset_mask(chip, gpio, &reg_offset,
> +						 &mask, false);
> +	if (!regmap)
> +		return -EINVAL;
> +
> +	ret =3D regmap_read(regmap, reg_offset, &value);
> +	if (ret)
> +		return ret;
> +
> +	return !!(value & mask);
> +}
> +
> +static int s32_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
> +			    int val)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +	int ret;
> +
> +	ret =3D s32_gpio_set_val(chip, gpio, val);
> +	if (ret)
> +		return ret;
> +
> +	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, false);
> +}
> +
> +static int s32_gpio_dir_in(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +
> +	return s32_pmx_gpio_set_direction(ipctl->pctl, NULL, gpio, true);
> +}
> +
> +static bool s32_gpio_is_valid(struct gpio_chip *chip, unsigned int gpio)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +	const struct s32_pinctrl_soc_data *soc_data;
> +	const struct pinctrl_pin_desc *pins;
> +	int i;
> +
> +	soc_data =3D ipctl->info->soc_data;
> +	pins =3D ipctl->info->soc_data->pins;
> +	for (i =3D 0; i < soc_data->npins && pins[i].number <=3D gpio; i++)
> +		if (pins[i].number =3D=3D gpio)
> +			return true;
> +
> +	return false;
> +}
> +
> +static int s32_init_valid_mask(struct gpio_chip *chip, unsigned long *ma=
sk,
> +			       unsigned int ngpios)
> +{
> +	struct s32_pinctrl *ipctl =3D to_s32_pinctrl(chip);
> +	const struct s32_pinctrl_soc_data *soc_data;
> +	const struct pinctrl_pin_desc *pins;
> +	int i;
> +
> +	bitmap_zero(mask, ngpios);
> +
> +	soc_data =3D ipctl->info->soc_data;
> +	pins =3D soc_data->pins;
> +
> +	for (i =3D 0; i < soc_data->npins; i++)
> +		if (pins[i].number < ngpios)
> +			bitmap_set(mask, pins[i].number, 1);
> +
> +	return 0;
> +}
> +
> +static int s32_gpio_gen_names(struct device *dev, struct gpio_chip *gc,
> +			      unsigned int cnt, char **names, char *ch_index,
> +			      unsigned int *num_index)
> +{
> +	unsigned int gpio;
> +	unsigned int i;
> +
> +	/*
> +	 * GPIO names follow the format P<port>_<pin>, for example:
> +	 *   PA_00 .. PA_15, PB_00 .. PB_15, ..
> +	 *
> +	 * @num_index tracks the absolute GPIO index. The port letter is
> +	 * advanced whenever the index crosses a 16-pin boundary.
> +	 */
> +	for (i =3D 0; i < cnt; i++) {
> +		gpio =3D *num_index;
> +		if (i !=3D 0 && (gpio % 16) =3D=3D 0)
> +			(*ch_index)++;
> +
> +		if (s32_gpio_is_valid(gc, gpio)) {
> +			names[i] =3D devm_kasprintf(dev, GFP_KERNEL, "P%c_%02d",
> +						  *ch_index, gpio & 0xF);
> +			if (!names[i])
> +				return -ENOMEM;
> +		}
> +
> +		(*num_index)++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s32_gpio_populate_names(struct device *dev,
> +				   struct s32_pinctrl *ipctl)
> +{
> +	const struct s32_pinctrl_soc_data *soc_data =3D ipctl->info->soc_data;
> +	const struct s32_gpio_range *range;
> +	unsigned int num_index =3D 0;
> +	char ch_index =3D 'A';
> +	char **names;
> +	int i, ret;
> +
> +	names =3D devm_kcalloc(dev, ipctl->gc.ngpio, sizeof(*names),
> +			     GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < soc_data->num_gpio_ranges; i++) {
> +		range =3D &soc_data->gpio_ranges[i];
> +
> +		if (range->gpio_base % 16 =3D=3D 0)
> +			num_index =3D 0;
> +
> +		ret =3D s32_gpio_gen_names(dev, &ipctl->gc, range->gpio_num,
> +					 names + range->gpio_base,
> +					 &ch_index, &num_index);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Error setting SIUL2_%d names\n",
> +					     i);
> +
> +		ch_index++;
> +	}
> +
> +	ipctl->gc.names =3D (const char *const *)names;
> +
> +	return 0;
> +}
> +
> +static int s32_pinctrl_init_gpio_regmaps(struct platform_device *pdev,
> +					 struct s32_pinctrl *ipctl)
> +{
> +	const struct s32_pinctrl_soc_data *soc_data =3D ipctl->info->soc_data;
> +	static const struct regmap_config pgpd_config =3D {
> +		.reg_bits =3D 32,
> +		.val_bits =3D 16,
> +		.reg_stride =3D 2,
> +	};
> +	struct regmap_config cfg;
> +	struct resource *res;
> +	void __iomem *base;
> +	unsigned int pgpdo_idx, pgpdi_idx;
> +	unsigned int i;
> +
> +	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +		return 0;
> +
> +	ipctl->num_gpio_regmaps =3D soc_data->num_gpio_ranges;
> +	ipctl->gpio_regmaps =3D devm_kcalloc(&pdev->dev, ipctl->num_gpio_regmap=
s,
> +					   sizeof(*ipctl->gpio_regmaps),
> +					   GFP_KERNEL);
> +	if (!ipctl->gpio_regmaps)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ipctl->num_gpio_regmaps; i++) {
> +		ipctl->gpio_regmaps[i].range =3D &soc_data->gpio_ranges[i];
> +
> +		/*
> +		 * GPIO resources are placed after the pinctrl regions
> +		 */
> +		pgpdo_idx =3D soc_data->mem_regions + i * 2;
> +		pgpdi_idx =3D soc_data->mem_regions + i * 2 + 1;
> +
> +		/* PGPDO */
> +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, pgpdo_idx);
> +		if (!res)
> +			return dev_err_probe(&pdev->dev, -ENOENT,
> +						 "Missing PGPDO resource %u\n", i);
> +
> +		base =3D devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		cfg =3D pgpd_config;
> +		cfg.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdo%u", i);
> +		if (!cfg.name)
> +			return -ENOMEM;
> +
> +		cfg.max_register =3D resource_size(res) - cfg.reg_stride;
> +
> +		ipctl->gpio_regmaps[i].pgpdo =3D
> +			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
> +		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdo))
> +			return dev_err_probe(&pdev->dev,
> +						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdo),
> +						 "Failed to init PGPDO regmap %u\n", i);
> +
> +		/* PGPDI */
> +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, pgpdi_idx);
> +		if (!res)
> +			return dev_err_probe(&pdev->dev, -ENOENT,
> +						 "Missing PGPDI resource %u\n", i);
> +
> +		base =3D devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		cfg =3D pgpd_config;
> +		cfg.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "pgpdi%u", i);
> +		if (!cfg.name)
> +			return -ENOMEM;
> +
> +		cfg.max_register =3D resource_size(res) - cfg.reg_stride;
> +
> +		ipctl->gpio_regmaps[i].pgpdi =3D
> +			devm_regmap_init_mmio(&pdev->dev, base, &cfg);
> +		if (IS_ERR(ipctl->gpio_regmaps[i].pgpdi))
> +			return dev_err_probe(&pdev->dev,
> +						 PTR_ERR(ipctl->gpio_regmaps[i].pgpdi),
> +						 "Failed to init PGPDI regmap %u\n", i);
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static bool s32_pinctrl_should_save(struct s32_pinctrl *ipctl,
>  				    unsigned int pin)
> @@ -928,9 +1282,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  #ifdef CONFIG_PM_SLEEP
>  	struct s32_pinctrl_context *saved_context;
>  #endif
> +	const struct s32_gpio_range *last_range;
>  	struct pinctrl_desc *s32_pinctrl_desc;
>  	struct s32_pinctrl_soc_info *info;
>  	struct s32_pinctrl *ipctl;
> +	struct gpio_chip *gc;
>  	int ret;
>
>  	if (!soc_data || !soc_data->pins || !soc_data->npins)
> @@ -974,6 +1330,11 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Fail to probe dt properties\n");
>
> +	ret =3D s32_pinctrl_init_gpio_regmaps(pdev, ipctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +					 "Failed to init GPIO regmaps\n");
> +
>  	ret =3D devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
>  					     ipctl, &ipctl->pctl);
>  	if (ret)
> @@ -997,5 +1358,43 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>
>  	dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
> +	/* Setup GPIO if GPIO ranges are defined */
> +	if (!soc_data->gpio_ranges || !soc_data->num_gpio_ranges)
> +		return 0;
> +
> +	gc =3D &ipctl->gc;
> +	gc->parent =3D &pdev->dev;
> +	gc->label =3D dev_name(&pdev->dev);
> +	gc->base =3D -1;
> +	/*
> +	 * In some cases, there is a gap between the SIUL GPIOs.
> +	 *
> +	 * gpio_ranges[] is expected to be sorted by increasing gpio_base.
> +	 * ngpio is derived from the last range and must cover the highest
> +	 * GPIO offset, even when gaps exist in the numbering.
> +	 */
> +	last_range =3D &soc_data->gpio_ranges[soc_data->num_gpio_ranges - 1];
> +	gc->ngpio =3D last_range->gpio_base + last_range->gpio_num;
> +	ret =3D s32_gpio_populate_names(&pdev->dev, ipctl);
> +	if (ret)
> +		return ret;
> +
> +	gc->set =3D s32_gpio_set;
> +	gc->get =3D s32_gpio_get;
> +	gc->set_config =3D gpiochip_generic_config;
> +	gc->request =3D s32_gpio_request;
> +	gc->free =3D s32_gpio_free;
> +	gc->direction_output =3D s32_gpio_dir_out;
> +	gc->direction_input =3D s32_gpio_dir_in;
> +	gc->get_direction =3D s32_gpio_get_dir;
> +	gc->init_valid_mask =3D s32_init_valid_mask;
> +
> +	ret =3D devm_gpiochip_add_data(&pdev->dev, gc, ipctl);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Unable to add gpiochip\n");
> +
> +	dev_info(&pdev->dev, "Initialized S32 GPIO functionality\n");

Don't do this, there's no reason for a driver to emit logs on success.

> +
>  	return 0;
>  }
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pi=
nctrl-s32g2.c
> index c49d28793b69..b1bf328371e2 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -3,7 +3,7 @@
>   * NXP S32G pinctrl driver
>   *
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
> - * Copyright 2017-2018, 2020-2022 NXP
> + * Copyright 2017-2018, 2020-2022, 2025-2026 NXP
>   * Copyright (C) 2022 SUSE LLC
>   */
>
> @@ -773,17 +773,36 @@ static const struct s32_pin_range s32_pin_ranges_si=
ul2[] =3D {
>  	S32_PIN_RANGE(942, 1007),
>  };
>
> -static const struct s32_pinctrl_soc_data s32_pinctrl_data =3D {
> +static const struct s32_gpio_range s32_gpio_ranges_siul2[] =3D {
> +	S32_GPIO_RANGE(0, 102),
> +	S32_GPIO_RANGE(112, 79),
> +};
> +
> +/* Legacy data for old DT bindings without GPIO support */
> +static const struct s32_pinctrl_soc_data legacy_s32g_pinctrl_data =3D {
> +	.pins =3D s32_pinctrl_pads_siul2,
> +	.npins =3D ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +	.mem_pin_ranges =3D s32_pin_ranges_siul2,
> +	.mem_regions =3D ARRAY_SIZE(s32_pin_ranges_siul2),
> +};
> +
> +static const struct s32_pinctrl_soc_data s32g_pinctrl_data =3D {
>  	.pins =3D s32_pinctrl_pads_siul2,
>  	.npins =3D ARRAY_SIZE(s32_pinctrl_pads_siul2),
>  	.mem_pin_ranges =3D s32_pin_ranges_siul2,
>  	.mem_regions =3D ARRAY_SIZE(s32_pin_ranges_siul2),
> +	.gpio_ranges =3D s32_gpio_ranges_siul2,
> +	.num_gpio_ranges =3D ARRAY_SIZE(s32_gpio_ranges_siul2),
>  };
>
>  static const struct of_device_id s32_pinctrl_of_match[] =3D {
> +	{
> +		.compatible =3D "nxp,s32g2-siul2-pinctrl-gpio",
> +		.data =3D &s32g_pinctrl_data,
> +	},
>  	{
>  		.compatible =3D "nxp,s32g2-siul2-pinctrl",
> -		.data =3D &s32_pinctrl_data,
> +		.data =3D &legacy_s32g_pinctrl_data,
>  	},
>  	{ /* sentinel */ }
>  };
> --
> 2.34.1
>
>

Bart

