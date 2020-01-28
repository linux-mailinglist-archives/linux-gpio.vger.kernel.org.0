Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865FA14B4C3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 14:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgA1NVD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 08:21:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbgA1NVD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 08:21:03 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 722502467B;
        Tue, 28 Jan 2020 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580217662;
        bh=6yMPyzyzgayEIhWQisn5URP1nsUaexkHHx5nPCWZHxE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m/qnAjAWjKa7ujJV4+9bpIdnM8mieHm/wpjVEvkvRm9L3PYJnE5/FmP+1SvRPtqBR
         Tr6tDlVON4RnWc0Q/zVwJ2TH8GGOHQ0Z/AQT2Zyb7H/gS7g2HcGKX1gUmwAPkHvQTu
         b8olEF31GK411fPrGLjVPuPn58DV+ShN/oweXQ50=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1iwQnc-001ofc-Hp; Tue, 28 Jan 2020 13:21:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Jan 2020 13:21:00 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com, wesley@sifive.com,
        atish.patra@wdc.com, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        sachin.ghadi@sifive.com
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
In-Reply-To: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
Message-ID: <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, wesley@sifive.com, atish.patra@wdc.com, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-01-28 05:24, Yash Shah wrote:
> Typcasting "irq_state" leads to the below static checker warning:
> The fix is to declare "irq_state" as unsigned long instead of u32.
> 
> 	drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
> 	warn: passing casted pointer '&chip->irq_state' to
> 	'assign_bit()' 32 vs 64.
> 
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 147a1bd..c54dd08 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -35,7 +35,7 @@ struct sifive_gpio {
>  	void __iomem		*base;
>  	struct gpio_chip	gc;
>  	struct regmap		*regs;
> -	u32			irq_state;
> +	unsigned long		irq_state;
>  	unsigned int		trigger[SIFIVE_GPIO_MAX];
>  	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
>  };
> @@ -94,7 +94,7 @@ static void sifive_gpio_irq_enable(struct irq_data 
> *d)
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> 
>  	/* Enable interrupts */
> -	assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
> +	assign_bit(offset, &chip->irq_state, 1);
>  	sifive_gpio_set_ie(chip, offset);
>  }
> 
> @@ -104,7 +104,7 @@ static void sifive_gpio_irq_disable(struct irq_data 
> *d)
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> 
> -	assign_bit(offset, (unsigned long *)&chip->irq_state, 0);
> +	assign_bit(offset, &chip->irq_state, 0);
>  	sifive_gpio_set_ie(chip, offset);
>  	irq_chip_disable_parent(d);
>  }

Yup, nice one. Should have spotted it.

Reviewed-by: Marc Zyngier <maz@kernel.org>

Linus, do you want me to queue this via the irqchip tree (given that
it is where the original bug came from)? Or would you rather take it?

         M.
-- 
Jazz is not dead. It just smells funny...
