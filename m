Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5008C410E0B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 02:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbhITAqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 20:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbhITAp7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 20:45:59 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DFEC061764
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 17:44:33 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso21376803otp.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lzKqB+hvLZ/JMccnjIuEIhViBFYa45nTJzf1VzPKkQM=;
        b=geuYnnJgB8GKQG9MHXQWQ9qCeznG/2qiKgr26NIQ2RlTKID2Ai8AQTzC3FHNsffvYm
         xFN1q2LncnS//Ppt4czKmDJrFUaKFoGGrYNGfSAFV1rHAGpX6VbQHBHZCAeJvMAUukme
         n+5jxW4GOHoZrPsQ9IJFXuF53SOqYumNaLk00sAzPmCiRFrhvfheG5AcgE4EPYbXrAYc
         foy2vaQbKs6ykHcdMPF3c0+3ZJNbrKi9sd54wmJ5sCQXx3kAnzmQTew0dDLyuvbdSUMm
         Mj+Ij/We8jLSmbGR25LHHIYRTEPjqyN7XUufwr59RgN4DDL2OH8bTm7l5BUiZaip99d1
         Q3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lzKqB+hvLZ/JMccnjIuEIhViBFYa45nTJzf1VzPKkQM=;
        b=AlTAJaTJA9XSmrxlhhmmiEpCwggt2hsaVEDUyXBmWVJcYAx3DAq9dzxb6mWBF0c5mh
         ceNrM3ltstWG6CjAcZpFZzWVNaDqw+KkLVktr+zZ/VGg8ot79YJ6ziwJCnzr2LJiAZ6E
         r+kQhykOZPxA67Ud4cWKZTdM+E5ibcgZ041o4oelga2XRMf3wgtu6llJs7qRQ+NoxbUj
         18OdJJ6+PiL62w/UsI5omDWPEYYqMdqgjQBbfDqJ+6achcQY303n6XN8Z7lIACYpi2Fc
         GE8uYKcl8b3XvwoFS3Qp9IyEC6g956pwTblBEmtZO6y40B0hi3eOaoZgi6bHmlYEA+X4
         mE8w==
X-Gm-Message-State: AOAM531wHZ7oMPXGKfkCc8Ii8INQ0+cao6GO1ySuGXbggNGkGhe6WYyR
        rf+ih4laM2Oq6VIps9IpDeZ8i6Tx8Hu9fQ==
X-Google-Smtp-Source: ABdhPJyURgRw9OC2NNBTkmOgiOvyzID7Xviw5xcTBH6RmvJCkZ+rCi5FGlZoYceTmyxZphPwzV4JBw==
X-Received: by 2002:a9d:5a9b:: with SMTP id w27mr18814468oth.29.1632098672900;
        Sun, 19 Sep 2021 17:44:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f17sm1884382ook.9.2021.09.19.17.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 17:44:32 -0700 (PDT)
Date:   Sun, 19 Sep 2021 19:44:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
Message-ID: <YUfZbsf3MX1aQJ2+@builder.lan>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:

> From: Prasad Sodagudi <psodagud@codeaurora.org>
> 
> egpio is a scheme which allows special power Island Domain IOs
> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
> TLMM functions with Island Domain functions.
> With this scheme, an IO can be controlled both by the cpu running
> linux and the Island processor. This provides great flexibility to
> re-purpose the Island IOs for regular TLMM usecases.
> 
> 2 new bits are added to ctl_reg, egpio_present is a read only bit
> which shows if egpio feature is available or not on a given gpio.
> egpio_enable is the read/write bit and only effective if egpio_present
> is 1. Once its set, the Island IO is controlled from Chip TLMM.
> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
> 
> The support exists on most recent qcom SoCs, and we add support
> for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
> 

I was under the impression that this feature would allow you to
repurpose pins for use either by the remote island or by apps.

But if I understand your proposal, you check to see if the pin is
"egpio capable" for a pin and if so just sets the bit - muxing it to
apps (or the island?).


It seems reasonable that this would be another pinmux state for these
pins, rather than just flipping them all in one or the other direction.


PS. When I spoke with Prasad about this a couple of years ago, I think
we talked about representing this as a pinconf property, but it seems to
make more sense to me now that it would be a pinmux state.

Regards,
Bjorn

> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> [rnayak: rewrite commit log, minor rebase]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c    | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8150.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 ++
>  drivers/pinctrl/qcom/pinctrl-sm8350.c | 2 ++
>  6 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 8476a8a..f4a2343 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -220,6 +220,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	val = msm_readl_ctl(pctrl, g);
>  	val &= ~mask;
>  	val |= i << g->mux_bit;
> +	/* Check if egpio present and enable that feature */
> +	if (val & BIT(g->egpio_present))
> +		val |= BIT(g->egpio_enable);
> +
>  	msm_writel_ctl(val, pctrl, g);
>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index e31a516..3635b31 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -77,6 +77,8 @@ struct msm_pingroup {
>  	unsigned drv_bit:5;
>  
>  	unsigned od_bit:5;
> +	unsigned egpio_enable:5;
> +	unsigned egpio_present:5;
>  	unsigned oe_bit:5;
>  	unsigned in_bit:5;
>  	unsigned out_bit:5;
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> index afddf6d..607d459 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> @@ -43,6 +43,8 @@
>  		.mux_bit = 2,			\
>  		.pull_bit = 0,			\
>  		.drv_bit = 6,			\
> +		.egpio_enable = 12,		\
> +		.egpio_present = 11,		\
>  		.oe_bit = 9,			\
>  		.in_bit = 0,			\
>  		.out_bit = 1,			\
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> index 7359bae..63a625a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> @@ -56,6 +56,8 @@ enum {
>  		.mux_bit = 2,			\
>  		.pull_bit = 0,			\
>  		.drv_bit = 6,			\
> +		.egpio_enable = 12,		\
> +		.egpio_present = 11,		\
>  		.oe_bit = 9,			\
>  		.in_bit = 0,			\
>  		.out_bit = 1,			\
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> index af144e7..ad4fd94 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
> @@ -57,6 +57,8 @@ enum {
>  		.mux_bit = 2,				\
>  		.pull_bit = 0,				\
>  		.drv_bit = 6,				\
> +		.egpio_enable = 12,			\
> +		.egpio_present = 11,			\
>  		.oe_bit = 9,				\
>  		.in_bit = 0,				\
>  		.out_bit = 1,				\
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> index 4d8f863..bb436dc 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
> @@ -46,6 +46,8 @@
>  		.mux_bit = 2,			\
>  		.pull_bit = 0,			\
>  		.drv_bit = 6,			\
> +		.egpio_enable = 12,		\
> +		.egpio_present = 11,		\
>  		.oe_bit = 9,			\
>  		.in_bit = 0,			\
>  		.out_bit = 1,			\
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
