Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B52196173
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 23:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgC0WrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 18:47:08 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54501 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgC0WrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 18:47:07 -0400
Received: by mail-pj1-f65.google.com with SMTP id np9so4464046pjb.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 15:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1wSwo251yyiXKUeE+XnUhhLK8OMnF/L91ccGd/UxDFQ=;
        b=lUyhJQ1S6XDMLFU+K/JQXz8ijg9a2pwJAa9IT2T9+uqTf1A6hAKYOnfKaD69Z0ZJ/h
         AXWY3SHctlNCCfzhHsJFuPylUJjafyd1lMZi7gnrwp61ewKfx+85+H74UgzlaDafWDb/
         UeWg0DdayFfpxZsfAjm+Z6RsDAWqrZPbw7t/mClBsj1GG2ci+qiPDrBL6Xo+WrNyt8Cs
         T2VrJBSFbc2h49OwwWli89i1EP1ppUgk08w1MQYouyZKEUSVaEH1sIfRrb3ZIHcHijWv
         CsuzxcguR/3nIcHGyBdqgLyqXfiIpK5cvvaLZQUYSqEd7c8xiuSCe7XkcpoGkAut94s9
         J4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1wSwo251yyiXKUeE+XnUhhLK8OMnF/L91ccGd/UxDFQ=;
        b=Is2E0EAetY1LG9KG63umD9QGSg81ro8DwUKaIevY2R4sPUfDAwCrgOF3SloczMtjIE
         8VHezbvz60dNICk4iXbdFVXwVs/POfds6dY207ae7S643B0V9ME+gj1U3EGlpXTGEKsM
         a4o7UyLIUbaSepnkx1xpXZ5EgrNdpRIj52cX0xy9Zzv3B2Xg6nn+VNwjtJpK1hNKlqz1
         jHg1p2/ZKzJZofu+cOalfX4vsNSHOfD3Dsf4wQp/MF6C2EJsoT9a0coyZTFO5ssGlr1v
         m3hiiS+EbMqs8+yOMpEjc4Uxdu4ls+CYO+MN1Op+JEq3StKf99Dvp95k/WrIH9S+fNIF
         EyMQ==
X-Gm-Message-State: ANhLgQ2GynpXvDHgd2+QkxoNtYvWnk+gurwrvpvAK5vVqv/X2J8GuCl+
        bptksGCJg84v3j/8SiPTfvoNCQ==
X-Google-Smtp-Source: ADFU+vuOpckmO8qm1DthNvPOq67QvO7aIoHF9/F8Bu7ngLFIW10zjhHBiLsdegMl1cdLk69PP8GRAA==
X-Received: by 2002:a17:902:b787:: with SMTP id e7mr1331744pls.128.1585349224758;
        Fri, 27 Mar 2020 15:47:04 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c207sm4932084pfb.47.2020.03.27.15.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:47:04 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:47:02 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Message-ID: <20200327224702.GC211617@minitux>
References: <20200327223209.20409-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327223209.20409-1-ansuelsmth@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 27 Mar 15:32 PDT 2020, Ansuel Smith wrote:

> From: Ajay Kishore <akisho@codeaurora.org>
> 
> For IPQ806x targets, TZ protects the registers that are used to
> configure the routing of interrupts to a target processor.
> To resolve this, this patch uses scm call to route GPIO interrupts
> to application processor. Also the scm call interface is changed.
> 
> Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
> v3:
> * Rename route_to_apps to intr_target_use_scm
> * Follow standard design and rename base_reg to phys_base
> * Add additional comments in route interrupts condition 
> 
> v2:
> * Move static varibale in msm_pinctrl struct
> * Revert '4b024225c4a8 ("pinctrl: use devm_platform_ioremap_resource() to simplify code")'
>   to get base_reg addr
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c | 42 +++++++++++++++++++++++++-----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 9a8daa256a32..7d2a34beb1b6 100644
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
> @@ -60,6 +62,8 @@ struct msm_pinctrl {
>  	struct irq_chip irq_chip;
>  	int irq;
>  
> +	bool intr_target_use_scm;
> +
>  	raw_spinlock_t lock;
>  
>  	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
> @@ -68,6 +72,7 @@ struct msm_pinctrl {
>  
>  	const struct msm_pinctrl_soc_data *soc;
>  	void __iomem *regs[MAX_NR_TILES];
> +	u32 phys_base[MAX_NR_TILES];
>  };
>  
>  #define MSM_ACCESSOR(name) \
> @@ -882,11 +887,31 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	else
>  		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
>  
> -	/* Route interrupts to application cpu */
> -	val = msm_readl_intr_target(pctrl, g);
> -	val &= ~(7 << g->intr_target_bit);
> -	val |= g->intr_target_kpss_val << g->intr_target_bit;
> -	msm_writel_intr_target(val, pctrl, g);
> +	/* Route interrupts to application cpu.
> +	 * With intr_target_use_scm interrupts are routed to
> +	 * application cpu using scm calls.
> +	 */
> +	if (pctrl->intr_target_use_scm) {
> +		u32 addr = pctrl->phys_base[0] + g->intr_target_reg;
> +		int ret;
> +
> +		qcom_scm_io_readl(addr, &val);
> +
> +		val &= ~(7 << g->intr_target_bit);
> +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +
> +		ret = qcom_scm_io_writel(addr, val);
> +		if (ret)
> +			dev_err(pctrl->dev,
> +				"Failed routing %lu interrupt to Apps proc",
> +				d->hwirq);
> +		}
> +	} else {
> +		val = msm_readl_intr_target(pctrl, g);
> +		val &= ~(7 << g->intr_target_bit);
> +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +		msm_writel_intr_target(val, pctrl, g);
> +	}
>  
>  	/* Update configuration for gpio.
>  	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
> @@ -1241,6 +1266,9 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  	pctrl->dev = &pdev->dev;
>  	pctrl->soc = soc_data;
>  	pctrl->chip = msm_gpio_template;
> +	pctrl->intr_target_use_scm = of_device_is_compatible(
> +					pctrl->dev->of_node,
> +					"qcom,ipq8064-pinctrl");
>  
>  	raw_spin_lock_init(&pctrl->lock);
>  
> @@ -1253,9 +1280,12 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  				return PTR_ERR(pctrl->regs[i]);
>  		}
>  	} else {
> -		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
>  		if (IS_ERR(pctrl->regs[0]))
>  			return PTR_ERR(pctrl->regs[0]);
> +
> +		pctrl->phys_base[0] = res->start;
>  	}
>  
>  	msm_pinctrl_setup_pm_reset(pctrl);
> -- 
> 2.25.1
> 
