Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BCE1582C2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 19:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgBJSjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 13:39:09 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:58818 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgBJSjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 13:39:09 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48GZS912Y8z1rXQ7;
        Mon, 10 Feb 2020 19:39:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48GZS86txzz1qxyd;
        Mon, 10 Feb 2020 19:39:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id WpRmuv2sT68o; Mon, 10 Feb 2020 19:39:03 +0100 (CET)
X-Auth-Info: jtnBlJieYpM91jZUoaaeoKQHkpCutPCsTMqRuKLLFD8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 10 Feb 2020 19:39:03 +0100 (CET)
Subject: Re: [PATCH 2/2] pinctrl: stm32: Add level interrupt support to gpio
 irq chip
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20200210134901.1939-1-alexandre.torgue@st.com>
 <20200210134901.1939-3-alexandre.torgue@st.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <377b0895-aaeb-b12e-cad7-469332787b4e@denx.de>
Date:   Mon, 10 Feb 2020 19:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210134901.1939-3-alexandre.torgue@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/10/20 2:49 PM, Alexandre Torgue wrote:
> This patch adds level interrupt support to gpio irq chip.
> 
> GPIO hardware block is directly linked to EXTI block but EXTI handles
> external interrupts only on edge. To be able to handle GPIO interrupt on
> level a "hack" is done in gpio irq chip: parent interrupt (exti irq chip)
> is retriggered following interrupt type and gpio line value.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 2d5e0435af0a..04e1b062c20e 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -89,6 +89,7 @@ struct stm32_gpio_bank {
>  	struct pinctrl_gpio_range range;
>  	struct fwnode_handle *fwnode;
>  	struct irq_domain *domain;
> +	u32 irq_type[STM32_GPIO_PINS_PER_BANK];

You might want reverse xmas tree order here.

>  	u32 bank_nr;
>  	u32 bank_ioport_nr;
>  	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
> @@ -303,6 +304,48 @@ static const struct gpio_chip stm32_gpio_template = {
>  	.get_direction		= stm32_gpio_get_direction,
>  };
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
> +	irq_chip_set_type_parent(d, parent_type);

irq_chip_set_type_parent() returns error code, shouldn't that be handled?

Otherwise, tested on STM32MP1 with KSZ8851-16MLL NIC.
