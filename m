Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9791E56F10
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 18:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFZQqi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 12:46:38 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8493 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfFZQqh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 12:46:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d13a16d0001>; Wed, 26 Jun 2019 09:46:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 09:46:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 09:46:34 -0700
Received: from [10.2.169.244] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 16:46:31 +0000
Subject: Re: [PATCH V4 12/18] clk: tegra210: support for Tegra210 clocks
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
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-13-git-send-email-skomatineni@nvidia.com>
 <20190626101616.GE6362@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <2dad8c70-2501-5cc0-9b8a-9c1a437ebc05@nvidia.com>
Date:   Wed, 26 Jun 2019 09:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626101616.GE6362@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561567597; bh=f/btVB27Am+mVQsxQjKjkhfm1RXwG9pGuiNvyRx23jo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ICoHuZUWkTAXTSDtyT4AGtdPQyfi3+bu0lN93jP0fk0AihzFg70+w8iX18IQ579p0
         aL6WIU6qoLxe2e5BV8beNtZnZLMt2h9XoZi2f/0wq2n9/Naw6XLnxQqKr6YCxp4mr3
         sjw55r3p98+4/HdZD7xYr8Qm7/WMBoi3eheESH6ma/sztmVNCU3ZWfl6d39Ww5ndHU
         zp5v0zFfNFDAWwHf399R6gvtzAq9f+JMYT+rqh0Szyc3L1GlHiZk7wB+L3N1aRRoTg
         9z+Dg96VFU8ECs3UMhKkoahcYVdGmvqGZq+3hCBZiV1Bm9pkeP404euMlKd1BxruIc
         QyQ36HubLaeFQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/26/19 3:16 AM, Thierry Reding wrote:
> On Sun, Jun 23, 2019 at 08:02:53PM -0700, Sowjanya Komatineni wrote:
>> This patch adds system suspend and resume support for Tegra210
>> clocks.
>>
>> All the CAR controller settings are lost on suspend when core power
>> goes off.
>>
>> This patch has implementation for saving and restoring all the PLLs
>> and clocks context during system suspend and resume to have the
>> clocks back to same state for normal operation.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra210.c | 115 ++++++++++++++++++++++++++++++++++++++-
>>   drivers/clk/tegra/clk.c          |  14 +++++
>>   drivers/clk/tegra/clk.h          |   1 +
>>   3 files changed, 127 insertions(+), 3 deletions(-)
> Can you give a brief overview of how you've been testing this? Is this
> just about confirming that "things work fine" after resume? Could we be
> more methodical and perhaps check the state of the clock tree before
> suspend (perhaps by inspecting debugfs) and comparing it to the state
> after resume?
>
> One minor nit below...
Yes, I tested by checking clock tree for counts and rate through debugfs 
clk_rate nodes as well for all clocks before suspend and on resume.
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>> index c414cd72d045..4fb3509fe9f6 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -9,10 +9,12 @@
>>   #include <linux/clkdev.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/delay.h>
>>   #include <linux/export.h>
>>   #include <linux/mutex.h>
>>   #include <linux/clk/tegra.h>
>> +#include <linux/syscore_ops.h>
>>   #include <dt-bindings/clock/tegra210-car.h>
>>   #include <dt-bindings/reset/tegra210-car.h>
>>   #include <linux/iopoll.h>
>> @@ -20,6 +22,7 @@
>>   #include <soc/tegra/pmc.h>
>>   
>>   #include "clk.h"
>> +#include "clk-dfll.h"
>>   #include "clk-id.h"
>>   
>>   /*
>> @@ -225,6 +228,7 @@
>>   
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>> +#define CPU_SOFTRST_CTRL 0x380
>>   
>>   #define LVL2_CLK_GATE_OVRA 0xf8
>>   #define LVL2_CLK_GATE_OVRC 0x3a0
>> @@ -2820,6 +2824,7 @@ static int tegra210_enable_pllu(void)
>>   	struct tegra_clk_pll_freq_table *fentry;
>>   	struct tegra_clk_pll pllu;
>>   	u32 reg;
>> +	int ret;
>>   
>>   	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>>   		if (fentry->input_rate == pll_ref_freq)
>> @@ -2847,10 +2852,10 @@ static int tegra210_enable_pllu(void)
>>   	fence_udelay(1, clk_base);
>>   	reg |= PLL_ENABLE;
>>   	writel(reg, clk_base + PLLU_BASE);
>> +	fence_udelay(1, clk_base);
>>   
>> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>> -					  reg & PLL_BASE_LOCK, 2, 1000);
>> -	if (!(reg & PLL_BASE_LOCK)) {
>> +	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>> +	if (ret) {
>>   		pr_err("Timed out waiting for PLL_U to lock\n");
>>   		return -ETIMEDOUT;
>>   	}
>> @@ -3282,6 +3287,103 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>   }
>>   
>>   #ifdef CONFIG_PM_SLEEP
>> +static u32 cpu_softrst_ctx[3];
>> +static struct platform_device *dfll_pdev;
>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
>> +#define car_writel(_val, _base, _off) \
>> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>> +
>> +static int tegra210_clk_suspend(void)
>> +{
>> +	int i;
> This can be unsigned int.
>
>> +	struct device_node *node;
>> +
>> +	tegra_cclkg_burst_policy_save_context();
>> +
>> +	if (!dfll_pdev) {
>> +		node = of_find_compatible_node(NULL, NULL,
>> +					       "nvidia,tegra210-dfll");
>> +		if (node)
>> +			dfll_pdev = of_find_device_by_node(node);
>> +
>> +		of_node_put(node);
>> +		if (!dfll_pdev)
>> +			pr_err("dfll node not found. no suspend for dfll\n");
>> +	}
>> +
>> +	if (dfll_pdev)
>> +		tegra_dfll_suspend(dfll_pdev);
>> +
>> +	/* Enable PLLP_OUT_CPU after dfll suspend */
>> +	tegra_clk_set_pllp_out_cpu(true);
>> +
>> +	tegra_sclk_cclklp_burst_policy_save_context();
>> +
>> +	clk_save_context();
>> +
>> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>> +		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra210_clk_resume(void)
>> +{
>> +	int i;
> And here too.
>
> With that:
>
> Acked-by: Thierry Reding <treding@nvidia.com>
>
>> +	struct clk_hw *parent;
>> +	struct clk *clk;
>> +
>> +	/*
>> +	 * clk_restore_context restores clocks as per the clock tree.
>> +	 *
>> +	 * dfllCPU_out is first in the clock tree to get restored and it
>> +	 * involves programming DFLL controller along with restoring CPUG
>> +	 * clock burst policy.
>> +	 *
>> +	 * DFLL programming needs dfll_ref and dfll_soc peripheral clocks
>> +	 * to be restores which are part ofthe peripheral clocks.
>> +	 * So, peripheral clocks restore should happen prior to dfll clock
>> +	 * restore.
>> +	 */
>> +
>> +	tegra_clk_osc_resume(clk_base);
>> +	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
>> +
>> +	/* restore all plls and peripheral clocks */
>> +	tegra210_init_pllu();
>> +	clk_restore_context();
>> +
>> +	fence_udelay(5, clk_base);
>> +
>> +	/* resume SCLK and CPULP clocks */
>> +	tegra_sclk_cpulp_burst_policy_restore_context();
>> +
>> +	/*
>> +	 * restore CPUG clocks:
>> +	 * - enable DFLL in open loop mode
>> +	 * - switch CPUG to DFLL clock source
>> +	 * - close DFLL loop
>> +	 * - sync PLLX state
>> +	 */
>> +	if (dfll_pdev)
>> +		tegra_dfll_resume(dfll_pdev, false);
>> +
>> +	tegra_cclkg_burst_policy_restore_context();
>> +	fence_udelay(2, clk_base);
>> +
>> +	if (dfll_pdev)
>> +		tegra_dfll_resume(dfll_pdev, true);
>> +
>> +	parent = clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
>> +	clk = clks[TEGRA210_CLK_PLL_X];
>> +	if (parent != __clk_get_hw(clk))
>> +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
>> +
>> +	/* Disable PLL_OUT_CPU after DFLL resume */
>> +	tegra_clk_set_pllp_out_cpu(false);
>> +}
>> +
>>   static void tegra210_cpu_clock_suspend(void)
>>   {
>>   	/* switch coresite to clk_m, save off original source */
>> @@ -3297,6 +3399,11 @@ static void tegra210_cpu_clock_resume(void)
>>   }
>>   #endif
>>   
>> +static struct syscore_ops tegra_clk_syscore_ops = {
>> +	.suspend = tegra210_clk_suspend,
>> +	.resume = tegra210_clk_resume,
>> +};
>> +
>>   static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
>>   	.wait_for_reset	= tegra210_wait_cpu_in_reset,
>>   	.disable_clock	= tegra210_disable_cpu_clock,
>> @@ -3582,5 +3689,7 @@ static void __init tegra210_clock_init(struct device_node *np)
>>   	tegra210_mbist_clk_init();
>>   
>>   	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
>> +
>> +	register_syscore_ops(&tegra_clk_syscore_ops);
>>   }
>>   CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>> index 9e863362d2bf..96cc9937ea37 100644
>> --- a/drivers/clk/tegra/clk.c
>> +++ b/drivers/clk/tegra/clk.c
>> @@ -23,6 +23,7 @@
>>   #define CLK_OUT_ENB_W			0x364
>>   #define CLK_OUT_ENB_X			0x280
>>   #define CLK_OUT_ENB_Y			0x298
>> +#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
>>   #define CLK_OUT_ENB_SET_L		0x320
>>   #define CLK_OUT_ENB_CLR_L		0x324
>>   #define CLK_OUT_ENB_SET_H		0x328
>> @@ -205,6 +206,19 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>>   	}
>>   }
>>   
>> +void tegra_clk_set_pllp_out_cpu(bool enable)
>> +{
>> +	u32 val;
>> +
>> +	val = readl_relaxed(clk_base + CLK_OUT_ENB_Y);
>> +	if (enable)
>> +		val |= CLK_ENB_PLLP_OUT_CPU;
>> +	else
>> +		val &= ~CLK_ENB_PLLP_OUT_CPU;
>> +
>> +	writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
>> +}
>> +
>>   void tegra_cclkg_burst_policy_save_context(void)
>>   {
>>   	unsigned int i;
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 7b99496fefb9..b994dfaa9602 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -862,6 +862,7 @@ void tegra_cclkg_burst_policy_restore_context(void);
>>   void tegra_sclk_cclklp_burst_policy_save_context(void);
>>   void tegra_sclk_cpulp_burst_policy_restore_context(void);
>>   void tegra_clk_osc_resume(void __iomem *clk_base);
>> +void tegra_clk_set_pllp_out_cpu(bool enable);
>>   
>>   /* Combined read fence with delay */
>>   #define fence_udelay(delay, reg)	\
>> -- 
>> 2.7.4
>>
