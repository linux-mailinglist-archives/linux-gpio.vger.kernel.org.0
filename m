Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16F7321D51
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Feb 2021 17:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbhBVQox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Feb 2021 11:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhBVQoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2021 11:44:39 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E576C06178B
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 08:43:58 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 18so14583872oiz.7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2021 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I9HPVcIZh92ffaSgkiuaC52t1AjwtivB9/6mRIvGEJ8=;
        b=JwqxXjgLS5YlVaPZFSBeKOGo4NFR9oRHLd8Q7FQ30RENW+pqBjEWzvqc9gdM5MlK+E
         RGk60u9kpuRbca4hjpxfmp6tW3ddXS7mtf60WA5wOTtSRSFXb+GxzYQy21NzEqvSPsmA
         zKmXmWoJQUCNaeB6E5sqSb/5aIqKwH1ZatMJV9qfomazt4jnG1t8e3XOEsksmo7SgxzX
         z7ssB67OruJNtw5af7jNnMO5nX1w+44tHO4F7r8iO1DnloIROw5Pe+Fo2+jxN3XCwzYQ
         1M3QoQ9noeu5n9fBfnZUn3u4xlZHmA1yp/EkZ3bK4JLqyiuFTEoZCCvbjIapLlhYrLRF
         Ngtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9HPVcIZh92ffaSgkiuaC52t1AjwtivB9/6mRIvGEJ8=;
        b=JjXf6lERkBmINQOh1h8GLmQH9tldx9iGrMhdxyor0RUMZarDCtBXkGavV0owZU1n9l
         AzdxbTBGKVmPucaw6Gk5Z7vK5aLPfg1c8OgICa0agchJ11bCPQZviyE8+bqvZMpgtztW
         gMSWg4D2P6Pe/XhRDK2DFoK5FC9XnixGIMEnY4CS1suOGbcYbgcNgrxnPtN/Brf/3L1p
         /RrSBozn+n1ykOOB9YWz8lFotl0I92vNuOiZJLtrkjS9I4T1BmU7aI7azvRA0R7mGCo4
         D4uHwvNk6NYj/tEenY1XPqiIOBc914wUeuiK/dK1BjbDioGYhqTpftlZublJFj0ttUOW
         e4JQ==
X-Gm-Message-State: AOAM530a98VeDfhLLOmMyO15CpNP7mstwuPqjZx0EHEBYd82eIFPIOZ+
        2uJuTImoSPNpnVR6tgWLpHYpSw==
X-Google-Smtp-Source: ABdhPJwglAISK+IAqoV8BrrJ/jvcvjqAfa1AHrbQX40p7RRVWpuviAXuERWP1JUkVQ40YIkqWxstgA==
X-Received: by 2002:a05:6808:a1d:: with SMTP id n29mr2525976oij.141.1614012237466;
        Mon, 22 Feb 2021 08:43:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o20sm3560130oor.14.2021.02.22.08.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:43:57 -0800 (PST)
Date:   Mon, 22 Feb 2021 10:43:55 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map
Message-ID: <YDPfS5In6DPaDrHW@builder.lan>
References: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 11 Feb 22:59 CST 2021, Rajendra Nayak wrote:

> From: Maulik Shah <mkshah@codeaurora.org>
> 
> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
> 
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> index 8daccd5..99c416e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> @@ -1449,6 +1449,28 @@ static const struct msm_pingroup sc7280_groups[] = {
>  	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
>  };
>  
> +static const struct msm_gpio_wakeirq_map sc7280_pdc_map[] = {
> +	{ 0, 134 }, { 3, 131 }, { 4, 121 }, { 7, 103 }, { 8, 155 },
> +	{ 11, 93 }, { 12, 78 }, { 15, 79 }, { 16, 80 }, { 18, 81 },
> +	{ 19, 107 }, { 20, 82 }, { 21, 83 }, { 23, 99 }, { 24, 86 },
> +	{ 25, 95 }, { 27, 158 }, { 28, 159 }, { 31, 90 }, { 32, 144 },
> +	{ 34, 77 }, { 35, 92 }, { 36, 157 }, { 39, 73 }, { 40, 97 },
> +	{ 41, 98 }, { 43, 85 }, { 44, 100 }, { 45, 101 }, { 47, 102 },
> +	{ 48, 74 }, { 51, 112 }, { 52, 156 }, { 54, 117 }, { 55, 84 },
> +	{ 56, 108 }, { 59, 110 }, { 60, 111 }, { 61, 123 }, { 63, 104 },
> +	{ 68, 127 }, { 72, 150 }, { 75, 133 }, { 77, 125 }, { 78, 105 },
> +	{ 79, 106 }, { 80, 118 }, { 81, 119 }, { 82, 162 }, { 83, 122 },
> +	{ 86, 75 }, { 88, 154 }, { 89, 124 }, { 90, 149 }, { 91, 76 },
> +	{ 93, 128 }, { 95, 160 }, { 101, 126 }, { 102, 96 }, { 103, 116 },
> +	{ 104, 114 }, { 112, 72 }, { 116, 135 }, { 117, 163 }, { 119, 137 },
> +	{ 121, 138 }, { 123, 139 }, { 125, 140 }, { 127, 141 }, { 128, 165 },
> +	{ 129, 143 }, { 130, 94 }, { 131, 145 }, { 133, 146 }, { 136, 147 },
> +	{ 140, 148 }, { 141, 115 }, { 142, 113 }, { 145, 130 }, { 148, 132 },
> +	{ 150, 87 }, { 151, 88 }, { 153, 89 }, { 155, 164 }, { 156, 129 },
> +	{ 157, 161 }, { 158, 120 }, { 161, 136 }, { 163, 142 }, { 172, 166 },
> +	{ 174, 167 },
> +};
> +
>  static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
>  	.pins = sc7280_pins,
>  	.npins = ARRAY_SIZE(sc7280_pins),
> @@ -1457,6 +1479,8 @@ static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
>  	.groups = sc7280_groups,
>  	.ngroups = ARRAY_SIZE(sc7280_groups),
>  	.ngpios = 176,
> +	.wakeirq_map = sc7280_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(sc7280_pdc_map),
>  };
>  
>  static int sc7280_pinctrl_probe(struct platform_device *pdev)
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
