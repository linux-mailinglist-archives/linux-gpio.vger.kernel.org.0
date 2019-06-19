Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0359F4B190
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 07:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730971AbfFSFnS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 01:43:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45597 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730901AbfFSFnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jun 2019 01:43:17 -0400
Received: by mail-pl1-f196.google.com with SMTP id bi6so6698010plb.12
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2019 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RcMrhNV2rA8CLALBPr7bDQwyiJXyMuKwxFa8vNfUS7I=;
        b=LPLVcncCQs9OSVRTUCWqEJNKz0UKrN7gDxzSi2ofWu/7iy/NAVMPbpK4CBtIjhI9iR
         /T64O1dhPTXBGQkFAN0qw59FwQ8wsOYayBbkU9vsY7lznOvYYj2a/S4fvTWeOSGBvmvw
         RfXXtWINQHMHeJXJxKrnBVK7SbMYMzwxr0cqX/hB+lGeNjFF5Rbf6ETkvhUPfzMciqMT
         Ukdj0XgDCpUiJ/xag6fRqCk5/RWe5UM73SCm3ehcPXWO7kPf/X15XT0nniOkyWNnH1hY
         PTb2uehPnlTTxPms5OhFL37oAViZKA/LNjKIup6lcHKt9Bn3DZE+X32m3ZQLnXjKoQEW
         s8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RcMrhNV2rA8CLALBPr7bDQwyiJXyMuKwxFa8vNfUS7I=;
        b=SztKCyMGlHHkKOk7TbstHaxAiFPdJs+dECfmLsuhKSTP3Ym6yU5rJ6T2YVc7EeTUYi
         C6BtDqGzw0p1WckzYaPnEWHexlXsPZXzn35Bb36AMJA9CVP/aWa5DxC2NfuzT0/4xetn
         LWnFNmufjk+VCbmYsl+5xP2K/K+8n25Egg42w+vUD5z7U8JCSC7OT5pwcCRoj/g3R4SQ
         A58tDHWW3Eww5ph8pv69V5LnBGgmWv91u5h2vAn5CKF61kt9/09VU5vwrFA/jOAPZCi/
         JTVAcKHqzQUif/suQ/AYhPEwEkaOy+6kn1w2lPCY67rOPu4FC7gNFFvBfc9FtgCIewZn
         1IDA==
X-Gm-Message-State: APjAAAUrCQbBo3Dt5F5VP6A5xviVfQ8jcxVLYo5mJOPHJSV56LaVjPgc
        o74WhJ9mCHkqjAerBKAQdha0Cg==
X-Google-Smtp-Source: APXvYqwQeIEFEJ28689Z3bGKlhY9VryoQA0Cf7rC3shUrKuMbmxfKOaXEntcBMTxDNNw8iuz5EjbVQ==
X-Received: by 2002:a17:902:4a:: with SMTP id 68mr118225810pla.235.1560922996994;
        Tue, 18 Jun 2019 22:43:16 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 25sm17432761pfp.76.2019.06.18.22.43.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 22:43:16 -0700 (PDT)
Date:   Tue, 18 Jun 2019 22:43:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.or
Subject: Re: [PATCH v4 3/6] soc: qcom: geni: Add support for ACPI
Message-ID: <20190619054314.GJ4814@minitux>
References: <20190612142654.9639-1-lee.jones@linaro.org>
 <20190612142654.9639-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612142654.9639-4-lee.jones@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 12 Jun 07:26 PDT 2019, Lee Jones wrote:

> When booting with ACPI as the active set of configuration tables,
> all; clocks, regulators, pin functions ect are expected to be at
> their ideal values/levels/rates, thus the associated frameworks
> are unavailable.  Ensure calls to these APIs are shielded when
> ACPI is enabled.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 6b8ef01472e9..d5cf953b4337 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>  
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
> @@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
>  {
>  	int ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	ret = pinctrl_pm_select_sleep_state(se->dev);
>  	if (ret)
>  		return ret;
> @@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
>  {
>  	int ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	ret = geni_se_clks_on(se);
>  	if (ret)
>  		return ret;
> @@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
>  	if (IS_ERR(wrapper->base))
>  		return PTR_ERR(wrapper->base);
>  
> -	wrapper->ahb_clks[0].id = "m-ahb";
> -	wrapper->ahb_clks[1].id = "s-ahb";
> -	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> -	if (ret) {
> -		dev_err(dev, "Err getting AHB clks %d\n", ret);
> -		return ret;
> +	if (!has_acpi_companion(&pdev->dev)) {
> +		wrapper->ahb_clks[0].id = "m-ahb";
> +		wrapper->ahb_clks[1].id = "s-ahb";
> +		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +		if (ret) {
> +			dev_err(dev, "Err getting AHB clks %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	dev_set_drvdata(dev, wrapper);
> -- 
> 2.17.1
> 
