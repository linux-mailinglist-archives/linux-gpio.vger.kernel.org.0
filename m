Return-Path: <linux-gpio+bounces-8067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6500928541
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 11:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DD512839B0
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 09:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023D8146D71;
	Fri,  5 Jul 2024 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBtx7k4Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF39146A8E
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720172316; cv=none; b=K3WXwbQRLjD9QLYWIFqzIpw4rYcx9z8e0iqLZedrVeT5RnfySvSLfNnv4C/p8EE6huZtlSnxQRa2uOZH9YqzzhXdM0bSjay1p0dPhNzcwnFm92KWuPDonPfr5pISFnJxH4vHaj98F6AbeLPVKby25HTHQyZ4gUgE/hfN9no32ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720172316; c=relaxed/simple;
	bh=H3LIhSNZQKMYtlqW8KsC915SQX2x44dGDfWPEwylGvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHW70ASTS2d5V0GaiwhMZ3huzy22zJHjU9+ZaqTmlGPHmj+9yE0WlOFYQP6z5zt7xBJbNGG9AWL9VcaTUvoHvIoEH6W5qxpe1c//Rtnzps2VgPuVOjNB1zLrigKXb45yI64Z78KMVIlTT2EmZeO+TTUv6uZDvB4liZiNJH/uRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBtx7k4Q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-425809eef0eso9586205e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2024 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720172313; x=1720777113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ObbfnTF/ig6JDQuTygy6iiFA4DAAf48nruHQbJOCnXQ=;
        b=yBtx7k4Q3uK3VpOPEwQMi5t7cpws53I91OTxKLZNFFDrBGPosQJ029jue6g9wJI+gp
         TV8m0fD36HVzk+MYoAgrDtppiyl4vEAwSVzGbGKJLwIDDCArME2hlCBkN6svIv6abrnW
         UaXDVtytnJEVZBT8NVZBHPG/SgkoHLFd41FLUVFYQCvxsT0pBXv1dhJxD7CDpWOGtu2B
         tIFSxpfDrRSDJeqwpnkaErQ2gIlb2Zks3rOAsbvyS0ZVZnbXIokQ/rlBjuDPAMAnaWUm
         p3gFRzytVAznJUMsdnmTfy+IImI5k3Z+WzdkgrxoSq4gqsxFmABtrGWpoMWjAz05kpdX
         FJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172313; x=1720777113;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObbfnTF/ig6JDQuTygy6iiFA4DAAf48nruHQbJOCnXQ=;
        b=NW9MgqGgvGXOSdTaeOUK+MzI19J2WSCaWeSPiQ9LuUaSfahotVSXBdWtUA5+PjbxlV
         CYXXjdYYcPHaiz69K58SOiduIpOEKweqfx32a0FwiU0CGCgANmOFRvU76/IKhD9uBFFr
         iRB0iNI2YBdG3Ujh6iJmynnn1T6zYp3NDMV41F/dCIkrla1MSo1gqLZhZzGF/PAFqRky
         PxV9PCv0/NL0FUklr8NortcxZ1C+qJPvX/dqzFNNtSLIRFZQx+8B9tOv/LAIYNp6Vnhi
         1m0RgaY/I4dCIKJvrrj9FVwEU35pK0QHA+o0I6pGhY+Rqf9HvgeQ+E33LyxwrOKPIS1l
         JKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe+ctSFfyzd45EK8RGXiuqC0mw2VFqiT+C8xvcFS0+fFLRmfRpZMkQQWQALBTuNQ9jMT1BdupFwxCBKz+O/qorb/btCXQw+PseGg==
X-Gm-Message-State: AOJu0Yw3wi0dKXwaD/ZGs6c7KBfemoRNSwrruwEO4PbBNIssJrTOMT5T
	XzzfhVqZnoavSQI4x4Ltp9i+QcsLV2nv1ydd/KyLZdCerPCRqU6M1zGbxfQJ/Ew=
X-Google-Smtp-Source: AGHT+IENEoehOBqKgKCrQHFL2ATAv5msu6AWrdhCuFQer5ew34/sZeVqsGuzLlH59WB4CY92L/619w==
X-Received: by 2002:a5d:5184:0:b0:363:e0e2:eeff with SMTP id ffacd0b85a97d-3679dd3cb6cmr2609570f8f.20.1720172313033;
        Fri, 05 Jul 2024 02:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367957d3451sm5781084f8f.101.2024.07.05.02.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 02:38:32 -0700 (PDT)
Message-ID: <4781d95e-a44c-423b-97b6-973c1826a1ab@linaro.org>
Date: Fri, 5 Jul 2024 11:38:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: samsung: Add support for pull-up and
 pull-down
To: Vishnu Reddy <vishnu.reddy@samsung.com>, s.nawrocki@samsung.com,
 alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff@epcas5p2.samsung.com>
 <20240704042629.26151-1-vishnu.reddy@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240704042629.26151-1-vishnu.reddy@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/2024 06:26, Vishnu Reddy wrote:
> gpiolib framework has the implementation of setting up the
> PUD configuration for GPIO pins but there is no driver support.
> 
> Add support to handle the PUD configuration request from the
> userspace in samsung pinctrl driver.
> 
> Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 15 ++++
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c    | 15 ++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c    | 80 ++++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.h    | 24 ++++++
>  4 files changed, 134 insertions(+)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> index 85ddf49a5188..426d1daacef2 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> @@ -40,6 +40,20 @@ static const struct samsung_pin_bank_type bank_type_alive = {
>  #define S5P_OTHERS_RET_MMC		(1 << 29)
>  #define S5P_OTHERS_RET_UART		(1 << 28)
>  
> +/*
> + * s5pv210_pud_value_init: initialize the drvdata pud_val with s5pv210 pud values
> + * s5pv210_pull_disable:	0
> + * s5pv210_pull_down_enable:	1
> + * s5pv210_pull_up_enable:	2

Please use proper defines, e.g. S5P_PIN_PUD_PULL_DISABLE


> + */
> +static void s5pv210_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
> +{
> +	unsigned int i, *pud_val = drvdata->pud_val;
> +
> +	for (i = 0; i < PUD_MAX; i++)
> +		pud_val[i] = i;

pud_val[PUD_PULL_DISABLE] = PROPER_DEFINE

> +}
> +
>  static void s5pv210_retention_disable(struct samsung_pinctrl_drv_data *drvdata)
>  {
>  	void __iomem *clk_base = (void __iomem *)drvdata->retention_ctrl->priv;
> @@ -133,6 +147,7 @@ static const struct samsung_pin_ctrl s5pv210_pin_ctrl[] __initconst = {
>  		.nr_banks	= ARRAY_SIZE(s5pv210_pin_bank),
>  		.eint_gpio_init = exynos_eint_gpio_init,
>  		.eint_wkup_init = exynos_eint_wkup_init,
> +		.pud_value_init	= s5pv210_pud_value_init,
>  		.suspend	= exynos_pinctrl_suspend,
>  		.resume		= exynos_pinctrl_resume,
>  		.retention_data	= &s5pv210_retention_data,
> diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> index c5d92db4fdb1..cf57b0f16999 100644
> --- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> +++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> @@ -255,6 +255,20 @@ static int s3c64xx_irq_get_trigger(unsigned int type)
>  	return trigger;
>  }
>  
> +/*
> + * s3c64xx_pud_value_init: initialize the drvdata pud_val with s3c64xx pud values
> + * s3c64xx_pull_disable:	0
> + * s3c64xx_pull_down_enable:	1
> + * s3c64xx_pull_up_enable:	2

Use proper defines. Comments are not the place to define magic values.


> + */
> +static void s3c64xx_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
> +{
> +	unsigned int i, *pud_val = drvdata->pud_val;
> +
> +	for (i = 0; i < PUD_MAX; i++)
> +		pud_val[i] = i;
> +}
> +
>  static void s3c64xx_irq_set_handler(struct irq_data *d, unsigned int type)
>  {
>  	/* Edge- and level-triggered interrupts need different handlers */
> @@ -797,6 +811,7 @@ static const struct samsung_pin_ctrl s3c64xx_pin_ctrl[] __initconst = {
>  		.nr_banks	= ARRAY_SIZE(s3c64xx_pin_banks0),
>  		.eint_gpio_init = s3c64xx_eint_gpio_init,
>  		.eint_wkup_init = s3c64xx_eint_eint0_init,
> +		.pud_value_init	= s3c64xx_pud_value_init,
>  	},
>  };
>  
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 623df65a5d6f..7d7e924c1fdb 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -997,6 +997,80 @@ static int samsung_pinctrl_unregister(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +/*
> + *samsung_pud_value_init: initialize the drvdata pud_val

You use some weird style of comments. It's not kerneldoc, it's not a
proper neither useful comment. Either use proper kerneldoc (and test
it!) or drop duplicated function names. They are not helping. This
applies everywhere.


> + */
> +static void samsung_pud_value_init(struct samsung_pinctrl_drv_data *drvdata)
> +{
> +	unsigned int  *pud_val = drvdata->pud_val;
> +
> +	pud_val[PUD_PULL_DISABLE] = PIN_PUD_PULL_UP_DOWN_DISABLE;
> +	pud_val[PUD_PULL_DOWN] = PIN_PUD_PULL_DOWN_ENABLE;
> +	pud_val[PUD_PULL_UP] = PIN_PUD_PULL_UP_ENABLE;
> +}
> +
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
> +	unsigned int data, mask;
> +
> +	reg = bank->pctl_base + bank->pctl_offset;
> +	data = readl(reg + type->reg_offset[PINCFG_TYPE_PUD]);
> +	mask = (1 << type->fld_width[PINCFG_TYPE_PUD]) - 1;
> +	data &= ~(mask << (offset * type->fld_width[PINCFG_TYPE_PUD]));
> +	data |= value << (offset * type->fld_width[PINCFG_TYPE_PUD]);
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
> +	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
> +	unsigned int value;
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		value = drvdata->pud_val[PUD_PULL_DISABLE];
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		value = drvdata->pud_val[PUD_PULL_DOWN];
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		value = drvdata->pud_val[PUD_PULL_UP];
> +		break;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	ret = clk_enable(drvdata->pclk);
> +	if (ret) {
> +		dev_err(drvdata->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	raw_spin_lock_irqsave(&bank->slock, flags);
> +	samsung_gpio_set_pud(gc, offset, value);
> +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	clk_disable(drvdata->pclk);
> +
> +	return ret;
> +}
> +
>  static const struct gpio_chip samsung_gpiolib_chip = {
>  	.request = gpiochip_generic_request,
>  	.free = gpiochip_generic_free,
> @@ -1006,6 +1080,7 @@ static const struct gpio_chip samsung_gpiolib_chip = {
>  	.direction_output = samsung_gpio_direction_output,
>  	.to_irq = samsung_gpio_to_irq,
>  	.add_pin_ranges = samsung_add_pin_ranges,
> +	.set_config = samsung_gpio_set_config,
>  	.owner = THIS_MODULE,
>  };
>  
> @@ -1237,6 +1312,11 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
>  	if (ctrl->eint_wkup_init)
>  		ctrl->eint_wkup_init(drvdata);
>  
> +	if (ctrl->pud_value_init)
> +		ctrl->pud_value_init(drvdata);
> +	else
> +		samsung_pud_value_init(drvdata);
> +
>  	ret = samsung_gpiolib_register(pdev, drvdata);
>  	if (ret)
>  		goto err_unregister;
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
> index d50ba6f07d5d..61384096b6d7 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -61,6 +61,28 @@ enum pincfg_type {
>  #define PIN_CON_FUNC_INPUT		0x0
>  #define PIN_CON_FUNC_OUTPUT		0x1
>  
> +/*
> + * Values for the pin PUD register.
> + */
> +#define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0

EXYNOS_PIN_PUD_PULL_DISABLE

> +#define PIN_PUD_PULL_DOWN_ENABLE	0x1

EXYNOS_PIN_PID_PULL_DOWN

> +#define PIN_PUD_PULL_UP_ENABLE		0x3

EXYNOS_PIN_PID_PULL_UP

> +
> +/*
> + * enum pud_index: Index values to access the pud_val array in
> + *	struct samsung_pinctrl_drv_data.
> + * @PUD_PULL_DISABLE: Index for value of pud disable
> + * @PUD_PULL_DOWN: Index for the value of pull down enable
> + * @PUD_PULL_UP: Index for the value of pull up enable
> + * @PUD_MAX: Maximun value of the index

Typo: Maximum

> + */
> +enum pud_index {
> +	PUD_PULL_DISABLE,
> +	PUD_PULL_DOWN,
> +	PUD_PULL_UP,
> +	PUD_MAX,
> +};

Best regards,
Krzysztof


