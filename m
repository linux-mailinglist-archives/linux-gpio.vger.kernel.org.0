Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A2131A90
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 10:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfFAI2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 04:28:51 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13619 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFAI2v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 04:28:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf237360003>; Sat, 01 Jun 2019 01:28:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 01 Jun 2019 01:28:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 01 Jun 2019 01:28:49 -0700
Received: from [10.2.175.94] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 1 Jun
 2019 08:28:46 +0000
Subject: Re: [PATCH V2 10/12] gpio: tegra: implement wake event support for
 Tegra210 and prior GPIO
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-11-git-send-email-skomatineni@nvidia.com>
 <20190529140318.GB17679@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <9f9633e0-5f45-d2ba-9758-d2a85a41ede9@nvidia.com>
Date:   Sat, 1 Jun 2019 01:28:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529140318.GB17679@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559377718; bh=2Mn+83g9lYSX5HL4pR4UbLQLsdFwFvdRDBYLBT+eapI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=UlbLJgdSTBA5HmzxDmW7Vh/SHAYjqeWsO5RPXAisT2RenbLyd+h6OEWiCm1s2s58T
         hkThcPGhldVHORCjG+BM+4NHIhmVFGnXRjnP8UfIqhNA99po0mxP81+tz7VNm9bVBf
         no4vGoCrs+70SRSO0QFWje7UZJgdrMD05nqCZGQhxd0pqveSI0GgvTYR2XKoWHpqEh
         M0LR1gDCG3eddr5Ei2YwGcn8jKZPI/8lXsdcGWrHdHUDpIo3MaZonB0qrR97Nw6HXx
         DfRlOf9KAC43y/hzIuHXgWLQDDNzC/aeyKspVm4LFMV28t4wOLmjUqkRPcTfqkmcWN
         YDklPJQZPMaJQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 5/29/19 7:03 AM, Thierry Reding wrote:
> On Tue, May 28, 2019 at 04:08:54PM -0700, Sowjanya Komatineni wrote:
>> The GPIO controller doesn't have any controls to enable the system to
>> wake up from low power states based on activity on GPIO pins. An extra
>> hardware block that is part of the power management controller (PMC)
>> contains these controls. In order for the GPIO controller to be able
>> to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
>> and make it a parent to the GPIO controller's IRQ domain. This way the
>> PMC gets an opportunity to program the additional registers required
>> to enable wakeup sources on suspend.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/gpio/gpio-tegra.c | 116 +++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 110 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>> index 6d9b6906b9d0..5190129668d3 100644
>> --- a/drivers/gpio/gpio-tegra.c
>> +++ b/drivers/gpio/gpio-tegra.c
>> @@ -32,6 +32,8 @@
>>   #include <linux/pinctrl/consumer.h>
>>   #include <linux/pm.h>
>>   
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>   #define GPIO_BANK(x)		((x) >> 5)
>>   #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
>>   #define GPIO_BIT(x)		((x) & 0x7)
>> @@ -275,8 +277,22 @@ static int tegra_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
>>   static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
>>   {
>>   	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
>> +	struct irq_domain *domain = tgi->irq_domain;
>> +
>> +	if (!gpiochip_irqchip_irq_valid(chip, offset))
>> +		return -ENXIO;
>> +
>> +	if (irq_domain_is_hierarchy(domain)) {
>> +		struct irq_fwspec spec;
>> +
>> +		spec.fwnode = domain->fwnode;
>> +		spec.param_count = 2;
>> +		spec.param[0] = offset;
>> +		spec.param[1] = IRQ_TYPE_NONE;
>> +		return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &spec);
> This looks like it was copied from the equivalent Tegra186 patch. I have
> since then changed the implementation, based on feedback by Linus, to
> not call irq_domain_alloc_irqs() here and instead call
> irq_create_fwspec_mapping(). This has the advantage of not requiring the
> irq_domain_alloc_irqs() function to be exported. It ends up calling that
> function internally, but as discussed with Linus it's also a nicer way
> to create these mappings.
>
existing gpio-tegra driver maps hwirq to virtual interrupt number using 
irq_create_mapping during gpio probe

and irq_create_fwspec_mapping() will always return virq number as virq 
number exists already and irq_domain_alloc_irqs doesn't happen.

So I was using irq_domain_alloc_irqs().


>> +	}
>>   
>> -	return irq_find_mapping(tgi->irq_domain, offset);
>> +	return irq_find_mapping(domain, offset);
>>   }
>>   
>>   static void tegra_gpio_irq_ack(struct irq_data *d)
>> @@ -365,7 +381,10 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>   	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
>>   		irq_set_handler_locked(d, handle_edge_irq);
>>   
>> -	return 0;
>> +	if (d->parent_data)
>> +		return irq_chip_set_type_parent(d, type);
>> +	else
>> +		return 0;
> There's no need for this final else. Just make it a regular "return 0;"
> at the end of the function, without the extra else branch.
>
>>   }
>>   
>>   static void tegra_gpio_irq_shutdown(struct irq_data *d)
>> @@ -503,6 +522,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>>   	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
>>   	unsigned int gpio = d->hwirq;
>>   	u32 port, bit, mask;
>> +	int ret;
>>   
>>   	port = GPIO_PORT(gpio);
>>   	bit = GPIO_BIT(gpio);
>> @@ -513,7 +533,14 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
>>   	else
>>   		bank->wake_enb[port] &= ~mask;
>>   
>> -	return irq_set_irq_wake(bank->irq, enable);
>> +	ret = irq_set_irq_wake(bank->irq, enable);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (d->parent_data)
>> +		return irq_chip_set_wake_parent(d, enable);
>> +	else
>> +		return 0;
> Same here.
>
> Thierry
