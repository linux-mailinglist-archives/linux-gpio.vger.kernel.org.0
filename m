Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B6F7BA837
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 19:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjJERj7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 13:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjJERjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 13:39:54 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E01D8
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 10:39:49 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c6193d6bb4so16645ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 10:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527589; x=1697132389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXODrEGswDBHgZt3EC36Idp+LKyU6nTpAzOo1uX2Tbo=;
        b=cvpAYGbp30c0Q9flMLgxUpDsjTg3LMfeWkl8mAJ+UjYblZUZbG4AHF3pQu8KK5e6nn
         WF2MqzPQ2/TplzXSz8axz/XmxzdsqIPTTyZG2boReLy7qR4Ryzs6lyJjCE6jxYZFJF9g
         csnIc7QpU/OLhI9OVS4V3yptopGOnkner2hZRviR9iboUgRseGrZrnPyfx7FvcO0WS+j
         edUy9MCfUmpn78J401oOGAD6+iw2OF3F3WnIT+ZUZGilY9HJ0BGDNpqXL6uwt0QKfOEP
         XmLyQYanXINmSdAMKwZhqfGvgURLcC7HcWlGlwaV+GwmsPpcQSpfkMDpDWAvQB2svv/g
         tSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527589; x=1697132389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXODrEGswDBHgZt3EC36Idp+LKyU6nTpAzOo1uX2Tbo=;
        b=er4u3c/B+BInnKTnIAnSydG9a5yEYRFWrjo9m/TxQBSgWliAO6f2pAQv///l/hDfdn
         PFt9zvYWo9z3VdAs2a91WTabz4fKX5J8EBAzWcLTr1o2Nvk+jhlG1GaBk1ouEVsXrefB
         dM5ANb3o1N49ST0K03dfCnEUXgHl1FUUiaL/NVRqi9x3tXm+vAWFJegkXMhGwNq4iEbe
         piq/nSqpOq4FoL4RRtcjKERbTa1is6rBfEDGx1qAdoi7Xk7DBLV6v/8H3gHCZU0qaJis
         yO4yLnaUk+4/yu7V8lHMDxxhQwouzswIfI6H2zUY/zDN6Je14R5jLUPDai2c8EW/6n2R
         zPyg==
X-Gm-Message-State: AOJu0YyzaptW82XjXT/F3exqU6Uv9FDvfkfPGvFwUtd4EOani0mtUuBD
        LM2mFzDrjZzsqjOS15OiND3OwA==
X-Google-Smtp-Source: AGHT+IFvigfflXUA9HwY9N7eYv+zsvKrsN9xemzqOgeiVvG2YkDU2e3seNYkty+sv2qmvZvZeQ4iYQ==
X-Received: by 2002:a17:902:d4c8:b0:1c3:5df4:a778 with SMTP id o8-20020a170902d4c800b001c35df4a778mr161516plg.13.1696527588397;
        Thu, 05 Oct 2023 10:39:48 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b896686c78sm2005265pli.66.2023.10.05.10.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:39:47 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:39:44 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 12/21] clk: samsung: clk-pll: Add support for
 pll_{0516,0517,518}
Message-ID: <ZR704FEUwYpq5sFJ@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-13-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-13-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
> Thesee plls are found in the Tensor gs101 SoC found in the Pixel 6.

nit: Thesee -> These

> 
> pll0516x: Integrer PLL with high frequency
> pll0517x: Integrer PLL with middle frequency
> pll0518x: Integrer PLL with low frequency

nit: Integrer -> Integer?

Regards,
Will

> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> PLL0517x and PLL0518x
> FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> 
> The PLLs are similar enough to pll_0822x that the same code can handle
> both. The main difference is the change in the fout formula for the
> high frequency 0516 pll.
> 
> Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> 
> When defining the PLL the "con" parameter should be set to CON3
> register, like this
> 
> PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>     NULL),
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
>  drivers/clk/samsung/clk-pll.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>  	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>  
> -	fvco *= mdiv;
> +	if (pll->type == pll_0516x)
> +		fvco = fvco * 2 * mdiv;
> +	else
> +		fvco *= mdiv;
> +
>  	do_div(fvco, (pdiv << sdiv));
>  
>  	return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  	case pll_1417x:
>  	case pll_0818x:
>  	case pll_0822x:
> +	case pll_0516x:
> +	case pll_0517x:
> +	case pll_0518x:
>  		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
>  		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
>  		if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>  	pll_0822x,
>  	pll_0831x,
>  	pll_142xx,
> +	pll_0516x,
> +	pll_0517x,
> +	pll_0518x,
>  };
>  
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
