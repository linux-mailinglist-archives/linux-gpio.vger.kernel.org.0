Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B851E2F1A5D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 17:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbhAKQCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 11:02:03 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:34231 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729414AbhAKQCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 11:02:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610380900; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tIaeOh2O8eQew0PEtYuX7dx/6nI/Req8F64eYze35UE=; b=soBi/WozMo44KgnZtWIGYP7JSyswMnJLmT1PozSnhdgRV8udCYaWO672DKtiRSc7zDjQ0dcs
 u81gDTExnRAD35IjZ+FiwVLpzwhfUBOv+RdOIB087dCD8miBfbjuwb9JZnxJEtYaHuPsBY74
 GBnvkeSz+K8V2v2lrPuNYf+596w=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5ffc7650415a6293c592fa88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 16:01:20
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5106BC43464; Mon, 11 Jan 2021 16:01:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.75.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE0A8C433CA;
        Mon, 11 Jan 2021 16:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE0A8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when
 enabling
To:     Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <a08c603b-d72b-c72b-a607-fac3ba9f0e1b@codeaurora.org>
Date:   Mon, 11 Jan 2021 21:31:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

Thanks for the patch. Looks good to me and tested.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 1/8/2021 11:05 PM, Douglas Anderson wrote:
> In Linux, if a driver does disable_irq() and later does enable_irq()
> on its interrupt, I believe it's expecting these properties:
> * If an interrupt was pending when the driver disabled then it will
>    still be pending after the driver re-enables.
> * If an edge-triggered interrupt comes in while an interrupt is
>    disabled it should assert when the interrupt is re-enabled.
>
> If you think that the above sounds a lot like the disable_irq() and
> enable_irq() are supposed to be masking/unmasking the interrupt
> instead of disabling/enabling it then you've made an astute
> observation.  Specifically when talking about interrupts, "mask"
> usually means to stop posting interrupts but keep tracking them and
> "disable" means to fully shut off interrupt detection.  It's
> unfortunate that this is so confusing, but presumably this is all the
> way it is for historical reasons.
>
> Perhaps more confusing than the above is that, even though clients of
> IRQs themselves don't have a way to request mask/unmask
> vs. disable/enable calls, IRQ chips themselves can implement both.
> ...and yet more confusing is that if an IRQ chip implements
> disable/enable then they will be called when a client driver calls
> disable_irq() / enable_irq().
>
> It does feel like some of the above could be cleared up.  However,
> without any other core interrupt changes it should be clear that when
> an IRQ chip gets a request to "disable" an IRQ that it has to treat it
> like a mask of that IRQ.
>
> In any case, after that long interlude you can see that the "unmask
> and clear" can break things.  Maulik tried to fix it so that we no
> longer did "unmask and clear" in commit 71266d9d3936 ("pinctrl: qcom:
> Move clearing pending IRQ to .irq_request_resources callback"), but it
> only handled the PDC case and it had problems (it caused
> sc7180-trogdor devices to fail to suspend).  Let's fix.
>
>  From my understanding the source of the phantom interrupt in the
> were these two things:
> 1. One that could have been introduced in msm_gpio_irq_set_type()
>     (only for the non-PDC case).
> 2. Edges could have been detected when a GPIO was muxed away.
>
> Fixing case #1 is easy.  We can just add a clear in
> msm_gpio_irq_set_type().
>
> Fixing case #2 is harder.  Let's use a concrete example.  In
> sc7180-trogdor.dtsi we configure the uart3 to have two pinctrl states,
> sleep and default, and mux between the two during runtime PM and
> system suspend (see geni_se_resources_{on,off}() for more
> details). The difference between the sleep and default state is that
> the RX pin is muxed to a GPIO during sleep and muxed to the UART
> otherwise.
>
> As per Qualcomm, when we mux the pin over to the UART function the PDC
> (or the non-PDC interrupt detection logic) is still watching it /
> latching edges.  These edges don't cause interrupts because the
> current code masks the interrupt unless we're entering suspend.
> However, as soon as we enter suspend we unmask the interrupt and it's
> counted as a wakeup.
>
> Let's deal with the problem like this:
> * When we mux away, we'll mask our interrupt.  This isn't necessary in
>    the above case since the client already masked us, but it's a good
>    idea in general.
> * When we mux back will clear any interrupts and unmask.
>
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Note that patch #1 of v4 has now landed so it's dropped from the v5
> post.  Also note that there is no dependency of this series on the v4
> patch #1 so no special coordination need happen for that.
>
> I didn't add Rajendra's and Stephen's tags from v4 since there were
> enough changes from v4 to v5 to warrant a re-review.
>
> My tests here for the non-PDC case are mostly synthetic and I don't
> have any good way to test the case that the original patch was added
> for.  Hopefully it's all good?
>
> Changes in v5:
> - Re-combined PDC and non-PDC since non-PDC their issues are similar.
> - "it" => "the interrupt" in comment.
> - Handle 2nd case where edges came when muxed away.
> - Handle controllers where you write 1 to Ack.
>
> Changes in v4:
> - Split non-PDC fix and PDC fix in two.
> - Totally rewrote again with my new understanding of the world.
>
> Changes in v3:
> - Fixed bug in msm_gpio_direction_output() (s/oldval =/oldval = val =/)
> - Add back "if !skip_wake_irqs" test in msm_gpio_irq_enable()
> - For non-PDC, clear 1st interrupt in msm_gpio_irq_set_type()
>
> Changes in v2:
> - 0 => false
> - If skip_wake_irqs, don't need to clear normal intr.
> - Add comment about glitches in both output and input.
>
>   drivers/pinctrl/qcom/pinctrl-msm.c | 74 +++++++++++++++++++-----------
>   1 file changed, 46 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a6b0c17e2f78..d5d1f3430c6c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -51,6 +51,7 @@
>    * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
>    *                  detection.
>    * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt controller
> + * @disabled_for_mux: These IRQs were disabled because we muxed away.
>    * @soc:            Reference to soc_data of platform specific data.
>    * @regs:           Base addresses for the TLMM tiles.
>    * @phys_base:      Physical base address
> @@ -72,6 +73,7 @@ struct msm_pinctrl {
>   	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
>   	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
>   	DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
> +	DECLARE_BITMAP(disabled_for_mux, MAX_NR_GPIO);
>   
>   	const struct msm_pinctrl_soc_data *soc;
>   	void __iomem *regs[MAX_NR_TILES];
> @@ -179,6 +181,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   			      unsigned group)
>   {
>   	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct gpio_chip *gc = &pctrl->chip;
> +	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
> +	struct irq_data *d = irq_get_irq_data(irq);
> +	unsigned int gpio_func = pctrl->soc->gpio_func;
>   	const struct msm_pingroup *g;
>   	unsigned long flags;
>   	u32 val, mask;
> @@ -195,6 +201,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   	if (WARN_ON(i == g->nfuncs))
>   		return -EINVAL;
>   
> +	/*
> +	 * If an GPIO interrupt is setup on this pin then we need special
> +	 * handling.  Specifically interrupt detection logic will still see
> +	 * the pin twiddle even when we're muxed away.
> +	 *
> +	 * When we see a pin with an interrupt setup on it then we'll disable
> +	 * (mask) interrupts on it when we mux away until we mux back.  Note
> +	 * that disable_irq() refcounts and interrupts are disabled as long as
> +	 * at least one disable_irq() has been called.
> +	 */
> +	if (d && i != gpio_func &&
> +	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> +		disable_irq(irq);
> +
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
>   	val = msm_readl_ctl(pctrl, g);
> @@ -204,6 +224,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   
> +	if (d && i == gpio_func &&
> +	    test_and_clear_bit(d->hwirq, pctrl->disabled_for_mux)) {
> +		/*
> +		 * Clear interrupts detected while not GPIO since we only
> +		 * masked things.
> +		 */
> +		if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +			irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
> +		else
> +			msm_ack_intr_status(pctrl, g);
> +
> +		enable_irq(irq);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -782,7 +816,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   }
>   
> -static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> +static void msm_gpio_irq_unmask(struct irq_data *d)
>   {
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> @@ -800,14 +834,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>   
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	/*
> -	 * clear the interrupt status bit before unmask to avoid
> -	 * any erroneous interrupts that would have got latched
> -	 * when the interrupt is not in use.
> -	 */
> -	if (status_clear)
> -		msm_ack_intr_status(pctrl, g);
> -
>   	val = msm_readl_intr_cfg(pctrl, g);
>   	val |= BIT(g->intr_raw_status_bit);
>   	val |= BIT(g->intr_enable_bit);
> @@ -827,7 +853,7 @@ static void msm_gpio_irq_enable(struct irq_data *d)
>   		irq_chip_enable_parent(d);
>   
>   	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -		msm_gpio_irq_clear_unmask(d, true);
> +		msm_gpio_irq_unmask(d);
>   }
>   
>   static void msm_gpio_irq_disable(struct irq_data *d)
> @@ -842,11 +868,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
>   		msm_gpio_irq_mask(d);
>   }
>   
> -static void msm_gpio_irq_unmask(struct irq_data *d)
> -{
> -	msm_gpio_irq_clear_unmask(d, false);
> -}
> -
>   /**
>    * msm_gpio_update_dual_edge_parent() - Prime next edge for IRQs handled by parent.
>    * @d: The irq dta.
> @@ -935,6 +956,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>   	const struct msm_pingroup *g;
>   	unsigned long flags;
> +	bool was_enabled;
>   	u32 val;
>   
>   	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
> @@ -996,6 +1018,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	 * could cause the INTR_STATUS to be set for EDGE interrupts.
>   	 */
>   	val = msm_readl_intr_cfg(pctrl, g);
> +	was_enabled = val & BIT(g->intr_raw_status_bit);
>   	val |= BIT(g->intr_raw_status_bit);
>   	if (g->intr_detection_width == 2) {
>   		val &= ~(3 << g->intr_detection_bit);
> @@ -1045,6 +1068,14 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	}
>   	msm_writel_intr_cfg(val, pctrl, g);
>   
> +	/*
> +	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
> +	 * Clear the interrupt.  This is safe because we have
> +	 * IRQCHIP_SET_TYPE_MASKED.
> +	 */
> +	if (!was_enabled)
> +		msm_ack_intr_status(pctrl, g);
> +
>   	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>   		msm_gpio_update_dual_edge_pos(pctrl, g, d);
>   
> @@ -1096,19 +1127,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>   		ret = -EINVAL;
>   		goto out;
>   	}
> -
> -	/*
> -	 * Clear the interrupt that may be pending before we enable
> -	 * the line.
> -	 * This is especially a problem with the GPIOs routed to the
> -	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
> -	 * Disabling the interrupt line at the PDC does not prevent
> -	 * the interrupt from being latched at the GIC. The state at
> -	 * GIC needs to be cleared before enabling.
> -	 */
> -	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> -
>   	return 0;
>   out:
>   	module_put(gc->owner);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

