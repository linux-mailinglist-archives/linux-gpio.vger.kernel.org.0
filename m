Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D701960BB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 22:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0VwB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 17:52:01 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37435 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgC0VwB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 17:52:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id x1so3944572plm.4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 14:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gBPuJeY3dLf2RT1lf5uBkQiOCkTAmK3v0hMLV6g8WYA=;
        b=E0pjgTC2wT8HGZZlEvw4wgVqJIyXjr7lYLeWPRIQfrZQyMl8GEdivYCcSRz8/C+QAT
         BgWvF5fu+sJbxmM4K6cytpRAdvFPcashiS1qVq/hx1Au/iPzeakm8aARpEsY32O5TMOw
         R4pK4aXghLdOrcHJ2yV1N9WpeITG5Q9sUKq6PwvlK8ESfvnxexT1L/poHbJTPWAld8wy
         1Y5mh9+EG2HTW21iK2HZodTCV9rVn5B+dyW/fOo+pLyLXmfsKI6f2BytouT3pmeIwH3o
         cOOdgOURm/kyhs6kcbEjR+dtp6ZxkU/Vyyj5LzZ/GLrj/+Q17wLL+V5W+lPYXZniL1Qc
         J9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gBPuJeY3dLf2RT1lf5uBkQiOCkTAmK3v0hMLV6g8WYA=;
        b=LWVWo/q6PFDcQlQz8uVjQPtkvODigTllHYegmFSme4fhOtkST8oAqhrr/LtakNF/oy
         11ApDLz4t7oL+gb6g78xxy7E8/4wtH6WySXi++wkV1MCjL8z94Y8SQSccpNecQyqcESL
         Z0nrrn2xhJ8tGV5Ut/xssT70MktCMmswiohsOEA5qz+Re5KD1LUz73KUn5IT/xyHqOwK
         864GggyboOBBwMQ+UmG80pLpbpPfQnON+rhCtm+MqprcCNqEtift9EQzc3rKGmIDIyfo
         yX6jtl9aNqfvwmoPmu4ip1mWnrXiZ8TqaYnc1rsMPMYbLCGgZ9vue+P3LRmKV2oa6t/T
         txOg==
X-Gm-Message-State: ANhLgQ04z4Q/hM+oYGlMhnkGrFJO06+1kv0Z2BD9X2avlBIWyzlF5ZPm
        oHEM4nTKfcFGN8q2c9iMjc4rmg==
X-Google-Smtp-Source: ADFU+vu4f8JEOmDCYOkH4DfavtNwX5cxyzPgeeL/wA/5Pkm6OiDvDjlanl0ORciaVKINpvfp7+47XQ==
X-Received: by 2002:a17:902:8348:: with SMTP id z8mr995022pln.342.1585345919178;
        Fri, 27 Mar 2020 14:51:59 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k17sm4803173pfp.194.2020.03.27.14.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 14:51:58 -0700 (PDT)
Date:   Fri, 27 Mar 2020 14:51:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ansuelsmth@gmail.com
Cc:     'Andy Gross' <agross@kernel.org>,
        'Ajay Kishore' <akisho@codeaurora.org>,
        'Linus Walleij' <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: R: [PATCH v2] pinctrl: qcom: use scm_call to route GPIO irq to
 Apps
Message-ID: <20200327215156.GB211617@minitux>
References: <20200326173524.15236-1-ansuelsmth@gmail.com>
 <20200327201340.GA211617@minitux>
 <048701d6047a$8752f390$95f8dab0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048701d6047a$8752f390$95f8dab0$@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 27 Mar 13:58 PDT 2020, ansuelsmth@gmail.com wrote:

> > On Thu 26 Mar 10:35 PDT 2020, Ansuel Smith wrote:
> > 
> > > From: Ajay Kishore <akisho@codeaurora.org>
> > >
> > > For IPQ806x targets, TZ protects the registers that are used to
> > > configure the routing of interrupts to a target processor.
> > > To resolve this, this patch uses scm call to route GPIO interrupts
> > > to application processor. Also the scm call interface is changed.
> > >
> > > Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > 
> > Thanks for respinning this Ansuel, just some minor things below.
> > 
> > > ---
> > > v2:
> > > * Move static varibale in msm_pinctrl struct
> > > * Revert '4b024225c4a8 ("pinctrl: use
> > devm_platform_ioremap_resource() to simplify code")'
> > >   to get base_reg addr
> > >
> > >  drivers/pinctrl/qcom/pinctrl-msm.c | 37
> > ++++++++++++++++++++++++++----
> > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
> > b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 9a8daa256a32..9627ebd41ff9 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -22,6 +22,8 @@
> > >  #include <linux/reboot.h>
> > >  #include <linux/pm.h>
> > >  #include <linux/log2.h>
> > > +#include <linux/qcom_scm.h>
> > > +#include <linux/io.h>
> > >
> > >  #include <linux/soc/qcom/irq.h>
> > >
> > > @@ -60,6 +62,9 @@ struct msm_pinctrl {
> > >  	struct irq_chip irq_chip;
> > >  	int irq;
> > >
> > > +	int route_to_apps;
> > 
> > We "always" route our interrupts to apps, so please rename this to
> > intr_target_use_scm. And using "bool" instead would make it clear that
> > this is a binary flag.
> > 
> 
> Will fix in v3
> 
> > > +	u32 base_reg;
> > 
> > Even though I think it's fine that you only fill in the first entry,
> > please make this phys_base[MAX_NR_GPIO]; next to regs.
> > 
> 
> If I understand correctly, I should replace base_reg with 
> phys_base[MAX_NR_GPIO]
> I think we should use MAX_NR_TILES instead of MAX_NR_GPIO

Yes of course, didn't pay attention to my autocomplete!

> Wouldn't this be a waste of memory since only the base_reg will be
> needed?  I don't think there will be a soc with multiple tiles and the
> need to add code in the loop function. (Also sorry for off-topic...
> since we have soc_data->ntiles why don't we use kmem allocation
> instead of statically use half empty array?)
> 

While I hope you're right, I think it looks better if it mimics the
overall design - at the expense of wasting 12 bytes.

> > > +
> > >  	raw_spinlock_t lock;
> > >
> > >  	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
> > > @@ -883,10 +888,27 @@ static int msm_gpio_irq_set_type(struct
> > irq_data *d, unsigned int type)
> > >  		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
> > >
> > >  	/* Route interrupts to application cpu */
> > > -	val = msm_readl_intr_target(pctrl, g);
> > > -	val &= ~(7 << g->intr_target_bit);
> > > -	val |= g->intr_target_kpss_val << g->intr_target_bit;
> > > -	msm_writel_intr_target(val, pctrl, g);
> > > +	if (pctrl->route_to_apps && pctrl->base_reg) {
> > 
> > I meant that you could fill out "base_reg" only if it's supposed to be
> > used, but looking at your patch I think it's nicer to have a separate
> > flag - so you can omit the check for base_reg != NULL here.
> > 
> 
> Since we return error if devm_ioremap_resource fails, it is good to only
> check 
> the route_to_apps as base_reg will be set for sure?
> 

Right.

My initial suggestion was that base != NULL would have the meaning of
intr_target_use_scm. But what I meant here is that after looking at your
patch I think one flag and a separate base is better.

Thanks,
Bjorn

> > > +		u32 addr = pctrl->base_reg + g->intr_target_reg;
> > > +		int ret;
> > > +
> > > +		qcom_scm_io_readl(addr, &val);
> > > +
> > > +		val &= ~(7 << g->intr_target_bit);
> > > +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> > > +
> > > +		ret = qcom_scm_io_writel(addr, val);
> > > +		if (ret)
> > > +			dev_err(pctrl->dev,
> > > +				"Failed routing %lu interrupt to Apps proc",
> > > +				d->hwirq);
> > > +		}
> > > +	} else {
> > > +		val = msm_readl_intr_target(pctrl, g);
> > > +		val &= ~(7 << g->intr_target_bit);
> > > +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> > > +		msm_writel_intr_target(val, pctrl, g);
> > > +	}
> > >
> > >  	/* Update configuration for gpio.
> > >  	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
> > > @@ -1241,6 +1263,8 @@ int msm_pinctrl_probe(struct platform_device
> > *pdev,
> > >  	pctrl->dev = &pdev->dev;
> > >  	pctrl->soc = soc_data;
> > >  	pctrl->chip = msm_gpio_template;
> > > +	pctrl->route_to_apps = of_device_is_compatible(pctrl->dev-
> > >of_node,
> > > +					"qcom,ipq8064-pinctrl");
> > >
> > >  	raw_spin_lock_init(&pctrl->lock);
> > >
> > > @@ -1253,9 +1277,12 @@ int msm_pinctrl_probe(struct
> > platform_device *pdev,
> > >  				return PTR_ERR(pctrl->regs[i]);
> > >  		}
> > >  	} else {
> > > -		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
> > > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
> > >  		if (IS_ERR(pctrl->regs[0]))
> > >  			return PTR_ERR(pctrl->regs[0]);
> > > +		else
> > 
> > No need for the else, as the "positive" case is a return.
> > 
> 
> Will fix in v3
> 
> > Thank you,
> > Bjorn
> > 
> > > +			pctrl->base_reg = res->start;
> > >  	}
> > >
> > >  	msm_pinctrl_setup_pm_reset(pctrl);
> > > --
> > > 2.25.1
> > >
> 
