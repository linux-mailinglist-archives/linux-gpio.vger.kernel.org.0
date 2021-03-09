Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB416332F93
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 21:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhCIUF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 15:05:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhCIUFb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:05:31 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4969EC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:05:31 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id t16so14066309ott.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lpdt0zLAZe17/ZolXa2wLHIA6dgjRIlJmgcDz9hKEVI=;
        b=eKWffYyiwh8TVySSuyodQeIj3xuj3BmnlSfi2whF4VR5SpxqzVqW/cSEgTndopWiUm
         T4Yd5hktkb18NChbtjAFJpEu5QU8rSa2i9mf2bZMB8Dp8SaAs0eIj7dhY65OUyOSTbBp
         n1LOrT6jTwpesV31Fd5r4D9G2HCnTDry0Dfredu1GnwpF91PsAvnS46H/FFPDxoPzzHF
         inxRoKa03EX/mti10bKu0DgsZnzrHxEyina5GAYsqwNTBArZZCqM41Sy4c9sPd9ZJXaF
         r9NtmN/Y1FXU0Ygh1PXtopGLdcWaY9SIsbW0IirGbIUp6ria1SpyZf33N/xwLVfxbXsX
         sRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lpdt0zLAZe17/ZolXa2wLHIA6dgjRIlJmgcDz9hKEVI=;
        b=QLDJHc6ZB937vxWgKslnMyf5GRjE3G55t+QmdMnPAfbMcJQtBRSO4pAD+dv9C3L+GE
         q8QWZO9+SGgSOPAzp02SX/fvFuHHv050yV3zkb2pcODKICw8wZ/U9Rzj4XsgdrAiMANp
         0WZWB8SG5HOxrOsKncOMjW8dcsIG0sXS7zZAYR4Z9L8GJ7saKdJOMFJq4E4rSwACpXGY
         fGeFPwpEoGUS2H1MoDHpsS0ZBxB4rd06/cPSmEMvJhoyPujBPqqgCRKGrug8QwnsnOqU
         /pGiR8Q++ip+4LSXnuLoG4rY+1s7RVtuc5LExXBbpdD9/LEnC5eW8gHl5x/M6429ZT/I
         NVGA==
X-Gm-Message-State: AOAM532Uwd7ofESz5WNnT0/eJ2q/2bBN/T9TS5vnYHCF6cuvqR0bw8S8
        VusI/mAA4nE/qhuK/l41cOIdRw==
X-Google-Smtp-Source: ABdhPJyKQfLCM6cWgrKmNtKybZb+cd/Gr+M7QJnsR1ybcJGJ7/xAk5Hp2j1XAMUkgG7t+6poeYtlKg==
X-Received: by 2002:a9d:561:: with SMTP id 88mr2420310otw.150.1615320330732;
        Tue, 09 Mar 2021 12:05:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i3sm3172218oov.2.2021.03.09.12.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:05:30 -0800 (PST)
Date:   Tue, 9 Mar 2021 14:05:28 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and
 UFS_RESET offsets
Message-ID: <YEfVCPvsAP2FpYsz@builder.lan>
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 01 Mar 23:21 CST 2021, Rajendra Nayak wrote:

> The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
> due to an issue in the scripts generating the data.
> 
> Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
> 
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> index 8daccd5..49c4347 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
> @@ -1439,14 +1439,14 @@ static const struct msm_pingroup sc7280_groups[] = {
>  	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, _),
>  	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
>  	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
> -	[175] = UFS_RESET(ufs_reset, 0x1be000),
> -	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x1b3000, 15, 0),
> -	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0x1b3000, 13, 6),
> -	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x1b3000, 11, 3),
> -	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0x1b3000, 9, 0),
> -	[180] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1b4000, 14, 6),
> -	[181] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1b4000, 11, 3),
> -	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
> +	[175] = UFS_RESET(ufs_reset, 0xbe000),
> +	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3000, 15, 0),
> +	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
> +	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0xb3000, 11, 3),
> +	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0xb3000, 9, 0),
> +	[180] = SDC_QDSD_PINGROUP(sdc2_clk, 0xb4000, 14, 6),
> +	[181] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xb4000, 11, 3),
> +	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0xb4000, 9, 0),
>  };
>  
>  static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
