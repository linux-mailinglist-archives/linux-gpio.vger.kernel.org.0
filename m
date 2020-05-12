Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4461D021E
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 00:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbgELWY3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 18:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731954AbgELWY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 18:24:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE100C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 15:24:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so7073361pfn.5
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 15:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NG6we4EVElAPQUK0aN618c7gFt1x3MHwQbr2/Svw2vI=;
        b=kNEV5mI0LwUaQw+DbWntL8ZgPqqlUBdufqDPVeVaEhZANnwVoh0chDp/Uo97YcBtRh
         223QYDNVBusXaAIEKFWART+4E5rHM+7cdyocVpyOKLwXxztGya4gLbJPe6p08mf7yhxd
         zcFUWbivJqKcQBSbJJo4RRYbSd76fM4r6z1VlOXHn26I9l6HOnZ/ytcP0I+hXggiTJqj
         N4kH5qY5YythLgLQ5fPBn+6mdRncEaP6pFehPaISXvUd7oGYr/mUISfpaFk49C+TMhE4
         R2KO92/B2yrY288FYdxfaXUa7nb8emvCf+jRHFDz1wIwe4zFUlmsX7N39kUjuoHrnxmo
         aRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NG6we4EVElAPQUK0aN618c7gFt1x3MHwQbr2/Svw2vI=;
        b=lehs/3AYLAkL2Yb7ymvabZCLzHWJrpkFf1U3vB/xagTKyy/8w1L/MWhUG7IHCcQSkO
         CTdp7sOaD2zeSJEmhqR/Ozlo1vRzB5OsqkfKGUCLay87+U1CR+OyynhpaXdli8G2IPry
         Kb5Dnpc7aZkfdl5qfIq6Zoql/0IoglW/lYojiaaviuXC1beIQx9rxclbpOJfSzTgn4Pf
         lSZ4EKjb3NaIQ7Bh92lrMWTKi03ChXy4/EmPxmzdJTMX2pMKL6G6Ies6YyJfcNxYN6bd
         Lte0BraCKfBHqXLoly13Wo6/yct1VXqfuUYmDiUkFVq6w4pw/MfwIUjbYy/BTWU3Vsv8
         CAqg==
X-Gm-Message-State: AGi0PubXBhg/sdLDRyvVMqIRMvlMkTRp4h7RPcGSmtciAC0XehCJ13Wc
        haHYTcacYpcOEuPbay+MeCn60Q==
X-Google-Smtp-Source: APiQypL5T85pumwim3gF1owmE1/fjwAzTQXH9mCqeOjfPWv4HgPerDsfZK4XURMNbgXNQJIG9mHhSA==
X-Received: by 2002:aa7:9690:: with SMTP id f16mr24507424pfk.20.1589322267141;
        Tue, 12 May 2020 15:24:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k4sm10971599pgg.88.2020.05.12.15.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:24:26 -0700 (PDT)
Date:   Tue, 12 May 2020 15:22:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     andy.gross@linaro.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dianders@chromium.org,
        swboyd@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
Message-ID: <20200512222253.GP2165@builder.lan>
References: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 30 Apr 23:30 PDT 2020, Maulik Shah wrote:

> From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> 
> Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
> is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
> affinity of wakeup capable IRQs.
> 
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> [mkshah: updated commit text and minor code fixes]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 29259fe..83b7d64 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1033,6 +1033,29 @@ static void msm_gpio_irq_relres(struct irq_data *d)
>  	module_put(gc->owner);
>  }
>  
> +static int msm_gpio_irq_set_affinity(struct irq_data *d,
> +				const struct cpumask *dest, bool force)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +
> +	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +		return irq_chip_set_affinity_parent(d, dest, force);
> +
> +	return 0;
> +}
> +
> +static int msm_gpio_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +
> +	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +		return irq_chip_set_vcpu_affinity_parent(d, vcpu_info);
> +
> +	return 0;
> +}
> +
>  static void msm_gpio_irq_handler(struct irq_desc *desc)
>  {
>  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> @@ -1131,6 +1154,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
>  	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
>  	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
> +	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
> +	pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
>  
>  	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>  	if (np) {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
