Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D1A190C0C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 12:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgCXLKa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Mar 2020 07:10:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgCXLK3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Mar 2020 07:10:29 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A062720786;
        Tue, 24 Mar 2020 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585048228;
        bh=q+fr1XUysR+uZyKlppncJA/Y74Ewsk6+aW8I0yI5Bfw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=knQxveLIDh1KN9R/D4L2x/3sei3oJLnCRMmN9K8rmfSZY17PHfWmXQqS6tIM+Sxv0
         FFQvSOcy3NHhg9WNFs4JehAdqKopz5xqshoxBg5WP1yZmMcjRJrw1mgME3EJKuJvPD
         nvLPO8u9fje2VZ47/tEPTr95BX6e9QVdFwaB1baQ=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jGhRy-00FErF-OK; Tue, 24 Mar 2020 11:10:27 +0000
Date:   Tue, 24 Mar 2020 11:10:25 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] irqchip/stm32: Retrigger both in eoi and unmask
 callbacks
Message-ID: <20200324111025.0523605a@why>
In-Reply-To: <20200323235132.530550-1-marex@denx.de>
References: <20200323235132.530550-1-marex@denx.de>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: marex@denx.de, linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com, jason@lakedaemon.net, linus.walleij@linaro.org, tglx@linutronix.de, linux-gpio@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Mar 2020 00:51:32 +0100
Marek Vasut <marex@denx.de> wrote:

> Sampling the IRQ line state in EOI and retriggering the interrupt to
> work around missing level-triggered interrupt support only works for
> non-threaded interrupts. Threaded interrupts must be retriggered the
> same way in unmask callback.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>,
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-gpio@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 9ac9ecfc2f34..2dd4a4dd944c 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -304,18 +304,22 @@ static const struct gpio_chip stm32_gpio_template = {
>  	.get_direction		= stm32_gpio_get_direction,
>  };
>  
> -void stm32_gpio_irq_eoi(struct irq_data *d)
> +static void stm32_gpio_irq_trigger(struct irq_data *d)
>  {
>  	struct stm32_gpio_bank *bank = d->domain->host_data;
>  	int level;
>  
> -	irq_chip_eoi_parent(d);
> -
>  	/* If level interrupt type then retrig */
>  	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
>  	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
>  	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
>  		irq_chip_retrigger_hierarchy(d);
> +}
> +
> +void stm32_gpio_irq_eoi(struct irq_data *d)

This should obviously be static. I'll amend it locally.

> +{
> +	irq_chip_eoi_parent(d);
> +	stm32_gpio_irq_trigger(d);
>  };
>  
>  static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
> @@ -371,12 +375,18 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
>  	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
>  }
>  
> +static void stm32_gpio_irq_unmask(struct irq_data *d)
> +{
> +	irq_chip_unmask_parent(d);
> +	stm32_gpio_irq_trigger(d);
> +}
> +
>  static struct irq_chip stm32_gpio_irq_chip = {
>  	.name		= "stm32gpio",
>  	.irq_eoi	= stm32_gpio_irq_eoi,
>  	.irq_ack	= irq_chip_ack_parent,
>  	.irq_mask	= irq_chip_mask_parent,
> -	.irq_unmask	= irq_chip_unmask_parent,
> +	.irq_unmask	= stm32_gpio_irq_unmask,
>  	.irq_set_type	= stm32_gpio_set_type,
>  	.irq_set_wake	= irq_chip_set_wake_parent,
>  	.irq_request_resources = stm32_gpio_irq_request_resources,

I'll queue this for 5.7.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
