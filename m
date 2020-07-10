Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FFA21B1ED
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 11:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgGJJDp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 05:03:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbgGJJDp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 05:03:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D168F206E2;
        Fri, 10 Jul 2020 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594371825;
        bh=xp0XX8npgR/ksbohGsse1Q7/8OvE6IsWCRGw8ro2f78=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XJgV8a+Ln8iEbXRBB+cw7W/noPC7IRv8Z9YiQ2bGrrTD0yqI498iOYDKXqMwPXhAH
         iMauDJc5Hsfl8/wHIGh38tD6mksXOnb3OVTPgjPIharjZpgSmmtaBzXl8Va6w6shUy
         9N+DP+6TkWF1kqe+ZX/et2o/jrPgPcClo70H3JGA=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jtowZ-00Ad5H-1z; Fri, 10 Jul 2020 10:03:43 +0100
Date:   Fri, 10 Jul 2020 10:03:41 +0100
Message-ID: <87lfjreo7m.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, cychiang@chromium.org,
        ilina@codeaurora.org, agross@kernel.org, rnayak@codeaurora.org,
        mkshah@codeaurora.org, bjorn.andersson@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
In-Reply-To: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: dianders@chromium.org, linus.walleij@linaro.org, swboyd@chromium.org, linux-arm-msm@vger.kernel.org, cychiang@chromium.org, ilina@codeaurora.org, agross@kernel.org, rnayak@codeaurora.org, mkshah@codeaurora.org, bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On Wed, 08 Jul 2020 22:16:25 +0100,
Douglas Anderson <dianders@chromium.org> wrote:
> 
> As per Qualcomm, there is a PDC hardware issue (with the specific IP
> rev that exists on sc7180) that causes the PDC not to work properly
> when configured to handle dual edges.
> 
> Let's work around this by emulating only ever letting our parent see
> requests for single edge interrupts on affected hardware.
> 
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> As far as I can tell everything here should work and the limited
> testing I'm able to give it shows that, in fact, I can detect both
> edges.
> 
> Please give this an extra thorough review since it's trying to find
> the exact right place to insert this code and I'm not massively
> familiar with all the frameworks.
> 
> If someone has hardware where it's easy to stress test this that'd be
> wonderful too.  The board I happen to have in front of me doesn't have
> any easy-to-toggle GPIOs where I can just poke a button or a switch to
> generate edges.  My testing was done by hacking the "write protect"
> GPIO on my board into gpio-keys as a dual-edge interrupt and then
> sending commands to our security chip to toggle it--not exactly great
> for testing to make sure there are no race conditions if the interrupt
> bounces a lot.

This looks positively awful (the erratum, not the patch). Is there an
actual description of the problem, outlining the circumstances that
triggers this issue? The PDC really never fails to disappoint...

> 
>  drivers/pinctrl/qcom/pinctrl-msm.c    | 80 +++++++++++++++++++++++++++
>  drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
>  drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
>  3 files changed, 85 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 83b7d64bc4c1..45ca09ebb7b3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -860,6 +860,79 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>  
> +/**
> + * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
> + * @d: The irq dta.
> + *
> + * This is much like msm_gpio_update_dual_edge_pos() but for IRQs that are
> + * normally handled by the parent irqchip.  The logic here is slightly
> + * different due to what's easy to do with our parent, but in principle it's
> + * the same.
> + */
> +static void msm_gpio_update_dual_edge_parent(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
> +	unsigned long flags;
> +	int loop_limit = 100;

I guess this is a "finger up in the air" type of limit?

> +	unsigned int val;
> +	unsigned int type;
> +
> +	/* Read the value and make a guess about what edge we need to catch */
> +	val = msm_readl_io(pctrl, g) & BIT(g->in_bit);

What does this value represent? The input line value?

> +	type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> +
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);

What is this lock protecting you against? In both cases, you are
already under the irq_desc lock, with interrupts disabled.

> +	do {
> +		/* Set the parent to catch the next edge */
> +		irq_chip_set_type_parent(d, type);
> +
> +		/*
> +		 * Possibly the line changed between when we last read "val"
> +		 * (and decided what edge we needed) and when set the edge.
> +		 * If the value didn't change (or changed and then changed
> +		 * back) then we're done.
> +		 */

If the line changed, shouldn't you actually inject a new interrupt
altogether? By changing the polarity more than once, you are
effectively loosing edges that should have triggered an interrupt.

> +		val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> +		if (type == IRQ_TYPE_EDGE_RISING) {
> +			if (!val)
> +				break;
> +			type = IRQ_TYPE_EDGE_FALLING;
> +		} else if (type == IRQ_TYPE_EDGE_FALLING) {
> +			if (val)
> +				break;
> +			type = IRQ_TYPE_EDGE_RISING;
> +		}
> +	} while (loop_limit-- > 0);
> +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	if (!loop_limit)
> +		dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");
> +}
> +
> +void msm_gpio_handle_dual_edge_parent_irq(struct irq_desc *desc)
> +{
> +	struct irq_data	*d = &desc->irq_data;
> +
> +	/* Make sure we're primed for the next edge */
> +	msm_gpio_update_dual_edge_parent(d);

I would have expected this to happen on EOI or ACK, rather than before
the flow is actually handled, once you have told the interrupt
controller that you were dealing with this interrupt.

> +
> +	/* Pass on to the normal interrupt handler */
> +	handle_fasteoi_irq(desc);

Is that the right flow? It seems that the current code is using
handle_edge_irq. I guess it has been broken so far, and that this
patch actually fixes it by forcing a fasteoi flow...

> +}
> +
> +static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
> +						       unsigned int type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +
> +	return type == IRQ_TYPE_EDGE_BOTH &&
> +	       pctrl->soc->wakeirq_dual_edge_errata && d->parent_data &&
> +	       test_bit(d->hwirq, pctrl->skip_wake_irqs);
> +}
> +
>  static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -868,6 +941,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	unsigned long flags;
>  	u32 val;
>  
> +	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
> +		irq_set_handler_locked(d, msm_gpio_handle_dual_edge_parent_irq);
> +		msm_gpio_update_dual_edge_parent(d);
> +
> +		return 0;
> +	}
> +
>  	if (d->parent_data)
>  		irq_chip_set_type_parent(d, type);
>  
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 9452da18a78b..7486fe08eb9b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -113,6 +113,9 @@ struct msm_gpio_wakeirq_map {
>   * @pull_no_keeper: The SoC does not support keeper bias.
>   * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
>   * @nwakeirq_map:   The number of entries in @wakeirq_map
> + * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
> + *                            to be aware that their parent can't handle dual
> + *                            edge interrupts.
>   */
>  struct msm_pinctrl_soc_data {
>  	const struct pinctrl_pin_desc *pins;
> @@ -128,6 +131,7 @@ struct msm_pinctrl_soc_data {
>  	const int *reserved_gpios;
>  	const struct msm_gpio_wakeirq_map *wakeirq_map;
>  	unsigned int nwakeirq_map;
> +	bool wakeirq_dual_edge_errata;
>  };
>  
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index 1b6465a882f2..1d9acad3c1ce 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -1147,6 +1147,7 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>  	.ntiles = ARRAY_SIZE(sc7180_tiles),
>  	.wakeirq_map = sc7180_pdc_map,
>  	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>  };
>  
>  static int sc7180_pinctrl_probe(struct platform_device *pdev)
> -- 
> 2.27.0.383.g050319c2ae-goog
> 
> 

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
