Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986084D9FAB
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 17:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349927AbiCOQLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 12:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349932AbiCOQLR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 12:11:17 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EAF4832E
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:10:04 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id u30-20020a4a6c5e000000b00320d8dc2438so24885353oof.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 09:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ByiqpVNJnghZS7rl/0H3t4qf3Wtk1swesADPIolOu9M=;
        b=ZGTQdOg9Z/h6mt0XqVcLBdHhIkmMSDtC4nAuWcGG0/GFqH8uAsYKfpCkF2Wl/J/AR/
         tgMnAsDaVA84ujU2RDL1mle5w4okLxmFtt6e/i3UTNUzR7AjVojFH+UzCiSOiI6b2+YF
         IsNw/qCYBARMmXAk0fburEAFlbTnf/Zme4OamiHchenQDNlmXndfOGtzeZvWYuAyRv/t
         MeBkPnciol0TtYx6MHjvmpwtds4L2UJVIzebdCUqklyMyrSCcM9xjN/Nki7o7JUcyKy8
         0hTd44bxuAas9wq5cL7FIKYl6Y9zjn7HQwwux3nOZgrV5yrbDLAZFIII+bgs5LYcxapu
         CRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ByiqpVNJnghZS7rl/0H3t4qf3Wtk1swesADPIolOu9M=;
        b=o3Juct74DEoh4WGncTetG18kjMAb9TUvIr9weeV02HCdX+REb2iCHMghayrWsbRz6q
         oSnEheyg6DOrRdgXG+wxK0JKqTYDqJoaQfhVLh3LwWONuPPBoKbKSk9c2ORDUmi5OHxN
         NcHnNVzLLUVyC/ulf60t5aZgG4gJ+ZhcacJAJyYZxRbGyZpmKqcSIMl5MpA34Tb1CE0x
         nVIiUpw+QHnOEoLUr7xPg7drohbdZ50epY7ao9HqP5hIcxv5o2/0lmqGG2mulxySHmNX
         G8xdEOmJ5KsI3eKrhHTobjgDlofkDuxlN0OYV8jjY/xXBW1z7rKH/O3tnIF6gEjVKsqu
         sBFg==
X-Gm-Message-State: AOAM530q82fCQboLp952jwr4Efzokgf239P4oD0HYGcvuj/+HJsslquK
        JnnaLnDTLCQHJGpQGAYpmzaYnBdyWE5vaw==
X-Google-Smtp-Source: ABdhPJwxXKMs0s1H3GUn2dbrZggsynPLV3jiosRtrMTm4uRWhBES5MJOFMvFU8RmZ1V/GEYx9YPD/A==
X-Received: by 2002:a05:6870:618a:b0:da:b3f:324b with SMTP id a10-20020a056870618a00b000da0b3f324bmr1878817oah.251.1647360603438;
        Tue, 15 Mar 2022 09:10:03 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id m13-20020a056870888d00b000d103280accsm8117995oam.16.2022.03.15.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 09:10:02 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:10:01 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, maz@kernel.org,
        quic_mkshah@quicinc.com, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: sm8150: Specify PDC map
Message-ID: <YjC6WZUAYtmxwoFL@builder.lan>
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
 <20220226184028.111566-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226184028.111566-3-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 26 Feb 12:40 CST 2022, Bhupesh Sharma wrote:

> Specify the PDC mapping for SM8150, so that gpio interrupts are
> properly mapped to the wakeup IRQs of the PDC.
> 
> Cc: Maulik Shah <quic_mkshah@quicinc.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-sm8150.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> index 7359bae68c69..1cc622694553 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> @@ -1500,6 +1500,25 @@ static const struct msm_pingroup sm8150_groups[] = {
>  	[178] = SDC_QDSD_PINGROUP(sdc2_data, 0xB2000, 9, 0),
>  };
>  
> +static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
> +	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
> +	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
> +	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
> +	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
> +	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
> +	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
> +	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
> +	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
> +	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
> +	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
> +	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
> +	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
> +	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
> +	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
> +	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
> +	{ 152, 108 }, { 153, 109 }
> +};
> +
>  static const struct msm_pinctrl_soc_data sm8150_pinctrl = {
>  	.pins = sm8150_pins,
>  	.npins = ARRAY_SIZE(sm8150_pins),
> @@ -1510,6 +1529,9 @@ static const struct msm_pinctrl_soc_data sm8150_pinctrl = {
>  	.ngpios = 176,
>  	.tiles = sm8150_tiles,
>  	.ntiles = ARRAY_SIZE(sm8150_tiles),
> +	.wakeirq_map = sm8150_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(sm8150_pdc_map),
> +	.wakeirq_dual_edge_errata = true,
>  };
>  
>  static int sm8150_pinctrl_probe(struct platform_device *pdev)
> -- 
> 2.35.1
> 
