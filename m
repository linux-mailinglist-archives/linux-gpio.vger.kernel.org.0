Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CAB2F660C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 17:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbhANQfa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 11:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbhANQfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 11:35:30 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B08DC061575
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 08:34:50 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id n42so5680747ota.12
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OIpd+GXflkSZOzCqCi1q1iLDHd4kC//VfI93wd8QIPA=;
        b=owDQjefsdPO8pEnzfVMv73Nc6hdCKHcrby4gnyVd1zN8zXcGiQ7p6OnE+IfNhR/gxJ
         FKwJDCw1ZY5FWByfTfof9wzJbNntFSkjOC0OAYEHPVmxlPamOguRnhhC0ReQLriMdi8L
         /zMm9Ek2WK6ScFGre5k82FDigHwAur5iQJyAjyUFgH9XUfiqTv1jVCqsSVoC4lR1FYXz
         t5Obn7M4gaXQ9L1k7kW5stesH++/4zeBywno+CQsD87Gjon72GhnbfzEZg/5fL6ZncJl
         inonofalG9E7fdQ8KFWzK+tYGLgpfGUIX8F8R7MbY1HR82KVO1+VpEC72uePY4WtULGv
         EHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OIpd+GXflkSZOzCqCi1q1iLDHd4kC//VfI93wd8QIPA=;
        b=HXMH6JXRaCiYAwBJfjQnOar30OhAL+oz4SVLTI26NaUwQhM+ngQL2ajVjfAf0cYV2q
         Cx9zX91h15F2WKGoyvoyKQaaB2I0H3BKCFlCxjA/da23mNWwEIQ8T/FIBFh4B51Ek2ar
         o1/8KAghFlAfrNplq18FukaSDq+R1W7HCzPa72R0d5sF5TPzmQl1tw/n7ZTrI6LZlONr
         XQAAt/m0y4gP1zWVvss3CCZxzMbDhYeMBO9B5mRiU+A/lHcqx82j1AxZUb0n23o+Js9l
         6ShUmGwCe3ZRnXIxWxo3LwyUiLvhZG0UXjnP/CmATLOCtKR7txdGI+Afzm67bU26PISU
         mXCg==
X-Gm-Message-State: AOAM5317AuhhUg9LD6ji2rUK4plhaOio/dXXdQ5FxxSxtvax8vcgQ8Ik
        od0ggodq/ddtKtpxrys3f6TgMQ==
X-Google-Smtp-Source: ABdhPJxkf/IHke46xeEdKyBJpOPkNzr63CrLo19UHT+BuLAgMQaJQa4p2mM52rMBqmddd3nPenUTqA==
X-Received: by 2002:a9d:650f:: with SMTP id i15mr4805042otl.347.1610642089822;
        Thu, 14 Jan 2021 08:34:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r13sm1170189oti.49.2021.01.14.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:34:49 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:34:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] pinctrl: qcom: Properly clear "intr_ack_high"
 interrupts when unmasking
Message-ID: <YAByp5pL7vg9ZUT9@builder.lan>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108093339.v5.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 08 Jan 11:35 CST 2021, Douglas Anderson wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

And I agree with Stephen's comment about the unnecessary parenthesis
around g->intr_ack_high.

Regards,
Bjorn

> ---
> It should be noted that this code will be moved in the next patch.  In
> theory this could be squashed into the next patch but it seems more
> documenting to have this as a separate patch.
> 
> Changes in v5:
> - ("pinctrl: qcom: Properly clear "intr_ack_high" interrupts...") new for v5.
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1787ada6bfab..a6b0c17e2f78 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -96,6 +96,14 @@ MSM_ACCESSOR(intr_cfg)
>  MSM_ACCESSOR(intr_status)
>  MSM_ACCESSOR(intr_target)
>  
> +static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
> +				const struct msm_pingroup *g)
> +{
> +	u32 val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
> +
> +	msm_writel_intr_status(val, pctrl, g);
> +}
> +
>  static int msm_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> @@ -798,7 +806,7 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
>  	 * when the interrupt is not in use.
>  	 */
>  	if (status_clear)
> -		msm_writel_intr_status(0, pctrl, g);
> +		msm_ack_intr_status(pctrl, g);
>  
>  	val = msm_readl_intr_cfg(pctrl, g);
>  	val |= BIT(g->intr_raw_status_bit);
> @@ -891,7 +899,6 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>  	const struct msm_pingroup *g;
>  	unsigned long flags;
> -	u32 val;
>  
>  	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
>  		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
> @@ -903,8 +910,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
> -	val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
> -	msm_writel_intr_status(val, pctrl, g);
> +	msm_ack_intr_status(pctrl, g);
>  
>  	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>  		msm_gpio_update_dual_edge_pos(pctrl, g, d);
> -- 
> 2.29.2.729.g45daf8777d-goog
> 
