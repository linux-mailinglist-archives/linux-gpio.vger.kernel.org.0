Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42AE27430B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 15:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIVNaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 09:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgIVNaQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 09:30:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A42EC061755
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 06:30:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b124so12423886pfg.13
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2/R/oDUGducvjUOkFGRB4yHjl6PPO14jUmeK6ANox9c=;
        b=pMS+IJOMEVM9wkUeCUQ1ARmiLkLho6MwK7z6PAdSVm+TqtQAR622t1mK6t/zi0eMOP
         yDaQr9hk60zS1p1coEY0s6h3984Yy47jdtvszbK5b8t0u0T/NTMXRq/oZRvfcPF8e5s9
         z3XFllg9bMJmiduYsMqg/ZhpHjM9LR+w91qZMosBYNMsc2fxZ/admwEArurwX1vz8N15
         VtDmckxoBktSQWV2/etOeUtEgXbeTbqATNDHZgNa6WDwqvK0NeC5qPvuUAJg5OxeCdmZ
         Ke1AjRfowIKM88pYdvIA0BYe5wNWTCcojxzq2+EhjBMOS7soU2Fc/WrUMxOA6DZCi4SJ
         /AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2/R/oDUGducvjUOkFGRB4yHjl6PPO14jUmeK6ANox9c=;
        b=pVm+8/jQ9beJXJw9kmyaPDdipyug3v6/BwRftckbtWWkN795D00msA8uxaaEr+UWAV
         CulYYWPZHB6deXKOHW7SLjgMOFMp7VVytjIK9yv3Lz890D9IQzEWnUw9h6RE38mksnaQ
         m+Ctx6oYgJcMuizvbaytbFkpgm/epg6Qf09RVUP21xmXFxjA/XJUIBlmeXoeTd9IOxJ6
         z0NOu2IruXDPljHcaeE2819HdeavM1zQ8ww63BiZj+XjeX/VbHCWimuCOOX4Sns6eIAY
         xzxWHsf6Ty4z4yK5FRuSIu+zq/X8DTl5nvFLVGXSYvyGUGu/nCyRscZW3w2EYS2v4i69
         9bpQ==
X-Gm-Message-State: AOAM530O4q18IwSUrwFNZ5iQbgl6yg7pSReAL2ASypeBK2rT7jkXC6g7
        LrPL0N5ztt7iFY6nvjSVvknl/Q==
X-Google-Smtp-Source: ABdhPJy0Pb6z6+/Dt/u2tAJWB6aDaKpho6z3MqyTTGnzm6s9IKTCkUx7ZF9GcYA/G55EBG+QElXtXQ==
X-Received: by 2002:a63:1a21:: with SMTP id a33mr3545043pga.305.1600781415892;
        Tue, 22 Sep 2020 06:30:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id w185sm16583239pfc.36.2020.09.22.06.30.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 06:30:15 -0700 (PDT)
Date:   Tue, 22 Sep 2020 19:00:07 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: spear: simplify the return expression of
 spear310_pinctrl_probe
Message-ID: <20200922133007.dx46iszynpjcm6oq@vireshk-i7>
References: <20200921082448.2591929-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921082448.2591929-1-liushixin2@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-09-20, 16:24, Liu Shixin wrote:
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear310.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear310.c b/drivers/pinctrl/spear/pinctrl-spear310.c
> index 393b2b97d527..9d9facc4a6e4 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear310.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear310.c
> @@ -379,8 +379,6 @@ static const struct of_device_id spear310_pinctrl_of_match[] = {
>  
>  static int spear310_pinctrl_probe(struct platform_device *pdev)
>  {
> -	int ret;
> -
>  	spear3xx_machdata.groups = spear310_pingroups;
>  	spear3xx_machdata.ngroups = ARRAY_SIZE(spear310_pingroups);
>  	spear3xx_machdata.functions = spear310_functions;
> @@ -392,11 +390,7 @@ static int spear310_pinctrl_probe(struct platform_device *pdev)
>  
>  	spear3xx_machdata.modes_supported = false;
>  
> -	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
>  }
>  
>  static struct platform_driver spear310_pinctrl_driver = {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
