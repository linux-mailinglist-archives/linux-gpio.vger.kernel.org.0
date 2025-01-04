Return-Path: <linux-gpio+bounces-14512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461EBA0164D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 19:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934391883972
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0CF1D5146;
	Sat,  4 Jan 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMp3zMV8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A011CA0;
	Sat,  4 Jan 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736015239; cv=none; b=T/LcaoPGBo0XAsfWwuLBYqPddAZrfS4+vmGtG5N6Fmqf2tSdCiVawMHA+hwEecT3AXkIWaFVl6a8KuBCiQVCI2F/0GKnIDeIR7AOM/aordzgVDiciROFG3FR4z9RPRdysdX0nN7/DMEsY5bAdknrHXL6lIC75oX4VXIDgP08Xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736015239; c=relaxed/simple;
	bh=BH66K8lXTf9eqFuEkzO0oGIOGGi90rxH6n9eHL+ullk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWQt5kodtR/4Pb/ijFqaAIBWOZHsjKOHVCvoubNRkKMWiD1dVHDHIwa1BEletbTg5O8CYtvyzqVJcaHn8Is2ts9zxbL1WmnRQyzvFTDKp+onSkQur88NMKzeV7ts78IW2nlypVQHFciTOvAjXpJcUBiiuggNPl+58gg9KYa5qyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMp3zMV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B75C4CED1;
	Sat,  4 Jan 2025 18:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736015239;
	bh=BH66K8lXTf9eqFuEkzO0oGIOGGi90rxH6n9eHL+ullk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jMp3zMV8uzDg0JaqO9RTj1mAlUTL8m1Y2gDiIXTpvKD+ABwvDwX6F6IE/jh67ybtc
	 dapzHoHtFEmrVsKz0gozdKKRmKgGD9HPtP7LN+vLGHzjSYujFPm/QRqhtx2kbUbqHr
	 yBzsOCS1HcTzLuCO4XWXVYSAkdy99+LzeIUF7/JPNI2IHadVMS1s4JJxtrQ+g8IqFv
	 vvanmRu7Hh15Gm5vtkfd0WvMKGkgUiXbwfz2rRN9IuVEzjiC7uC9l1d1aXL0kGQvoE
	 RscsX0+MBFGKVTki0lpDzsNzkp8gzgADEJXsBskkogaVsgRS2/+GWN6Vsd42hjlimJ
	 FxaTaQkf+jt1w==
Message-ID: <a34f42fb-30e0-426b-8efe-9be0c0494fe7@kernel.org>
Date: Sat, 4 Jan 2025 20:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio tps65215: Add support for varying gpio/offset
 values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
References: <20250103225407.196068-1-s-ramamoorthy@ti.com>
 <20250103225407.196068-4-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250103225407.196068-4-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2025 00:54, Shree Ramamoorthy wrote:
> Add device-specific structs to select the different PMIC .npgio and .offset
> values. With the chip_data struct values selected based on the match data,
> having a separate GPIO0_OFFSET macro is no longer needed.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/gpio/gpio-tps65219.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 70a4410c473a..14286dd5fdfb 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -13,7 +13,6 @@
>  #include <linux/regmap.h>
>  
>  #define TPS65219_GPIO0_DIR_MASK		BIT(3)
> -#define TPS65219_GPIO0_OFFSET		2
>  #define TPS6521X_GPIO0_IDX			0
>  
>  struct tps65219_gpio {
> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>  	struct tps65219 *tps;
>  };
>  
> +struct tps65219_chip_data {
> +	int ngpio;
> +	int offset;
> +};
> +
>  static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
>  	struct device *dev = gpio->tps->dev;
>  	int v, mask, bit;
>  
> -	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
> +	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.ngpio - 1) : offset - 1;

shouldn't this be
	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset - 1) : offset - 1;

>  
>  	mask = BIT(bit);
>  	v = value ? mask : 0;
> @@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chip = {
>  	.get			= tps65219_gpio_get,
>  	.set			= tps65219_gpio_set,
>  	.base			= -1,
> -	.ngpio			= 3,
>  	.can_sleep		= true,
>  };
>  
> +static const struct tps65219_chip_data chip_info_table[] = {
> +	[TPS65215] = {
> +		.ngpio = 2,
> +		.offset = 1,
> +	},
> +	[TPS65219] = {
> +		.ngpio = 3,
> +		.offset = 2,
> +	},
> +};
> +
>  static int tps65219_gpio_probe(struct platform_device *pdev)
>  {
>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>  	struct tps65219_gpio *gpio;
> +	const struct tps65219_chip_data *pmic;
> +
> +	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
> +

unnecessary newline?

> +	pmic = &chip_info_table[chip];
>

here too?
  
>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -164,6 +183,8 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
>  	gpio->tps = tps;
>  	gpio->gpio_chip = tps65219_template_chip;
>  	gpio->gpio_chip.label = dev_name(&pdev->dev);
> +	gpio->gpio_chip.ngpio =  pmic->ngpio;
> +	gpio->gpio_chip.offset = pmic->offset;
>  	gpio->gpio_chip.parent = tps->dev;
>  
>  	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);

-- 
cheers,
-roger


