Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDE86193519
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 01:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgCZAs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 20:48:57 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36244 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgCZAs5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 20:48:57 -0400
Received: by mail-pj1-f66.google.com with SMTP id nu11so1726118pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 17:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZxzmZfPQ1xcC/8WFAa5OQo5qBlQ7cBwjnS72WYBmhnM=;
        b=BaPu37FN/CsRiMEyYm+HmvCnIO8JDg5UEBcKiVnvhIRayz4l+DZ6c/rOFuGixsI5HJ
         8fp359TgrVh+iMC8jKBDpIqdsWb2aGsb4iEGmDMvGtdS69HT47g6S+e/owlZ+tSjAYXD
         56OeO3FBLPHnHriiGYcrSYnkeA3hJ8DFG5vcX4ij4fa73nKUZiFOGDd4/KWwDPCCN9nY
         2EuSs91uRxCixGPZUo2fKE+Ny31dQi7T5260bKFwPflt9L4i3r/ZhUmkCouEBivHpPhE
         ititO+ThCogxJzxi4HqALVxxsrRZMUx8Obvswcsjkl/Ovlfz/0y6fccNseM+u+YzK14y
         OO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZxzmZfPQ1xcC/8WFAa5OQo5qBlQ7cBwjnS72WYBmhnM=;
        b=D8OpJmSmePPlfFcEd601YMKe0Jp/XZORhUwt3ovIe41nE0T8nje64oHfs0LtMbWep3
         vmOPj7YmuihsRg0se7DZ8wkLYIxp8zy0y2YsxalZaseJWVUPL5mjILihC9nwB2gUGCLZ
         G/fm8SnGS+35NzDtC9pA8iIrFWDozsV7OSkthNdtahz8LJH4OjM5XDzRna4YuVbXRAnT
         AxyGQ5Uhh7XRe6GH9L+/jscvqF45bJ0kdfuf459XpaIt0tnOfj126/BzR2GHdJQoF1RT
         HRWjfqt2X0LypOZ6yPXu+J//BmTd3BGRcHbGzKzSv9yY3MLibFISMJNCOpuTlQVpzzAC
         ICuw==
X-Gm-Message-State: ANhLgQ0iR+v66zU7WOR8zMDXBizQvJqFFLBhrtp7LjVa6N/IMzJdS9oz
        pHQjgiOPvH0NNVrAYxWqo7/FZg==
X-Google-Smtp-Source: ADFU+vtw3sinPXugyhL8FDCWdq3ewIqgQgO1/OskBNO4Ad9/Uea+Sz3NiutRtgjrIwX+CfwM4abhRA==
X-Received: by 2002:a17:902:b592:: with SMTP id a18mr2419130pls.98.1585183736437;
        Wed, 25 Mar 2020 17:48:56 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z15sm273726pfg.152.2020.03.25.17.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 17:48:55 -0700 (PDT)
Date:   Wed, 25 Mar 2020 17:48:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     agross@kernel.org, Ajay Kishore <akisho@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Message-ID: <20200326004853.GH119913@minitux>
References: <20200313191513.11365-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313191513.11365-1-ansuelsmth@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 13 Mar 12:15 PDT 2020, Ansuel Smith wrote:

> For IPQ806x targets, TZ protects the registers that are used to
> configure the routing of interrupts to a target processor.
> To resolve this, this patch uses scm call to route GPIO interrupts
> to application processor. Also the scm call interface is changed.
> 

Oh no...but this does look pretty reasonable after all, some comments
and suggestions below.

> Signed-off-by: Ajay Kishore <akisho@codeaurora.org>

With this --author should be Ajay.

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 36 ++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9a8daa256a32..a83cfd1da219 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -22,6 +22,8 @@
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
>  #include <linux/log2.h>
> +#include <linux/qcom_scm.h>
> +#include <linux/io.h>
>  
>  #include <linux/soc/qcom/irq.h>
>  
> @@ -710,6 +712,9 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>  	const struct msm_pingroup *g;
>  	unsigned long flags;
>  	u32 val;
> +	u32 addr;
> +	int ret;
> +	const __be32 *reg;
>  
>  	if (d->parent_data)
>  		irq_chip_mask_parent(d);
> @@ -863,6 +868,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	const struct msm_pingroup *g;
>  	unsigned long flags;
>  	u32 val;
> +	int ret;
>  
>  	if (d->parent_data)
>  		irq_chip_set_type_parent(d, type);
> @@ -882,11 +888,33 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	else
>  		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
>  
> +	ret = of_device_is_compatible(pctrl->dev->of_node,
> +					"qcom,ipq8064-pinctrl");

This won't change in runtime, so I would like for you to query this
during probe and then carry the result in msm_pinctrl.

>  	/* Route interrupts to application cpu */
> -	val = msm_readl_intr_target(pctrl, g);
> -	val &= ~(7 << g->intr_target_bit);
> -	val |= g->intr_target_kpss_val << g->intr_target_bit;
> -	msm_writel_intr_target(val, pctrl, g);
> +	if (!ret) {
> +		val = msm_readl_intr_target(pctrl, g);
> +		val &= ~(7 << g->intr_target_bit);
> +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +		msm_writel_intr_target(val, pctrl, g);
> +	} else {
> +		const __be32 *reg = of_get_property(pctrl->dev->of_node,
> +						    "reg", NULL);

This too will be static, and we already resolve this, properly, with
address translation etc during probe.

So if you do a partial rollback of '4b024225c4a8 ("pinctrl: use
devm_platform_ioremap_resource() to simplify code")' you can stash the
base address of the resource in msm_pinctrl, and then make your change
conditional on this being NULL or not.

> +
> +		if (reg) {
> +			u32 addr = be32_to_cpup(reg) + g->intr_target_reg;
> +
> +			qcom_scm_io_readl(addr, &val);
> +			__iormb();

Why do you need this and below barriers?

> +
> +			val &= ~(7 << g->intr_target_bit);
> +			val |= g->intr_target_kpss_val << g->intr_target_bit;
> +
> +			__iowmb();
> +			ret = qcom_scm_io_writel(addr, val);
> +			if (ret)
> +				pr_err("\n Routing interrupts to Apps proc failed");

You have msm_pinctrl->dev, so use dev_err(). And the \n goes at the end
in Linux - and perhaps make it include d->hwirq to make it a little bit
informative?

Regards,
Bjorn

> +		}
> +	}
>  
>  	/* Update configuration for gpio.
>  	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
> -- 
> 2.25.0
> 
