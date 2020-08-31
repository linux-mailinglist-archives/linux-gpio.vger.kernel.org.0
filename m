Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBCC2580CC
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 20:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbgHaST3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 14:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729724AbgHaSTV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 14:19:21 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E283C061755
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 11:19:21 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id ef16so1622964qvb.8
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t1/Tbd4L56MeL2p75ATvjZTyO/Tm7hkvDW3bz/swotc=;
        b=tbpDwtgB2fMMtc4DXh027u/wFKzMbJ5Cc2upysoNYoY31SkshSdvfrxDYT0KcTGXs8
         SdJi7cdl3ZoRuz1ubGq96Q2TCNMgbhleQUqjnDvd8ssXP9zG4sJ2imOZ4MdfaqZU21n9
         Nzdy4NYs4tE4HoT/Qh1Z6Q3bT9/C+wOwGwrMoBMa6hmVI3L0EP0/j5jjNTPeD2upOUey
         GOTXlbG90X/p9ebnC4jR3xIMb1eacEQv8Ablpd1UumiQpwKdi67PuHMMTk8B4eiJ67qt
         +1nYSFsWkV+Y4G3YZLhcyJHeQrM+1v0U6SPfSwxCbVeysov157C49u18RjgaDTsooHks
         sSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t1/Tbd4L56MeL2p75ATvjZTyO/Tm7hkvDW3bz/swotc=;
        b=bPWeUq3BYnuOBawlK4vbGWLneC6IuEwJmSMqoviSwyLbZ53frIG1wCtUCGcEOEL2E3
         M70rblDGs41Pizm+RmmjUP/i3jA6NrnO1aeEM+jihv1HBH3yEEeldpFg/frNNsMfddwy
         FduOtB3xX8cx9tEz9BHJmvpegR00PvA+3jxeMw0ChMKQDOiHnSZgV+KIP/3TCVp+Aab1
         7Cu76E1It69QUlsBgg0CUYlToKuABjRdNqvRdjLCab2Z6ERK04HGxndAL/LmWGdywPtM
         TNGk2MZ7yuK5oOXHhJ3BIl7kM3PHcffGSgiGz6nlL6FhtJXTmbV8h4Foacv1wAZakRZ4
         y7MQ==
X-Gm-Message-State: AOAM531xvz5XsgfACKAeB2stsVknTrvTBQL0NpMtCdqkcbUGEI4Rvknd
        UdQAUrGdP8aWzQA2EZxzwn2GLg==
X-Google-Smtp-Source: ABdhPJyuyZ+ucI3w1yI15tL5bKSeQjAjW64aQ4RSO5hao4Rhp3pGVjo+MhwR7XDy8TnVcv+62efXEQ==
X-Received: by 2002:a05:6214:d46:: with SMTP id 6mr2364472qvr.240.1598897960345;
        Mon, 31 Aug 2020 11:19:20 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id y73sm10600006qkb.23.2020.08.31.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 11:19:19 -0700 (PDT)
Date:   Mon, 31 Aug 2020 18:19:18 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH v5 2/6] pinctrl: qcom: Use return value from
 irq_set_wake() call
Message-ID: <20200831181918.GB468@uller>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598113021-4149-3-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 22 Aug 16:16 UTC 2020, Maulik Shah wrote:

> msmgpio irqchip was not using return value of irq_set_irq_wake() callback
> since previously GIC-v3 irqchip neither had IRQCHIP_SKIP_SET_WAKE flag nor
> it implemented .irq_set_wake callback. This lead to irq_set_irq_wake()
> return error -ENXIO.
> 
> However from 'commit 4110b5cbb014 ("irqchip/gic-v3: Allow interrupt to be
> configured as wake-up sources")' GIC irqchip has IRQCHIP_SKIP_SET_WAKE
> flag.
> 
> Use return value from irq_set_irq_wake() and irq_chip_set_wake_parent()
> instead of always returning success.
> 
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1c23f5c..1df2322 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1077,12 +1077,10 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>  	 * when TLMM is powered on. To allow that, enable the GPIO
>  	 * summary line to be wakeup capable at GIC.
>  	 */
> -	if (d->parent_data)
> -		irq_chip_set_wake_parent(d, on);
> -
> -	irq_set_irq_wake(pctrl->irq, on);
> +	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +		return irq_chip_set_wake_parent(d, on);
>  
> -	return 0;
> +	return irq_set_irq_wake(pctrl->irq, on);
>  }
>  
>  static int msm_gpio_irq_reqres(struct irq_data *d)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
