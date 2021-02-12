Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E88319BC7
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 10:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhBLJV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 04:21:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhBLJVy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 04:21:54 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404B5C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:21:13 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id c11so5443528pfp.10
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Xr++FWOGrRgeZX24DXMr+Mjana0jr7tu3CsjIljibE=;
        b=lwSecrGDkqIXoWpEN4asiZlDDh0SyJIg5YWpsegvrIP2/Wzxwl2j5MsGXj3lqkw27v
         Od2bLz0a42TTb6GPIX5S04kcxOXckSOTmJ25a9oLId7vxwO46qhy6f/NVoE258v/9XZk
         VWy1++OIa7Sazk0G2Er4EOEOJeC27fS8dGUw4r5sSJ71Q22YsFF+ZE1N+fNTPDRqgyl/
         HeTC2JJEkKW+kxa9PJgDQs/DDSkwmxviqnKkMp6l35+3cvhOzpXqdT0ljFxJs3m643G1
         oq/iiDU//u7Q09Zv6JmWetPb9eolDSym7JYOARg7uubcLR/AnOYIIsM9SRsUbx80mmlh
         FXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Xr++FWOGrRgeZX24DXMr+Mjana0jr7tu3CsjIljibE=;
        b=sQ6AI7a2FLEe3zUS1In4ayzUFUnwp6vAb62T+onGdggteygb0tBrBCCosZwitKxp2y
         9YUTOjwi/cbOsWNvraWt+krxIQYKUyqx7ULwMDfgCzaDVSyADQIxpltfCHw83TwAFrXM
         KLzRorevzXqKiGSbjdVnQKfignidvzah82yXCWc+gqMHOnxBNYMW2+F60ZTUrqJ0o7wT
         MYWAIYNW7ixYpdGmt41KXdrsAGXwRZ2Jza7n5qcsBPuWcp7VjhjytguvXW7BIKHqqYAC
         kKTvLNMZlFXc37oRAKaCPgEohdu/Um5yBIPd4h/PT5duZd7PGSmvlvPryUrHGb0PHGSe
         VMLg==
X-Gm-Message-State: AOAM533CoCE6D8cdUYibpu5nmoGonCbxUp2hcb8UcyoC/q8SFAbetBJE
        w2QPm16Cj5ChPLDPxlkSLrss
X-Google-Smtp-Source: ABdhPJzyFjDUiRxUEYywtsVsMENJrvBe66j6j61ZUfT+SNhLegdE0d/azLlQcAl/w6Ek9FKo1G5JzA==
X-Received: by 2002:a63:4556:: with SMTP id u22mr2243746pgk.270.1613121672763;
        Fri, 12 Feb 2021 01:21:12 -0800 (PST)
Received: from work ([103.66.79.123])
        by smtp.gmail.com with ESMTPSA id cq2sm7308016pjb.55.2021.02.12.01.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Feb 2021 01:21:12 -0800 (PST)
Date:   Fri, 12 Feb 2021 14:51:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: actions: Add depends on || COMPILE_TEST
Message-ID: <20210212092109.GA18975@work>
References: <20210212081411.50774-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212081411.50774-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 09:14:11AM +0100, Linus Walleij wrote:
> I happened to apply the v1 of the patch restriction the
> selection to ARM or ARM64, sorry for my sloppiness.
> Fixing up the mistake as I can't back the patch out now.
> 
> Fixes: 5784921f7b6c ("pinctrl: actions: Add the platform dependency to drivers")
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
> index 8bb8345b17da..119f0e471efd 100644
> --- a/drivers/pinctrl/actions/Kconfig
> +++ b/drivers/pinctrl/actions/Kconfig
> @@ -12,21 +12,21 @@ config PINCTRL_OWL
>  
>  config PINCTRL_S500
>  	bool "Actions Semi S500 pinctrl driver"
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST
>  	depends on PINCTRL_OWL
>  	help
>  	  Say Y here to enable Actions Semi S500 pinctrl driver
>  
>  config PINCTRL_S700
>  	bool "Actions Semi S700 pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_OWL
>  	help
>  	  Say Y here to enable Actions Semi S700 pinctrl driver
>  
>  config PINCTRL_S900
>  	bool "Actions Semi S900 pinctrl driver"
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_OWL
>  	help
>  	  Say Y here to enable Actions Semi S900 pinctrl driver
> -- 
> 2.29.2
> 
