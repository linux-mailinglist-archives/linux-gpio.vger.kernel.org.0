Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7CD21A2EF
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 17:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGIPCX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 11:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgGIPCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 11:02:22 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC7CC08C5DD
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 08:02:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w17so933584ply.11
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yq1VqfqgB3HyJVJWzu2ASng/xBjPmRxrFKs+qKlRsFQ=;
        b=xPTXH39eA4R1hyW/0+DxOoO3TZIaJEFQYVimJHiC0hKOAsm7g+hLEst/VUEC8Kob/M
         pYGJKFjj26OWwPMiLDg1KDq5DJKqEB0xNNLZSrkA0E3SqhhDg9HqtsZVgGYkffVIY6lz
         kRyKH0iJIXbyMk2/p6g0QaRhUp3nirw87raxp/r6rkEYRbt2tEsJDxkcl+0vS/6FuTdc
         FW5okx2lTVdWt+jR7LLtDLsbZKwKzV0IWbaq9kwAql4z/CU+O2fpb1XnuTb/HXehmRdi
         Gjy+QuQqT3FEGiFaf7nguBvlyK97pxgO1ovBOny1z4xXZGxb8QNa4+NPMBWNY1X3jG7Z
         nbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yq1VqfqgB3HyJVJWzu2ASng/xBjPmRxrFKs+qKlRsFQ=;
        b=ROHCFdKxEupsIz1yTlZjpS79XvWW9tgMuG3tv+Cs2MjuriIOXxWUeBqb/DX9Dyq7OS
         FV5qbpZol+fQPKyo6j/+LKLLJ0V/PvwO2k1OdEtuVdr3xhBanBTz9gjI/mGULun3BQ3+
         70ixASJD4fk4m7bFORxDl7C2HZe+PcGdoIxrwpalzL+LWAIu2MXg0HsLJxR/QChGPyDq
         bG3e0ihNLrNqxdFiCcGVyKNWlAz+Tl8ip7LeHsY9NoUHkZHHxPKbLdV+3vhudoXnvQwX
         xvar8MV48kp7dbNtTWGmN8YbgLYASqVgyrlFDokFBD8gDIscP6lfeavj3+s0mfADw3Qr
         5hdw==
X-Gm-Message-State: AOAM533sDI+0LGCby/qkKifY44FaviL5PeU+g1qTtmjbEdJoMgdH36mD
        dV8R8O97FEL1CMNSYrLCKxUpyQ==
X-Google-Smtp-Source: ABdhPJxyVlN9b5NzmNWPSv+Ip6Db1aXhYB21preD1xQhEl0MPKbmiEgGjSrkggqEfkeV+C4mHIyEnQ==
X-Received: by 2002:a17:90b:30d0:: with SMTP id hi16mr455592pjb.65.1594306940393;
        Thu, 09 Jul 2020 08:02:20 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 191sm3042477pfw.150.2020.07.09.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 08:02:19 -0700 (PDT)
Date:   Thu, 9 Jul 2020 08:00:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, cychiang@chromium.org,
        ilina@codeaurora.org, agross@kernel.org, rnayak@codeaurora.org,
        mkshah@codeaurora.org, Marc Zyngier <maz@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
Message-ID: <20200709150004.GV388985@builder.lan>
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 08 Jul 14:16 PDT 2020, Douglas Anderson wrote:

> As per Qualcomm, there is a PDC hardware issue (with the specific IP
> rev that exists on sc7180) that causes the PDC not to work properly
> when configured to handle dual edges.
> 
> Let's work around this by emulating only ever letting our parent see
> requests for single edge interrupts on affected hardware.
> 
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good to me, but did even less testing than you.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
> +	unsigned int val;
> +	unsigned int type;
> +
> +	/* Read the value and make a guess about what edge we need to catch */
> +	val = msm_readl_io(pctrl, g) & BIT(g->in_bit);
> +	type = val ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> +
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
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
> +
> +	/* Pass on to the normal interrupt handler */
> +	handle_fasteoi_irq(desc);
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
