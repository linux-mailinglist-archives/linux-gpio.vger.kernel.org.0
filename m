Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350301643E6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 13:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgBSMHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 07:07:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:41260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgBSMHS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 07:07:18 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D2E124654;
        Wed, 19 Feb 2020 12:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582114037;
        bh=G0d/jtalHOC6e6qLE9M5tzztTcx+kJ1uXsVu0TxH0zo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nVFTh6cNOma4kRqJuBbNUn2KLIvtLdxO3qDOQXtV8bi5u17SibOCQKEdW/QObO3jd
         Fi6q9XZfOsrEsQuNvN/mtJHCpzswo5a6DTc6YxHRdYZLOZUUeTtyoBi36sHpoD1xQM
         MJ6peMN7fzrYIgiY23VgoKZ1XpUA+CMqCaa8d3Jo=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j4O8J-006Ut1-VU; Wed, 19 Feb 2020 12:07:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 Feb 2020 12:07:15 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>, marex@denx.de,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
In-Reply-To: <f82caf02-5a47-ce3e-ec85-313712ef6de0@st.com>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-3-alexandre.torgue@st.com>
 <f82caf02-5a47-ce3e-ec85-313712ef6de0@st.com>
Message-ID: <53f72a8b241da3032a42b80c86b7c6ab@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, marex@denx.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-02-19 11:34, Alexandre Torgue wrote:
> Fix Marc email address.
> 
> On 2/18/20 2:12 PM, Alexandre Torgue wrote:
>> This patch adds level interrupt support to gpio irq chip.

A commit message should not contain "this patch".

>> 
>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>> external interrupts only on edge. To be able to handle GPIO interrupt 
>> on
>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq 
>> chip)
>> is retriggered following interrupt type and gpio line value.
>> 
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>> Tested-by: Marek Vasut <marex@denx.de>
>> 
>> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c 
>> b/drivers/pinctrl/stm32/pinctrl-stm32.c
>> index 2d5e0435af0a..dae236562543 100644
>> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
>> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
>> @@ -92,6 +92,7 @@ struct stm32_gpio_bank {
>>   	u32 bank_nr;
>>   	u32 bank_ioport_nr;
>>   	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
>> +	u32 irq_type[STM32_GPIO_PINS_PER_BANK];

Do you really need a u32 here? an array of u8 seems enough. After all,
you only need two bits of information per interrupts (level or not,
low or high).

>>   };
>>     struct stm32_pinctrl {
>> @@ -303,6 +304,46 @@ static const struct gpio_chip stm32_gpio_template 
>> = {
>>   	.get_direction		= stm32_gpio_get_direction,
>>   };
>>   +void stm32_gpio_irq_eoi(struct irq_data *d)
>> +{
>> +	struct stm32_gpio_bank *bank = d->domain->host_data;
>> +	int line;
>> +
>> +	irq_chip_eoi_parent(d);
>> +
>> +	/* If level interrupt type then retrig */
>> +	line = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
>> +	if ((line == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
>> +	    (line == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
>> +		irq_chip_retrigger_hierarchy(d);

s/line/level/

>> +};
>> +
>> +static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +	struct stm32_gpio_bank *bank = d->domain->host_data;
>> +	u32 parent_type;
>> +
>> +	bank->irq_type[d->hwirq] = type;

It would make more sense if this this assignment was done *after*
sanitizing the type value.

>> +
>> +	switch (type) {
>> +	case IRQ_TYPE_EDGE_RISING:
>> +	case IRQ_TYPE_EDGE_FALLING:
>> +	case IRQ_TYPE_EDGE_BOTH:
>> +		parent_type = type;
>> +		break;
>> +	case IRQ_TYPE_LEVEL_HIGH:
>> +		parent_type = IRQ_TYPE_EDGE_RISING;
>> +		break;
>> +	case IRQ_TYPE_LEVEL_LOW:
>> +		parent_type = IRQ_TYPE_EDGE_FALLING;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return irq_chip_set_type_parent(d, parent_type);
>> +};
>> +
>>   static int stm32_gpio_irq_request_resources(struct irq_data 
>> *irq_data)
>>   {
>>   	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
>> @@ -332,11 +373,11 @@ static void 
>> stm32_gpio_irq_release_resources(struct irq_data *irq_data)
>>     static struct irq_chip stm32_gpio_irq_chip = {
>>   	.name		= "stm32gpio",
>> -	.irq_eoi	= irq_chip_eoi_parent,
>> +	.irq_eoi	= stm32_gpio_irq_eoi,
>>   	.irq_ack	= irq_chip_ack_parent,
>>   	.irq_mask	= irq_chip_mask_parent,
>>   	.irq_unmask	= irq_chip_unmask_parent,
>> -	.irq_set_type	= irq_chip_set_type_parent,
>> +	.irq_set_type	= stm32_gpio_set_type,
>>   	.irq_set_wake	= irq_chip_set_wake_parent,
>>   	.irq_request_resources = stm32_gpio_irq_request_resources,
>>   	.irq_release_resources = stm32_gpio_irq_release_resources,
>> 

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
