Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8AEE196022
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 21:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgC0U7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 16:59:01 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33085 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbgC0U7B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 16:59:01 -0400
Received: by mail-wm1-f65.google.com with SMTP id w25so8203924wmi.0;
        Fri, 27 Mar 2020 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Q6cxwe9Qb2vwkeuHtz/dD2tnRfKg6dCCgqMHhoqOHqo=;
        b=PmMUoNlJOyZ7K0NKV9paeQeqZFLaXzAfIkPAn2mfGn8NgQ2Ik+r0zAnxVT+kFkJHds
         XO1Gyuc47YJ1Wjlfs2gQV6KNvivQL0RTX1yJfKwF1UQOiW3HrsuUNr44+sz8JIuFRYeO
         BjLsTXQBnxXmYsbp3j0GsROORrzbAJ8tS92GAmbIu6UQiE7jQvfq/9y6vmmoiVOMevic
         CB63TDGEWTZxgilOOptE4K7sum84gBagKEA5KsfuklloMrWfIE83iTnnorb09ZXdMtqN
         u1ETm/e7XDsC+Br4mt0swWRKlM7hEuW1+78nJDbSI7mjI1t3/JGAPLcL2AMKTcVimJug
         4ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Q6cxwe9Qb2vwkeuHtz/dD2tnRfKg6dCCgqMHhoqOHqo=;
        b=kCOoiY+L+E5oXe0N8lV9J+8kyO+jmn40KKwvB/EsEma3i8kTp+ca/2M+6jtLjGcHjq
         BFmaVqjaC0CymgsADk239VhGmCQpPELr/YNrqqGR3BaQ9yxFbHgRrxZhu8aCFYfDA/hq
         XA14N0Q0RhhYi4g+g6Z/lzPdFxEhQMp5U3QLXLof7GqyBRw67lui3Y10B0DQ80QIY503
         fTGkGyUVC4gwJW5BhqUmPUa2Xb3IQ+Rmk0SaxE0jHOvquEUI7WNnJg6+OvUJQ9BlFDIr
         b0NwzVk++TgB1lJmJUlYt7EJXf5P2GceVLb9zfE6yLS1rDtgk8oiA9piOLnovodEtz7y
         9yQw==
X-Gm-Message-State: ANhLgQ2VdXwk+3SXQJkM7YMRyUqJeDOwQDkH8oh+WFeS9o5ZGXvqQhwz
        EHT44zNxZSgrkUZ3s0Hs8yg=
X-Google-Smtp-Source: ADFU+vt//RPC/ZmN1X0LHsqVqVtX4Fzd31sl/CVw9kOFofXvOCz4Rdp7BUBfl6w+EADZMfCQKpegFg==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr575918wmi.13.1585342737774;
        Fri, 27 Mar 2020 13:58:57 -0700 (PDT)
Received: from AnsuelXPS ([2001:470:b467:1:6970:5124:473a:ebab])
        by smtp.gmail.com with ESMTPSA id p3sm9874945wrj.91.2020.03.27.13.58.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2020 13:58:57 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     "'Andy Gross'" <agross@kernel.org>,
        "'Ajay Kishore'" <akisho@codeaurora.org>,
        "'Linus Walleij'" <linus.walleij@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200326173524.15236-1-ansuelsmth@gmail.com> <20200327201340.GA211617@minitux>
In-Reply-To: <20200327201340.GA211617@minitux>
Subject: R: [PATCH v2] pinctrl: qcom: use scm_call to route GPIO irq to Apps
Date:   Fri, 27 Mar 2020 21:58:53 +0100
Message-ID: <048701d6047a$8752f390$95f8dab0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLj+LtT0Ig1DBg116zfQ12wMypniwFqtdGipjWnCEA=
Content-Language: it
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> On Thu 26 Mar 10:35 PDT 2020, Ansuel Smith wrote:
> 
> > From: Ajay Kishore <akisho@codeaurora.org>
> >
> > For IPQ806x targets, TZ protects the registers that are used to
> > configure the routing of interrupts to a target processor.
> > To resolve this, this patch uses scm call to route GPIO interrupts
> > to application processor. Also the scm call interface is changed.
> >
> > Signed-off-by: Ajay Kishore <akisho@codeaurora.org>
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> 
> Thanks for respinning this Ansuel, just some minor things below.
> 
> > ---
> > v2:
> > * Move static varibale in msm_pinctrl struct
> > * Revert '4b024225c4a8 ("pinctrl: use
> devm_platform_ioremap_resource() to simplify code")'
> >   to get base_reg addr
> >
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 37
> ++++++++++++++++++++++++++----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c
> b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 9a8daa256a32..9627ebd41ff9 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -22,6 +22,8 @@
> >  #include <linux/reboot.h>
> >  #include <linux/pm.h>
> >  #include <linux/log2.h>
> > +#include <linux/qcom_scm.h>
> > +#include <linux/io.h>
> >
> >  #include <linux/soc/qcom/irq.h>
> >
> > @@ -60,6 +62,9 @@ struct msm_pinctrl {
> >  	struct irq_chip irq_chip;
> >  	int irq;
> >
> > +	int route_to_apps;
> 
> We "always" route our interrupts to apps, so please rename this to
> intr_target_use_scm. And using "bool" instead would make it clear that
> this is a binary flag.
> 

Will fix in v3

> > +	u32 base_reg;
> 
> Even though I think it's fine that you only fill in the first entry,
> please make this phys_base[MAX_NR_GPIO]; next to regs.
> 

If I understand correctly, I should replace base_reg with 
phys_base[MAX_NR_GPIO]
I think we should use MAX_NR_TILES instead of MAX_NR_GPIO
Wouldn't this be a waste of memory since only the base_reg will be needed?
I don't think there will be a soc with multiple tiles and the need to add
code 
in the loop function. (Also sorry for off-topic... since we have
soc_data->ntiles
why don't we use kmem allocation instead of statically use half empty
array?)

> > +
> >  	raw_spinlock_t lock;
> >
> >  	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
> > @@ -883,10 +888,27 @@ static int msm_gpio_irq_set_type(struct
> irq_data *d, unsigned int type)
> >  		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
> >
> >  	/* Route interrupts to application cpu */
> > -	val = msm_readl_intr_target(pctrl, g);
> > -	val &= ~(7 << g->intr_target_bit);
> > -	val |= g->intr_target_kpss_val << g->intr_target_bit;
> > -	msm_writel_intr_target(val, pctrl, g);
> > +	if (pctrl->route_to_apps && pctrl->base_reg) {
> 
> I meant that you could fill out "base_reg" only if it's supposed to be
> used, but looking at your patch I think it's nicer to have a separate
> flag - so you can omit the check for base_reg != NULL here.
> 

Since we return error if devm_ioremap_resource fails, it is good to only
check 
the route_to_apps as base_reg will be set for sure?

> > +		u32 addr = pctrl->base_reg + g->intr_target_reg;
> > +		int ret;
> > +
> > +		qcom_scm_io_readl(addr, &val);
> > +
> > +		val &= ~(7 << g->intr_target_bit);
> > +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> > +
> > +		ret = qcom_scm_io_writel(addr, val);
> > +		if (ret)
> > +			dev_err(pctrl->dev,
> > +				"Failed routing %lu interrupt to Apps proc",
> > +				d->hwirq);
> > +		}
> > +	} else {
> > +		val = msm_readl_intr_target(pctrl, g);
> > +		val &= ~(7 << g->intr_target_bit);
> > +		val |= g->intr_target_kpss_val << g->intr_target_bit;
> > +		msm_writel_intr_target(val, pctrl, g);
> > +	}
> >
> >  	/* Update configuration for gpio.
> >  	 * RAW_STATUS_EN is left on for all gpio irqs. Due to the
> > @@ -1241,6 +1263,8 @@ int msm_pinctrl_probe(struct platform_device
> *pdev,
> >  	pctrl->dev = &pdev->dev;
> >  	pctrl->soc = soc_data;
> >  	pctrl->chip = msm_gpio_template;
> > +	pctrl->route_to_apps = of_device_is_compatible(pctrl->dev-
> >of_node,
> > +					"qcom,ipq8064-pinctrl");
> >
> >  	raw_spin_lock_init(&pctrl->lock);
> >
> > @@ -1253,9 +1277,12 @@ int msm_pinctrl_probe(struct
> platform_device *pdev,
> >  				return PTR_ERR(pctrl->regs[i]);
> >  		}
> >  	} else {
> > -		pctrl->regs[0] = devm_platform_ioremap_resource(pdev, 0);
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +		pctrl->regs[0] = devm_ioremap_resource(&pdev->dev, res);
> >  		if (IS_ERR(pctrl->regs[0]))
> >  			return PTR_ERR(pctrl->regs[0]);
> > +		else
> 
> No need for the else, as the "positive" case is a return.
> 

Will fix in v3

> Thank you,
> Bjorn
> 
> > +			pctrl->base_reg = res->start;
> >  	}
> >
> >  	msm_pinctrl_setup_pm_reset(pctrl);
> > --
> > 2.25.1
> >

