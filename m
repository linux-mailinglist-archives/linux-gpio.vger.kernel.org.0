Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330112C1E9F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 08:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgKXHDy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 02:03:54 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:64359 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729819AbgKXHDx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Nov 2020 02:03:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606201432; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YF61W81vONcskH27ZHgeEaWj9GgOnf6tmXPHaUZQsKI=; b=PLO2LfB1bxBvCv72id6s7iM5pHf5NAQFZFQAQrtrnvnNZp98FJ1fe1xFIBud+Hxf7LIfHNAr
 cTsGTh/zOcD32CXZ6/fLV96ViiSM0WfSdkvOtF6Qkl/XJGUyQBsU5U1Ocg9dESrKx57UkzXK
 5pk9NkMupc6GUDsaXhX7dC7AnFQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbcb0524146c5eefd9aba39 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 07:03:46
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7552CC43465; Tue, 24 Nov 2020 07:03:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFF4FC433ED;
        Tue, 24 Nov 2020 07:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFF4FC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/3] irqchip: qcom-pdc: Fix phantom irq when changing
 between rising/falling
To:     Douglas Anderson <dianders@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
References: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ca9543df-3cb3-c4b2-b60c-97651f489795@codeaurora.org>
Date:   Tue, 24 Nov 2020 12:33:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123160139.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
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

On 11/24/2020 5:31 AM, Douglas Anderson wrote:
> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>    wakeup-event-action = <EV_ACT_DEASSERTED>;
>    wakeup-source;
>
> Specifically we end up with a phantom interrupt that blocks suspend if
> the line was already high and we want wakeups on rising edges (AKA we
> want the GPIO to go low and then high again before we wake up).  The
> opposite is also problematic.
>
> Specifically, here's what's happening today:
> 1. Normally, gpio-keys configures to look for both edges.  Due to the
>     current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
>     qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
>     line was high we'd configure for falling edges.
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
>   drivers/irqchip/qcom-pdc.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index bd39e9de6ecf..7d097164aadc 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -159,6 +159,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>   {
>   	int pin_out = d->hwirq;
>   	enum pdc_irq_config_bits pdc_type;
> +	enum pdc_irq_config_bits old_pdc_type;
> +	int ret;
>   
>   	if (pin_out == GPIO_NO_WAKE_IRQ)
>   		return 0;
> @@ -187,9 +189,24 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
>   		return -EINVAL;
>   	}
>   
> +	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
>   	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
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
> +
> +	return ret;
>   }
>   
>   static struct irq_chip qcom_pdc_gic_chip = {

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

