Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197D821AE5D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 07:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgGJFL0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 01:11:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12967 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgGJFKh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Jul 2020 01:10:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594357836; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4cCihej0NMnulNb+7EXZtddOEx9DS7eYQDlDXZSl83s=; b=cC2bKnpTZw+h80CpV4UCrC4gJGVyuoRh++uP+v/4YgDQzYXgFi/VPHo4jq38G2JRvkRtwG+U
 WiadipR6BSAOStTnCpQ742jhIOv8iMsH8jmd4AufMHq088T3VJ/WIDYoWO9TSWG0fBtHZDW0
 8zdLOx0Xs4aS7F6uY/EH8BukUiE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f07f81ac431f7323b0102be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 05:09:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09032C433B1; Fri, 10 Jul 2020 05:09:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.65.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25F0AC43395;
        Fri, 10 Jul 2020 05:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25F0AC43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Handle broken PDC dual edge case on sc7180
To:     Douglas Anderson <dianders@chromium.org>, linus.walleij@linaro.org
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        cychiang@chromium.org, ilina@codeaurora.org, agross@kernel.org,
        rnayak@codeaurora.org, bjorn.andersson@linaro.org,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <11dcb47c-60e3-3566-fc64-3a047354dff1@codeaurora.org>
Date:   Fri, 10 Jul 2020 10:39:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200708141610.1.Ie0d730120b232a86a4eac1e2909bcbec844d1766@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

On 7/9/2020 2:46 AM, Douglas Anderson wrote:
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
>
>   drivers/pinctrl/qcom/pinctrl-msm.c    | 80 +++++++++++++++++++++++++++
>   drivers/pinctrl/qcom/pinctrl-msm.h    |  4 ++
>   drivers/pinctrl/qcom/pinctrl-sc7180.c |  1 +
>   3 files changed, 85 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 83b7d64bc4c1..45ca09ebb7b3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -860,6 +860,79 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   }
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
can you please move this spinlock covering above two lines as well?
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

you will never enter this if condtion since loop_limit will become 
negative value in above do..while loop.

need to update this check to if (loop_limit <= 0)

other than above comment this change looks good to me.

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

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
>   static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   {
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -868,6 +941,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	unsigned long flags;
>   	u32 val;
>   
> +	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
> +		irq_set_handler_locked(d, msm_gpio_handle_dual_edge_parent_irq);
> +		msm_gpio_update_dual_edge_parent(d);
> +
> +		return 0;
> +	}
> +
>   	if (d->parent_data)
>   		irq_chip_set_type_parent(d, type);
>   
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 9452da18a78b..7486fe08eb9b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -113,6 +113,9 @@ struct msm_gpio_wakeirq_map {
>    * @pull_no_keeper: The SoC does not support keeper bias.
>    * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
>    * @nwakeirq_map:   The number of entries in @wakeirq_map
> + * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
> + *                            to be aware that their parent can't handle dual
> + *                            edge interrupts.
>    */
>   struct msm_pinctrl_soc_data {
>   	const struct pinctrl_pin_desc *pins;
> @@ -128,6 +131,7 @@ struct msm_pinctrl_soc_data {
>   	const int *reserved_gpios;
>   	const struct msm_gpio_wakeirq_map *wakeirq_map;
>   	unsigned int nwakeirq_map;
> +	bool wakeirq_dual_edge_errata;
>   };
>   
>   extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index 1b6465a882f2..1d9acad3c1ce 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -1147,6 +1147,7 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>   	.ntiles = ARRAY_SIZE(sc7180_tiles),
>   	.wakeirq_map = sc7180_pdc_map,
>   	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>   };
>   
>   static int sc7180_pinctrl_probe(struct platform_device *pdev)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

