Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6743711A4DC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 08:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLKHJM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 02:09:12 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38756 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfLKHJM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 02:09:12 -0500
Received: by mail-pl1-f193.google.com with SMTP id a17so665828pls.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 23:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Mw1m7ZX6r1K+ymHABV5ItgLTm+mVsRBoTGueokW36qI=;
        b=rMAPs3R+esIjZdpo1ueKrYQgBgvGLiaqfirFkDuGPFWYiCfByGGNwnZUnQWgLPFMc8
         vukk1lfwIQaBOKsmvnunKBl9JKPpD+M0eAeD+VGnRiJ+4FAnQ1zqv+V/9pQ16qCm/VIC
         oc2lAMaLORTO9zNuIFhWLae5Bw/hVsFjbhkbqPVPV6BRb1yoDZrcdtkdhN363XazOI8k
         jpZgHxXNYUpb7gDR40Ck7+XdAAuMOEBiD4FztiC3jVmHtBiz7z/abxY+/+piYKN62VK+
         IKe77mGxcPuq/upvhQNpVamGZMsBYODTv8+jiKoV8jFc5pgrlhN4pyG5Rxxiw3T66nOd
         4n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mw1m7ZX6r1K+ymHABV5ItgLTm+mVsRBoTGueokW36qI=;
        b=CtDy6OnbVDQTIjXieUi2bl7Xzx1lyS7I5r+b07DDNFk6t2X7wEc41CGJtwYJ/PKMj1
         dr1k8OXA6XO2i3qQDRanNvYzMnQISjwybeKIT/YV0eXfG2BDNhpSxaCgOCvrgx0FIHvD
         PKEYnlwCM6alco951dVw2FKW9om8bpLH5GBO3IcQe6t0mzA9JOGUKGkiV4TX3QFUQCL2
         mAlazlV671VpTUqvUrXiqflB5GFcHRJmtb8M4+YtXXh8rFMzTRJcj+UoTAB3H2jMvMbM
         KRfZMIJ9HOuANnFUJza8zwKIP/feeV87SeztVcCtcWpf6GPfGIuYf9z+MJeJYnqG4AUO
         Fi/Q==
X-Gm-Message-State: APjAAAXjjdaxUvT9fXaB2O3SH4a6kbjHkl+SXwWRqArrCnwinrFV1Lj6
        moWwcGzy5aVdoPlgNNbB5eGVbw==
X-Google-Smtp-Source: APXvYqzH7A/k3hcWyCu54U7eOMxE0oC51dR4FqfA0CwxE8VJnJ0z14NuV83kl328IojF27XTQhS5PA==
X-Received: by 2002:a17:90b:150:: with SMTP id em16mr1796042pjb.123.1576048151628;
        Tue, 10 Dec 2019 23:09:11 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o7sm1577093pfg.138.2019.12.10.23.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:09:10 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:09:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
Message-ID: <20191211070908.GG3143381@builder>
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
 <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 30 Oct 00:06 PDT 2019, Maulik Shah wrote:

> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
> 
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Linus, please take this patch through your tree and I'll take patch 2
through the arm tree.

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> index 6399c8a..8a2b97c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
> @@ -1097,6 +1097,22 @@ static const struct msm_pingroup sc7180_groups[] = {
>  	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x97b000, 9, 0),
>  };
>  
> +static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
> +	{0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
> +	{10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
> +	{24, 61}, {26, 52}, {28, 36}, {30, 100}, {31, 33}, {32, 81},
> +	{33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
> +	{41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
> +	{52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
> +	{59, 37}, {62, 110}, {63, 111}, {64, 74}, {65, 44}, {66, 93},
> +	{67, 58}, {68, 112}, {69, 32}, {70, 54}, {72, 59}, {73, 64},
> +	{74, 71}, {78, 31}, {82, 30}, {85, 103}, {86, 38}, {87, 39},
> +	{88, 45}, {89, 46}, {90, 47}, {91, 48}, {92, 60}, {93, 49},
> +	{94, 84}, {95, 94}, {98, 65}, {101, 66}, {104, 67}, {109, 104},
> +	{110, 68}, {113, 69}, {114, 113}, {115, 108}, {116, 121},
> +	{117, 114}, {118, 119},
> +};
> +
>  static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>  	.pins = sc7180_pins,
>  	.npins = ARRAY_SIZE(sc7180_pins),
> @@ -1107,6 +1123,8 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
>  	.ngpios = 120,
>  	.tiles = sc7180_tiles,
>  	.ntiles = ARRAY_SIZE(sc7180_tiles),
> +	.wakeirq_map = sc7180_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
>  };
>  
>  static int sc7180_pinctrl_probe(struct platform_device *pdev)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
