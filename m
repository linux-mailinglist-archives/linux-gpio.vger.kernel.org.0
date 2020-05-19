Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810041D8D34
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2020 03:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgESBjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 21:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgESBjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 21:39:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C529C061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 18:39:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so659549pjd.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 18:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ou+cOtGNMtILAT0oAVla8LZd+D096WK5Uyod38Jow0Q=;
        b=XaLwzUCpVVPq3h/MtUoor5fOFcBbUIoffaVg3SAhD/lEVjGHNGfD8bK3/M4lJRcdaB
         hVHsHQEGB+TYoC063q1j59PJ5ACJOgD/XX1eO/yPVPV878bc9KL6yFXQosCE9mw8OwGP
         +IjDoQ625uyw+M/EuKGBUvyn4CMknJkXr6baq/jnAwwQc0Zny6gEah5Fx5Z7JTML6fAu
         m2YbO6KnotqzZqi1YvpdXgsNKYHGtPQL6nYec858WDnZErkLvYHLyljuCyuRS5hq8AYL
         nyIh8keGviwFFqPfB3arVtfDoG1+r/eAChyvfkLTyqmSlBSmLGWdvaSCVloZUYrkrLFJ
         Ztdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ou+cOtGNMtILAT0oAVla8LZd+D096WK5Uyod38Jow0Q=;
        b=seEhXO+1yaaxvTBOgMWLNwi6bDPH7ZQGEgBxjqr8Ul7aFx6L8YZpnYf6jl7Rr62fvG
         Tl9DsG2L230ncTxKZKbJR9jA77yQTb6qbzrh9Ul8nJSOs1TRJj4XitbRQMn1v/ej6BLW
         cCRQTlCHUWGPe4p7kgJZap9dXStM9flilHkldxMdIVLcSGgZiI6anP0F1cH0AgM5kxFq
         2QwIJqHsNk1deJMQhg9YrDIuI0GF81wB6NiddE1YxUlfyasK/5RWYLD7v4OrSQsEVGnq
         V3IHj4ufD7xy/5bOULHsB+L1yt7860FLkvQsUoFJMILyrGRuhi7fi0UWAHafe9kZWOW9
         Wm4g==
X-Gm-Message-State: AOAM532QJhPuCzy9gOvTUUEgSdDKwAIXqzwplx3lYusdJK2QoooJ1rP/
        sInhSC4+SSXNoyJR7vUEVTrcvA==
X-Google-Smtp-Source: ABdhPJynx5QKthzT98DmDd7nzVGpIH2mSq44cH42/3HOEhkiRPI693lExc+p7dp3L9pSkxIS4TiuHg==
X-Received: by 2002:a17:90b:887:: with SMTP id bj7mr2208850pjb.186.1589852376670;
        Mon, 18 May 2020 18:39:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 7sm7090318pfc.203.2020.05.18.18.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:39:36 -0700 (PDT)
Date:   Mon, 18 May 2020 18:38:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mayank Grover <groverm@codeaurora.org>, linus.walleij@linaro.org
Cc:     agross@kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neeraju@codeaurora.org
Subject: Re: [PATCH] pinctrl: msm: Add check for pinctrl group is valid
Message-ID: <20200519013813.GU2165@builder.lan>
References: <1589817025-21886-1-git-send-email-groverm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589817025-21886-1-git-send-email-groverm@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 18 May 08:50 PDT 2020, Mayank Grover wrote:

> The list of reserved gpio pins for platform are populated
> in gpiochip valid_mask.
> 
> Here on MSM common driver introduce ability to check if
> pingroup is valid, by parsing pins in pingroup against
> reserved pins for gpios. This does not handle non-gpio
> pingroups.
> 

Thanks Mayank, I can confirm that this is a problem, but don't we need
this on some of the pinmux_ops as well?

@Linus, we started off with something similar for GPIOs and ended up
with the logic in the core code. Should we somehow try to do the same
for pinctrl?

Regards,
Bjorn

> Signed-off-by: Mayank Grover <groverm@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 85858c1..b6ebe26 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -261,6 +261,24 @@ static unsigned msm_regval_to_drive(u32 val)
>  	return (val + 1) * 2;
>  }
>  
> +static bool msm_pingroup_is_valid(struct msm_pinctrl *pctrl,
> +				  const struct msm_pingroup *g)
> +{
> +	const unsigned int *pins = g->pins;
> +	unsigned int num_pins = g->npins;
> +	struct gpio_chip *chip = &pctrl->chip;
> +	unsigned int max_gpios = chip->ngpio;
> +	unsigned int i;
> +
> +	for (i = 0; i < num_pins; i++) {
> +		/* Doesn't handle non-gpio pingroups */
> +		if (pins[i] < max_gpios &&
> +		    !gpiochip_line_is_valid(chip, pins[i]))
> +			return false;
> +	}
> +	return true;
> +}
> +
>  static int msm_config_group_get(struct pinctrl_dev *pctldev,
>  				unsigned int group,
>  				unsigned long *config)
> @@ -276,6 +294,10 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
>  
>  	g = &pctrl->soc->groups[group];
>  
> +	/* Check if group has all valid pins */
> +	if (!msm_pingroup_is_valid(pctrl, g))
> +		return -EINVAL;
> +
>  	ret = msm_config_reg(pctrl, g, param, &mask, &bit);
>  	if (ret < 0)
>  		return ret;
> @@ -355,6 +377,10 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>  
>  	g = &pctrl->soc->groups[group];
>  
> +	/* Check if group has all valid pins */
> +	if (!msm_pingroup_is_valid(pctrl, g))
> +		return -EINVAL;
> +
>  	for (i = 0; i < num_configs; i++) {
>  		param = pinconf_to_config_param(configs[i]);
>  		arg = pinconf_to_config_argument(configs[i]);
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of the Code Aurora Forum, hosted by The Linux Foundation
