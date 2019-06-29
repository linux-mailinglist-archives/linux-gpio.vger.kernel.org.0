Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6918F5AC0C
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfF2PK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:10:56 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45384 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF2PKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:10:55 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so5861595lfm.12;
        Sat, 29 Jun 2019 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yi1nlzJ+1ITGsCb5ZgdiUETKdKZbRH6atuNF+gUSOn8=;
        b=UG8K7zBZ+cfTwet6tENGknaC0UDbq90Ctoqors/SLeLWPZ3DDihmXA2DeSFUMQetOW
         VvJEOgoyaC+aIh4r40VRNKBA4Eu59MVg40xngmayn12Taprq4mpXWhQqB2vKSgXUDPb1
         1pAFCvGP8yrdUSVapvxDc+eW/U0qWoCseHJ36KRqjWqNrBBpoMss5ty7Wu1IVPfFOg6q
         1aV3lq+HlgueQdAGYp1EV0K84zlQAONz7sRikOraygdUjWFa/kDXBjXzFJ/ekynznyBp
         xCJjh/awvcEaM7YdZLV9/yF7+kNYNrafqJurP5RjizOvUSTNjFcrJB5OqXnu6joH0mam
         WYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yi1nlzJ+1ITGsCb5ZgdiUETKdKZbRH6atuNF+gUSOn8=;
        b=I6h9p35EGw28THxN1uiYZWEurb+GtIkHAlhIFvli32PtHzvWcJl1XOxDI9OKKEG3L8
         qoyd95tmy5BzdOCql1Wl1xaTLfE0Gj7r1rOSuoE8YgThFt6+ECHvo3C/S/ozitWUZctg
         NH8nYHAzPcWt7kLa6xNBmCN2DTcyJ/ShrOyYKx/R/4ijijY8YzY5YYtUzEZw/y+5HRoU
         sri/VoJmeYxf0cvfxHI9dO9eH4hBdJXN7xMLfMKsVeJ8xph9J/7q1pDDhVGMoDvNrR1L
         eqqOYBXssvl3jsYpiPzMIDctun1EIWmszz2tDZd4jUb8zpq/Nka8AOEAfJhSqaerYEc3
         7Whg==
X-Gm-Message-State: APjAAAUVjyMushCnWQQzWq2ukYVqICJuRX0tBXxMu43soRK/ykKpnbHe
        kXhazEsT9NeI+7rUiaIrgzzUf4je
X-Google-Smtp-Source: APXvYqypnw//iWQoqJEa1rz96h/eT+w0OAOI+7R+hcWl3ssYYqdYv0UhxMUlEGJoJCC5drN/B7klfw==
X-Received: by 2002:ac2:5231:: with SMTP id i17mr7723138lfl.39.1561821051738;
        Sat, 29 Jun 2019 08:10:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id h3sm1753026lja.93.2019.06.29.08.10.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:10:50 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
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
 <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
Date:   Sat, 29 Jun 2019 18:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch adds system suspend and resume support for Tegra210
> clocks.
> 
> All the CAR controller settings are lost on suspend when core power
> goes off.
> 
> This patch has implementation for saving and restoring all the PLLs
> and clocks context during system suspend and resume to have the
> clocks back to same state for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 115 ++++++++++++++++++++++++++++++++++++++-
>  drivers/clk/tegra/clk.c          |  14 +++++
>  drivers/clk/tegra/clk.h          |   1 +
>  3 files changed, 127 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 1c08c53482a5..1b839544e086 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -9,10 +9,12 @@
>  #include <linux/clkdev.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/mutex.h>
>  #include <linux/clk/tegra.h>
> +#include <linux/syscore_ops.h>
>  #include <dt-bindings/clock/tegra210-car.h>
>  #include <dt-bindings/reset/tegra210-car.h>
>  #include <linux/iopoll.h>
> @@ -20,6 +22,7 @@
>  #include <soc/tegra/pmc.h>
>  
>  #include "clk.h"
> +#include "clk-dfll.h"
>  #include "clk-id.h"
>  
>  /*
> @@ -225,6 +228,7 @@
>  
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> +#define CPU_SOFTRST_CTRL 0x380
>  
>  #define LVL2_CLK_GATE_OVRA 0xf8
>  #define LVL2_CLK_GATE_OVRC 0x3a0
> @@ -2820,6 +2824,7 @@ static int tegra210_enable_pllu(void)
>  	struct tegra_clk_pll_freq_table *fentry;
>  	struct tegra_clk_pll pllu;
>  	u32 reg;
> +	int ret;
>  
>  	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>  		if (fentry->input_rate == pll_ref_freq)
> @@ -2847,10 +2852,10 @@ static int tegra210_enable_pllu(void)
>  	fence_udelay(1, clk_base);
>  	reg |= PLL_ENABLE;
>  	writel(reg, clk_base + PLLU_BASE);
> +	fence_udelay(1, clk_base);
>  
> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
> -					  reg & PLL_BASE_LOCK, 2, 1000);
> -	if (!(reg & PLL_BASE_LOCK)) {
> +	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
> +	if (ret) {
>  		pr_err("Timed out waiting for PLL_U to lock\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -3283,6 +3288,103 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> +static u32 cpu_softrst_ctx[3];
> +static struct platform_device *dfll_pdev;
> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
> +#define car_writel(_val, _base, _off) \
> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> +
> +static int tegra210_clk_suspend(void)
> +{
> +	unsigned int i;
> +	struct device_node *node;
> +
> +	tegra_cclkg_burst_policy_save_context();
> +
> +	if (!dfll_pdev) {
> +		node = of_find_compatible_node(NULL, NULL,
> +					       "nvidia,tegra210-dfll");
> +		if (node)
> +			dfll_pdev = of_find_device_by_node(node);
> +
> +		of_node_put(node);
> +		if (!dfll_pdev)
> +			pr_err("dfll node not found. no suspend for dfll\n");
> +	}
> +
> +	if (dfll_pdev)
> +		tegra_dfll_suspend(dfll_pdev);
> +
> +	/* Enable PLLP_OUT_CPU after dfll suspend */
> +	tegra_clk_set_pllp_out_cpu(true);
> +
> +	tegra_sclk_cclklp_burst_policy_save_context();
> +
> +	clk_save_context();
> +
> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
> +
> +	return 0;
> +}
> +
> +static void tegra210_clk_resume(void)
> +{
> +	unsigned int i;
> +	struct clk_hw *parent;
> +	struct clk *clk;
> +
> +	/*
> +	 * clk_restore_context restores clocks as per the clock tree.
> +	 *
> +	 * dfllCPU_out is first in the clock tree to get restored and it
> +	 * involves programming DFLL controller along with restoring CPUG
> +	 * clock burst policy.
> +	 *
> +	 * DFLL programming needs dfll_ref and dfll_soc peripheral clocks
> +	 * to be restores which are part ofthe peripheral clocks.
> +	 * So, peripheral clocks restore should happen prior to dfll clock
> +	 * restore.
> +	 */
> +
> +	tegra_clk_osc_resume(clk_base);
> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
> +
> +	/* restore all plls and peripheral clocks */
> +	tegra210_init_pllu();
> +	clk_restore_context();
> +
> +	fence_udelay(5, clk_base);
> +
> +	/* resume SCLK and CPULP clocks */
> +	tegra_sclk_cpulp_burst_policy_restore_context();
> +
> +	/*
> +	 * restore CPUG clocks:
> +	 * - enable DFLL in open loop mode
> +	 * - switch CPUG to DFLL clock source
> +	 * - close DFLL loop
> +	 * - sync PLLX state
> +	 */
> +	if (dfll_pdev)
> +		tegra_dfll_resume(dfll_pdev, false);
> +
> +	tegra_cclkg_burst_policy_restore_context();
> +	fence_udelay(2, clk_base);
> +
> +	if (dfll_pdev)
> +		tegra_dfll_resume(dfll_pdev, true);
> +
> +	parent = clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
> +	clk = clks[TEGRA210_CLK_PLL_X];
> +	if (parent != __clk_get_hw(clk))
> +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
> +
> +	/* Disable PLL_OUT_CPU after DFLL resume */
> +	tegra_clk_set_pllp_out_cpu(false);
> +}
> +
>  static void tegra210_cpu_clock_suspend(void)
>  {
>  	/* switch coresite to clk_m, save off original source */
> @@ -3298,6 +3400,11 @@ static void tegra210_cpu_clock_resume(void)
>  }
>  #endif
>  
> +static struct syscore_ops tegra_clk_syscore_ops = {
> +	.suspend = tegra210_clk_suspend,
> +	.resume = tegra210_clk_resume,
> +};
> +
>  static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
>  	.wait_for_reset	= tegra210_wait_cpu_in_reset,
>  	.disable_clock	= tegra210_disable_cpu_clock,
> @@ -3583,5 +3690,7 @@ static void __init tegra210_clock_init(struct device_node *np)
>  	tegra210_mbist_clk_init();
>  
>  	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
> +
> +	register_syscore_ops(&tegra_clk_syscore_ops);
>  }

Is it really worthwhile to use syscore_ops for suspend/resume given that drivers for
won't resume before the CLK driver anyway? Are there any other options for CLK
suspend/resume?

I'm also not sure whether PM runtime API could be used at all in the context of
syscore_ops ..

Secondly, what about to use generic clk_save_context() / clk_restore_context()
helpers for the suspend-resume? It looks to me that some other essential (and proper)
platform driver (soc/tegra/? PMC?) should suspend-resume the clocks using the generic
CLK Framework API.
