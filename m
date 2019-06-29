Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F15B95AB27
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF2NAK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:00:10 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37044 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:00:10 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so5779627lfb.4;
        Sat, 29 Jun 2019 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VKVuTi76X6U619/beNsDjryTD1vSHBxznB5zvfLdXhY=;
        b=g30ZHbmDx+vQ5DE5DZrWz+RF5OzrHJddPi3j24GSdBkfsnB/0bxJsf47GQFgvtJY7G
         +4y/7ROXDZ40KFU/ZJPXfPFSamVfwtNZfOYk/0S4QTSgv5M9ybx/VJoanqQp/0LBZ0N0
         L0OxiNzkoml3yVt+7LMwfXVJ1Ck9oeRkhBZ8NppMah+/P3AkDWuSOy74JLtCxkIMLjyA
         IDWTxD+b6Es7kfGX1ysnhj9V7ob+IX4p/cM4jJKDCgiVtHMf4jY70dqU/bOVjLUsRaFq
         0tluSPYT351alVvndxmkzWvtd5LHtmFoJoBXnJaB1sOTEOdR9iqDGOXfKWtxJBZhlWym
         AA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VKVuTi76X6U619/beNsDjryTD1vSHBxznB5zvfLdXhY=;
        b=hTd0U0lCzdJ9AofCau1UZquNII0IW86fRwHY59h0LCbVj0twFm5G+uBf7YRKixJDkK
         yr9NagE61GQxThHYjvfTT2P2biRbeU2HVJg2MGwG2xXg2sEbsaBlLiHW2IMTAWnwDd8R
         x2GtL6N7DteXVCDtFFKB5F+c35fBacc2cEqla0sLoGkYlZbfYYerWDjmFRIPRYBEv4GK
         nTTV9HjfZnl7BHNtbTVcoAnLyqZLk+HJsSPJ0j2GJe2ido9LSX1XnH7XnDvshpEKWJif
         PTQuZ22MWn0jLfG62IkGBM7I+chWe2o3BGWyMaFM019a2fj3wz3gpALsygwQgN/RAZQH
         gRuQ==
X-Gm-Message-State: APjAAAVFU+c2bWsQDCa6JG0qIP6flW59Y0DFn206gK1RQznsA8W7htTJ
        B16t1iKvznmjnD2UY9myzJwkAxgn
X-Google-Smtp-Source: APXvYqxBuJpM5eHvd6ZbNXRtzcuP+WGIXSdtE3qbqLiccUq4meBY9tGzVPm828k31YiBVDLCsfUfug==
X-Received: by 2002:a19:41cc:: with SMTP id o195mr6784256lfa.166.1561813207557;
        Sat, 29 Jun 2019 06:00:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id n131sm1306815lfd.70.2019.06.29.06.00.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:00:06 -0700 (PDT)
Subject: Re: [PATCH V5 16/18] soc/tegra: pmc: Configure deep sleep control
 settings
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cfdda2e4-2f9e-6228-7ae9-17c2fbce7fb0@gmail.com>
Date:   Sat, 29 Jun 2019 16:00:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
> timings which are platform specific that should be configured before
> entering into deep sleep.
> 
> Below are the timing specific configurations for deep sleep entry and
> wakeup.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
>   in deep sleep state irrespective of any quick wake event.
> 
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
> 
> These values vary based on the platform design and are specified
> through the device tree.
> 
> This patch has implementation to configure these timings which are must
> to have for proper deep sleep and wakeup operations.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index ed83c0cd09a3..7e4a8f04f4c4 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -89,6 +89,8 @@
>  
>  #define PMC_CPUPWRGOOD_TIMER		0xc8
>  #define PMC_CPUPWROFF_TIMER		0xcc
> +#define PMC_COREPWRGOOD_TIMER		0x3c
> +#define PMC_COREPWROFF_TIMER		0xe0
>  
>  #define PMC_PWR_DET_VALUE		0xe4
>  
> @@ -2291,6 +2293,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs = {
>  static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  {
>  	u32 value;
> +	unsigned long osc, pmu, off;
>  
>  	/* Always enable CPU power request */
>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
> @@ -2316,6 +2319,15 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>  	value |= PMC_CNTRL_SYSCLK_OE;
>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +
> +	osc = DIV_ROUND_UP_ULL(pmc->core_osc_time * 8192, 1000000);
> +	pmu = DIV_ROUND_UP_ULL(pmc->core_pmu_time * 32768, 1000000);
> +	off = DIV_ROUND_UP_ULL(pmc->core_off_time * 32768, 1000000);

IIUC, the first argument shall be explicitly of a type "long long", shouldn't it?
Otherwise the multiplication will overflow before division happens.

Thus:

	osc = DIV_ROUND_UP_ULL((u64)pmc->core_osc_time * 8192, 1000000);
	pmu = DIV_ROUND_UP_ULL((u64)pmc->core_pmu_time * 32768, 1000000);
	off = DIV_ROUND_UP_ULL((u64)pmc->core_off_time * 32768, 1000000);

Also, could you please tell what of the above multiplications could overflow u32 in
the first place? Maybe DIV_ROUND_UP_ULL isn't needed at all and DIV_ROUND_UP could be
use instead?
