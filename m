Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CADB4F017
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 22:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfFUUob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 16:44:31 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6721 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUUob (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 16:44:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0d41ac0001>; Fri, 21 Jun 2019 13:44:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 21 Jun 2019 13:44:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 21 Jun 2019 13:44:27 -0700
Received: from [10.2.174.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Jun
 2019 20:44:23 +0000
Subject: Re: [PATCH V3 11/17] clk: tegra210: support for Tegra210 clocks
 suspend and resume
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-12-git-send-email-skomatineni@nvidia.com>
 <20190618121607.GN28892@ulmo>
 <491e0b18-11e7-837c-4591-06ed30950e1d@nvidia.com>
 <20190619081541.GA3187@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <467eec6e-87fd-0b59-f2f6-75eae4a15a34@nvidia.com>
Date:   Fri, 21 Jun 2019 13:44:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619081541.GA3187@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561149869; bh=rMya3Lsh8UkESwXjmICg3L7PVGzynThgYAA0U3Q3z+s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=dOPOOF916qaV1KpO9gd7faBpvrrghFMtQD9ge9fbbRSusg1fu+QAFB968lGK9VlGa
         attGAfjJBg9gbLLjFG9fL4VCi8JiYwEYWmW2fBlYoyq0p6dlWJrAMMLUk3WT0+bL3R
         uVn/72IcURycFECcFOfSnsWHCHwTdHh4Ugdf7P176JlTIIFsok1NAWrOreDihpkZng
         LvnmfEezHR7J8sagnlrFj2n1nCURIUj//1PlFtgeSz+/0Uuk5UqgmYc2QB1VZnGETc
         pfF84AV1PuoLYcwgmw4MP9vPKSHPqFdw/J5pqXQAVz8quN6XFHBoioJ9zDbcySeVli
         hBjCtUUw/vppg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/19/19 1:15 AM, Thierry Reding wrote:
> On Tue, Jun 18, 2019 at 10:58:40AM -0700, Sowjanya Komatineni wrote:
>> On 6/18/19 5:16 AM, Thierry Reding wrote:
>>> On Tue, Jun 18, 2019 at 12:46:25AM -0700, Sowjanya Komatineni wrote:
>>>> This patch adds system suspend and resume support for Tegra210
>>>> clocks.
>>>>
>>>> All the CAR controller settings are lost on suspend when core power
>>>> goes off.
>>>>
>>>> This patch has implementation for saving and restoring all the PLLs
>>>> and clocks context during system suspend and resume to have the
>>>> system back to operating state.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    drivers/clk/tegra/clk-tegra210.c | 218 +++++++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 211 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>>> index e1ba62d2b1a0..c34d92e871f4 100644
>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>> @@ -9,10 +9,12 @@
>>>>    #include <linux/clkdev.h>
>>>>    #include <linux/of.h>
>>>>    #include <linux/of_address.h>
>>>> +#include <linux/of_platform.h>
>>>>    #include <linux/delay.h>
>>>>    #include <linux/export.h>
>>>>    #include <linux/mutex.h>
>>>>    #include <linux/clk/tegra.h>
>>>> +#include <linux/syscore_ops.h>
>>>>    #include <dt-bindings/clock/tegra210-car.h>
>>>>    #include <dt-bindings/reset/tegra210-car.h>
>>>>    #include <linux/iopoll.h>
>>>> @@ -20,6 +22,7 @@
>>>>    #include <soc/tegra/pmc.h>
>>>>    #include "clk.h"
>>>> +#include "clk-dfll.h"
>>>>    #include "clk-id.h"
>>>>    /*
>>>> @@ -36,6 +39,8 @@
>>>>    #define CLK_SOURCE_LA 0x1f8
>>>>    #define CLK_SOURCE_SDMMC2 0x154
>>>>    #define CLK_SOURCE_SDMMC4 0x164
>>>> +#define CLK_OUT_ENB_Y 0x298
>>>> +#define CLK_ENB_PLLP_OUT_CPU BIT(31)
>>>>    #define PLLC_BASE 0x80
>>>>    #define PLLC_OUT 0x84
>>>> @@ -225,6 +230,7 @@
>>>>    #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>    #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>    #define LVL2_CLK_GATE_OVRA 0xf8
>>>>    #define LVL2_CLK_GATE_OVRC 0x3a0
>>>> @@ -2820,6 +2826,7 @@ static int tegra210_enable_pllu(void)
>>>>    	struct tegra_clk_pll_freq_table *fentry;
>>>>    	struct tegra_clk_pll pllu;
>>>>    	u32 reg;
>>>> +	int ret;
>>>>    	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>>>>    		if (fentry->input_rate == pll_ref_freq)
>>>> @@ -2836,7 +2843,7 @@ static int tegra210_enable_pllu(void)
>>>>    	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
>>>>    	reg &= ~BIT(pllu.params->iddq_bit_idx);
>>>>    	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
>>>> -	udelay(5);
>>>> +	fence_udelay(5, clk_base);
>>>>    	reg = readl_relaxed(clk_base + PLLU_BASE);
>>>>    	reg &= ~GENMASK(20, 0);
>>>> @@ -2844,13 +2851,13 @@ static int tegra210_enable_pllu(void)
>>>>    	reg |= fentry->n << 8;
>>>>    	reg |= fentry->p << 16;
>>>>    	writel(reg, clk_base + PLLU_BASE);
>>>> -	udelay(1);
>>>> +	fence_udelay(1, clk_base);
>>> These udelay() -> fence_udelay() seem like they should be a separate
>>> patch.
>>>
>>>>    	reg |= PLL_ENABLE;
>>>>    	writel(reg, clk_base + PLLU_BASE);
>>>> +	fence_udelay(1, clk_base);
>>>> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>>> -					  reg & PLL_BASE_LOCK, 2, 1000);
>>>> -	if (!(reg & PLL_BASE_LOCK)) {
>>>> +	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>>> +	if (ret) {
>>>>    		pr_err("Timed out waiting for PLL_U to lock\n");
>>>>    		return -ETIMEDOUT;
>>>>    	}
>>>> @@ -2890,12 +2897,12 @@ static int tegra210_init_pllu(void)
>>>>    		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
>>>>    		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
>>>>    		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
>>>> -		udelay(1);
>>>> +		fence_udelay(1, clk_base);
>>>>    		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
>>>>    		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
>>>>    		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
>>>> -		udelay(1);
>>>> +		fence_udelay(1, clk_base);
>>>>    		reg = readl_relaxed(clk_base + PLLU_BASE);
>>>>    		reg &= ~PLLU_BASE_CLKENABLE_USB;
>>>> @@ -3282,6 +3289,188 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>>>    }
>>>>    #ifdef CONFIG_PM_SLEEP
>>>> +static u32 cpu_softrst_ctx[3];
>>>> +static struct platform_device *dfll_pdev;
>>>> +static u32 *periph_clk_src_ctx;
>>>> +struct periph_source_bank {
>>> Blank line between the above two.
>>>
>>>> +	u32 start;
>>>> +	u32 end;
>>>> +};
>>>> +
>>>> +static struct periph_source_bank periph_srcs[] = {
>>>> +	[0] = {
>>>> +		.start = 0x100,
>>>> +		.end = 0x198,
>>>> +	},
>>>> +	[1] = {
>>>> +		.start = 0x1a0,
>>>> +		.end = 0x1f8,
>>>> +	},
>>>> +	[2] = {
>>>> +		.start = 0x3b4,
>>>> +		.end = 0x42c,
>>>> +	},
>>>> +	[3] = {
>>>> +		.start = 0x49c,
>>>> +		.end = 0x4b4,
>>>> +	},
>>>> +	[4] = {
>>>> +		.start = 0x560,
>>>> +		.end = 0x564,
>>>> +	},
>>>> +	[5] = {
>>>> +		.start = 0x600,
>>>> +		.end = 0x678,
>>>> +	},
>>>> +	[6] = {
>>>> +		.start = 0x694,
>>>> +		.end = 0x6a0,
>>>> +	},
>>>> +	[7] = {
>>>> +		.start = 0x6b8,
>>>> +		.end = 0x718,
>>>> +	},
>>>> +};
>>>> +
>>>> +/* This array lists the valid clocks for each periph clk bank */
>>>> +static u32 periph_clks_on[] = {
>>>> +	0xdcd7dff9,
>>>> +	0x87d1f3e7,
>>>> +	0xf3fed3fa,
>>>> +	0xffc18cfb,
>>>> +	0x793fb7ff,
>>>> +	0x3fe66fff,
>>>> +	0xfc1fc7ff,
>>>> +};
>>> Hm... this is a bunch of magic. Perhaps replace this by a list of the
>>> clock IDs? That's perhaps a little more verbose, but if we ever need to
>>> tweak the list of IDs in that periph_clks_on array, that'll be quite the
>>> challenge.
>>>
>>> Also, is this list a "guess" or are these all guaranteed to be always
>>> on? What if some of these ended up getting disabled as part of suspend
>>> already (by their users). If we force them on, won't their references
>>> become unbalanced if the driver later enables them again on resume?
>> Yes, will replace with list of peripheral clock names..
>>
>> This list is not a guess. Each entry of this list maps to CLK_ENB set
>> register.
>>
>> Total 7 registers are available and each bit of these registers is for
>> enable/disable clock to corresponding peripheral.
>>
>> Some of the bits are off as those peripheral clocks don't need to be enabled
>> as we are not changing source or not using them like MIPIBIF, PLLG_REF..
>>
>> This list of peripheral clocks are enabled during resume before changing
>> clock sources and after clock source update, they are restored back to the
>> state they were before suspend. So their references don't become unbalanced.
> Okay, good. Can you maybe put a version of that explanation in a comment
> on top of the periph_clks_on declaration? And perhaps also describe this
> in the commit message.
>
> Or maybe even better, add some comments in the main suspend/resume paths
> to sort of "guide" through what's happening.
>
>>>> +
>>>> +static struct platform_device *dfll_pdev;
>>> I think you already predeclared this one above.
>>>
>>>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
>>>> +#define car_writel(_val, _base, _off) \
>>>> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>>>> +
>>>> +static u32 * __init tegra210_init_suspend_ctx(void)
>>>> +{
>>>> +	int i, size = 0;
>>> Can both be unsigned int.
>>>
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
>>>> +		size += periph_srcs[i].end - periph_srcs[i].start + 4;
>>>> +
>>>> +	periph_clk_src_ctx = kmalloc(size, GFP_KERNEL);
>>>> +
>>>> +	return periph_clk_src_ctx;
>>> It's somewhat wasteful to return a global variable since you can access
>>> it anyway. Perhaps it'd be more useful to make the function return a
>>> boolean?
>>>
>>>> +}
>>>> +
>>>> +static int tegra210_clk_suspend(void)
>>>> +{
>>>> +	int i;
>>> unsigned int.
>>>
>>>> +	unsigned long off;
>>>> +	struct device_node *node;
>>>> +	u32 *clk_rst_ctx = periph_clk_src_ctx;
>>>> +	u32 val;
>>>> +
>>>> +	tegra_cclkg_burst_policy_save_context();
>>>> +
>>>> +	if (!dfll_pdev) {
>>>> +		node = of_find_compatible_node(NULL, NULL,
>>>> +					       "nvidia,tegra210-dfll");
>>>> +		if (node)
>>>> +			dfll_pdev = of_find_device_by_node(node);
>>>> +		of_node_put(node);
>>>> +		if (!dfll_pdev)
>>>> +			pr_err("dfll node not found. no suspend for dfll\n");
>>>> +	}
>>> Wouldn't it make sense to run this only once, perhaps as part of
>>> tegra210_init_suspend_ctx()?

tegra210_init_suspend_ctx is invoked during tegra210_clock_init and as 
clock init happens earlier than dfll probe,

dfll platform device will not be available at that time. So acquiring 
dfll pdev during 1st suspend.

>>>> +
>>>> +	if (dfll_pdev)
>>>> +		tegra_dfll_suspend(dfll_pdev);
>>>> +
>>>> +	/* Enable PLLP_OUT_CPU after dfll suspend */
>>>> +	val = car_readl(CLK_OUT_ENB_Y, 0);
>>>> +	val |= CLK_ENB_PLLP_OUT_CPU;
>>>> +	car_writel(val, CLK_OUT_ENB_Y, 0);
>>>> +
>>>> +	tegra_clk_periph_suspend(clk_base);
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
>>>> +		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
>>>> +		     off += 4)
>>>> +			*clk_rst_ctx++ = car_readl(off, 0);
>>>> +
>>>> +	tegra_sclk_cclklp_burst_policy_save_context();
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>>> +		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
>>>> +
>>>> +	clk_save_context();
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void tegra210_clk_resume(void)
>>>> +{
>>>> +	int i;
>>>> +	unsigned long off;
>>>> +	u32 val;
>>>> +	u32 *clk_rst_ctx = periph_clk_src_ctx;
>>>> +	struct clk_hw *parent;
>>>> +	struct clk *clk;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>>>> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
>>>> +
>>>> +	tegra_clk_osc_resume(clk_base);
>>>> +
>>>> +	/*
>>>> +	 * restore all the plls before configuring clocks and resetting
>>>> +	 * the devices.
>>>> +	 */
>>>> +	tegra210_init_pllu();
>>>> +	tegra_sclk_cpulp_burst_policy_restore_context();
>>>> +	clk_restore_context();
>>>> +
>>>> +	/* enable all clocks before configuring clock sources */
>>>> +	tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks_on),
>>>> +				  clk_base);
>>>> +	/* wait for all writes to happen to have all the clocks enabled */
>>>> +	wmb();
>>>> +	fence_udelay(2, clk_base);
>>>> +
>>>> +	/* restore all the devices clock sources */
>>>> +	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
>>>> +		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
>>>> +		     off += 4)
>>>> +			car_writel(*clk_rst_ctx++, off, 0);
>>>> +
>>>> +	/* propagate and restore resets, restore clock state */
>>>> +	fence_udelay(5, clk_base);
>>>> +	tegra_clk_periph_resume(clk_base);
>>>> +
>>>> +	/*
>>>> +	 * restore CPUG clocks:
>>>> +	 * - enable DFLL in open loop mode
>>>> +	 * - switch CPUG to DFLL clock source
>>>> +	 * - close DFLL loop
>>>> +	 * - sync PLLX state
>>>> +	 */
>>>> +	if (dfll_pdev)
>>>> +		tegra_dfll_resume(dfll_pdev, false);
>>>> +
>>>> +	tegra_cclkg_burst_policy_restore_context();
>>>> +	fence_udelay(2, clk_base);
>>>> +
>>>> +	if (dfll_pdev)
>>>> +		tegra_dfll_resume(dfll_pdev, true);
>>>> +
>>>> +	parent = clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
>>>> +	clk = clks[TEGRA210_CLK_PLL_X];
>>>> +	if (parent != __clk_get_hw(clk))
>>>> +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
>>>> +
>>>> +	/* Disable PLL_OUT_CPU after DFLL resume */
>>>> +	val = car_readl(CLK_OUT_ENB_Y, 0);
>>>> +	val &= ~CLK_ENB_PLLP_OUT_CPU;
>>>> +	car_writel(val, CLK_OUT_ENB_Y, 0);
>>>> +}
>>> I'm surprised by the amount of work that we need to do here. I had hoped
>>> that the clock framework's save/restore infrastructure would be enough.
>>> I suppose you do call clk_restore_context() somewhere in there, so maybe
>>> this really is as good as it gets.
>>>
>>> Thierry
>> Reason is there are dependencies b/w the clocks and DFLL resume and clocks
>> resume order needed is not same as clock tree list.
>>
>> during resume as per clock tree, CPU clock configs to use DFLL will happen
>> first as its first in the clock tree but DFLL resume should be done prior to
>> switching CPU to use from DFLL output.
>>
>> To resume DFLL, peripheral clocks should be restored.
>>
>> Considering these dependencies, performing peripheral and DFLL/CPU resume in
>> Tegra210 clock driver rather than in corresponding peripheral clk_ops using
>> save and restore context callback.
> Okay makes sense. As mentioned above, I think it'd be great if you could
> add more comments throughout the tegra210_clk_{suspend,resume}() code to
> guide the reader through what you're doing, given that this is far from
> obvious. You already do quite a bit of that, but it's perhaps better to
> explain more what's going on and, perhaps more importantly, why. You're
> currently mostly repeating the code sequence in the code. It'd be great
> to have the general suspend/resume sequence detailed and highlight why
> the sequence is the way it is and what the dependencies are, etc.
>
> Thierry
>
OK, Will add more comments in V4
>>>> +
>>>>    static void tegra210_cpu_clock_suspend(void)
>>>>    {
>>>>    	/* switch coresite to clk_m, save off original source */
>>>> @@ -3295,8 +3484,20 @@ static void tegra210_cpu_clock_resume(void)
>>>>    	writel(tegra210_cpu_clk_sctx.clk_csite_src,
>>>>    				clk_base + CLK_SOURCE_CSITE);
>>>>    }
>>>> +#else
>>>> +#define tegra210_clk_suspend	NULL
>>>> +#define tegra210_clk_resume	NULL
>>>> +static inline u32 *tegra210_init_suspend_ctx(void)
>>>> +{
>>>> +	return NULL;
>>>> +}
>>>>    #endif
>>>> +static struct syscore_ops tegra_clk_syscore_ops = {
>>>> +	.suspend = tegra210_clk_suspend,
>>>> +	.resume = tegra210_clk_resume,
>>>> +};
>>>> +
>>>>    static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
>>>>    	.wait_for_reset	= tegra210_wait_cpu_in_reset,
>>>>    	.disable_clock	= tegra210_disable_cpu_clock,
>>>> @@ -3580,5 +3781,8 @@ static void __init tegra210_clock_init(struct device_node *np)
>>>>    	tegra210_mbist_clk_init();
>>>>    	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
>>>> +
>>>> +	if (tegra210_init_suspend_ctx())
>>>> +		register_syscore_ops(&tegra_clk_syscore_ops);
>>>>    }
>>>>    CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
>>>> -- 
>>>> 2.7.4
>>>>
