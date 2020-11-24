Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE4B2C209F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 10:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbgKXJAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 04:00:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:59748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730494AbgKXJAf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 04:00:35 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 376A22073C;
        Tue, 24 Nov 2020 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606208434;
        bh=B5gJW4XvFdpPY/O6e4RLIzbmqA6f65X+LK9jOXetPDM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O13LgKM21EYul5Nyeb9e3zdf0MHo0HOJkQSitIC2VxewKdjNpSLqhNn/V6JOTglhP
         8D7CMDvl1dN4B3/E+KxCcw5WRzX3gVN0g76RNh9I69SQjB2eIYBdMNR/jF1RAAn809
         jlsLTw8j05xd13qVdYoFRPcwwsZOAthuGHYRcj5s=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1khUBc-00DC4U-0h; Tue, 24 Nov 2020 09:00:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Nov 2020 09:00:31 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
In-Reply-To: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <d65e2be33a218751e7be3342e490e076@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: dianders@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, mkshah@codeaurora.org, sramana@codeaurora.org, neeraju@codeaurora.org, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, swboyd@chromium.org, agross@kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-24 00:01, Douglas Anderson wrote:
> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>   wakeup-event-action = <EV_ACT_DEASSERTED>;
>   wakeup-source;
> 
> Specifically we end up with a phantom interrupt that blocks suspend if
> the line was already high and we want wakeups on rising edges (AKA we
> want the GPIO to go low and then high again before we wake up).  The
> opposite is also problematic.
> 
> Specifically, here's what's happening today:
> 1. Normally, gpio-keys configures to look for both edges.  Due to the
>    current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
>    qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
>    line was high we'd configure for falling edges.
> 2. At suspend time, we change to look for rising edges.
> 3. After qcom_pdc_gic_set_type() runs, we get a phantom interrupt.
> 
> We can solve this by just clearing the phantom interrupt.
> 
> NOTE: it is possible that this could cause problems for a client with
> very specific needs, but there's not much we can do with this
> hardware.  As an example, let's say the interrupt signal is currently
> high and the client is looking for falling edges.  The client now
> changes to look for rising edges.  The client could possibly expect
> that if the line has a short pulse low (and back high) that it would
> always be detected.  Specifically no matter when the pulse happened,
> it should either have tripped the (old) falling edge trigger or the
> (new) rising edge trigger.  We will simply not trip it.  We could
> narrow down the race a bit by polling our parent before changing
> types, but no matter what we do there will still be a period of time
> where we can't tell the difference between a real transition (or more
> than one transition) and the phantom.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/irqchip/qcom-pdc.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index bd39e9de6ecf..7d097164aadc 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -159,6 +159,8 @@ static int qcom_pdc_gic_set_type(struct irq_data
> *d, unsigned int type)
>  {
>  	int pin_out = d->hwirq;
>  	enum pdc_irq_config_bits pdc_type;
> +	enum pdc_irq_config_bits old_pdc_type;
> +	int ret;
> 
>  	if (pin_out == GPIO_NO_WAKE_IRQ)
>  		return 0;
> @@ -187,9 +189,24 @@ static int qcom_pdc_gic_set_type(struct irq_data
> *d, unsigned int type)
>  		return -EINVAL;
>  	}
> 
> +	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
>  	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
> 
> -	return irq_chip_set_type_parent(d, type);
> +	ret = irq_chip_set_type_parent(d, type);
> +
> +	/*
> +	 * When we change types the PDC can give a phantom interrupt.
> +	 * Clear it.  Specifically the phantom shows up if a line is already
> +	 * high and we change to rising or if a line is already low and we
> +	 * change to falling but let's be consistent and clear it always.
> +	 *
> +	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
> +	 * interrupt will be cleared before the rest of the system sees it.
> +	 */
> +	if (old_pdc_type != pdc_type)
> +		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);

nit: s/0/false/.

You could also make it conditional on the parent side having been 
successful.
And while we're looking at this: do you need to rollback the PDC state
if the GIC side has failed? It's all very hypothetical, but just in 
case...

> +
> +	return ret;
>  }
> 
>  static struct irq_chip qcom_pdc_gic_chip = {

It otherwise looks sensible. Is that a fix for 5.10?

         M.
-- 
Jazz is not dead. It just smells funny...
