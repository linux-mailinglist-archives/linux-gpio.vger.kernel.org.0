Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07780413787
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 18:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhIUQ1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 12:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhIUQ1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 12:27:11 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56A2C061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 09:25:42 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id q26-20020a4adc5a000000b002918a69c8eeso7229453oov.13
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8730Bktiqk4tNVMLL/QOHd8DUmsTsfdK+RPNnLjS13I=;
        b=VRrsr8juMP7JcmvqszJf3Kw5kbOJBokuGC7gnKzAt9Z9sG06orD0t9EfuL4N1XzuXB
         rk1S8O8rqs54ly/NehWr5i2OVuQYHIGOBvAu5yemWMHut7f+fk8KgA4hdmi2HhFth4rh
         D+/G6qXG27KpDHa8mJCt+scEnQU6ZU3J+TZY1s26n1+abSBnBjrFDstSFpEoZHDsXAS/
         X9+U+MnUQRLyQIwQqy2KN1LdDB1iFJqGgkzmcAzEsjFwqs9NYrw/HEPDEIw7eIz8AKUV
         Kfe6yFj9ysNde8C1vC0faX/KaG2FBxwrPJHBdZ+cRm+8TAWpObJ+7bV3LK7AK5MPX9AC
         qc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8730Bktiqk4tNVMLL/QOHd8DUmsTsfdK+RPNnLjS13I=;
        b=Mi6WODQA+1UZfey+IlBiQ3ixCnu5CK2lhO+dtV/y20EN87dGpBpCMNsZieNMrgWuib
         ULzkt0y1RH+NmUCMc3D27tiXnRBHSaNYptElssr5yVbNsyRsleVtoBUNUJrbOTjNtOgq
         VQi1XBx4Xs9H6sLEoqTAy2bzkD/GITTo8mjxPRJ+33MlO4Vo5ic5MKghyv4Uu9M5Akwq
         egVaCuBl4aIoL4VfLgyWrmq7zkeIW8tRwJQzqQ7BjBarkJ/khb7K5wUGMKAf1jdv3vTJ
         7xCAhrfBH+XRJ6NpOJNyQ96svi76cGmi4OMwmLzm9u6dM/tWXzPIc1v3vWuGcU/D628A
         lmZw==
X-Gm-Message-State: AOAM533ISdTAe61SU5kbbGLA/y2/d0hYdf1LdxA5W3rxr+TbwWOPNY58
        48LifRyT7r4PtzjmKMd9U94ijg==
X-Google-Smtp-Source: ABdhPJyWx86fuRCxiB1BbAZsfo1axvq1nZpMeHdaaS8MkdJ7Qfh2CZw6I5ofRnlPQT0RBvanujWInQ==
X-Received: by 2002:a4a:a388:: with SMTP id s8mr6397396ool.39.1632241541498;
        Tue, 21 Sep 2021 09:25:41 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q7sm4154239otl.68.2021.09.21.09.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:25:41 -0700 (PDT)
Date:   Tue, 21 Sep 2021 09:26:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
Message-ID: <YUoHr0F9qjr2Toeb@ripper>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan>
 <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 21 Sep 03:39 PDT 2021, Rajendra Nayak wrote:

> 
> 
> On 9/20/2021 6:14 AM, Bjorn Andersson wrote:
> > On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:
> > 
> > > From: Prasad Sodagudi <psodagud@codeaurora.org>
> > > 
> > > egpio is a scheme which allows special power Island Domain IOs
> > > (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> > > TLMM functions with Island Domain functions.
> > > With this scheme, an IO can be controlled both by the cpu running
> > > linux and the Island processor. This provides great flexibility to
> > > re-purpose the Island IOs for regular TLMM usecases.
> > > 
> > > 2 new bits are added to ctl_reg, egpio_present is a read only bit
> > > which shows if egpio feature is available or not on a given gpio.
> > > egpio_enable is the read/write bit and only effective if egpio_present
> > > is 1. Once its set, the Island IO is controlled from Chip TLMM.
> > > egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
> > > 
> > > The support exists on most recent qcom SoCs, and we add support
> > > for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
> > > 
> > 
> > I was under the impression that this feature would allow you to
> > repurpose pins for use either by the remote island or by apps.
> 
> thats right, you can repurpose the pins for usage by apps by setting
> the egpio_enable to 1, when set to 0 its owned by the island processor.

Good.

> > 
> > But if I understand your proposal, you check to see if the pin is
> > "egpio capable" for a pin and if so just sets the bit - muxing it to
> > apps (or the island?).
> 
> Right, so if there is a request for a egpio-capable pin, the driver
> flips the ownership. Are you suggesting having some kind of checks to determine
> who should own it?
> 

I see, I missed that nuance. So Linux will steal any pins that are
mentioned in DT. But that would mean that you're relying on someone else
to ensure that this bit is cleared for the other pins and you would not
be able to explicitly flip the state back to island mode in runtime.

I would prefer that this was more explicit.

> > It seems reasonable that this would be another pinmux state for these
> > pins, rather than just flipping them all in one or the other direction.
> 
> hmm, I don't understand. This is not a pinmux state, its a switch to decide
> the ownership.

But does it mux the pin to the island, or does it state that the island
is now in charge of the associated TLMM registers?

If it's muxing the pin to the island, then it's conceptually just a
special mux state that we can represent in DT as another pinmux
function.

> These egpio pins have regulator mux functions, some for apps, some for the
> island processor, they might not always be used as gpios.

Right, so if egpio = 1 for a pin, then it works like any other pin
that's handled by the pinctrl-msm driver, with whatever muxing options
are available for the given pin.

But what happens when egpio = 0? Is the TLMM decoupled from the physical
pin, or does the island use the TLMM as well?

If it's not using the TLMM, do we need the TLMM to be in some particular
state?


What I'm proposing is that if the egpio is simply a first-line mux and
the TLMM isn't used when the pin is muxed towards the island. Then we
could add a custom 'function = "egpio"' muxing state and you could per
pin mux things explicitly, and possibly dynamically, to be routed to the
island.

Regards,
Bjorn

> > PS. When I spoke with Prasad about this a couple of years ago, I think
> > we talked about representing this as a pinconf property, but it seems to
> > make more sense to me now that it would be a pinmux state.
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> > > [rnayak: rewrite commit log, minor rebase]
> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > ---
> > >   drivers/pinctrl/qcom/pinctrl-msm.c    | 4 ++++
> > >   drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
> > >   drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 ++
> > >   drivers/pinctrl/qcom/pinctrl-sm8150.c | 2 ++
> > >   drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 ++
> > >   drivers/pinctrl/qcom/pinctrl-sm8350.c | 2 ++
> > >   6 files changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 8476a8a..f4a2343 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -220,6 +220,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > >   	val = msm_readl_ctl(pctrl, g);
> > >   	val &= ~mask;
> > >   	val |= i << g->mux_bit;
> > > +	/* Check if egpio present and enable that feature */
> > > +	if (val & BIT(g->egpio_present))
> > > +		val |= BIT(g->egpio_enable);
> > > +
> > >   	msm_writel_ctl(val, pctrl, g);
> > >   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> > > index e31a516..3635b31 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> > > @@ -77,6 +77,8 @@ struct msm_pingroup {
> > >   	unsigned drv_bit:5;
> > >   	unsigned od_bit:5;
> > > +	unsigned egpio_enable:5;
> > > +	unsigned egpio_present:5;
> > >   	unsigned oe_bit:5;
> > >   	unsigned in_bit:5;
> > >   	unsigned out_bit:5;
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> > > index afddf6d..607d459 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> > > @@ -43,6 +43,8 @@
> > >   		.mux_bit = 2,			\
> > >   		.pull_bit = 0,			\
> > >   		.drv_bit = 6,			\
> > > +		.egpio_enable = 12,		\
> > > +		.egpio_present = 11,		\
> > >   		.oe_bit = 9,			\
> > >   		.in_bit = 0,			\
> > >   		.out_bit = 1,			\
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> > > index 7359bae..63a625a 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> > > @@ -56,6 +56,8 @@ enum {
> > >   		.mux_bit = 2,			\
> > >   		.pull_bit = 0,			\
> > >   		.drv_bit = 6,			\
> > > +		.egpio_enable = 12,		\
> > > +		.egpio_present = 11,		\
> > >   		.oe_bit = 9,			\
> > >   		.in_bit = 0,			\
> > >   		.out_bit = 1,			\
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > index af144e7..ad4fd94 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> > > @@ -57,6 +57,8 @@ enum {
> > >   		.mux_bit = 2,				\
> > >   		.pull_bit = 0,				\
> > >   		.drv_bit = 6,				\
> > > +		.egpio_enable = 12,			\
> > > +		.egpio_present = 11,			\
> > >   		.oe_bit = 9,				\
> > >   		.in_bit = 0,				\
> > >   		.out_bit = 1,				\
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> > > index 4d8f863..bb436dc 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> > > @@ -46,6 +46,8 @@
> > >   		.mux_bit = 2,			\
> > >   		.pull_bit = 0,			\
> > >   		.drv_bit = 6,			\
> > > +		.egpio_enable = 12,		\
> > > +		.egpio_present = 11,		\
> > >   		.oe_bit = 9,			\
> > >   		.in_bit = 0,			\
> > >   		.out_bit = 1,			\
> > > -- 
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> > > 
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
