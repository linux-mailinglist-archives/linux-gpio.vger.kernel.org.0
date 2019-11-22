Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 870F01069C5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 11:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKVKRS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 05:17:18 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:44231 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726500AbfKVKRS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Nov 2019 05:17:18 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iY5zt-00071W-8E; Fri, 22 Nov 2019 11:17:05 +0100
To:     Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 2/5] irqchip: sifive: Support hierarchy irq domain
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 22 Nov 2019 10:17:05 +0000
From:   Marc Zyngier <maz@kernel.org>
Cc:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <bmeng.cn@gmail.com>,
        <atish.patra@wdc.com>, Sagar Kadam <sagar.kadam@sifive.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
In-Reply-To: <1574233128-28114-3-git-send-email-yash.shah@sifive.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-3-git-send-email-yash.shah@sifive.com>
Message-ID: <6bc97c77172ac277e0c28f68eb1ca440@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com, atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-11-20 06:59, Yash Shah wrote:
> Add support for hierarchy irq domains. This is needed as 
> pre-requisite for
> gpio-sifive driver.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/irqchip/Kconfig           |  1 +
>  drivers/irqchip/irq-sifive-plic.c | 30 
> ++++++++++++++++++++++++++----
>  2 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index ccbb897..a398552 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -488,6 +488,7 @@ endmenu
>  config SIFIVE_PLIC
>  	bool "SiFive Platform-Level Interrupt Controller"
>  	depends on RISCV
> +	select IRQ_DOMAIN_HIERARCHY
>  	help
>  	   This enables support for the PLIC chip found in SiFive (and
>  	   potentially other) RISC-V systems.  The PLIC controls devices
> diff --git a/drivers/irqchip/irq-sifive-plic.c
> b/drivers/irqchip/irq-sifive-plic.c
> index 7d0a12f..750e366 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -154,15 +154,37 @@ static struct irq_chip plic_chip = {
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int 
> irq,
>  			      irq_hw_number_t hwirq)
>  {
> -	irq_set_chip_and_handler(irq, &plic_chip, handle_fasteoi_irq);
> -	irq_set_chip_data(irq, NULL);
> +	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> +			    handle_fasteoi_irq, NULL, NULL);
>  	irq_set_noprobe(irq);
>  	return 0;
>  }
>
> +static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned
> int virq,
> +				 unsigned int nr_irqs, void *arg)
> +{
> +	int i, ret;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;

You shouldn't need this init here. The whole point of 
irq_domain_translate_onecell
is that it either gives you a valid value, or an error.

> +	struct irq_fwspec *fwspec = arg;
> +
> +	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		ret = plic_irqdomain_map(domain, virq + i, hwirq + i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct irq_domain_ops plic_irqdomain_ops = {
> -	.map		= plic_irqdomain_map,
> -	.xlate		= irq_domain_xlate_onecell,
> +	.translate	= irq_domain_translate_onecell,
> +	.alloc		= plic_irq_domain_alloc,
> +	.free		= irq_domain_free_irqs_top,
>  };
>
>  static struct irq_domain *plic_irqdomain;

Otherwise looks OK.

         M.
-- 
Jazz is not dead. It just smells funny...
