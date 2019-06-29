Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7557A5AC26
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 17:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbfF2P0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 11:26:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38479 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfF2P0Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 11:26:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so8808865ljg.5;
        Sat, 29 Jun 2019 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MAISvrZEFKf3K6sQaaEzdG1/Hb09pTM6bSrULCKOUP4=;
        b=MynHykDHkWoq2B8MMxowF7bRzEEJcEkYquho70+f8Vq5+sqJStUmGDk9nOUVL5IkW5
         Uxo+f0TmAovXKd12EC7K19pYw/38yPdAEaL1E140IQPC334tsSkU6AOxslkSAVQaQpMN
         YmjicIydABFuITwj2id6uswmN8FURbQc8Vu+KMYhwcr0SRb8Pgoh+R2ZV6zFHhbKck86
         1K/T3Qgq8RBpgwtnDlnFCojc9ZODs2UkJDyrJ+lcFWEeOrI/xDQyO9skpBxRf0t3nCdJ
         zighWnVtl06XrRC9oBvvJFeNiJ5vUytiYyTI06QM27Iy5MOufSX7ur5yrEoo9Cnme2QU
         jpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MAISvrZEFKf3K6sQaaEzdG1/Hb09pTM6bSrULCKOUP4=;
        b=TO5PZ+9yDJQ76DeGZkyeecfpYgcr2wQ7Zh2h7T91cHcXQ/N2GsmEZiAkdJ8X2k2RW5
         oqM62uPPRyhGvxdWrQrH04gYBGoui4b69y6E6LO2BgfAxyjE7giPCDHbeyE3eeFARGIR
         sKnSJl4zhoVb7mDT01eAzbvpQw6Wb41xKckRrN2Dm+r6vPjWiH2NJFCFSXtrPedWacTL
         UoltRJIwr06JPMHpmB1y2vWhytdVAYPg1NSNNEd65WTpI30GKS1NsKXKLhkas1uBrQM/
         Q8hzgwLX0rH8hjMC8x39UiYGnKweT62Rd0/NqEypf3wETtiFxncv5+2AmFfrau/g8GAR
         ofaQ==
X-Gm-Message-State: APjAAAV81lQkyNhQWEoFpPlEVAXve0RVR5SQ5oBzzGEwR1SC7YaSR8Iv
        ItCXtXICXU73FjJKrjOPGIOoBuLl
X-Google-Smtp-Source: APXvYqw93tmA6VN/oXwhmxYZTNS5ln9SvC9oIx14Mo9lLK+NjqRxQv8p8GF2ZQfRS2Ywa3NzRGlduw==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr9316878lji.171.1561821973102;
        Sat, 29 Jun 2019 08:26:13 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id w15sm1984880ljh.0.2019.06.29.08.26.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 08:26:12 -0700 (PDT)
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
Message-ID: <1054682d-5cab-2997-6795-f777d074d972@gmail.com>
Date:   Sat, 29 Jun 2019 18:26:11 +0300
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
> +}
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>  {
>  	clk_base = regs;
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 8532f5150091..c66b0a73bb01 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -10,6 +10,16 @@
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
>  
> +#define SCLK_BURST_POLICY	0x28
> +#define SYSTEM_CLK_RATE		0x30
> +#define CLK_MASK_ARM		0x44
> +#define MISC_CLK_ENB		0x48
> +#define CCLKG_BURST_POLICY	0x368
> +#define CCLKLP_BURST_POLICY	0x370
> +#define SYS_CLK_DIV		0x400
> +#define SPARE_REG0		0x55c
> +#define BURST_POLICY_REG_SIZE	2

"clk-tegra30.c",  "clk-tegra114.c" and "clk-tegra124.c" also define the
CCLKG_BURST_POLICY .. apparently you haven't tried to compile ARM32 kernel because I
assume that compile should bark at the re-definitions.
