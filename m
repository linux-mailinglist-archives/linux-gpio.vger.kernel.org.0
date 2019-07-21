Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021656F626
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 23:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfGUVit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 17:38:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39744 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGUVis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 17:38:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so35517161ljh.6;
        Sun, 21 Jul 2019 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SX+w2e2mewK1PQ9A3gUzSlRmLhtrjcNv4uPaB/2bOwc=;
        b=MU3b7ogIOv6Ir5iu3yldsYUxSv7Ottu6OLV7xfYXuRkZolJNbET5kNfbXzF+Q57h4R
         3nqq6HW+0ggaCECrxBSj2KugLj0Wl9l4kerbCBAc3Igkn+2QNB3SIs92yegXIkyQxr8a
         0GFdDNce4vbg+Y/mDRxINb3cEtmekiKFXweqBAbugyKx5al9EkOopnKJNm7ksUD2cZhx
         lmo8QkMeyjaD++q9hYVbrvucxtf4usO9d3JHIs1apljg20I/1UeBFuO1ld4L8aKV81TZ
         UsrjAwDMbRmwzEMyQzEI7Mx2ZB7EA/sc8F348sZR5bi/0u+IM9mzqMdRiGVjl+/HT5nj
         ai0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SX+w2e2mewK1PQ9A3gUzSlRmLhtrjcNv4uPaB/2bOwc=;
        b=ocLBR3VKTFrNj+A74LGuIWT/DSSmMFTVEGVl9SXMTwidb/jJIY4oDrEaOyTzf8mNcg
         U0oHnCSlmjTu+jn3M5X0LRTmivOCe8M+nKJAh2NtpwbCN2s4/F+aOBvrgiXqJglx/+O1
         V4z3WE3V+gTdyZueR23akG93LAjXqslSCK4mJvjvvTnGhQPnJ2VX5vMD00O7iR8IXfZ3
         67l9OOAQvMUP4sMlsKjv3TQJ77xR7tCth4kS+Mmr3zmApQs18k2A1hpthOIgNKYQ5hT4
         HejXPQEpKX9TyDhMrfdOzX/scsq0hJ3mW+gEA6rGhaKcOjYGGMQN66wdeInLZK1XUAa2
         CLLg==
X-Gm-Message-State: APjAAAVEvRMtSadoOEKqMiNJUNjOIxAYLnjjAiqmLrKHs2jrMLJ0FJPX
        o/gQl6S4yLVr+W2emcADUopVtvfT
X-Google-Smtp-Source: APXvYqylNJNqsfETN/UUse1HnB5AsJlsUQf/4dIITwJZV4phgSFpONgn47i+y/QuibLvLuaBYsuy+w==
X-Received: by 2002:a2e:9ac6:: with SMTP id p6mr17971968ljj.100.1563745124683;
        Sun, 21 Jul 2019 14:38:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id n1sm5756780lfk.19.2019.07.21.14.38.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 14:38:44 -0700 (PDT)
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
Date:   Mon, 22 Jul 2019 00:38:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch adds support for clk: tegra210: suspend-resume.
> 
> All the CAR controller settings are lost on suspend when core
> power goes off.
> 
> This patch has implementation for saving and restoring all PLLs
> and clocks context during system suspend and resume to have the
> clocks back to same state for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 68 ++++++++++++++++++++++++++++++++++++++--
>  drivers/clk/tegra/clk.c          | 14 +++++++++
>  drivers/clk/tegra/clk.h          |  1 +
>  3 files changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 55a88c0824a5..68271873acc1 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -9,6 +9,7 @@
>  #include <linux/clkdev.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/syscore_ops.h>
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/mutex.h>
> @@ -220,11 +221,15 @@
>  #define CLK_M_DIVISOR_SHIFT 2
>  #define CLK_M_DIVISOR_MASK 0x3
>  
> +#define CLK_MASK_ARM	0x44
> +#define MISC_CLK_ENB	0x48
> +
>  #define RST_DFLL_DVCO 0x2f4
>  #define DVFS_DFLL_RESET_SHIFT 0
>  
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>  #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> +#define CPU_SOFTRST_CTRL 0x380
>  
>  #define LVL2_CLK_GATE_OVRA 0xf8
>  #define LVL2_CLK_GATE_OVRC 0x3a0
> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>  	struct tegra_clk_pll_freq_table *fentry;
>  	struct tegra_clk_pll pllu;
>  	u32 reg;
> +	int ret;
>  
>  	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>  		if (fentry->input_rate == pll_ref_freq)
> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>  	reg |= PLL_ENABLE;
>  	writel(reg, clk_base + PLLU_BASE);
>  
> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
> -					  reg & PLL_BASE_LOCK, 2, 1000);
> -	if (!(reg & PLL_BASE_LOCK)) {
> +	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
> +	if (ret) {

Why this is needed? Was there a bug?

>  		pr_err("Timed out waiting for PLL_U to lock\n");
>  		return -ETIMEDOUT;
>  	}
> @@ -3288,6 +3293,56 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
> +#define car_writel(_val, _base, _off) \
> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> +
> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
> +static u32 cpu_softrst_ctx[3];
> +
> +static int tegra210_clk_suspend(void)
> +{
> +	unsigned int i;
> +
> +	clk_save_context();
> +
> +	/*
> +	 * save the bootloader configured clock registers SPARE_REG0,
> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL

Nit: Start all multi-line comments with a capital letter and put dot in
the end of sentence.

> +	 */
> +	spare_reg_ctx = readl_relaxed(clk_base + SPARE_REG0);
> +	misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
> +	clk_msk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
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
> +
> +	tegra_clk_osc_resume(clk_base);
> +
> +	/*
> +	 * restore the bootloader configured clock registers SPARE_REG0,
> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.

Same here.

> +	 */
> +	writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
> +	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
> +	writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
> +
> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
> +
> +	fence_udelay(5, clk_base);
> +
> +	tegra210_init_pllu();
> +	clk_restore_context();
> +}
> +
>  static void tegra210_cpu_clock_suspend(void)
>  {
>  	/* switch coresite to clk_m, save off original source */
> @@ -3303,6 +3358,11 @@ static void tegra210_cpu_clock_resume(void)
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
> @@ -3587,5 +3647,7 @@ static void __init tegra210_clock_init(struct device_node *np)
>  	tegra210_mbist_clk_init();
>  
>  	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
> +
> +	register_syscore_ops(&tegra_clk_syscore_ops);
>  }
>  CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 573e3c967ae1..eb08047fd02f 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -23,6 +23,7 @@
>  #define CLK_OUT_ENB_W			0x364
>  #define CLK_OUT_ENB_X			0x280
>  #define CLK_OUT_ENB_Y			0x298
> +#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
>  #define CLK_OUT_ENB_SET_L		0x320
>  #define CLK_OUT_ENB_CLR_L		0x324
>  #define CLK_OUT_ENB_SET_H		0x328
> @@ -199,6 +200,19 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>  	}
>  }
>  
> +void tegra_clk_set_pllp_out_cpu(bool enable)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(clk_base + CLK_OUT_ENB_Y);
> +	if (enable)
> +		val |= CLK_ENB_PLLP_OUT_CPU;
> +	else
> +		val &= ~CLK_ENB_PLLP_OUT_CPU;
> +
> +	writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
> +}
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>  {
>  	clk_base = regs;
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 562a3ee2d537..0ffa763c755b 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -863,6 +863,7 @@ int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
>  void tegra_clk_sync_state_pll(struct clk_hw *hw);
>  void tegra_clk_osc_resume(void __iomem *clk_base);
> +void tegra_clk_set_pllp_out_cpu(bool enable);
>  
>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\
> 

