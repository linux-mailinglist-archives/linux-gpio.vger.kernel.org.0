Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A693F43F345
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 01:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhJ1XEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 19:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhJ1XED (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 19:04:03 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20CCC061767
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 16:01:35 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id q39-20020a4a962a000000b002b8bb100791so2715325ooi.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 16:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vTcTp/Wzid/SbgAPPesCpOnCVxJ0VeAUEDkb6KOgaAQ=;
        b=buFHREiIhyVCaKVrvUR4qNi/kQcDjzdNRftJjpnCXXuf/uPqks9X+h3rIMVornbMa0
         kt1IFHAb2OKeU2Er5wxoz1UcEdUCiIhrfwZodSQWupPeRhu7D4/njCZhX5L0GhSTexAi
         Ag3Ael/OpwLkIoJbCr6o59l6EinZJeAmTvhGPboW16ApSqyzl0olOweNl7A7Vrmxbrqp
         hlqgo2utYI1qLb4LGwdd7SBStsQjI9+vC6QGpBPMEf4D30DLwn0j6S5ImE4qPtAiyOXk
         t4SqMRM46klvwi+IvxPabWKNZPr3VT69Pity5wKe6ICcRfFsb4AC6vqrG2UIdx5YtxXR
         RHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vTcTp/Wzid/SbgAPPesCpOnCVxJ0VeAUEDkb6KOgaAQ=;
        b=dXVUX79se/CrjONFWReuZ9oTE3oq/tsm2bgJ2yQc3m4L3qVH/kvRU2h9FlhG9lKLW7
         p6D/x6SUcbIIn+0t9lN5jrZ+LHY14nPpWlcoUoXssggB/JeUs84D3OPvUuOK6rmY4QbM
         SfRlpsqdsDg/yhKeZXJCcV8faAbRCC4nLn+bG5DqYxjYcMzvqvZ7HvJq6rEnSrfyw4t3
         h1A0LoRqVCBYFsxgnDwYTLZ8c8DkY6DvdbEGxc9rOL80hphiY+UiNmGvXVnfHNlXJe47
         iHnbZjqJCT10pt3Yi/sdmDMhDyAWxQAP+6p9EXeMEbSZWFDhZ0buw47LhWQKZoaFHD/f
         TG3g==
X-Gm-Message-State: AOAM530Dwsx6eUVkNL4VYIb57RqheTUeh8B4NUwhBa4UCpVHCkOqR1WV
        eE0kI40jhZN0pwk0hOk5nxxgRQ==
X-Google-Smtp-Source: ABdhPJxTdu3f3l/zvx+sGTC+t77mAT5Hsb7DrZPkM5Guh6tvYtJa3jh+3KHi3Adm4bWLuj+c2pDfNw==
X-Received: by 2002:a4a:da09:: with SMTP id e9mr4071736oou.60.1635462095167;
        Thu, 28 Oct 2021 16:01:35 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 38sm1409481oti.13.2021.10.28.16.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 16:01:34 -0700 (PDT)
Date:   Thu, 28 Oct 2021 16:03:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add egpio support
Message-ID: <YXssOzkqUHPH0ZQZ@ripper>
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
 <1635250056-20274-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635250056-20274-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 26 Oct 05:07 PDT 2021, Rajendra Nayak wrote:

> sc7280 supports the egpio feature, GPIOs ranging from 144 to 174
> (31 GPIOs) support it, we define gpio_func to 9, which
> is an unused function for all these pins on sc7280.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Thanks for reworking these patches, I like the end result.

Regards,
Bjorn

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 75 ++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> index 9017ede..31df55c 100644
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
> @@ -520,6 +522,7 @@ enum sc7280_functions {
>  	msm_mux_dp_lcd,
>  	msm_mux_edp_hot,
>  	msm_mux_edp_lcd,
> +	msm_mux_egpio,
>  	msm_mux_gcc_gp1,
>  	msm_mux_gcc_gp2,
>  	msm_mux_gcc_gp3,
> @@ -658,6 +661,14 @@ static const char * const gpio_groups[] = {
>  	"gpio165", "gpio166", "gpio167", "gpio168", "gpio169", "gpio170",
>  	"gpio171", "gpio172", "gpio173", "gpio174",
>  };
> +static const char * const egpio_groups[] = {
> +	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
> +	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
> +	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
> +	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
> +	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
> +	"gpio174",
> +};
>  static const char * const atest_char_groups[] = {
>  	"gpio81",
>  };
> @@ -1150,6 +1161,7 @@ static const struct msm_function sc7280_functions[] = {
>  	FUNCTION(dp_lcd),
>  	FUNCTION(edp_hot),
>  	FUNCTION(edp_lcd),
> +	FUNCTION(egpio),
>  	FUNCTION(gcc_gp1),
>  	FUNCTION(gcc_gp2),
>  	FUNCTION(gcc_gp3),
> @@ -1408,37 +1420,37 @@ static const struct msm_pingroup sc7280_groups[] = {
>  	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _),
>  	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _),
>  	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _),
> -	[144] = PINGROUP(144, _, _, _, _, _, _, _, _, _),
> -	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, _),
> -	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, _),
> -	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, _),
> -	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, _),
> -	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, _),
> -	[150] = PINGROUP(150, qdss, _, _, _, _, _, _, _, _),
> -	[151] = PINGROUP(151, qdss, _, _, _, _, _, _, _, _),
> -	[152] = PINGROUP(152, qdss, _, _, _, _, _, _, _, _),
> -	[153] = PINGROUP(153, qdss, _, _, _, _, _, _, _, _),
> -	[154] = PINGROUP(154, _, _, _, _, _, _, _, _, _),
> -	[155] = PINGROUP(155, _, _, _, _, _, _, _, _, _),
> -	[156] = PINGROUP(156, qdss_cti, _, _, _, _, _, _, _, _),
> -	[157] = PINGROUP(157, qdss_cti, _, _, _, _, _, _, _, _),
> -	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, _),
> -	[159] = PINGROUP(159, _, _, _, _, _, _, _, _, _),
> -	[160] = PINGROUP(160, _, _, _, _, _, _, _, _, _),
> -	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, _),
> -	[162] = PINGROUP(162, _, _, _, _, _, _, _, _, _),
> -	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, _),
> -	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, _),
> -	[165] = PINGROUP(165, qdss_cti, _, _, _, _, _, _, _, _),
> -	[166] = PINGROUP(166, qdss_cti, _, _, _, _, _, _, _, _),
> -	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _),
> -	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _),
> -	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _),
> -	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _),
> -	[171] = PINGROUP(171, qdss, _, _, _, _, _, _, _, _),
> -	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, _),
> -	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
> -	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
> +	[144] = PINGROUP(144, _, _, _, _, _, _, _, _, egpio),
> +	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, egpio),
> +	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, egpio),
> +	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, egpio),
> +	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, egpio),
> +	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, egpio),
> +	[150] = PINGROUP(150, qdss, _, _, _, _, _, _, _, egpio),
> +	[151] = PINGROUP(151, qdss, _, _, _, _, _, _, _, egpio),
> +	[152] = PINGROUP(152, qdss, _, _, _, _, _, _, _, egpio),
> +	[153] = PINGROUP(153, qdss, _, _, _, _, _, _, _, egpio),
> +	[154] = PINGROUP(154, _, _, _, _, _, _, _, _, egpio),
> +	[155] = PINGROUP(155, _, _, _, _, _, _, _, _, egpio),
> +	[156] = PINGROUP(156, qdss_cti, _, _, _, _, _, _, _, egpio),
> +	[157] = PINGROUP(157, qdss_cti, _, _, _, _, _, _, _, egpio),
> +	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, egpio),
> +	[159] = PINGROUP(159, _, _, _, _, _, _, _, _, egpio),
> +	[160] = PINGROUP(160, _, _, _, _, _, _, _, _, egpio),
> +	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, egpio),
> +	[162] = PINGROUP(162, _, _, _, _, _, _, _, _, egpio),
> +	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, egpio),
> +	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, egpio),
> +	[165] = PINGROUP(165, qdss_cti, _, _, _, _, _, _, _, egpio),
> +	[166] = PINGROUP(166, qdss_cti, _, _, _, _, _, _, _, egpio),
> +	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, egpio),
> +	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, egpio),
> +	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, egpio),
> +	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, egpio),
> +	[171] = PINGROUP(171, qdss, _, _, _, _, _, _, _, egpio),
> +	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, egpio),
> +	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, egpio),
> +	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, egpio),
>  	[175] = UFS_RESET(ufs_reset, 0xbe000),
>  	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3004, 0, 6),
>  	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
> @@ -1481,6 +1493,7 @@ static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
>  	.ngpios = 176,
>  	.wakeirq_map = sc7280_pdc_map,
>  	.nwakeirq_map = ARRAY_SIZE(sc7280_pdc_map),
> +	.egpio_func = 9,
>  };
>  
>  static int sc7280_pinctrl_probe(struct platform_device *pdev)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
