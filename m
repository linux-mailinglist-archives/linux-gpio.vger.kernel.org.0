Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD7A2F1A51
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 16:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388435AbhAKP7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 10:59:00 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:34513 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731804AbhAKP7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 10:59:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610380721; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Rv8Ae9G9a0YvS21zbU6dOKG+esLbKOGZK6eFqISPatk=; b=I32F8m3mAqRyuePfFN9tVyWBRTAXmz0/HjWc7vLpbaW3StEvDg3DL3SXHXwVhRbxU949ohDK
 alWvQVvFFz2XrB7ZpAGueZiNJ2O4yLj5HXuutHytacj8ISSw43dSSaqViESWB7iGb1KGtEbZ
 EgbAEslzdmFVNnwYjZsxeIDhtec=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ffc75919dddba11a671f2eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 15:58:09
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 97367C43464; Mon, 11 Jan 2021 15:58:09 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6448DC433ED;
        Mon, 11 Jan 2021 15:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6448DC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 2/4] pinctrl: qcom: No need to read-modify-write the
 interrupt status
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
 <20210108093339.v5.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <aa84c8e0-3922-cc59-7c11-663bde0d2ed8@codeaurora.org>
Date:   Mon, 11 Jan 2021 21:28:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108093339.v5.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 1/8/2021 11:05 PM, Douglas Anderson wrote:
> When the Qualcomm pinctrl driver wants to Ack an interrupt, it does a
> read-modify-write on the interrupt status register.  On some SoCs it
> makes sure that the status bit is 1 to "Ack" and on others it makes
> sure that the bit is 0 to "Ack".  Presumably the first type of
> interrupt controller is a "write 1 to clear" type register and the
> second just let you directly set the interrupt status register.
>
> As far as I can tell from scanning structure definitions, the
> interrupt status bit is always in a register by itself.  Thus with
> both types of interrupt controllers it is safe to "Ack" interrupts
> without doing a read-modify-write.  We can do a simple write.
>
> It should be noted that if the interrupt status bit _was_ ever in a
> register with other things (like maybe status bits for other GPIOs):
> a) For "write 1 clear" type controllers then read-modify-write would
>     be totally wrong because we'd accidentally end up clearing
>     interrupts we weren't looking at.
> b) For "direct set" type controllers then read-modify-write would also
>     be wrong because someone setting one of the other bits in the
>     register might accidentally clear (or set) our interrupt.
> I say this simply to show that the current read-modify-write doesn't
> provide any sort of "future proofing" of the code.  In fact (for
> "write 1 clear" controllers) the new code is slightly more "future
> proof" since it would allow more than one interrupt status bits to
> share a register.
>
> NOTE: this code fixes no bugs--it simply avoids an extra register
> read.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v5:
> - ("pinctrl: qcom: No need to read-modify-write the ...") new for v5.
>
>   drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1d2a78452c2d..1787ada6bfab 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -792,16 +792,13 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
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
> +	/*
> +	 * clear the interrupt status bit before unmask to avoid
> +	 * any erroneous interrupts that would have got latched
> +	 * when the interrupt is not in use.
> +	 */
> +	if (status_clear)
> +		msm_writel_intr_status(0, pctrl, g);
>   
>   	val = msm_readl_intr_cfg(pctrl, g);
>   	val |= BIT(g->intr_raw_status_bit);
> @@ -906,11 +903,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>   
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	val = msm_readl_intr_status(pctrl, g);
> -	if (g->intr_ack_high)
> -		val |= BIT(g->intr_status_bit);
> -	else
> -		val &= ~BIT(g->intr_status_bit);
> +	val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
>   	msm_writel_intr_status(val, pctrl, g);
>   
>   	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

