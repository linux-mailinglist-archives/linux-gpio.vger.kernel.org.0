Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525241D9551
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgESLbY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 May 2020 07:31:24 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36175 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726859AbgESLbY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 May 2020 07:31:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589887883; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=jtGFv/rOwWa36h/UoB6hocUCfUy1WbaEeaCMlK5Ky5A=; b=dvrEXhquBnVfTj1AFo5+uUO17zZ2/C8RTZI7hGRXW4PNgn6NxpgR3dDamX4kcGuj90BXOS+e
 SQj1mP9FZzk79U7ZLudqVultZ5WNdjaJKniDk5ddh6LYCnCGdtq89Hg41JSWtShJ8e45/VjW
 zDH04M/TnQi99kjXVj7PPVABPl0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3c383.7fa0e76c3570-smtp-out-n03;
 Tue, 19 May 2020 11:31:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58CC5C433D2; Tue, 19 May 2020 11:31:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: groverm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D3B3C433F2;
        Tue, 19 May 2020 11:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D3B3C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=groverm@codeaurora.org
Date:   Tue, 19 May 2020 17:01:02 +0530
From:   Mayank Grover <groverm@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, agross@kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraju@codeaurora.org
Subject: Re: [PATCH] pinctrl: msm: Add check for pinctrl group is valid
Message-ID: <20200519113102.GA5076@codeaurora.org>
References: <1589817025-21886-1-git-send-email-groverm@codeaurora.org>
 <20200519013813.GU2165@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519013813.GU2165@builder.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

O Mon, May 18, 2020 at 06:38:13PM -0700, Bjorn Andersson wrote:
> On Mon 18 May 08:50 PDT 2020, Mayank Grover wrote:
> 
> > The list of reserved gpio pins for platform are populated
> > in gpiochip valid_mask.
> > 
> > Here on MSM common driver introduce ability to check if
> > pingroup is valid, by parsing pins in pingroup against
> > reserved pins for gpios. This does not handle non-gpio
> > pingroups.
> > 
> 
> Thanks Mayank, I can confirm that this is a problem, but don't we need
> this on some of the pinmux_ops as well?
>

Thanks Bjorn, for quick reply.

For pinmux ops, we already have check for validity in msm_pinmux_request
function hook.

request is getting called by core to check availabity of pin before acquiring
the pin.

Hence, I think we don't need this check there.

Regards,
Mayank

 
> @Linus, we started off with something similar for GPIOs and ended up
> with the logic in the core code. Should we somehow try to do the same
> for pinctrl?
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Mayank Grover <groverm@codeaurora.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 85858c1..b6ebe26 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -261,6 +261,24 @@ static unsigned msm_regval_to_drive(u32 val)
> >  	return (val + 1) * 2;
> >  }
> >  
> > +static bool msm_pingroup_is_valid(struct msm_pinctrl *pctrl,
> > +				  const struct msm_pingroup *g)
> > +{
> > +	const unsigned int *pins = g->pins;
> > +	unsigned int num_pins = g->npins;
> > +	struct gpio_chip *chip = &pctrl->chip;
> > +	unsigned int max_gpios = chip->ngpio;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < num_pins; i++) {
> > +		/* Doesn't handle non-gpio pingroups */
> > +		if (pins[i] < max_gpios &&
> > +		    !gpiochip_line_is_valid(chip, pins[i]))
> > +			return false;
> > +	}
> > +	return true;
> > +}
> > +
> >  static int msm_config_group_get(struct pinctrl_dev *pctldev,
> >  				unsigned int group,
> >  				unsigned long *config)
> > @@ -276,6 +294,10 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
> >  
> >  	g = &pctrl->soc->groups[group];
> >  
> > +	/* Check if group has all valid pins */
> > +	if (!msm_pingroup_is_valid(pctrl, g))
> > +		return -EINVAL;
> > +
> >  	ret = msm_config_reg(pctrl, g, param, &mask, &bit);
> >  	if (ret < 0)
> >  		return ret;
> > @@ -355,6 +377,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
> >  
> >  	g = &pctrl->soc->groups[group];
> >  
> > +	/* Check if group has all valid pins */
> > +	if (!msm_pingroup_is_valid(pctrl, g))
> > +		return -EINVAL;
> > +
> >  	for (i = 0; i < num_configs; i++) {
> >  		param = pinconf_to_config_param(configs[i]);
> >  		arg = pinconf_to_config_argument(configs[i]);
> > -- 
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> > member of the Code Aurora Forum, hosted by The Linux Foundation
