Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEDE2F1A58
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 17:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730472AbhAKQAG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 11:00:06 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:26635 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729630AbhAKQAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 11:00:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610380785; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KF3pDVrkGIwiIeNHkgBT0vpztBzizZGwHLuTfWBg/Lg=; b=wcLa5+7wAA749AjywpejH3DlNwZzDdqLWhwJtGP8F7ocyXQRhyTc9ebNstCFoHgKaoBjbClH
 M1dKsLP9FNPKcTJ9dr4hBbKZvekEjyqNe3Um6wOCv+HtzreUmhLtyqpNogWAmWal2001jl73
 hSV0Rb3MqIeyTYKDQx52cQwJpzE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ffc75cc415a6293c59068f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 15:59:08
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 441F7C43465; Mon, 11 Jan 2021 15:59:08 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21D5AC433C6;
        Mon, 11 Jan 2021 15:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21D5AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v5 3/4] pinctrl: qcom: Properly clear "intr_ack_high"
 interrupts when unmasking
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
 <20210108093339.v5.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <029799d8-014c-6ad2-bbdd-d81ba355edba@codeaurora.org>
Date:   Mon, 11 Jan 2021 21:29:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108093339.v5.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
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
> In commit 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for
> msm gpio") we tried to Ack interrupts during unmask.  However, that
> patch forgot to check "intr_ack_high" so, presumably, it only worked
> for a certain subset of SoCs.
>
> Let's add a small accessor so we don't need to open-code the logic in
> both places.
>
> This was found by code inspection.  I don't have any access to the
> hardware in question nor software that needs the Ack during unmask.
>
> Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> It should be noted that this code will be moved in the next patch.  In
> theory this could be squashed into the next patch but it seems more
> documenting to have this as a separate patch.
>
> Changes in v5:
> - ("pinctrl: qcom: Properly clear "intr_ack_high" interrupts...") new for v5.
>
>   drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1787ada6bfab..a6b0c17e2f78 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -96,6 +96,14 @@ MSM_ACCESSOR(intr_cfg)
>   MSM_ACCESSOR(intr_status)
>   MSM_ACCESSOR(intr_target)
>   
> +static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
> +				const struct msm_pingroup *g)
> +{
> +	u32 val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
> +
> +	msm_writel_intr_status(val, pctrl, g);
> +}
> +
>   static int msm_get_groups_count(struct pinctrl_dev *pctldev)
>   {
>   	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> @@ -798,7 +806,7 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>   	 * when the interrupt is not in use.
>   	 */
>   	if (status_clear)
> -		msm_writel_intr_status(0, pctrl, g);
> +		msm_ack_intr_status(pctrl, g);
>   
>   	val = msm_readl_intr_cfg(pctrl, g);
>   	val |= BIT(g->intr_raw_status_bit);
> @@ -891,7 +899,6 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>   	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>   	const struct msm_pingroup *g;
>   	unsigned long flags;
> -	u32 val;
>   
>   	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
>   		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> @@ -903,8 +910,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>   
>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>   
> -	val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
> -	msm_writel_intr_status(val, pctrl, g);
> +	msm_ack_intr_status(pctrl, g);
>   
>   	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>   		msm_gpio_update_dual_edge_pos(pctrl, g, d);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

