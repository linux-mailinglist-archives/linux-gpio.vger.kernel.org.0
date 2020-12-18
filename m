Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CA22DDE1A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 06:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbgLRFgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 00:36:43 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:29078 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLRFgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 00:36:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608269777; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bIxzsvC8MsCGA55Fum83HNABdyD+z6GnK6PLUqTBqj0=; b=kqxu0bVLpT1OLC+r0MSNRdNxjp8ZdBVSsAWVy5UXz1eOMkGlpyQy2PIkAr9/Rhu5Kab9+PHA
 f/FGRfknYs2PvlLGIRtlkgs28H0PVXi5cnNxQRqiHLh3jSoC+HAdc6fGykuTopstW9nSSAXP
 e00EuAEtgEDgWoK/cVRWKeTkv+g=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fdc3fb17549779c5b7930ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 05:35:45
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07A67C43465; Fri, 18 Dec 2020 05:35:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.120] (unknown [49.207.218.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88093C433C6;
        Fri, 18 Dec 2020 05:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88093C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 3/4] pinctrl: qcom: Don't clear pending interrupts when
 enabling
To:     Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
 <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <71a4e7da-59da-4a7c-aa4e-45ade8c5558b@codeaurora.org>
Date:   Fri, 18 Dec 2020 11:05:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201211141514.v4.3.I7cf3019783720feb57b958c95c2b684940264cd1@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 12/12/2020 3:45 AM, Douglas Anderson wrote:
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
> only handled the PDC case (it also had problems, but that's the
> subject of another patch).  Let's fix this for the non-PDC case.
> 
>  From my understanding the source of the phantom interrupt in the
> non-PDC case was the one that could have been introduced in
> msm_gpio_irq_set_type().  Let's handle that one and then get rid of
> the clear.
> 
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I don't have lots of good test cases here, so hopefully someone from
> Qualcomm can confirm that this works well for them and there isn't
> some other phantom interrupt source that I'm not aware of.

I currently don;t have access to any non-PDC hardware, so could not really do
any real tests, but the changes seem sane, so

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
> Changes in v4:
> - ("pinctrl: qcom: Don't clear pending interrupts when enabling") split for v4.
> 
>   drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++-----------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 588df91274e2..f785646d1df7 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -774,7 +774,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>   }
>   
> -static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
> +static void msm_gpio_irq_unmask(struct irq_data *d)
>   {
>   	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> @@ -792,17 +792,6 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>   
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	if (status_clear) {
> -		/*
> -		 * clear the interrupt status bit before unmask to avoid
> -		 * any erroneous interrupts that would have got latched
> -		 * when the interrupt is not in use.
> -		 */
> -		val = msm_readl_intr_status(pctrl, g);
> -		val &= ~BIT(g->intr_status_bit);
> -		msm_writel_intr_status(val, pctrl, g);
> -	}
> -
>   	val = msm_readl_intr_cfg(pctrl, g);
>   	val |= BIT(g->intr_raw_status_bit);
>   	val |= BIT(g->intr_enable_bit);
> @@ -822,7 +811,7 @@ static void msm_gpio_irq_enable(struct irq_data *d)
>   		irq_chip_enable_parent(d);
>   
>   	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
> -		msm_gpio_irq_clear_unmask(d, true);
> +		msm_gpio_irq_unmask(d);
>   }
>   
>   static void msm_gpio_irq_disable(struct irq_data *d)
> @@ -837,11 +826,6 @@ static void msm_gpio_irq_disable(struct irq_data *d)
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
> @@ -936,6 +920,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>   	const struct msm_pingroup *g;
>   	unsigned long flags;
> +	bool was_enabled;
>   	u32 val;
>   
>   	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
> @@ -997,6 +982,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	 * could cause the INTR_STATUS to be set for EDGE interrupts.
>   	 */
>   	val = msm_readl_intr_cfg(pctrl, g);
> +	was_enabled = val & BIT(g->intr_raw_status_bit);
>   	val |= BIT(g->intr_raw_status_bit);
>   	if (g->intr_detection_width == 2) {
>   		val &= ~(3 << g->intr_detection_bit);
> @@ -1046,6 +1032,16 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	}
>   	msm_writel_intr_cfg(val, pctrl, g);
>   
> +	/*
> +	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
> +	 * Clear it.  This is safe because we have IRQCHIP_SET_TYPE_MASKED.
> +	 */
> +	if (!was_enabled) {
> +		val = msm_readl_intr_status(pctrl, g);
> +		val &= ~BIT(g->intr_status_bit);
> +		msm_writel_intr_status(val, pctrl, g);
> +	}
> +
>   	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>   		msm_gpio_update_dual_edge_pos(pctrl, g, d);
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
