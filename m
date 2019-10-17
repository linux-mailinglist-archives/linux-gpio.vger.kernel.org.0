Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345C0DADB5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 15:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391035AbfJQM74 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 08:59:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43594 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391038AbfJQM7z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 08:59:55 -0400
Received: by mail-pl1-f196.google.com with SMTP id f21so1094425plj.10
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JVwwdb+zQ9NSzWqZM+D+qhy9Nv1h+9z50bI96ImiwFA=;
        b=yipLLBVIoqam9ZEQvn5Rf5/4J06Zm6A3vprEphD1/20bTuSYMwQTjsi2fXVI9RA8Vc
         T95azBJNV68gtoOpRkyJfcXFLC/5WEiPAFdsvW2SjKW2QiRSylO7tv0w7Z/EzY8rECJG
         kTyYu3wRJT7nLTe7uwSgq1QA6Q5dWYGnEZ41hGSTnZLcVVE2xTi5RTQidRfOh3v8rH8s
         V3dtYdMnmXvMCOCY+2Ck1JAcalgJ/oNZ/X/as36DbTkVCa9AE4UY0NQSLsmSiO3/XruE
         aIG0EA4BCSq6H/KkUTMOMaMFFjPcjAbuufh85d22i5l+2Q6jLn6eRlvtE3GtsRuODB9k
         GMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JVwwdb+zQ9NSzWqZM+D+qhy9Nv1h+9z50bI96ImiwFA=;
        b=aszwByFDgtudJhtLoKcGgNCCVpEvuBIAi/0MQ0JyZpe654VrG6s51p8+vU3OU0OWZt
         TMOsvD0Fp3QlKXTlgueQRKXZ9SZr6PajM5o64Cnuk2YcUwLIJ0IKFg0qKJoarBfpvtd/
         7N1bdWzKfNqtn8LZPJWQZGhliMpycYt7qlmLsUini3eT1FeAoWVx9JHS1lALUJDZ5O+Z
         3xPPxd5oBKCRSnLXIEymmacK2BN01NrGmJ66SDXI+xZBX/BOSM27GIUVwUz/4gLcr4Ys
         na2DjV1HBHayycbBehVDiCBqlo0YZQbnRx71yqnduf1D4sZJ6zGjF1CtS+ZYseP5Zlay
         qlsA==
X-Gm-Message-State: APjAAAVdNZP/FZi2Fvn/nM2URB88Z3XFNeown4xzAToKetBvTCHchq5d
        W4nvw5ih/BIdwdkcwqLMCP2z
X-Google-Smtp-Source: APXvYqyzA6Z4cjckSGIKMOaUmTPEDpjA24NdP9kjBoDo+9GggM+8hRKzvWxgrdA1/AYK9n2JcE1sZw==
X-Received: by 2002:a17:902:bd88:: with SMTP id q8mr3605384pls.299.1571317193054;
        Thu, 17 Oct 2019 05:59:53 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id h2sm5064753pfq.108.2019.10.17.05.59.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 05:59:52 -0700 (PDT)
Date:   Thu, 17 Oct 2019 18:29:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linus.walleij@linaro.org, afaerber@suse.de, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, jesper.nilsson@axis.com,
        lars.persson@axis.com, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@axis.com, linux-oxnas@groups.io,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, vz@mleia.com, narmstrong@baylibre.com,
        geert+renesas@glider.be, daniel@zonque.org,
        haojian.zhuang@gmail.com, wens@csie.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, agross@kernel.org
Subject: Re: [PATCH -next 28/30] pinctrl: actions: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017125940.GA25046@mani>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-29-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-29-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 17, 2019 at 08:26:38PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/pinctrl-owl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
> index 5dfe718..5a0c8e8 100644
> --- a/drivers/pinctrl/actions/pinctrl-owl.c
> +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> @@ -915,7 +915,6 @@ static int owl_gpio_init(struct owl_pinctrl *pctrl)
>  int owl_pinctrl_probe(struct platform_device *pdev,
>  				struct owl_pinctrl_soc_data *soc_data)
>  {
> -	struct resource *res;
>  	struct owl_pinctrl *pctrl;
>  	int ret, i;
>  
> @@ -923,8 +922,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
>  	if (!pctrl)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	pctrl->base = devm_ioremap_resource(&pdev->dev, res);
> +	pctrl->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pctrl->base))
>  		return PTR_ERR(pctrl->base);
>  
> -- 
> 2.7.4
> 
> 
