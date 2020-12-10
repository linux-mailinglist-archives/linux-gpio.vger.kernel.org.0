Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEE92D60C4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 17:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390903AbgLJQAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 11:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392116AbgLJQAd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 11:00:33 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A42FC0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 07:59:53 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t37so4593069pga.7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=37jd6dDlFZ0FtOT7hpVyZM2/D02By4B+sVM7kzHyGUo=;
        b=MWuujoSGk4peEKzynZFRPFoyGH19IBZVRPEAsgk28Yoc5K33qhzPD52IvKgUGA3CEA
         yXJj55ZyOTQuKIj0oivtOjqsRa0y43lhTiDRFnfHmIsDgplSKDPVEBR/m2lj9U8WnOKe
         /8/fxKq7dVl6MnNqXRubT3sHl1oJqaSDP93tVQgECo464FSPGt1oYyhcmhv7SOZEUlbO
         wSoLiOC8UFqdPjNi5GtcTq5JcKdm5IIZD7jjsM0b7IHyqVdxaJmNCZklX9tWzAC5w1VG
         cW0G66b6QYOlLXcmmzySjYk91AARRZkyZxyowKqIY1WKD8f8NJ+mLIdm1P+xeCdmVne7
         wTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=37jd6dDlFZ0FtOT7hpVyZM2/D02By4B+sVM7kzHyGUo=;
        b=N9XjEnp3+I02KQ3V2lUCNuHZioW+cq1SnQ7Uo2j8W1EFYKw5DvtruNHKUMEvejHW7/
         t2Ny608Btao10Cd8zajTGjevq9a2bo8+4sC9cUsZcyUviqEgRZUQigl+xaTUU5lbR4vp
         ZHmjZHW9apMdRui8dX6Em27PCxus6+fAdwIoLvaxe5DB9Dkp3xBTL/77T2KQ7tUTtoiu
         +PVx/S4uRA51Jk18ghPbuz40LpDocZU8W4lLxoTnNgj038yoNDBhUWPJb0707VY4B/VM
         CDsJXQ0m44d3zPL4jKQATRIqoC1bR6Qj26JFA4IsTvLl3XXzwQDWVxjWOV2J+C89yuem
         cQUQ==
X-Gm-Message-State: AOAM531yzvOXtX9G2gfjWZPGPxIPPkc0KVyg2hTlTSdqgwiaFfvm1tQD
        3hgmHb735x0VVABPL0HdGSl8Nw==
X-Google-Smtp-Source: ABdhPJz921FqDmPeIxZhrD4LCEmyv9upRImAS9aQrg23lfpVzNs/aHKkONoTMZLLVHDQ2aBd301d0w==
X-Received: by 2002:a17:90a:4042:: with SMTP id k2mr8511128pjg.160.1607615992813;
        Thu, 10 Dec 2020 07:59:52 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id m14sm6383060pgu.0.2020.12.10.07.59.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 07:59:51 -0800 (PST)
Date:   Thu, 10 Dec 2020 21:29:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     vireshk@kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl/spear: simplify the return expression of
 spear300_pinctrl_probe()
Message-ID: <20201210155949.thezgn2drwuur5sm@vireshk-i7>
References: <20201210135746.1492-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210135746.1492-1-zhengyongjun3@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-12-20, 21:57, Zheng Yongjun wrote:
> Simplify the return expression.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear300.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear300.c b/drivers/pinctrl/spear/pinctrl-spear300.c
> index e39913a18139..d53a04597cbe 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear300.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear300.c
> @@ -654,8 +654,6 @@ static const struct of_device_id spear300_pinctrl_of_match[] = {
>  
>  static int spear300_pinctrl_probe(struct platform_device *pdev)
>  {
> -	int ret;
> -
>  	spear3xx_machdata.groups = spear300_pingroups;
>  	spear3xx_machdata.ngroups = ARRAY_SIZE(spear300_pingroups);
>  	spear3xx_machdata.functions = spear300_functions;
> @@ -669,11 +667,7 @@ static int spear300_pinctrl_probe(struct platform_device *pdev)
>  
>  	pmx_init_addr(&spear3xx_machdata, PMX_CONFIG_REG);
>  
> -	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
>  }
>  
>  static struct platform_driver spear300_pinctrl_driver = {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
