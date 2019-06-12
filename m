Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D0342081
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 11:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730353AbfFLJQn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 05:16:43 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:53076 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730665AbfFLJQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 05:16:43 -0400
Received: (qmail 20541 invoked by uid 5089); 12 Jun 2019 09:16:41 -0000
Received: by simscan 1.2.0 ppid: 20461, pid: 20465, t: 0.0787s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 12 Jun 2019 09:16:40 -0000
Subject: Re: [PATCH v2 1/1] pinctlr: mcp23s08: Fix add_data and
 irqchip_add_nested call order
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linus.walleij@linaro.org, jkridner@gmail.com, poeschel@lemonage.de,
        gustavo@embeddedor.com, linux-gpio@vger.kernel.org
References: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
 <20190612083228.jbs7ygn62q6twedp@pengutronix.de>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <8b8275d1-e0ba-a577-a48e-4a4b90dbd108@electromag.com.au>
Date:   Wed, 12 Jun 2019 17:16:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612083228.jbs7ygn62q6twedp@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/06/2019 16:32, Marco Felsch wrote:
> Hi Phil,
> 
> thanks for the patch. Can you check that the error which should be fixed
> by commit 02e389e6 ("pinctrl: mcp23s08: fix irq setup order") do not
> appear. If so we should also add a Fixes line.
> 
G'day Marco,

I remember that one know.
I'm also using the mcp with gpio-keys driver.
I don't think I saw the same behaviour with my setup then.

I'm using the (spi) mcp23s16 (with gpio-keys), and Dmitry was using mcp23008 (i2c).

I noted at the time the difference in when
i2c_set_clientdata & spi_set_drvdata are called in the spi / i2c probe paths.

It seems wrong to call i2c_set_clientdata after devm_pinctrl_register is called.
But I'm by no means an expert.

I do have a system with an i2c variant now, but it doesn't use the gpio-keys driver.

Anyways I'm still not seeing any adverse behaviour with the patch so far.



> Regards,
>    Marco
> 
> On 19-06-12 10:24, Phil Reid wrote:
>> Currently probing of the mcp23s08 results in an error message
>> "detected irqchip that is shared with multiple gpiochips:
>> please fix the driver"
>>
>> This is due to the following:
>>
>> Call to mcp23s08_irqchip_setup() with call hierarchy:
>> mcp23s08_irqchip_setup()
>>    gpiochip_irqchip_add_nested()
>>      gpiochip_irqchip_add_key()
>>        gpiochip_set_irq_hooks()
>>
>> Call to devm_gpiochip_add_data() with call hierarchy:
>> devm_gpiochip_add_data()
>>    gpiochip_add_data_with_key()
>>      gpiochip_add_irqchip()
>>        gpiochip_set_irq_hooks()
>>
>> The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
>> but we added a irqchip due to the previous mcp23s08_irqchip_setup()
>> call. So it calls gpiochip_set_irq_hooks() a second time.
>>
>> Fix this by moving the call to devm_gpiochip_add_data before
>> the call to mcp23s08_irqchip_setup
>>
>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>> ---
>>
>> Notes:
>>      v2:
>>      - remove unrelated whitespace changes
>>
>>   drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
>> index 5d7a851..b727de56 100644
>> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
>> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
>> @@ -881,6 +881,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   	if (ret < 0)
>>   		goto fail;
>>   
>> +	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
>> +	if (ret < 0)
>> +		goto fail;
>> +
>>   	mcp->irq_controller =
>>   		device_property_read_bool(dev, "interrupt-controller");
>>   	if (mcp->irq && mcp->irq_controller) {
>> @@ -922,10 +926,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>   			goto fail;
>>   	}
>>   
>> -	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
>> -	if (ret < 0)
>> -		goto fail;
>> -
>>   	if (one_regmap_config) {
>>   		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
>>   				"mcp23xxx-pinctrl.%d", raw_chip_address);
>> -- 
>> 1.8.3.1
>>
>>
> 


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
