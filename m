Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C9B2C9248
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbgK3XO0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726737AbgK3XO0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:14:26 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7A1C0613D2;
        Mon, 30 Nov 2020 15:13:45 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606778024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DcIojZeNBXirIxPuzck5gKL+B2GaAAVvbLMSbnv7A4o=;
        b=TErIi0LRzrxWtp2w0jaDbQs3wM0sxhxyGGuNXb8yCoSc19jwyWuTOLBKnvHCQCuVB92XB7
        U8bleVUuBzWgRMnH9UGQbNX9UJU1aATJ3/YACH9xpT2TQ28H7n6zBeosQVWyUDwLhsclsu
        iBmtG3PLr6EVBA9vzkJ2dN2nxSoEl77RRKFyUPL1iJRoLiXoQE/hvD7OuotKPcwa+Lvy9V
        GkYyESZNsVaNTsQHjBmTN/OSf4JuKlnUIPkFLAl5f1dQHxjSPXt8xoGGv0afpOS0RoEDrL
        vkEM6fM2/ruRi/txjDpqSV9joZSgnJFSMw6uQvHtLX2JLfic/ZSKE2dJ5uRKuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606778024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DcIojZeNBXirIxPuzck5gKL+B2GaAAVvbLMSbnv7A4o=;
        b=OBqVQNWAecaT77Y/D1j/uIFIdsyYMUuCsILx3O7iOBPONrreeEGV9ZZIdUy8tDebOhwOw5
        JTAGOz1sV1hhrSCQ==
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Cc:     =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Oliver O'Halloran <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 6/8] genirq/irqdomain: Move hierarchical IRQ cleanup to kobject_release
In-Reply-To: <20201124061720.86766-7-aik@ozlabs.ru>
References: <20201124061720.86766-1-aik@ozlabs.ru> <20201124061720.86766-7-aik@ozlabs.ru>
Date:   Tue, 01 Dec 2020 00:13:44 +0100
Message-ID: <871rgaigk7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Alexey,

On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
> This moves hierarchical domain's irqs cleanup into the kobject release
> hook to make irq_domain_free_irqs() as simple as kobject_put.

Truly simple: Simply broken in multiple ways.

CONFIG_SPARSE_IRQ=n is now completely buggered. It does not even compile
anymore. Running core code changes through a larger set of cross
compilers is neither rocket science nor optional.

For CONFIG_SPARSE_IRQ=y, see below.

> @@ -1675,14 +1679,11 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
>  		 "NULL pointer, cannot free irq\n"))
>  		return;
>  
> -	mutex_lock(&irq_domain_mutex);
> -	for (i = 0; i < nr_irqs; i++)
> -		irq_domain_remove_irq(virq + i);
> -	irq_domain_free_irqs_hierarchy(data->domain, virq, nr_irqs);
> -	mutex_unlock(&irq_domain_mutex);
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_desc *desc = irq_to_desc(virq + i);
>  
> -	irq_domain_free_irq_data(virq, nr_irqs);
> -	irq_free_descs(virq, nr_irqs);
> +		kobject_put(&desc->kobj);

So up to this point both irq_dispose_mapping() _and_
irq_domain_free_irqs() invoked irq_free_descs().

Let's look at the call chains:

   irq_domain_free_irqs()
     irq_free_descs()
       mutex_lock(&sparse_irq_lock);
         for (i...)
           free_desc(from + i)
             irq_remove_debugfs_entry();
             unregister_irq_proc();
             irq_sysfs_del();
             delete_irq_desc();
             call_rcu();
       bitmap_clear(allocated_irqs, ...);
       mutex_unlock(&sparse_irq_lock);

with your modifications it does:

   irq_domain_free_irqs()
     for (i...)
          kobject_put(&desc->kobj)
            irq_kobj_release()
              if (desc->free_irq)
                desc->free_irq(desc);
              irq_remove_debugfs_entry();
              unregister_irq_proc();
              delete_irq_desc();
              call_rcu();

Can you spot the wreckage? It's not even subtle, it's more than obvious.

    1) None of the operations in irq_kobj_release() is protected by
       sparse_irq_lock anymore. There was a comment in free_desc() which
       explained what is protected. You removed parts of that comment
       and just left the sysfs portion of it above delete_irq_desc()
       which is completely bogus because you removed the irq_sysfs_del()
       call.

    2) Nothing removes the freed interrupts from the allocation
       bitmap. Run this often enough and you exhausted the interrupt
       space.

And no, you cannot just go and invoke irq_free_descs() instead of
kobject_put(), simply because you'd create lock order inversion vs. the
free_irq() callback.

So no, it's not that simple and I'm not at all interested in another
respin of this with some more duct tape applied.

It can be done, but that needs way more thought, a proper design which
preserves the existing semantics completely and wants to be a fine
grained series where each patch does exactly ONE small thing which is
reviewable and testable on _ALL_ users of this code, i.e. _ALL_
architectures and irq chip implementations.  

Thanks,

        tglx
