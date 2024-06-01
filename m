Return-Path: <linux-gpio+bounces-7026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F48D710C
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 18:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DEFF1F21A97
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14A215279C;
	Sat,  1 Jun 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw60ZAFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6F152517;
	Sat,  1 Jun 2024 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717258282; cv=none; b=Lgr+AEFSz7ZyeE2Hd7NYegKd+kwR4/GucqhOauBaRTuT/9pJoa/nDBe03AWwVZWiYzRUBUKQLZQA3S+VNIuvOaRJwg15PordGAwP3/t496gONdJ/rG/GPsGevGvMWIUAcm/YGcuUtjdARsjjAWjkNQ1njcT082MAtuLu15PWVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717258282; c=relaxed/simple;
	bh=M/G4EWycUwATzD14/dyBu7qr6EKd3fFH23GNEPwmMY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE8hi4NL8dVi9ZcRcL+jsKc82SEjFvorhK1EHzqDHbPTck5NnchWOLTYoyzQvvmgj/TIsludKnpvpwC+C5vKTu6buhbLG5XXBpg/3yruvUDlUzUw/YVwK/3oBbxc4esxt12Xb6PNAUlwAZJ4/mM9EvijC8/LCOqpuUbTAOjExl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw60ZAFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50439C116B1;
	Sat,  1 Jun 2024 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717258282;
	bh=M/G4EWycUwATzD14/dyBu7qr6EKd3fFH23GNEPwmMY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lw60ZAFCa2oqEvw46NpxMc+haJObJH1iKZVaqpEsEZVKcAgl8qdTlorZG/OxPy45K
	 eULIKEYDRzURrLdsHxUYbXTx2sZurI09YvSXYP+AhyKPJ4kB1bu0kfiZIztEEiV4vd
	 8APweNJL8q6kYAlqBDH/gHf6YGB+19gY6qedH1yDKhqKk2bS0/73OT/BOgR8cOoRGS
	 P5SbuuYqUwRReUNbIubYJ+lh7GToqpzGjEDpjw43flNjzMcBWT0XpGYL90J/sGQOAh
	 8WJ3KTyVQczADzFE/pwikCmZ65GM7Vc9SY91JLNYy5FXttCDjcAECQiJE9UGaG2Tqz
	 OPZYBnulfw8HQ==
Message-ID: <32137d7d-fe61-468a-a3f4-1602512104da@kernel.org>
Date: Sat, 1 Jun 2024 18:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
To: Vishnu Reddy <vishnu.reddy@samsung.com>, s.nawrocki@samsung.com,
 alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com
References: <CGME20240529070220epcas5p140580a28b93ce5cb256ef825c778c649@epcas5p1.samsung.com>
 <20240529065939.36369-1-vishnu.reddy@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240529065939.36369-1-vishnu.reddy@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2024 08:59, Vishnu Reddy wrote:
> gpiolib framework has the implementation of setting up the
> PUD configuration for GPIO pins but there is no driver support.
> 
> Add support to handle the PUD configuration request from the
> userspace in samsung pinctrl driver.
> 
> Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 51 +++++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.h |  7 ++++

Please work on latest mainline or next branches. This was based on some
older tree.


>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index ed07e23e0912..a4b6eea5e168 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -939,6 +939,56 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +/*
> + * samsung_gpio_set_pud will enable or disable the pull-down and
> + * pull-up for the gpio pins in the PUD register.
> + */
> +static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int offset,
> +				 unsigned int value)
> +{
> +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> +	const struct samsung_pin_bank_type *type = bank->type;
> +	void __iomem *reg;
> +	unsigned int data;
> +
> +	reg = bank->pctl_base + bank->pctl_offset;
> +	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
> +	data &= ~(0xf << (offset * 4));
> +	data |= value << (offset * 4);
> +	writel(data, reg + type->reg_offset[PINCFG_TYPE_PUD]);
> +}
> +
> +/*
> + * samsung_gpio_set_config will identify the type of PUD config based
> + * on the gpiolib request to enable or disable the PUD configuration.
> + */
> +static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> +				   unsigned long config)
> +{
> +	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
> +	unsigned long flags;
> +	unsigned int value = 0;
> +
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		value = DISABLE_PIN_PULL_UP_DOWN;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		value = ENABLE_PIN_PULL_DOWN;
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		value = ENABLE_PIN_PULL_UP;
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +

Missing clock.

> +	raw_spin_lock_irqsave(&bank->slock, flags);
> +	samsung_gpio_set_pud(gc, offset, value);
> +	raw_spin_unlock_irqrestore(&bank->slock, flags);

Blank line

> +	return 0;
> +}
> +
>  static const struct gpio_chip samsung_gpiolib_chip = {
>  	.request = gpiochip_generic_request,
>  	.free = gpiochip_generic_free,
> @@ -948,6 +998,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
>  	.direction_output = samsung_gpio_direction_output,
>  	.to_irq = samsung_gpio_to_irq,
>  	.add_pin_ranges = samsung_add_pin_ranges,
> +	.set_config = samsung_gpio_set_config,
>  	.owner = THIS_MODULE,
>  };
>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index ab791afaabf5..23b70ddcaccc 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -61,6 +61,13 @@ enum pincfg_type {
>  #define PIN_CON_FUNC_INPUT		0x0
>  #define PIN_CON_FUNC_OUTPUT		0x1
>  
> +/*
> + * Values for the pin PUD register.
> + */
> +#define DISABLE_PIN_PULL_UP_DOWN	0x0
> +#define ENABLE_PIN_PULL_DOWN		0x1
> +#define ENABLE_PIN_PULL_UP		0x3

This does not look right. The value is 0x2 for s3c and s5p.



Best regards,
Krzysztof


