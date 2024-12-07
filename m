Return-Path: <linux-gpio+bounces-13604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCB9E7E84
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 07:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2F9167108
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 06:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1458839F4;
	Sat,  7 Dec 2024 06:17:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7654A1C;
	Sat,  7 Dec 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733552242; cv=none; b=fvW6zMWV5lDmi44c+jgZLEwaAQHqWSzrinSF/sM3VswKef0YlRVyzaWaZMZ8StVWAvFMwkYOOyYIz8EV5rZUBrxPRCzu4yK4Ml96rgcnte/1QrEr/z/gemyREJQbH/LrODZCeQD9tTU1vqoh8XvTpY/kNaISdpYETt2+L8/bSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733552242; c=relaxed/simple;
	bh=PoUmVQMj3+HZCDXmBV4HeEJkCnlPVo35nDRSSlrdUUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTpxQw8MHekrvla+q4muNsemDeVBDNnH1ASTx8J6pBwzp7aUXLtJY/BEX0xLTs6HjMbUfgyoeMnbQJ8puW8BkHV5pNvyw7WFEaGY3J6X55DjzEfwlAHteIdIoOLPS/eKstfhpmDgIqaKcI959Vi9epGp1nmFwFHWZHrenH2qI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.242.145:58104.1057134893
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-60.27.225.139 (unknown [10.158.242.145])
	by 189.cn (HERMES) with SMTP id DA81410299D;
	Sat,  7 Dec 2024 14:17:08 +0800 (CST)
Received: from  ([60.27.225.139])
	by gateway-153622-dep-5c5f88b874-qw5z2 with ESMTP id eb863826ac1c4ecf96d13ba9377e9762 for krzk@kernel.org;
	Sat, 07 Dec 2024 14:17:09 CST
X-Transaction-ID: eb863826ac1c4ecf96d13ba9377e9762
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 60.27.225.139
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <862662aa-c5a2-4e15-b97f-ca1b4757ab25@189.cn>
Date: Sat, 7 Dec 2024 14:16:22 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
To: Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
 broonie@kernel.org, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241206051358.496832-1-chensong_2000@189.cn>
 <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Only a question needs to be clarified, the rest of your comments is 
accepted and will be fixed accordingly.

Many thanks and best regards,

Song

在 2024/12/6 16:33, Krzysztof Kozlowski 写道:
> On 06/12/2024 06:13, Song Chen wrote:
>> This converts s5m8767 regulator driver to use GPIO
>> descriptors.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> Subject: missing : after s5m prefix.
> 
>>
>> Signed-off-by: Song Chen <chensong_2000@189.cn>
>> ---
>>   drivers/regulator/s5m8767.c      | 110 ++++++++++---------------------
>>   include/linux/mfd/samsung/core.h |   5 +-
>>   2 files changed, 37 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
>> index d25cd81e3f36..d0b1eed4dfa0 100644
>> --- a/drivers/regulator/s5m8767.c
>> +++ b/drivers/regulator/s5m8767.c
>> @@ -5,7 +5,7 @@
>>   
>>   #include <linux/cleanup.h>
>>   #include <linux/err.h>
>> -#include <linux/of_gpio.h>
>> +//#include <linux/of_gpio.h>
> 
> Some development code was left.
> 
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> @@ -15,6 +15,7 @@
>>   #include <linux/mfd/samsung/s5m8767.h>
>>   #include <linux/regulator/of_regulator.h>
>>   #include <linux/regmap.h>
>> +#include <linux/of.h>
>>   
>>   #define S5M8767_OPMODE_NORMAL_MODE 0x1
>>   
>> @@ -23,6 +24,8 @@ struct s5m8767_info {
>>   	struct sec_pmic_dev *iodev;
>>   	int num_regulators;
>>   	struct sec_opmode_data *opmode;
>> +	struct gpio_desc *buck_gpios[3];
>> +	struct gpio_desc *buck_ds[3];
>>   
>>   	int ramp_delay;
>>   	bool buck2_ramp;
>> @@ -35,8 +38,7 @@ struct s5m8767_info {
>>   	u8 buck2_vol[8];
>>   	u8 buck3_vol[8];
>>   	u8 buck4_vol[8];
>> -	int buck_gpios[3];
>> -	int buck_ds[3];
> 
> Don't move them.
> 
>> +
> 
> No need.
> 
>>   	int buck_gpioindex;
>>   };
>>   
>> @@ -272,9 +274,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
>>   {
>>   	int temp_index = s5m8767->buck_gpioindex;
>>   
>> -	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>> -	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> -	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>>   
>>   	return 0;
>>   }
>> @@ -283,9 +285,9 @@ static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
>>   {
>>   	int temp_index = s5m8767->buck_gpioindex;
>>   
>> -	gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>> -	gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> -	gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> +	gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>>   
>>   	return 0;
>>   }
>> @@ -486,16 +488,22 @@ static int s5m8767_pmic_dt_parse_dvs_gpio(struct sec_pmic_dev *iodev,
>>   			struct sec_platform_data *pdata,
>>   			struct device_node *pmic_np)
>>   {
>> -	int i, gpio;
>> +	int i;
>> +	char label[32];
>>   
>>   	for (i = 0; i < 3; i++) {
>> -		gpio = of_get_named_gpio(pmic_np,
>> -					"s5m8767,pmic-buck-dvs-gpios", i);
>> -		if (!gpio_is_valid(gpio)) {
>> -			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
>> +		pdata->buck_gpios[i] = devm_gpiod_get_index(iodev->dev,
>> +					"s5m8767,pmic-buck-dvs", i, GPIOD_OUT_LOW);
>> +		if (IS_ERR(pdata->buck_gpios[i])) {
>> +			dev_err(iodev->dev, "invalid gpio[%d]\n", i);
> 
> Why not printing error msg? This should be also return dev_err_probe
> 
>>   			return -EINVAL;
>>   		}
>> -		pdata->buck_gpios[i] = gpio;
>> +
>> +		/* SET GPIO*/
> 
> What is a SET GPIO?
> 
>> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
> 
> Why using "SET" as name, not the actual name it is used for? Buck DVS?

from below snippets:
s5m8767_pmic_probe of drivers/regulator/s5m8767.c
         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
                     "S5M8767 SET1");
         if (ret)
             return ret;

         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
                     "S5M8767 SET2");
         if (ret)
             return ret;

         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
                     "S5M8767 SET3");

and arch/arm/boot/dts/samsung/exynos5250-spring.dts

         s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>, /* DVS1 */
                           <&gpd1 1 GPIO_ACTIVE_LOW>, /* DVS2 */
                           <&gpd1 2 GPIO_ACTIVE_LOW>; /* DVS3 */

         s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>, /* SET1 */
                          <&gpx2 4 GPIO_ACTIVE_LOW>, /* SET2 */
                          <&gpx2 5 GPIO_ACTIVE_LOW>; /* SET3 */

> 
>> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
>> +		gpiod_direction_output(pdata->buck_gpios[i],
>> +					(pdata->buck_default_idx >> (2 - i)) & 0x1);
> 
> This is not an equivalent code. You set values for GPIOs 0-1 even if
> requesting GPIO 2 fails.
> 
> On which board did you test it?

You are right ,it's not equivalent with original code, i will fix it. 
but i have a question here:

         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
                     "S5M8767 SET1");
         if (ret)
             return ret;

         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
                     "S5M8767 SET2");
         if (ret)
             return ret;

         ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
                     "S5M8767 SET3");
         if (ret)
             return ret;

if it fails to request buck_gpios[2] after successfully requests 
buck_gpios[0] and buck_gpios[1], the probe fails as well, should it call 
gpiod_put to return gpio resource?



> 
>>   	}
>>   	return 0;
>>   }
>> @@ -504,16 +512,21 @@ static int s5m8767_pmic_dt_parse_ds_gpio(struct sec_pmic_dev *iodev,
>>   			struct sec_platform_data *pdata,
>>   			struct device_node *pmic_np)
>>   {
>> -	int i, gpio;
>> +	int i;
>> +	char label[32];
>>   
>>   	for (i = 0; i < 3; i++) {
>> -		gpio = of_get_named_gpio(pmic_np,
>> -					"s5m8767,pmic-buck-ds-gpios", i);
>> -		if (!gpio_is_valid(gpio)) {
>> -			dev_err(iodev->dev, "invalid gpio[%d]: %d\n", i, gpio);
>> +		pdata->buck_ds[i] = devm_gpiod_get_index(iodev->dev,
>> +					"s5m8767,pmic-buck-ds", i, GPIOD_OUT_LOW);
>> +		if (IS_ERR(pdata->buck_ds[i])) {
>> +			dev_err(iodev->dev, "invalid gpio[%d]\n", i);
>>   			return -EINVAL;
>>   		}
>> -		pdata->buck_ds[i] = gpio;
>> +
>> +		/* SET GPIO*/
>> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 DS", i + 2);
>> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
>> +		gpiod_direction_output(pdata->buck_gpios[i], 0);
>>   	}
>>   	return 0;
>>   }
>> @@ -785,61 +798,6 @@ static int s5m8767_pmic_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> -	if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs ||
>> -						pdata->buck4_gpiodvs) {
>> -
>> -		if (!gpio_is_valid(pdata->buck_gpios[0]) ||
>> -			!gpio_is_valid(pdata->buck_gpios[1]) ||
>> -			!gpio_is_valid(pdata->buck_gpios[2])) {
>> -			dev_err(&pdev->dev, "GPIO NOT VALID\n");
>> -			return -EINVAL;
>> -		}
>> -
>> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>> -					"S5M8767 SET1");
>> -		if (ret)
>> -			return ret;
>> -
>> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>> -					"S5M8767 SET2");
>> -		if (ret)
>> -			return ret;
>> -
>> -		ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>> -					"S5M8767 SET3");
>> -		if (ret)
>> -			return ret;
>> -
>> -		/* SET1 GPIO */
>> -		gpio_direction_output(pdata->buck_gpios[0],
>> -				(s5m8767->buck_gpioindex >> 2) & 0x1);
>> -		/* SET2 GPIO */
>> -		gpio_direction_output(pdata->buck_gpios[1],
>> -				(s5m8767->buck_gpioindex >> 1) & 0x1);
>> -		/* SET3 GPIO */
>> -		gpio_direction_output(pdata->buck_gpios[2],
>> -				(s5m8767->buck_gpioindex >> 0) & 0x1);
>> -	}
>> -
>> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[0], "S5M8767 DS2");
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[1], "S5M8767 DS3");
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = devm_gpio_request(&pdev->dev, pdata->buck_ds[2], "S5M8767 DS4");
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* DS2 GPIO */
>> -	gpio_direction_output(pdata->buck_ds[0], 0x0);
>> -	/* DS3 GPIO */
>> -	gpio_direction_output(pdata->buck_ds[1], 0x0);
>> -	/* DS4 GPIO */
>> -	gpio_direction_output(pdata->buck_ds[2], 0x0);
>> -
>>   	regmap_update_bits(s5m8767->iodev->regmap_pmic,
>>   			   S5M8767_REG_BUCK2CTRL, 1 << 1,
>>   			   (pdata->buck2_gpiodvs) ? (1 << 1) : (0 << 1));
>> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
>> index 750274d41fc0..b757f15877a3 100644
>> --- a/include/linux/mfd/samsung/core.h
>> +++ b/include/linux/mfd/samsung/core.h
>> @@ -33,6 +33,7 @@
>>   #define STEP_12_5_MV		12500
>>   #define STEP_6_25_MV		6250
>>   
>> +#define BULK_GPIO_COUNT		3
> 
> Where do you use ot?
> 
>>   struct gpio_desc;
>>   
>>   enum sec_device_type {
>> @@ -77,10 +78,10 @@ int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
>>   struct sec_platform_data {
>>   	struct sec_regulator_data	*regulators;
>>   	struct sec_opmode_data		*opmode;
>> +	struct gpio_desc			*buck_gpios[3];
>> +	struct gpio_desc			*buck_ds[3];
>>   	int				num_regulators;
>>   
>> -	int				buck_gpios[3];
>> -	int				buck_ds[3];
> 
> Don't move the code.
> 
>>   	unsigned int			buck2_voltage[8];
>>   	bool				buck2_gpiodvs;
>>   	unsigned int			buck3_voltage[8];
> 
> 
> Best regards,
> Krzysztof
> 


