Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460622437A9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 11:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHMJ3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 05:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMJ3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 05:29:22 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8910BC061757;
        Thu, 13 Aug 2020 02:29:21 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597310959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5wCQOX25aaOsWpq5c0leMLJU3ShjXx6gzZ+lkhN/m0=;
        b=Vzk+YeoEP4LH28amktQIViJ8D9qMr/DHRfX/C89rl4+p8WIQ7HxIwKIZi1GnX9ILYvvox7
        ikl+xVRjiDXBraLXEcZqYAKR+G0Vpg5CBw7Iskmlslxe70tBQ+95nKOHzjvpjGFagzxS4B
        TFAKUTKl5Yt9PN9e0M7DLx2ak/iQoS6hrCwcMnsPeEhoLAYDEHYOYs19nZJUzAUcd+jVHG
        4ypxj9WucKRV6r6CFoguKAjXQcZCZVllHyd9ZkIis4O4hUsISUcEYxXvLLW68jFPAsYpcj
        wjgTJ6Q5/xzow0FdoX9MRoFoxAbfh1hGMftqFhkqCGRgt8evsh/XPFeHx1slgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597310959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5wCQOX25aaOsWpq5c0leMLJU3ShjXx6gzZ+lkhN/m0=;
        b=b9PXrdqWDzOqx5rZ1FfLBRohEdSAf3TXIS2lBOlq7JURbLGYkOh1eSvgitaTkmQyNf/VvX
        bnbJBkyqO+25WDCw==
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
In-Reply-To: <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
Date:   Thu, 13 Aug 2020 11:29:18 +0200
Message-ID: <87pn7ulwr5.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Maulik Shah <mkshah@codeaurora.org> writes:
> From: Douglas Anderson <dianders@chromium.org>
>
> The "struct irq_chip" has two callbacks in it: irq_suspend() and
> irq_resume().  These two callbacks are interesting because sometimes
> an irq chip needs to know about suspend/resume, but they are a bit
> awkward because:
> 1. They are called once for the whole irq_chip, not once per IRQ.
>    It's passed data for one of the IRQs enabled on that chip.  That
>    means it's up to the irq_chip driver to aggregate.
> 2. They are only called if you're using "generic-chip", which not
>    everyone is.
> 3. The implementation uses syscore ops, which apparently have problems
>    with s2idle.

The main point is that these callbacks are specific to generic chip and
not used anywhere else.

> Probably the old irq_suspend() and irq_resume() callbacks should be
> deprecated.

You need to analyze first what these callbacks actually do. :)

> Let's introcuce a nicer API that works for all irq_chip devices.

s/Let's intro/Intro/

Let's is pretty useless in a changelog especially if you read it some
time after the patch got applied.

> This will be called by the core and is called once per IRQ.  The core
> will call the suspend callback after doing its normal suspend
> operations and the resume before its normal resume operations.

Will be? You are adding the code which calls that unconditionally even.

> +void suspend_one_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
> +	if (chip->irq_suspend_one)
> +		chip->irq_suspend_one(&desc->irq_data);
> +}
> +
> +void resume_one_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
> +	if (chip->irq_resume_one)
> +		chip->irq_resume_one(&desc->irq_data);
> +}

There not much of a point to have these in chip.c. The functionality is
clearly pm.c only.

>  static bool suspend_device_irq(struct irq_desc *desc)
>  {
> +	bool sync = false;
> +
>  	if (!desc->action || irq_desc_is_chained(desc) ||
>  	    desc->no_suspend_depth)
> -		return false;
> +		goto exit;

What?

If no_suspend_depth is > 0 why would you try to tell the irq chip
that this line needs to be suspended?

If there is no action, then the interrupt line is in shut down
state. What's the point of suspending it?

Chained interrupts are special and you really have to think hard whether
calling suspend for them unconditionally is a good idea. What if a
wakeup irq is connected to this chained thing?

>  	if (irqd_is_wakeup_set(&desc->irq_data)) {
>  		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
> +
>  		/*
>  		 * We return true here to force the caller to issue
>  		 * synchronize_irq(). We need to make sure that the
>  		 * IRQD_WAKEUP_ARMED is visible before we return from
>  		 * suspend_device_irqs().
>  		 */
> -		return true;
> +		sync = true;
> +		goto exit;

So again. This interrupt is a wakeup source. What's the point of
suspending it unconditionally.

>  	}
>  
>  	desc->istate |= IRQS_SUSPENDED;
> @@ -95,7 +99,10 @@ static bool suspend_device_irq(struct irq_desc *desc)
>  	 */
>  	if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
>  		mask_irq(desc);
> -	return true;
> +
> +exit:
> +	suspend_one_irq(desc);
> +	return sync;

So what happens in this case:

   CPU0                         CPU1
   interrupt                    suspend_device_irq()
     handle()                     chip->suspend_one()
       action()                 ...              
       chip->fiddle();

????

What is the logic here and how is this going to work under all
circumstances without having magic hacks in the irq chip to handle all
the corner cases?

This needs way more thoughts vs. the various states and sync
requirements. Just adding callbacks, invoking them unconditionally, not
giving any rationale how the whole thing is supposed to work and then
let everyone figure out how to deal with the state and corner case
handling at the irq chip driver level does not cut it, really.

State handling is core functionality and if irq chip drivers have
special requirements then they want to be communicated with flags and/or
specialized callbacks.

Thanks,

        tglx
