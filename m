Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB8E258123
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 20:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729411AbgHaSdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 14:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgHaSdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 14:33:15 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25368C061575
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 11:33:15 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id z2so5446631qtv.12
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 11:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UAcyAoFOFeExwZF9tW7MfLgxAuJk5pMwJvDO9oFiQTk=;
        b=De60GL1O9L9kN7NgDfGBry5QLlAacsuoC8jdKD5ZoWq2OJIFp5D0H6tBc+b6/AJLik
         r0Yppf/BHEmVPCza77yxJ0adDWUxcYY8/l1l0M3D81k7JLJZsFFeTeommFS6OVE4ma/E
         hk57HL7O6g+Ul5OEAyhjQ0BFpcj7CARyqn3T0Fz5J2DC3quhaZw0CAWqXitsMYCp6cLc
         tJL5CiIRljD+sMvVrVzmatrqk4ePQuLLyw+oifXbrQlIMnCcK78CxmoWEa+hCQe5FHPg
         zdWGkNflZLT450Zdu1uHzSqBdLIGnv4S2qFpv698zjvW/tlH+ZB0KR0fjqD8lE7UQx1n
         UX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UAcyAoFOFeExwZF9tW7MfLgxAuJk5pMwJvDO9oFiQTk=;
        b=DtQmPnYST66hPSX7SzkVslb7NcpbE0ofAsTCFeuW6Zo9FSLblHOdMfw68hLjpwGt0l
         vP2BkYZWz7CU0q2U8cGRy2Z4wlhD/04M+BmVuAFyy+4SZiarwj8BzGaDXKaCKtj0Xe0a
         tAbXS20oJVX56PvJLK/jRcfht7IJEL7OyzEX1N7nob7K5uQSx5u73KhEQraDWxjhfL+9
         37G9I6BRb+TkUuA2DmEwIXgTHPepImJFcFiIlbHH2KlwbUpVnPUL5y8ff7DHhGJ9HfrV
         GlS9SRIugf4PkjQwhCJd9hyQj+HYNA9Vgt7KdcaTj7GrpejMUbh8y4uZbOu3sjJb8Frq
         eHbA==
X-Gm-Message-State: AOAM5332XRRAF7KfpfwXYdYdN0UhXhPVm1keUQXjfdfZNXS7NlQDhMH7
        X6BtXZHfLtMRv7DvQZ1J20MWNA==
X-Google-Smtp-Source: ABdhPJxMYVLW/OqNwsAnPKkGVetBrH5C2vVqfm7r+pHWg/iKcznPIFe/SPY5WC7Z0UckiSB9A0Pbyw==
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr2656182qta.146.1598898794310;
        Mon, 31 Aug 2020 11:33:14 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id m17sm11533922qkn.45.2020.08.31.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 11:33:13 -0700 (PDT)
Date:   Mon, 31 Aug 2020 18:33:12 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH v5 1/6] pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASKED and
 IRQCHIP_MASK_ON_SUSPEND flags
Message-ID: <20200831183312.GC468@uller>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
 <1598113021-4149-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598113021-4149-2-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 22 Aug 16:16 UTC 2020, Maulik Shah wrote:

> Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs during
> suspend and mask before setting irq type.
> 
> Masking before changing type should make sure any spurious interrupt is not
> detected during this operation.
> 

This seems like two different problems and both descriptions are thin on
details imho.  If you're respinning the series I would appreciate if you
improved this.

Otherwise
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a2567e7..1c23f5c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1243,6 +1243,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>  	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>  	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
>  	pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
> +	pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND |
> +				IRQCHIP_SET_TYPE_MASKED;
>  
>  	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>  	if (np) {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
