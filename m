Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 340FD32F56C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 22:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhCEVnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 16:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCEVnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 16:43:11 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F52C06175F
        for <linux-gpio@vger.kernel.org>; Fri,  5 Mar 2021 13:43:11 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id p6so785420oot.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Mar 2021 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4QnN4YsB1edIr8X2Vj7cXXHiapi33m7m7f0fEZDlVLo=;
        b=JJByvBdbUshot5c6rAG4/RL11oDwFpx/j/CUdhj7hWbWGxMs7bTXh66gYKCMuPlKkx
         UbvVNWDvgnmXzn7XDz99Y5wldwGN2HFcH5yiDN7Swc6H7u62PhGl7tQ3VEhtC2Eh5XTb
         cRH+aer6kGnlzc0ZUDPnC6Dx2ktMhJ571iuBtODBgdsHBsYF+JevM+7d6WjbrNqvNxwy
         ivvXjCE0zI1b7efhVrfuFObnFqBMJE2ui5SlN1jxQycmZuUp+DEZ62S6ph7l6Ilby4io
         ouUpzFTUH1WXlZuNsI3VfDg09TTtmVXlp1Cvahq67xY4wmkpn1px93nAHvw+9jsAgyeP
         +KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4QnN4YsB1edIr8X2Vj7cXXHiapi33m7m7f0fEZDlVLo=;
        b=KeXwMZewkYIzgJA33qc+3aYTfZVWM+d9zWfH+hHgMKJoi2Ph5hL8XgXl5v4MW/Dxqb
         zvvS65IWMNmhnlxl7eoVw7766QhHHGsqCijk9Y+AeJblpEw/DaCVCFTWOQhWy0Ut6b6X
         B0TRzuI6NLSSOdd3s3DuGuHQtm97y1Io0w7dlNR2oAu4fnWdTwoAsH9rzVQbhpaXB0y3
         66MZedLl3lWGT4vwbh+rERbEXUV1A/wyHEmfrQOHQjbMT8PgYTkoLixxLVlfJYLiQG/c
         wiWCJITyMF+EAGgyCTD+nazxjXbWmCkch9j75scSWnMZ/4hgSdTyC8rwcg+hJ8a7HIEr
         YEhg==
X-Gm-Message-State: AOAM530zgYv7Ewzvo8DXxvhebPAL1QjSivaiWmPhr4mzEdq07fAdl1Ir
        uDoZVomzt/NMr5ZGhhzKVUA+rQ==
X-Google-Smtp-Source: ABdhPJy4eZ0JGEiyyEW5mWTURNNMiA9RtniVPWvPsitPH/LgrX6/OVuHlk2llyKwdHivHrKqK04jXA==
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr9527254oot.25.1614980590387;
        Fri, 05 Mar 2021 13:43:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y83sm763379oig.15.2021.03.05.13.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 13:43:09 -0800 (PST)
Date:   Fri, 5 Mar 2021 15:43:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: fix number of pins in
 'gpio-ranges'
Message-ID: <YEKl7GbxBhui4eoT@builder.lan>
References: <20210303033106.549-1-shawn.guo@linaro.org>
 <20210303033106.549-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303033106.549-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 02 Mar 21:31 CST 2021, Shawn Guo wrote:

> The last cell of 'gpio-ranges' should be number of GPIO pins, and in
> case of qcom platform it should match msm_pinctrl_soc_data.ngpio rather
> than msm_pinctrl_soc_data.ngpio - 1.
> 

This is a historical artifact, SDM845 has 150 GPIO pins. In addition to
this there's an output-only pin for UFS, which I exposed as an GPIO as
well - but it's only supposed to be used as a reset-gpio for the UFS
device.

Perhaps that still mandates that gpio-ranges should cover it?

> This fixes the problem that when the last GPIO pin in the range is
> configured with the following call sequence, it always fails with
> -EPROBE_DEFER.
> 
>     pinctrl_gpio_set_config()
>         pinctrl_get_device_gpio_range()
>             pinctrl_match_gpio_range()

When do we hit this sequence? I didn't think operations on the UFS
GP(I)O would ever take this code path?

Regards,
Bjorn

> 
> Fixes: bc2c806293c6 ("arm64: dts: qcom: sdm845: Add gpio-ranges to TLMM node")
> Cc: Evan Green <evgreen@chromium.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 454f794af547..6a2ed02d383d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2382,7 +2382,7 @@
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			gpio-ranges = <&tlmm 0 0 150>;
> +			gpio-ranges = <&tlmm 0 0 151>;
>  			wakeup-parent = <&pdc_intc>;
>  
>  			cci0_default: cci0-default {
> -- 
> 2.17.1
> 
