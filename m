Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940BD124794
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfLRNFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:05:30 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36186 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfLRNFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 08:05:30 -0500
Received: by mail-lf1-f67.google.com with SMTP id n12so1657850lfe.3;
        Wed, 18 Dec 2019 05:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3llU15j0gpDibcrDHCMYLRjeeqHoBcJJVHO0LwZp1bk=;
        b=rkubY0X+tJNBbKFcIDyJNS42KLtKYt+XiQIEy0BuEb9xplYnTWien2+xBo74HOhsh+
         juxSZTBxMKv/SUxdWezvgaYzXuShi9UdXKZKcaTeP8j4MWc9F1dXXuTiwGtbQr648mmE
         bWdjKGHzq0bOEnrFh1bp3IZkFtSAfEwzUxOcCxG8auuqGAxHROJXhjuSeI0c2FYEn3rJ
         IoR7/7O4YbE905Bti1u1cg4ceU+/dCKqzQ8RCEMICgwfBG5JZcaIgiZIwFYpiRqlv6Nd
         AwSnhMAfEDls/s+DLzPhooUV/i8lXbP5oObHk6hgG79LRAMCRxRtSIrWCGTMYaLwZ2hU
         Hwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3llU15j0gpDibcrDHCMYLRjeeqHoBcJJVHO0LwZp1bk=;
        b=qiH07rFfbtZcjyhcocEy7qfKT1O1VghdIbJl5t30CgQn/84feWxq9KuzI48geT6yMP
         +04i86YWTWCPjfKyydNAjvyDA6ZKHJDQ7Iik6eDKU3e+4hi8BUc07cwAlU4iz9bV65pK
         tKCmLIPExdo0omoC41+kGYEkMBNyPcbBjywiXf01pTAltk2XzAxdxzCbtWyXIWbOAheq
         jrPbNkISUFdemx7JnfiTGpB3PFXURH/hdAyQw4Me36OQ+EnPuIoSTMBc4HeqeTi5hdnH
         TdTZyVzJFJFEq2QJNPgG2cm2/VATUpF86HvxKI1NcGsyEIji5kegvmwdnPo1CxdoyQXK
         tURw==
X-Gm-Message-State: APjAAAVYlTLNG4zdvEifLnC/AcSeL4+aHnB2lLL9eqqJAK7IFGWfa1QU
        7PcRWxs415W3ZPUS1JQN9keIjZQy
X-Google-Smtp-Source: APXvYqzM3VSBXnFRkOjLGJFHHnEWUavlyreyEYRsUSqJJ0IIhn9y0Ta74N4djKHY1jSXAdIY46dhWQ==
X-Received: by 2002:a19:ac43:: with SMTP id r3mr1731296lfc.156.1576674328354;
        Wed, 18 Dec 2019 05:05:28 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id p4sm1141915lji.107.2019.12.18.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 05:05:27 -0800 (PST)
Subject: Re: [PATCH] pinctrl: tegra: fix missing __iomem in suspend/resume
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ea1d111-478d-5054-a17f-8c2876b71c2f@gmail.com>
Date:   Wed, 18 Dec 2019 16:05:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.12.2019 14:04, Ben Dooks (Codethink) пишет:
> The functions should have __iomem on the register pointer
> so add that to silence the following sparse warnings:
> 
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    expected unsigned int [usertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:657:22:    got void [noderef] <asn:2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:659:42:    got unsigned int [usertype] *
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    expected unsigned int [usertype] *regs
> drivers/pinctrl/tegra/pinctrl-tegra.c:675:22:    got void [noderef] <asn:2> *
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/tegra/pinctrl-tegra.c:677:25:    got unsigned int [usertype] *
> 
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 692d8b3e2a20..cefbbb8d1a68 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -648,7 +648,7 @@ static int tegra_pinctrl_suspend(struct device *dev)
>  {
>  	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>  	u32 *backup_regs = pmx->backup_regs;
> -	u32 *regs;
> +	u32 __iomem *regs;
>  	size_t bank_size;
>  	unsigned int i, k;
>  
> @@ -666,7 +666,7 @@ static int tegra_pinctrl_resume(struct device *dev)
>  {
>  	struct tegra_pmx *pmx = dev_get_drvdata(dev);
>  	u32 *backup_regs = pmx->backup_regs;
> -	u32 *regs;
> +	u32 __iomem *regs;
>  	size_t bank_size;
>  	unsigned int i, k;
>  
> 

Looks good!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
