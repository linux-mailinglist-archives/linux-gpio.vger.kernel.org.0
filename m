Return-Path: <linux-gpio+bounces-13576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 924469E68F9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 09:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E1B7161A81
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 08:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B141DDA3A;
	Fri,  6 Dec 2024 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwp4SlyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771AF6FBF;
	Fri,  6 Dec 2024 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474034; cv=none; b=sBF1Pq/Fed65+aEiuT/OdYSP+aETklx+yzJp+QZT3OiJI7fWvD16gIww/Q/Mc+BtAphF1gDwTgq5SKUhLsrWtvhXZTW1SzxWyobHTG7kNyPt8ytHO1rZEE4GrwEVFzaV7SEw0gTbgdDWbP1W7Q60nDhM//aVsbNe5nQI+H0ozIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474034; c=relaxed/simple;
	bh=DdsykxjoYwGNap8VBMiXurGFc0Soee4yASPhhni6j/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lY2l8mJTi8mHssegF9oXwSo/HLMtoM+AZk994k0qGf0to3bPG6s9Mav2OLJ3d9GM9ZLAnfcXP7Sszea1G+fKlrojwA768zFhFrcmQT+IU1ksoe9vVYqfQ6Sx/JYgb9ytCAZP51452CgxH0qWL5Gccv5jaDLINux0WM9nJfrRu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwp4SlyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D8AC4CED1;
	Fri,  6 Dec 2024 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733474034;
	bh=DdsykxjoYwGNap8VBMiXurGFc0Soee4yASPhhni6j/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwp4SlyCOjqE1HX7OTfX265WGvdBBIYnnd5v2H7PnzHa0M+WMCXRw0hawTxkPyvDK
	 WQiW3Utv+26d8d7PZy095rUn82Qhc8qqFbuu+Y0wIl2b/pDP+MPnpWh9uBdrGQaZQN
	 IgPGsw9cp9OfQZcdN0wKBXzX9OtX5c73VnFf4syWEBXDSpwDH6PnYBgjAtzFLhM1P7
	 JKtDUNUOcGgXxP/J1nTc7ECVXCj5woG/a0mfJiZDw9amF9Dhh977yBYIyB5sFr2rdO
	 682Db5mC1VALKjbex0OZk+0dSIXPynaMtM5GEOO3Y0xcI3FjXtwG6rTbkhta743aEP
	 rImWaBq/Lrb4g==
Message-ID: <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
Date: Fri, 6 Dec 2024 09:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
To: Song Chen <chensong_2000@189.cn>, lgirdwood@gmail.com,
 broonie@kernel.org, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241206051358.496832-1-chensong_2000@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241206051358.496832-1-chensong_2000@189.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2024 06:13, Song Chen wrote:
> This converts s5m8767 regulator driver to use GPIO
> descriptors.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Subject: missing : after s5m prefix.

> 
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---
>  drivers/regulator/s5m8767.c      | 110 ++++++++++---------------------
>  include/linux/mfd/samsung/core.h |   5 +-
>  2 files changed, 37 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
> index d25cd81e3f36..d0b1eed4dfa0 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -5,7 +5,7 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> -#include <linux/of_gpio.h>
> +//#include <linux/of_gpio.h>

Some development code was left.

>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -15,6 +15,7 @@
>  #include <linux/mfd/samsung/s5m8767.h>
>  #include <linux/regulator/of_regulator.h>
>  #include <linux/regmap.h>
> +#include <linux/of.h>
>  
>  #define S5M8767_OPMODE_NORMAL_MODE 0x1
>  
> @@ -23,6 +24,8 @@ struct s5m8767_info {
>  	struct sec_pmic_dev *iodev;
>  	int num_regulators;
>  	struct sec_opmode_data *opmode;
> +	struct gpio_desc *buck_gpios[3];
> +	struct gpio_desc *buck_ds[3];
>  
>  	int ramp_delay;
>  	bool buck2_ramp;
> @@ -35,8 +38,7 @@ struct s5m8767_info {
>  	u8 buck2_vol[8];
>  	u8 buck3_vol[8];
>  	u8 buck4_vol[8];
> -	int buck_gpios[3];
> -	int buck_ds[3];

Don't move them.

> +

No need.

>  	int buck_gpioindex;
>  };
>  
> @@ -272,9 +274,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
>  {
>  	int temp_index = s5m8767->buck_gpioindex;
>  
> -	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> -	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> -	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>  
>  	return 0;
>  }
> @@ -283,9 +285,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
>  {
>  	int temp_index = s5m8767->buck_gpioindex;
>  
> -	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> -	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> -	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>  
>  	return 0;
>  }
> @@ -486,16 +488,22 @@ static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
>  			struct sec_platform_data *pdata,
>  			struct device_node *pmic_np)
>  {
> -	int i, gpio;
> +	int i;
> +	char label[32];
>  
>  	for (i = 0; i < 3; i++) {
> -		gpio = of_get_named_gpio(pmic_np,
> -					"s5m8767,pmic-buck-dvs-gpios", i);
> -		if (!gpio_is_valid(gpio)) {
> -			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
> +		pdata->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
> +					"s5m8767,pmic-buck-dvs", i, GPIOD_OUT_LOW);
> +		if (IS_ERR(pdata->buck_gpios[i])) {
> +			dev_err(iodev->dev, "invalid gpio[%d]\n", i);

Why not printing error msg? This should be also return dev_err_probe

>  			return -EINVAL;
>  		}
> -		pdata->buck_gpios[i] = gpio;
> +
> +		/* SET GPIO*/

What is a SET GPIO?

> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);

Why using "SET" as name, not the actual name it is used for? Buck DVS?

> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
> +		gpiod_direction_output(pdata->buck_gpios[i],
> +					(pdata->buck_default_idx >> (2 - i)) & 0x1);

This is not an equivalent code. You set values for GPIOs 0-1 even if
requesting GPIO 2 fails.

On which board did you test it?

>  	}
>  	return 0;
>  }
> @@ -504,16 +512,21 @@ static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
>  			struct sec_platform_data *pdata,
>  			struct device_node *pmic_np)
>  {
> -	int i, gpio;
> +	int i;
> +	char label[32];
>  
>  	for (i = 0; i < 3; i++) {
> -		gpio = of_get_named_gpio(pmic_np,
> -					"s5m8767,pmic-buck-ds-gpios", i);
> -		if (!gpio_is_valid(gpio)) {
> -			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
> +		pdata->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
> +					"s5m8767,pmic-buck-ds", i, GPIOD_OUT_LOW);
> +		if (IS_ERR(pdata->buck_ds[i])) {
> +			dev_err(iodev->dev, "invalid gpio[%d]\n", i);
>  			return -EINVAL;
>  		}
> -		pdata->buck_ds[i] = gpio;
> +
> +		/* SET GPIO*/
> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 DS", i + 2);
> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
> +		gpiod_direction_output(pdata->buck_gpios[i], 0);
>  	}
>  	return 0;
>  }
> @@ -785,61 +798,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
> -						pdata->buck4_gpiodvs) {
> -
> -		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
> -			!gpio_is_valid(pdata->buck_gpios[1]) ||
> -			!gpio_is_valid(pdata->buck_gpios[2])) {
> -			dev_err(&pdev->dev, "GPIO NOT VALID\n");
> -			return -EINVAL;
> -		}
> -
> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
> -					"S5M8767 SET1");
> -		if (ret)
> -			return ret;
> -
> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
> -					"S5M8767 SET2");
> -		if (ret)
> -			return ret;
> -
> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
> -					"S5M8767 SET3");
> -		if (ret)
> -			return ret;
> -
> -		/* SET1 GPIO */
> -		gpio_direction_output(pdata->buck_gpios[0],
> -				(s5m8767->buck_gpioindex >> 2) & 0x1);
> -		/* SET2 GPIO */
> -		gpio_direction_output(pdata->buck_gpios[1],
> -				(s5m8767->buck_gpioindex >> 1) & 0x1);
> -		/* SET3 GPIO */
> -		gpio_direction_output(pdata->buck_gpios[2],
> -				(s5m8767->buck_gpioindex >> 0) & 0x1);
> -	}
> -
> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
> -	if (ret)
> -		return ret;
> -
> -	/* DS2 GPIO */
> -	gpio_direction_output(pdata->buck_ds[0], 0x0);
> -	/* DS3 GPIO */
> -	gpio_direction_output(pdata->buck_ds[1], 0x0);
> -	/* DS4 GPIO */
> -	gpio_direction_output(pdata->buck_ds[2], 0x0);
> -
>  	regmap_update_bits(s5m8767->iodev->regmap_pmic,
>  			   S5M8767_REG_BUCK2CTRL, 1 << 1,
>  			   (pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index 750274d41fc0..b757f15877a3 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -33,6 +33,7 @@
>  #define STEP_12_5_MV		12500
>  #define STEP_6_25_MV		6250
>  
> +#define BULK_GPIO_COUNT		3

Where do you use ot?

>  struct gpio_desc;
>  
>  enum sec_device_type {
> @@ -77,10 +78,10 @@ int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
>  struct sec_platform_data {
>  	struct sec_regulator_data	*regulators;
>  	struct sec_opmode_data		*opmode;
> +	struct gpio_desc			*buck_gpios[3];
> +	struct gpio_desc			*buck_ds[3];
>  	int				num_regulators;
>  
> -	int				buck_gpios[3];
> -	int				buck_ds[3];

Don't move the code.

>  	unsigned int			buck2_voltage[8];
>  	bool				buck2_gpiodvs;
>  	unsigned int			buck3_voltage[8];


Best regards,
Krzysztof

