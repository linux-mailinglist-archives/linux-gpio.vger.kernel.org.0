Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AAD1A7068
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 03:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390682AbgDNBDx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 21:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgDNBDw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 21:03:52 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB8AC0A3BDC
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2020 18:03:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id nu11so4528349pjb.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2020 18:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3H4Dc25qW8BbIe+22WyuGrbcJLXnrB9yyeQkheTBGjI=;
        b=NzZLu5yCf7G+UvXKWu/LXbUROwfNg2W9g2qK6u2SHGkZvX/TNbaH6dH32D6tAs693Y
         nwLAFqczy7X07YnJwro2vIPrzQTaxz8xb4JM7P1hb62RC+iFBPdk3+BLinig8p0up9AJ
         3xuM+nqaKSkli6t77Xny9OK3oa/lU4+XqfENIi8TahyJJgZHDbfOlFYVcU1WSmRvIhg9
         lrgtvvTNjnVER/Li1Fd0opt5wO63rVC3Nqp66wadIglbW3lBuo6+tlINdeB9Q2MSp1jZ
         3SdOGHge17Z516XTibJlhf4ryRSoumlMYiVs7VLMEWdGgQQ2N9irJGcJFN6n7+fT9s2x
         Jw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3H4Dc25qW8BbIe+22WyuGrbcJLXnrB9yyeQkheTBGjI=;
        b=aWjoG/yL8fV6pqO1e224DVJRtp4yUuvamSqQlc7yG8esaZ6BEUQhzifvjSrJJpuO1i
         ZmgNgp6xcvPPY90oVCY1a8vYIV6CASjQVJoCUEcJvLF0qS2w+Fr1YjU07BpRVnDYhHkG
         oq8Xh6nylQu9XDQPZdHNZ/P2xdDoWGZgmYHzsi39DowJpb3PPz30UTdKW6BjbJFHiD6j
         s0UqquxwNIBdVT2zCNaBoZE/ceZnmd39yIX01OtPivExN1pszGFhTDqZyUMM7ifl1MbQ
         G8liGYCuz/fFEIlXsPnpfaJ0BJ5BgE/EuoORdi/2Cm4fqHsYlWOH5RjDmbz6CO9QzJtw
         kALw==
X-Gm-Message-State: AGi0PuZDqtPZS+7QIyvyrXT7eqCyQe45urU+aWeceoBnMHbdZWANJz36
        LKFxYSAVTTEboz7F6QQIdcBcAw==
X-Google-Smtp-Source: APiQypLOLF6y86SSshrMlrtaOnLr+7SpDX73vsQdF+yLQM9/hSPTf7ORseejl//wa94X0JUHz9IWDg==
X-Received: by 2002:a17:902:464:: with SMTP id 91mr20531471ple.261.1586826232101;
        Mon, 13 Apr 2020 18:03:52 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l190sm9749771pfl.212.2020.04.13.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 18:03:51 -0700 (PDT)
Date:   Mon, 13 Apr 2020 18:04:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix wrong write in update_dual_edge
Message-ID: <20200414010405.GH20625@builder.lan>
References: <20200414003726.25347-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414003726.25347-1-ansuelsmth@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 13 Apr 17:37 PDT 2020, Ansuel Smith wrote:

> Fix a typo in the readl/writel accessor conversion where val is used
> instead of pol changing the behavior of the original code.
> 
> Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Thank you Ansuel

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Linus, when you apply this please add
Cc: stable@vger.kernel.org

Thanks,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 1a948c3f54b7..9f1c9951949e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -692,7 +692,7 @@ static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
>  
>  		pol = msm_readl_intr_cfg(pctrl, g);
>  		pol ^= BIT(g->intr_polarity_bit);
> -		msm_writel_intr_cfg(val, pctrl, g);
> +		msm_writel_intr_cfg(pol, pctrl, g);
>  
>  		val2 = msm_readl_io(pctrl, g) & BIT(g->in_bit);
>  		intstat = msm_readl_intr_status(pctrl, g);
> -- 
> 2.25.1
> 
