Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6505AA3B22
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 17:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfH3P65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 11:58:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44250 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbfH3P65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 11:58:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A694B60128; Fri, 30 Aug 2019 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567180735;
        bh=4NxFQHBBDhTd9PF9Spo5Zg9uecXMm43cMnHcq8yhCkg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NAepYYwz2SadM1U618ErlqzFJQuLJoKKROf3pq87Myt9g6/Ybslb6ObM8IrLQHXj4
         38qb3ICaith54idII7twTsHapE/hmXItBVisXy1H/W1fwuuDIsa6q4/oPQaSfRiZFJ
         EadBeegMKw5Ocrbn69SVjp+FM7U53ciQQqv2x5cc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 199F160128;
        Fri, 30 Aug 2019 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567180734;
        bh=4NxFQHBBDhTd9PF9Spo5Zg9uecXMm43cMnHcq8yhCkg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B+GMc7wNumi0TqSU+lZo38JFYHoPjnOpLXka7zpcAnR8EfO5USGApBMl/Hjtc+UGF
         /U7PHma7/STew63Rg7Z8wbgSNjkoZYFrUD0FSgn0mj7n0Vpy3oFQQ+hFkJpGuT5jAd
         Xch6IyQEg451kL7cvU7pl5qX1hJ4/fm6VPmX6JRk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 199F160128
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
Date:   Fri, 30 Aug 2019 09:58:53 -0600
From:   Lina Iyer <ilina@codeaurora.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH RFC 03/14] drivers: irqchip: add PDC irqdomain for wakeup
 capable GPIOs
Message-ID: <20190830155853.GA5224@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-4-ilina@codeaurora.org>
 <d2a45d45-3071-ab8d-060b-92a2812a8d42@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d2a45d45-3071-ab8d-060b-92a2812a8d42@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 30 2019 at 08:50 -0600, Marc Zyngier wrote:
>[Please use my kernel.org address in the future. The days of this
>arm.com address are numbered...]
>
Sure, will update and repost.

>On 29/08/2019 19:11, Lina Iyer wrote:
>> Introduce a new domain for wakeup capable GPIOs. The domain can be
>> requested using the bus token DOMAIN_BUS_WAKEUP. In the following
>> patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
>> irqchip. Requesting a wakeup GPIO will setup the GPIO and the
>> corresponding PDC interrupt as its parent.
>>
>> Co-developed-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>>  drivers/irqchip/qcom-pdc.c   | 104 ++++++++++++++++++++++++++++++++---
>>  include/linux/soc/qcom/irq.h |  34 ++++++++++++
>>  2 files changed, 129 insertions(+), 9 deletions(-)
>>  create mode 100644 include/linux/soc/qcom/irq.h
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index 338fae604af5..ad1faf634bcf 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -13,12 +13,13 @@
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_device.h>
>> +#include <linux/soc/qcom/irq.h>
>>  #include <linux/spinlock.h>
>> -#include <linux/platform_device.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>
>>  #define PDC_MAX_IRQS		126
>> +#define PDC_MAX_GPIO_IRQS	256
>>
>>  #define CLEAR_INTR(reg, intr)	(reg & ~(1 << intr))
>>  #define ENABLE_INTR(reg, intr)	(reg | (1 << intr))
>> @@ -26,6 +27,8 @@
>>  #define IRQ_ENABLE_BANK		0x10
>>  #define IRQ_i_CFG		0x110
>>
>> +#define PDC_NO_PARENT_IRQ	~0UL
>> +
>>  struct pdc_pin_region {
>>  	u32 pin_base;
>>  	u32 parent_base;
>> @@ -65,23 +68,35 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>
>>  static void qcom_pdc_gic_disable(struct irq_data *d)
>>  {
>> +	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +		return;
>> +
>>  	pdc_enable_intr(d, false);
>>  	irq_chip_disable_parent(d);
>>  }
>>
>>  static void qcom_pdc_gic_enable(struct irq_data *d)
>>  {
>> +	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +		return;
>> +
>>  	pdc_enable_intr(d, true);
>>  	irq_chip_enable_parent(d);
>>  }
>>
>>  static void qcom_pdc_gic_mask(struct irq_data *d)
>>  {
>> +	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +		return;
>> +
>>  	irq_chip_mask_parent(d);
>>  }
>>
>>  static void qcom_pdc_gic_unmask(struct irq_data *d)
>>  {
>> +	if (d->hwirq == GPIO_NO_WAKE_IRQ)
>> +		return;
>> +
>>  	irq_chip_unmask_parent(d);
>>  }
>>
>> @@ -124,6 +139,9 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>>  	int pin_out = d->hwirq;
>>  	enum pdc_irq_config_bits pdc_type;
>>
>> +	if (pin_out == GPIO_NO_WAKE_IRQ)
>> +		return 0;
>> +
>>  	switch (type) {
>>  	case IRQ_TYPE_EDGE_RISING:
>>  		pdc_type = PDC_EDGE_RISING;
>> @@ -181,8 +199,7 @@ static irq_hw_number_t get_parent_hwirq(int pin)
>>  			return (region->parent_base + pin - region->pin_base);
>>  	}
>>
>> -	WARN_ON(1);
>> -	return ~0UL;
>> +	return PDC_NO_PARENT_IRQ;
>>  }
>>
>>  static int qcom_pdc_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
>> @@ -211,17 +228,17 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
>>
>>  	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
>>  	if (ret)
>> -		return -EINVAL;
>> -
>> -	parent_hwirq = get_parent_hwirq(hwirq);
>> -	if (parent_hwirq == ~0UL)
>> -		return -EINVAL;
>> +		return ret;
>>
>>  	ret  = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>>  					     &qcom_pdc_gic_chip, NULL);
>>  	if (ret)
>>  		return ret;
>>
>> +	parent_hwirq = get_parent_hwirq(hwirq);
>> +	if (parent_hwirq == PDC_NO_PARENT_IRQ)
>> +		return 0;
>> +
>>  	if (type & IRQ_TYPE_EDGE_BOTH)
>>  		type = IRQ_TYPE_EDGE_RISING;
>>
>> @@ -244,6 +261,60 @@ static const struct irq_domain_ops qcom_pdc_ops = {
>>  	.free		= irq_domain_free_irqs_common,
>>  };
>>
>> +static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
>> +			       unsigned int nr_irqs, void *data)
>> +{
>> +	struct irq_fwspec *fwspec = data;
>> +	struct irq_fwspec parent_fwspec;
>> +	irq_hw_number_t hwirq, parent_hwirq;
>> +	unsigned int type;
>> +	int ret;
>> +
>> +	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> +					    &qcom_pdc_gic_chip, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (hwirq == GPIO_NO_WAKE_IRQ)
>> +		return 0;
>> +
>> +	parent_hwirq = get_parent_hwirq(hwirq);
>> +	if (parent_hwirq == PDC_NO_PARENT_IRQ)
>> +		return 0;
>> +
>> +	if (type & IRQ_TYPE_EDGE_BOTH)
>> +		type = IRQ_TYPE_EDGE_RISING;
>> +
>> +	if (type & IRQ_TYPE_LEVEL_MASK)
>> +		type = IRQ_TYPE_LEVEL_HIGH;
>> +
>> +	parent_fwspec.fwnode      = domain->parent->fwnode;
>> +	parent_fwspec.param_count = 3;
>> +	parent_fwspec.param[0]    = 0;
>> +	parent_fwspec.param[1]    = parent_hwirq;
>> +	parent_fwspec.param[2]    = type;
>> +
>> +	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
>> +					    &parent_fwspec);
>> +}
>> +
>> +static int qcom_pdc_gpio_domain_select(struct irq_domain *d,
>> +				       struct irq_fwspec *fwspec,
>> +				       enum irq_domain_bus_token bus_token)
>> +{
>> +	return (bus_token == DOMAIN_BUS_WAKEUP);
>> +}
>> +
>> +static const struct irq_domain_ops qcom_pdc_gpio_ops = {
>> +	.select		= qcom_pdc_gpio_domain_select,
>> +	.alloc		= qcom_pdc_gpio_alloc,
>> +	.free		= irq_domain_free_irqs_common,
>> +};
>> +
>>  static int pdc_setup_pin_mapping(struct device_node *np)
>>  {
>>  	int ret, n;
>> @@ -282,7 +353,7 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>
>>  static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>  {
>> -	struct irq_domain *parent_domain, *pdc_domain;
>> +	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
>>  	int ret;
>>
>>  	pdc_base = of_iomap(node, 0);
>> @@ -313,8 +384,23 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>>  		goto fail;
>>  	}
>>
>> +	pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
>> +						      IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>> +						      PDC_MAX_GPIO_IRQS,
>> +						      of_fwnode_handle(node),
>> +						      &qcom_pdc_gpio_ops, NULL);
>> +	if (!pdc_gpio_domain) {
>> +		pr_err("%pOF: GIC domain add failed for GPIO domain\n", node);
>> +		ret = -ENOMEM;
>> +		goto remove;
>> +	}
>> +
>> +	irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
>> +
>>  	return 0;
>>
>> +remove:
>> +	irq_domain_remove(pdc_domain);
>>  fail:
>>  	kfree(pdc_region);
>>  	iounmap(pdc_base);
>> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
>> new file mode 100644
>> index 000000000000..73239917dc38
>> --- /dev/null
>> +++ b/include/linux/soc/qcom/irq.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __QCOM_IRQ_H
>> +#define __QCOM_IRQ_H
>> +
>> +#include <linux/irqdomain.h>
>> +
>> +#define GPIO_NO_WAKE_IRQ	~0U
>> +
>> +/**
>> + * QCOM specific IRQ domain flags that distinguishes the handling of wakeup
>> + * capable interrupts by different interrupt controllers.
>> + *
>> + * IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP: Line must be masked at TLMM and the
>> + *                                  interrupt configuration is done at PDC
>> + * IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP: Interrupt configuration is handled at TLMM
>> + */
>> +#define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP		(1 << 17)
>> +#define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP		(1 << 18)
>
>Any reason why you're starting at bit 17? The available range in from
>bit 16... But overall, it would be better if you expressed it as:
>
>#define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP	(IRQ_DOMAIN_FLAG_NONCORE << 0)
>#define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP (IRQ_DOMAIN_FLAG_NONCORE << 1)
>
Okay.

>> +
>> +/**
>> + * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
>> + *                                configuration
>> + * @parent: irq domain
>> + *
>> + * This QCOM specific irq domain call returns if the interrupt controller
>> + * requires the interrupt be masked at the child interrupt controller.
>> + */
>> +static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *parent)
>> +{
>> +	return (parent->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
>> +}
>> +
>> +#endif
>>
>
>But most of this file isn't used by this patch, so maybe it should be
>moved somewhere else...
>
Apart from creating the domain, this is not used here, but a separate
patch seemed excessive. Let me know if you have any suggestions.

Thanks,
Lina

