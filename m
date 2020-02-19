Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA52164376
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 12:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgBSLec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 06:34:32 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23750 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726530AbgBSLec (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Feb 2020 06:34:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01JBYIaF018375;
        Wed, 19 Feb 2020 12:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=sYV+fXFkNE49b3PkSLY5bKUtbpxLPJfmmOZx2ifgHCY=;
 b=bmHIpqpu4wcMqOaGmCyiVnCqOjBS1mi8K/1TPdBbSaeHA61FRTkuvdV6XKnQKw/jK0Vq
 YQV+b7qnSRB70GmxlkcYN4jooKhfoLk+Xv++L7aPESeNBNWtmlpuPBUYdvux6DCeuESd
 1gfjr+mDRqdeHnhFq0n3fZk++s9JV7aOmaHcqtqi0yC3DmgYQaPWCORUh8yJC/Qm0d+h
 ImJmNsGInRGMX0dSa83DEEt/kWkJynbW8oyrXccbH7cquLtmFPAm79ycGcKFF3l1/4UD
 zm4FlBlvwYeLhOTbawrmUjWmMbgG5fNWIEzG2Jd7x1+4ipyVHcV1SALj4b5k240rqGNR GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8ub5jrfk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 12:34:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28B27100034;
        Wed, 19 Feb 2020 12:34:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15D232B2DE7;
        Wed, 19 Feb 2020 12:34:14 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 12:34:13 +0100
Subject: Re: [PATCH v2 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <marex@denx.de>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200218131218.10789-1-alexandre.torgue@st.com>
 <20200218131218.10789-3-alexandre.torgue@st.com>
Message-ID: <f82caf02-5a47-ce3e-ec85-313712ef6de0@st.com>
Date:   Wed, 19 Feb 2020 12:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218131218.10789-3-alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_03:2020-02-19,2020-02-19 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix Marc email address.

On 2/18/20 2:12 PM, Alexandre Torgue wrote:
> This patch adds level interrupt support to gpio irq chip.
> 
> GPIO hardware block is directly linked to EXTI block but EXTI handles
> external interrupts only on edge. To be able to handle GPIO interrupt on
> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
> is retriggered following interrupt type and gpio line value.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> Tested-by: Marek Vasut <marex@denx.de>
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 2d5e0435af0a..dae236562543 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -92,6 +92,7 @@ struct stm32_gpio_bank {
>   	u32 bank_nr;
>   	u32 bank_ioport_nr;
>   	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
> +	u32 irq_type[STM32_GPIO_PINS_PER_BANK];
>   };
>   
>   struct stm32_pinctrl {
> @@ -303,6 +304,46 @@ static const struct gpio_chip stm32_gpio_template = {
>   	.get_direction		= stm32_gpio_get_direction,
>   };
>   
> +void stm32_gpio_irq_eoi(struct irq_data *d)
> +{
> +	struct stm32_gpio_bank *bank = d->domain->host_data;
> +	int line;
> +
> +	irq_chip_eoi_parent(d);
> +
> +	/* If level interrupt type then retrig */
> +	line = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
> +	if ((line == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
> +	    (line == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
> +		irq_chip_retrigger_hierarchy(d);
> +};
> +
> +static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct stm32_gpio_bank *bank = d->domain->host_data;
> +	u32 parent_type;
> +
> +	bank->irq_type[d->hwirq] = type;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_EDGE_FALLING:
> +	case IRQ_TYPE_EDGE_BOTH:
> +		parent_type = type;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		parent_type = IRQ_TYPE_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		parent_type = IRQ_TYPE_EDGE_FALLING;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return irq_chip_set_type_parent(d, parent_type);
> +};
> +
>   static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
>   {
>   	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
> @@ -332,11 +373,11 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
>   
>   static struct irq_chip stm32_gpio_irq_chip = {
>   	.name		= "stm32gpio",
> -	.irq_eoi	= irq_chip_eoi_parent,
> +	.irq_eoi	= stm32_gpio_irq_eoi,
>   	.irq_ack	= irq_chip_ack_parent,
>   	.irq_mask	= irq_chip_mask_parent,
>   	.irq_unmask	= irq_chip_unmask_parent,
> -	.irq_set_type	= irq_chip_set_type_parent,
> +	.irq_set_type	= stm32_gpio_set_type,
>   	.irq_set_wake	= irq_chip_set_wake_parent,
>   	.irq_request_resources = stm32_gpio_irq_request_resources,
>   	.irq_release_resources = stm32_gpio_irq_release_resources,
> 
