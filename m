Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6AD21EE61
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 12:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgGNKyM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 06:54:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgGNKyL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jul 2020 06:54:11 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EE4022200;
        Tue, 14 Jul 2020 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594724050;
        bh=cDO8mVuJGw7IldM2TtX7w+rPbtOFzpateMoK5B7ZCFE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KfiYi6aG8N1v3AgIz7tKIs+RK+MNLUnKgXsmTZPRUPeIySEkIVK6GC/rT0Kj8hi3/
         aUii/dsaGN/dm2lM35epZOBoK/zeaJEsW8O80SxifHAhwEr4slsghx77bWM2aHyB29
         4KZROBTsomtF3lG8C07Lez9C0uYRovRjAy/nskX4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jvIZd-00BdhO-1G; Tue, 14 Jul 2020 11:54:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jul 2020 11:54:08 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        cychiang@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        swboyd@chromium.org, agross@kernel.org, mkshah@codeaurora.org,
        bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: Handle broken/missing PDC dual edge
 IRQs on sc7180
In-Reply-To: <20200713082628.v2.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
References: <20200713082628.v2.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <d1d9271595a0cfc6cbfca85b54f545cc@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: dianders@chromium.org, linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org, cychiang@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, swboyd@chromium.org, agross@kernel.org, mkshah@codeaurora.org, bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On 2020-07-13 16:26, Douglas Anderson wrote:
> Depending on how you look at it, you can either say that:
> a) There is a PDC hardware issue (with the specific IP rev that exists
>    on sc7180) that causes the PDC not to work properly when configured
>    to handle dual edges.
> b) The dual edge feature of the PDC hardware was only added in later
>    HW revisions and thus isn't in all hardware.
> 
> Regardless of how you look at it, let's work around the lack of dual
> edge support by only ever letting our parent see requests for single
> edge interrupts on affected hardware.
> 
> NOTE: it's possible that a driver requesting a dual edge interrupt
> might get several edges coalesced into a single IRQ.  For instance if
> a line starts low and then goes high and low again, the driver that
> requested the IRQ is not guaranteed to be called twice.  However, it
> is guaranteed that once the driver's interrupt handler starts running
> its first instruction that any new edges coming in will cause the
> interrupt to fire again.  This is relatively commonplace for dual-edge
> gpio interrupts (many gpio controllers require software to emulate
> dual edge with single edge) so client drivers should be setup to
> handle it.
> 
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> As far as I can tell everything here should work and the limited
> testing I'm able to give it shows that, in fact, I can detect both
> edges.
> 
> I specifically left off Reviewed-by and Tested-by tags from v2 becuase
> I felt that the implementation had changed just enough to invalidate
> previous reviews / testing.  Hopefully it's not too much of a hassle
> for folks to re-review and re-test.
> 
> Changes in v2:
> - Use handle_fasteoi_ack_irq() and switch edges in the Ack now.
> - If we change types, switch back to the normal handle_fasteoi_irq().
> - No extra locking.
> - Properly print an error if we hit 100 loops w/ no stability.
> - Beefed up the commit message.
> 
>  drivers/pinctrl/qcom/Kconfig          |  2 +
>  drivers/pinctrl/qcom/pinctrl-msm.c    | 74 ++++++++++++++++++++++++++-
>  drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
>  drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
>  4 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig 
> b/drivers/pinctrl/qcom/Kconfig
> index ff1ee159dca2..f8ff30cdafa6 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -7,6 +7,8 @@ config PINCTRL_MSM
>  	select PINCONF
>  	select GENERIC_PINCONF
>  	select GPIOLIB_IRQCHIP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select IRQ_FASTEOI_HIERARCHY_HANDLERS
> 
>  config PINCTRL_APQ8064
>  	tristate "Qualcomm APQ8064 pin controller driver"
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
> b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 83b7d64bc4c1..eae8f421ff63 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -832,6 +832,52 @@ static void msm_gpio_irq_unmask(struct irq_data 
> *d)
>  	msm_gpio_irq_clear_unmask(d, false);
>  }
> 
> +/**
> + * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs
> handled by parent.
> + * @d: The irq dta.
> + *
> + * This is much like msm_gpio_update_dual_edge_pos() but for IRQs that 
> are
> + * normally handled by the parent irqchip.  The logic here is slightly
> + * different due to what's easy to do with our parent, but in 
> principle it's
> + * the same.
> + */
> +static void msm_gpio_update_dual_edge_parent(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
> +	int loop_limit = 100;
> +	unsigned int val;
> +	unsigned int type;
> +
> +	/* Read the value and make a guess about what edge we need to catch 
> */
> +	val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> +	type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> +
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
> +		val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> +		if (type == IRQ_TYPE_EDGE_RISING) {
> +			if (!val)
> +				return;
> +			type = IRQ_TYPE_EDGE_FALLING;
> +		} else if (type == IRQ_TYPE_EDGE_FALLING) {
> +			if (val)
> +				return;
> +			type = IRQ_TYPE_EDGE_RISING;
> +		}
> +	} while (loop_limit-- > 0);
> +	dev_err(pctrl->dev, "dual-edge irq failed to stabilize\n");

I'd tone this down to a dev_warn_once(), if at all possible, or
some other rate-limited variant.

Otherwise, looks OK to me.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
