Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33E57DADBD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 15:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391083AbfJQNA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 09:00:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40699 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390426AbfJQNA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 09:00:57 -0400
Received: by mail-pl1-f194.google.com with SMTP id d22so1103453pll.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yfYp7qhZbl65vNKUTYsaxlWaCnBTNx7GglyjHYhUNIE=;
        b=K/QVAoxCRRVNlHuppUhAVFzLPGRyb1qTL2zA24HcsSkfncwvmhMgdeJPnhVPP6qPVV
         8N6DiV+y7xDvSi5kSxnKlW+Bn5wnpY4yxsHrRezVPj0NumwFiRHUzLp6CDBnwZDlpj6Z
         p1g9Fo+8cepblVehZurYU4snoQ1hiF4EOZXxMqMYOQ1Whz35LcyXzmxTpxXPYjHBskZD
         uOB1WyDaRulr4qWPaZxUnGSfdME/meS6RVkenfo4MARBhTfbMPLbHT5i4KEAkeqlZnbt
         nu4dzLy11xSO7YlCBv7W6lJGLd/3QL2f2RpWHrDVyq5B1JGcZDM4kQ+p8r7VUlGRObqX
         jniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yfYp7qhZbl65vNKUTYsaxlWaCnBTNx7GglyjHYhUNIE=;
        b=QaFU2tP0lvHrB+2JsUMsWrEa5gv1LqKMfg6jn6zNbL3VgIyvFY0tPfXEWtuXZMPemZ
         MkSWX0SRhuRAHhXgU7bNN+psuhC+tS5MmV6niqDlZtLXBlPXtHl3G6kW+3iWm/7GY/0p
         V52wWwaJKBP2flwwvDnvvA62L/vt4pxD2uDFDXfgsOwbqoLFV2hfmm2m7k21ZTsh1Tds
         J1sHSHIGHkDoa2Tsz9C9iS5NMdPJCmsiMU9yP1cjip2mEzI154XJksj/ViZUQlXHqKp9
         mHQ7R2nv/AOyDYvbf7HQ87YiXIBKdsP+DJuOYkzdMHjIFKc6j6hYWOoKKbvaLEZ+53/y
         doHg==
X-Gm-Message-State: APjAAAV7EY8ALpeJDms5vM42ojgnLdTPCcYOyJTj8+8JaIWMVO0DgYDR
        zsMozwygokf7FPPyiiI3mVs+
X-Google-Smtp-Source: APXvYqwXeZAaSYCvV1FS/rjh8RsCufqorARnCkghqamNFA/Ehwy/l+zGZEoGNx2xjhw2EnTl69o8bg==
X-Received: by 2002:a17:902:b611:: with SMTP id b17mr3852502pls.23.1571317256478;
        Thu, 17 Oct 2019 06:00:56 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id o64sm7246854pjb.24.2019.10.17.06.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:00:55 -0700 (PDT)
Date:   Thu, 17 Oct 2019 18:30:44 +0530
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
Subject: Re: [PATCH -next 26/30] pinctrl: bm1880: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017130044.GB25046@mani>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-27-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-27-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 17, 2019 at 08:26:36PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/pinctrl-bm1880.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
> index 63b130c..f7dff4f 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -1308,15 +1308,13 @@ static struct pinctrl_desc bm1880_desc = {
>  static int bm1880_pinctrl_probe(struct platform_device *pdev)
>  
>  {
> -	struct resource *res;
>  	struct bm1880_pinctrl *pctrl;
>  
>  	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
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
