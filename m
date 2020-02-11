Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B32E158C5D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 11:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgBKKIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 05:08:48 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48254 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727561AbgBKKIs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Feb 2020 05:08:48 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01BA4R3C014422;
        Tue, 11 Feb 2020 11:08:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=TwPRE10MrHGJ+ok36qcGjNbTRRU/wDoMTVxqEqGhrRs=;
 b=Wds27R0iOAr36uRNOdD6PjfMDrZifimR8AmTtIFfXDi/0v/oaYcHM15rH8dzHO4R05AU
 kLW1CADhGoZjhLPAof7EgUN4qmkuhCl88p+hroMyw67yDn+0nafMqj+2hzebmS+Z8YRl
 HbwmAPt3mUWDktEhehyBDgSD0n39WiPyfCKHWhhHF31Ml61OVbTNStXBBnupaTzc0cj1
 YGaEu0Azncc7/7GkTx+2VEqDCM+itH5R2DW6J0vSuLw+PC3E2c2Obj6oS/QRruDc2XPg
 OkY156Mzn29Ik29Y6vONbvhoYo9SB+u8bbKqW33TxHtT76bPClZYPNVJllh2/u6DSw0R hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1ud9ks63-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Feb 2020 11:08:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EBA010002A;
        Tue, 11 Feb 2020 11:08:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79B502AD23D;
        Tue, 11 Feb 2020 11:08:30 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 11 Feb
 2020 11:08:29 +0100
Subject: Re: [PATCH 2/2] pinctrl: stm32: Add level interrupt support to gpio
 irq chip
To:     Marek Vasut <marex@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20200210134901.1939-1-alexandre.torgue@st.com>
 <20200210134901.1939-3-alexandre.torgue@st.com>
 <377b0895-aaeb-b12e-cad7-469332787b4e@denx.de>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <dd6434a7-aff1-94ec-2fdf-51374c695ada@st.com>
Date:   Tue, 11 Feb 2020 11:08:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <377b0895-aaeb-b12e-cad7-469332787b4e@denx.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-11_02:2020-02-10,2020-02-11 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marek

On 2/10/20 7:39 PM, Marek Vasut wrote:
> On 2/10/20 2:49 PM, Alexandre Torgue wrote:
>> This patch adds level interrupt support to gpio irq chip.
>>
>> GPIO hardware block is directly linked to EXTI block but EXTI handles
>> external interrupts only on edge. To be able to handle GPIO interrupt on
>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
>> is retriggered following interrupt type and gpio line value.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
>> index 2d5e0435af0a..04e1b062c20e 100644
>> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
>> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
>> @@ -89,6 +89,7 @@ struct stm32_gpio_bank {
>>   	struct pinctrl_gpio_range range;
>>   	struct fwnode_handle *fwnode;
>>   	struct irq_domain *domain;
>> +	u32 irq_type[STM32_GPIO_PINS_PER_BANK];
> 
> You might want reverse xmas tree order here.

I agree

> 
>>   	u32 bank_nr;
>>   	u32 bank_ioport_nr;
>>   	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
>> @@ -303,6 +304,48 @@ static const struct gpio_chip stm32_gpio_template = {
>>   	.get_direction		= stm32_gpio_get_direction,
>>   };
>>   
>> +void stm32_gpio_irq_eoi(struct irq_data *d)
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
>> +};
>> +
>> +static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +	struct stm32_gpio_bank *bank = d->domain->host_data;
>> +	u32 parent_type;
>> +
>> +	bank->irq_type[d->hwirq] = type;
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
>> +	irq_chip_set_type_parent(d, parent_type);
> 
> irq_chip_set_type_parent() returns error code, shouldn't that be handled?

Yes. It'll be fixed in v2.

> 
> Otherwise, tested on STM32MP1 with KSZ8851-16MLL NIC.

Thanks
