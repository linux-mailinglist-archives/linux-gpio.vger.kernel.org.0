Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4064A2C90DB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 23:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbgK3WTR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 17:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgK3WTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 17:19:17 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A020AC0613CF;
        Mon, 30 Nov 2020 14:18:36 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606774714;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CFudy8L+FlHMOa4nsHLt70wET9/WFjTaQkZS7DntErI=;
        b=LKYde6pxVDO8fB/PwX7qEMxyT+OyS7kjQ5jVxQTYW/rZtRAgLQyOHvkX6cefQFr8+wHPn4
        VoNpwxoEITvI2gzTqprsF/EVBGhC5WkqzTBYtr/hXg1Q6q4lZibJ5CFM8wqLVp3Bsi9/Y9
        JFy2SN14bhwT7xHJfYXYD95qz0I42FTBs65tkI1/U8NfamnLVO63F85kwLwSWnCaLS499l
        EkOvGygL7SnHVYhO2uJieDBngIQmIZdrpk/vDaQtQLMTVnwMdK0/uHUbPzVqNrQtDzKrk8
        uEkgzdGcVWJZG+qQDbKHNSUsuAncrKqfot3G8V0rRk1T5QndhKrmU+PQCzQAiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606774714;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CFudy8L+FlHMOa4nsHLt70wET9/WFjTaQkZS7DntErI=;
        b=yAgP2wjTpmMizPaYS2eE7kNJTr0f4jj44LvgPz+5/V8EMY/UF87pHX4+fK6GW4Bb5mx1dZ
        M4vb99HR77HvR2AA==
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Cc:     =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Oliver O'Halloran <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 5/8] genirq: Add free_irq hook for IRQ descriptor and use for mapping disposal
In-Reply-To: <20201124061720.86766-6-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru> <20201124061720.86766-6-aik@ozlabs.ru>
Date:   Mon, 30 Nov 2020 23:18:34 +0100
Message-ID: <877dq2ij45.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Alexey,

On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
> We want to make the irq_desc.kobj's release hook free associated resources
> but we do not want to pollute the irqdesc code with domains.

Can you please describe your changelog in factual ways without 'we and I
and want'? See Documentation/process/

> This adds a free_irq hook which is called when the last reference to
> the descriptor is dropped.
>
> The first user is mapped irqs. This potentially can break the existing
> users; however they seem to do the right thing and call dispose once
> per mapping.

Q: How is this supposed to work with CONFIG_SPARSE_IRQ=n?
A: Not at all.

Also 'seem to do the right thing' is from the same quality as 'should
not break stuff'. Either you have done a proper analysis or you did
not. Aside of that how is anyone supposed to decode the subtle wreckage
which is this going to cause if 'seem to do the right thing' turns out
to be wrong?

> -void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
> +static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
>  {
>  	struct irq_data *irq_data = irq_get_irq_data(irq);
>  	irq_hw_number_t hwirq;
> @@ -582,6 +582,13 @@ void irq_domain_associate_many(struct irq_domain *domain, unsigned int irq_base,
>  }
>  EXPORT_SYMBOL_GPL(irq_domain_associate_many);
>  
> +static void irq_mapped_free_desc(struct irq_desc *desc)

That function name is really misleading and badly chosen. The function
is not about freeing the irq descriptor as the name suggests. It's
called from that code in order to clean up the mapping.

> +{
> +	unsigned int virq = desc->irq_data.irq;
> +
> +	irq_domain_disassociate(desc->irq_data.domain, virq);
> +}
> +
>  /**
>   * irq_create_direct_mapping() - Allocate an irq for direct mapping
>   * @domain: domain to allocate the irq for or NULL for default domain
> @@ -638,6 +645,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>  {
>  	struct device_node *of_node;
>  	int virq;
> +	struct irq_desc *desc;

This code uses reverse fir tree ordering of variables

  	struct device_node *of_node;
	struct irq_desc *desc;
  	int virq;

Why? Because it's simpler to read than the vertical camel case above.

Thanks,

        tglx
