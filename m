Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7007B5AB93
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfF2NdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:33:17 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40459 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfF2NdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:33:17 -0400
Received: by mail-lf1-f66.google.com with SMTP id a9so5809924lff.7;
        Sat, 29 Jun 2019 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wqC91kN2z8pwwbsf+i4CCKuzyZv4LVpkroUyov/rXt0=;
        b=Kq/PtaMK747mIbS+3CEfKcGHmUcaAyzO49GryVMstXrzWQtOmJURLDb6D6JpHwJYMQ
         JYYnT0ZIq+6R85vEhLBPGBX9lpqjwUbKiNntpWF+5XZYHaOOMoCAqIQnVh8TtXoMPsm+
         8ZQi/zzJtmytD0wRRJsS/9Zf1P2B0F0zC82/8AnRAqkMJbJAe6+rlj833+pwkb/ZfCEi
         eIaoVDjQ4xuA9MkDo4jICO3CYilZ1KOIWbrXVX2JXixEGuvrggkPc7DzsOWiXU7A5LaD
         CEtYPTmzyKMBc7Ql44qFxoOvLhiIPNxt3PbXHN8KEiuqj1NWQDpPpjMq4zlWeLY8bEc8
         LTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wqC91kN2z8pwwbsf+i4CCKuzyZv4LVpkroUyov/rXt0=;
        b=cOpvleIvuu2e58zopBieEj1Pp40KhKRN8RU11EIDzS8X+sValdzFqxZVdZFI8W7N53
         T61T7Zh31AhBTfObxxkqjdJqmtpavx9TginDw+zqukbFg9qkct/eqNZaUPjBM0wSWMN/
         UTKbDVQZexWt92fM8Af39H9EV1Mhb5f2BVLEoesvo8p2CBMZa8eBfH+tlypxA/aJL9rb
         VG2WrhrDzT5XpK8eEwlPzyYWVTt1SvR7Y7JK3F0zmBGWrvKkqSw+xtlqXbgX3t8l6XjU
         tz/1+xhHGUHc4idzpYUJaLCavpHcMuQ4r87budAogp5Fbf/HK9FKfUy4FVk7oDMUgu/o
         lt+Q==
X-Gm-Message-State: APjAAAX46wjhM6HOWNrbuIevpU0Rdnu6xLR9U/db9jlysyqTDUVo6FZx
        lQqsG14vMQgwWh4aL/Xez6Df3Xh8
X-Google-Smtp-Source: APXvYqxJkhouaDVad4g+tnS3yko8FqNv/HIfJQCOb9WqSa5NS6XfjIElZR7HWSq4DW3r7C9EbnAyLg==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr7478440lft.79.1561815194077;
        Sat, 29 Jun 2019 06:33:14 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id 16sm1375534lfy.21.2019.06.29.06.33.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:33:13 -0700 (PDT)
Subject: Re: [PATCH V5 06/18] clk: tegra: Save and restore CPU and System
 clocks context
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
 <1561687972-19319-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd0d57bb-287c-11cf-fadf-0b2d8ace507f@gmail.com>
Date:   Sat, 29 Jun 2019 16:33:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> During system suspend state, core power goes off and looses all the
> CAR controller register settings.
> 
> This patch creates APIs for saving and restoring the context of Tegra
> CPUG, CPULP and SCLK.
> 
> CPU and System clock context includes
> - CPUG, CPULP, and SCLK burst policy settings for clock sourcea of all
>   their normal states.
> - SCLK divisor and System clock rate for restoring SCLK, AHB and APB
>   rates on resume.
> - OSC_DIV settings which are used as reference clock input to some PLLs.
> - SPARE_REG and CLK_MASK settings.
> 
> These APIs are used in Tegra210 clock driver during suspend and resume
> operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  4 --
>  drivers/clk/tegra/clk.c                  | 80 ++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h                  | 14 ++++++
>  3 files changed, 94 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
> index cdfe7c9697e1..ed69ec4d883e 100644
> --- a/drivers/clk/tegra/clk-tegra-super-gen4.c
> +++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
> @@ -19,10 +19,6 @@
>  #define PLLX_MISC2 0x514
>  #define PLLX_MISC3 0x518
>  
> -#define CCLKG_BURST_POLICY 0x368
> -#define CCLKLP_BURST_POLICY 0x370
> -#define SCLK_BURST_POLICY 0x028
> -#define SYSTEM_CLK_RATE 0x030
>  #define SCLK_DIVIDER 0x2c
>  
>  static DEFINE_SPINLOCK(sysrate_lock);
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 573e3c967ae1..9e863362d2bf 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -70,6 +70,12 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
>  
> +static u32 cclkg_burst_policy_ctx[2];
> +static u32 cclklp_burst_policy_ctx[2];
> +static u32 sclk_burst_policy_ctx[2];
> +static u32 sys_clk_divisor_ctx, system_rate_ctx;
> +static u32 spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
> +
>  /* Handlers for SoC-specific reset lines */
>  static int (*special_reset_assert)(unsigned long);
>  static int (*special_reset_deassert)(unsigned long);
> @@ -199,6 +205,80 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>  	}
>  }
>  
> +void tegra_cclkg_burst_policy_save_context(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < BURST_POLICY_REG_SIZE; i++)
> +		cclkg_burst_policy_ctx[i] = readl_relaxed(clk_base +
> +							  CCLKG_BURST_POLICY +
> +							  (i * 4));
> +}
> +
> +void tegra_cclkg_burst_policy_restore_context(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < BURST_POLICY_REG_SIZE; i++)
> +		writel_relaxed(cclkg_burst_policy_ctx[i],
> +			       clk_base + CCLKG_BURST_POLICY + (i * 4));
> +
> +	fence_udelay(2, clk_base);
> +}
> +
> +void tegra_sclk_cclklp_burst_policy_save_context(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
> +		cclklp_burst_policy_ctx[i] = readl_relaxed(clk_base +
> +							  CCLKLP_BURST_POLICY +
> +							  (i * 4));
> +
> +		sclk_burst_policy_ctx[i] = readl_relaxed(clk_base +
> +							  SCLK_BURST_POLICY +
> +							  (i * 4));
> +	}
> +
> +	sys_clk_divisor_ctx = readl_relaxed(clk_base + SYS_CLK_DIV);
> +	system_rate_ctx = readl_relaxed(clk_base + SYSTEM_CLK_RATE);
> +	spare_ctx = readl_relaxed(clk_base + SPARE_REG0);
> +	misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
> +	clk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
> +}
> +
> +void tegra_sclk_cpulp_burst_policy_restore_context(void)
> +{
> +	unsigned int i;
> +	u32 val;
> +
> +	/*
> +	 * resume SCLK and CPULP clocks
> +	 * for SCLk, set safe dividers values first and then restore source
> +	 * and dividers
> +	 */
> +
> +	writel_relaxed(0x1, clk_base + SYSTEM_CLK_RATE);
> +	val = readl_relaxed(clk_base + SYS_CLK_DIV);
> +	if (val < sys_clk_divisor_ctx)
> +		writel_relaxed(sys_clk_divisor_ctx, clk_base + SYS_CLK_DIV);
> +
> +	fence_udelay(2, clk_base);
> +
> +	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
> +		writel_relaxed(cclklp_burst_policy_ctx[i],
> +			       clk_base + CCLKLP_BURST_POLICY + (i * 4));
> +		writel_relaxed(sclk_burst_policy_ctx[i],
> +			       clk_base + SCLK_BURST_POLICY + (i * 4));
> +	}
> +
> +	writel_relaxed(sys_clk_divisor_ctx, clk_base + SYS_CLK_DIV);
> +	writel_relaxed(system_rate_ctx, clk_base + SYSTEM_CLK_RATE);
> +	writel_relaxed(spare_ctx, clk_base + SPARE_REG0);
> +	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
> +	writel_relaxed(clk_arm_ctx, clk_base + CLK_MASK_ARM);

Why fence_udelay was needed above and not needed here?

> +}


