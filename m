Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA091037B5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 11:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfKTKjI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 05:39:08 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:39717 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728497AbfKTKjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 05:39:08 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iXNNz-0001Zl-U1; Wed, 20 Nov 2019 11:38:59 +0100
To:     Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 1/5] genirq: introduce =?UTF-8?Q?irq=5Fdomain=5Ftra?=  =?UTF-8?Q?nslate=5Fonecell?=
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 10:38:59 +0000
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
In-Reply-To: <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
Message-ID: <5ec51559d8b4cd3b8e80943788b52926@www.loen.fr>
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
> Add a new function irq_domain_translate_onecell() that is to be used 
> as
> the translate function in struct irq_domain_ops for the v2 IRQ API.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  include/linux/irqdomain.h |  5 +++++
>  kernel/irq/irqdomain.c    | 20 ++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 583e7ab..cad9eb8 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -426,6 +426,11 @@ int irq_domain_translate_twocell(struct 
> irq_domain *d,
>  				 unsigned long *out_hwirq,
>  				 unsigned int *out_type);
>
> +int irq_domain_translate_onecell(struct irq_domain *d,
> +				 struct irq_fwspec *fwspec,
> +				 unsigned long *out_hwirq,
> +				 unsigned int *out_type);
> +
>  /* IPI functions */
>  int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask 
> *dest);
>  int irq_destroy_ipi(unsigned int irq, const struct cpumask *dest);
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 132672b..6972a48 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -987,6 +987,26 @@ const struct irq_domain_ops 
> irq_domain_simple_ops = {
>  EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
>
>  /**
> + * irq_domain_translate_onecell() - Generic translate for direct one 
> cell
> + * bindings
> + *
> + * Device Tree IRQ specifier translation function which works with 
> one cell

nit: the whole point of the 'new' translate function is that they are
firmware-agnostic. Just drop the DT reference here.

> + * bindings where the cell values map directly to the hwirq number.
> + */
> +int irq_domain_translate_onecell(struct irq_domain *d,
> +				 struct irq_fwspec *fwspec,
> +				 unsigned long *out_hwirq,
> +				 unsigned int *out_type)
> +{
> +	if (WARN_ON(fwspec->param_count < 1))
> +		return -EINVAL;
> +	*out_hwirq = fwspec->param[0];
> +	*out_type = IRQ_TYPE_NONE;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> +
> +/**
>   * irq_domain_translate_twocell() - Generic translate for direct two 
> cell
>   * bindings
>   *

Can you please also update (potentially in a separate patch) the 
potential
users of this? I mentioned the nvic driver last time...

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
