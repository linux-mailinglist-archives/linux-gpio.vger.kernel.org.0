Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A5C8AF51
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 08:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfHMGKo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 02:10:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:50516 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfHMGKo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Aug 2019 02:10:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 23:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; 
   d="scan'208";a="177709469"
Received: from rfried-mobl.ger.corp.intel.com (HELO [10.249.82.228]) ([10.249.82.228])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 23:10:41 -0700
Subject: Re: [PATCH v2] gpiolib: Take MUX usage into account
To:     Stefan Wahren <wahrenst@gmx.net>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190813014210.15519-1-ramon.fried@linux.intel.com>
 <1650c967-5176-70db-ff9a-b2af432ba1e7@i2se.com>
From:   "Fried, Ramon" <ramon.fried@linux.intel.com>
Message-ID: <88cbb5b2-fd95-afb3-3645-e5b799844941@linux.intel.com>
Date:   Tue, 13 Aug 2019 09:10:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1650c967-5176-70db-ff9a-b2af432ba1e7@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/13/2019 08:38, Stefan Wahren wrote:
> Hi Ramon,
>
> On 13.08.19 03:42, Ramon Fried wrote:
>> From: Stefan Wahren <stefan.wahren@i2se.com>
>>
>> The user space like gpioinfo only see the GPIO usage but not the
>> MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
>> pin is free/safe to use. So take the MUX usage of strict pinmux controllers
>> into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>> Tested-by: Ramon Fried <rfried.dev@gmail.com>
>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>> ---
>> v2: Address review from linus:
>> * ** Please notive logic was reversed **
>> * renamed pinctrl_gpio_is_in_use() to pinctrl_gpio_can_use_line()
>> * renamed pinmux_is_in_use() to pinmux_can_be_used_for_gpio()
>> * changed dev_err to dev_dbg (Linus suggested removing it altogether, I
>>    find it better to keep it for debug).
> thanks for taking care of this.
>>   drivers/gpio/gpiolib.c           |  3 ++-
>>   drivers/pinctrl/core.c           | 28 ++++++++++++++++++++++++++++
>>   drivers/pinctrl/pinmux.c         | 27 +++++++++++++++++++++++++++
>>   drivers/pinctrl/pinmux.h         |  8 ++++++++
>>   include/linux/pinctrl/consumer.h |  6 ++++++
>>   5 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index f497003f119c..52937bf8e514 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1084,7 +1084,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>   		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
>>   		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
>>   		    test_bit(FLAG_EXPORT, &desc->flags) ||
>> -		    test_bit(FLAG_SYSFS, &desc->flags))
>> +		    test_bit(FLAG_SYSFS, &desc->flags) ||
>> +		    !pinctrl_gpio_can_use_line(chip->base + lineinfo.line_offset))
>>   			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
>>   		if (test_bit(FLAG_IS_OUT, &desc->flags))
>>   			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
>> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
>> index b70df27874d1..2bbd8ee93507 100644
>> --- a/drivers/pinctrl/core.c
>> +++ b/drivers/pinctrl/core.c
>> @@ -736,6 +736,34 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
>>   	return -EINVAL;
>>   }
>>   
>> +bool pinctrl_gpio_can_use_line(unsigned gpio)
>> +{
>> +	struct pinctrl_dev *pctldev;
>> +	struct pinctrl_gpio_range *range;
>> +	bool result;
>> +	int pin;
>> +
>> +	/*
>> +	 * Try to obtain GPIO range, if it fails
>> +	 * we're probably dealing with GPIO driver
>> +	 * without a backing pin controller - bail out.
>> +	 */
>> +	if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
>> +		return true;
>> +
>> +	mutex_lock(&pctldev->mutex);
>> +
>> +	/* Convert to the pin controllers number space */
>> +	pin = gpio_to_pin(range, gpio);
>> +
>> +	result = pinmux_can_be_used_for_gpio(pctldev, pin);
>> +
>> +	mutex_unlock(&pctldev->mutex);
>> +
>> +	return result;
>> +}
>> +EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
>> +
>>   /**
>>    * pinctrl_gpio_request() - request a single pin to be used as GPIO
>>    * @gpio: the GPIO pin number from the GPIO subsystem number space
>> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
>> index 020e54f843f9..7e42a5738d82 100644
>> --- a/drivers/pinctrl/pinmux.c
>> +++ b/drivers/pinctrl/pinmux.c
>> @@ -70,6 +70,33 @@ int pinmux_validate_map(const struct pinctrl_map *map, int i)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * pinmux_can_be_used_for_gpio() - check if a specific pin
>> + *	is either muxed to a different function or used as gpio.
>> + *
>> + * @pin: the pin number in the global pin space
>> + *
>> + * Controllers not defined as strict will always return true,
>> + * menaning that the gpio can be used.
>> + */
>> +bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin)
>> +{
>> +	struct pin_desc *desc = pin_desc_get(pctldev, pin);
>> +	const struct pinmux_ops *ops = pctldev->desc->pmxops;
>> +
>> +	if (!desc) {
>> +		dev_dbg(pctldev->dev,
>> +			"pin %u is not registered so it cannot be requested\n",
>> +			pin);
>> +		return true;
> This return value looks strange to me.

Basically, it's just the reversed return value you returned in the 
original patch,
It means in this context that if the pin is not owned by a 
pin-controller it can be used for GPIO.

Thanks,
Ramon.

>
> Stefan
>
