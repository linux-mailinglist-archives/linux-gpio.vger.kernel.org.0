Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746AE571A3A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 14:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbiGLMoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 08:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiGLMox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 08:44:53 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60FD9C250
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so11277934pjr.4
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QYL0SRgLUmg8BnK5Yo3lzlJ4c0o1vhFy27q1BHms55E=;
        b=M9ZOyqVnnUe1kQ1lYFItGrYNc078kUr6Am55NLN0d1kC3kIbA+ABERmQoje+GHES78
         AlnIcs/g2MpFEwNW6yLzuJipMD3yEPQs7stbk8+q8MBWP02Qgz+ZyINb8gTS8mPiiW+m
         duREQLrPy3kHmKzqDU3zfNEvKbJwvVnnsGCMPiDOxTfzNysdXYCWGhpyXyi+cj8nRbhS
         SzNwVQ+n5xTqUPo/Caxl7D/FnnVPEa5lZm5c0RCZPkpiLQzPrSkKKmwFsr3OIqRJcCxm
         nxPO1jpXd+n4kbNBbR+9KmnWfeiV3c+vEbi313WP3dPYB2DZO0tGPYywVH3wS1NsXIpi
         fjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QYL0SRgLUmg8BnK5Yo3lzlJ4c0o1vhFy27q1BHms55E=;
        b=ugHpmrVWK99W/rNKaCqoV9IH/9w/+uvfWhCRx/7+iBd2G3H9wLF+idl4k1aaxr2ucc
         dvaHLlAlP7wC45dk6E5gWzuGUmMMavZ9HsBWGK2PS7U3VxsKvzsu7jVcagh26diDLkCN
         nt1veitWCvv2RCfPjkmc6fzF9zxxHHuBUJTD0kDZVNlhZVIAClvdkZDEZI+OAEXiCgUn
         XbSzxsII0ol2jX6ZuZ9q4fcfrkWSq62BjhFJap0OsK8B96FvJjeVVTHDh0B0wqed/07e
         Yth02WMSrHd+s/Petl2+Ddw5XpwQCLNHnzeNkCXcNZMIxM2uK01aVaUhoYGekqdkJQb0
         IH2w==
X-Gm-Message-State: AJIora84C55uJFtrhr82TB9pg8SY0xv/clnyqozuKhN/bTRvIhv+z0bo
        QgvmBQtDHXnM1l2F8Mc+VLZl
X-Google-Smtp-Source: AGRyM1v+M5lV7lgNVXXA7ep5lugVxUMn5AWgMFlKRyd/tc8Cbi7QwigHgSxgIwlOdFq966IerhvE4g==
X-Received: by 2002:a17:90b:4c91:b0:1ef:f85b:6342 with SMTP id my17-20020a17090b4c9100b001eff85b6342mr4254301pjb.75.1657629892302;
        Tue, 12 Jul 2022 05:44:52 -0700 (PDT)
Received: from workstation ([117.207.31.14])
        by smtp.gmail.com with ESMTPSA id pi4-20020a17090b1e4400b001df264610c4sm3212648pjb.0.2022.07.12.05.44.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 05:44:51 -0700 (PDT)
Date:   Tue, 12 Jul 2022 18:14:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: make the irqchip immutable
Message-ID: <20220712124445.GC21746@workstation>
References: <20220624195112.894916-1-robimarko@gmail.com>
 <87edyq1ujr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edyq1ujr.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 11:42:32AM +0100, Marc Zyngier wrote:
> On Fri, 24 Jun 2022 20:51:12 +0100,
> Robert Marko <robimarko@gmail.com> wrote:
> > 
> > Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning to indicate if the gpiolib is altering the
> > internals of irqchips.
> > 
> > Following this change the following warning is now observed for the SPMI
> > PMIC pinctrl driver:
> > gpio gpiochip1: (200f000.spmi:pmic@0:gpio@c000): not an immutable chip, please consider fixing it!
> > 
> > Fix this by making the irqchip in the SPMI PMIC pinctrl driver immutable.
> > 
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index c3255b0bece4..406ee0933d0b 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -171,7 +171,6 @@ struct pmic_gpio_state {
> >  	struct regmap	*map;
> >  	struct pinctrl_dev *ctrl;
> >  	struct gpio_chip chip;
> > -	struct irq_chip irq;
> >  	u8 usid;
> >  	u8 pid_base;
> >  };
> > @@ -988,6 +987,17 @@ static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
> >  	return fwspec;
> >  }
> >  
> > +static const struct irq_chip spmi_gpio_irq_chip = {
> > +	.name		= "spmi-gpio",
> > +	.irq_ack	= irq_chip_ack_parent,
> > +	.irq_mask	= irq_chip_mask_parent,
> > +	.irq_unmask	= irq_chip_unmask_parent,
> 
> No, this is wrong. Please look at the documentation to see how you
> must now directly call into the gpiolib helpers for these two
> callbacks.
> 

IIUC, you are referring to gpiochip_disable_irq() and
gpiochip_enable_irq() APIs. These APIs are supposed to let the gpiolib
know about that the IRQ usage of these GPIOs. But for the case of hierarchial
IRQ domain, isn't the parent is going to do that?

Please correct me if I'm wrong.

Thanks,
Mani

> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
