Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A57678A4
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 07:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfGMFy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 01:54:27 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7782 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfGMFy1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 01:54:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d29720a0001>; Fri, 12 Jul 2019 22:54:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 12 Jul 2019 22:54:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 12 Jul 2019 22:54:24 -0700
Received: from [10.2.168.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 13 Jul
 2019 05:54:20 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-12-git-send-email-skomatineni@nvidia.com>
 <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a9b5c364-52b4-bee1-5881-47197f043950@nvidia.com>
Date:   Fri, 12 Jul 2019 22:54:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562997259; bh=JdcMwDSi7TpMeWiXpjZzROOFWkzDtUQMjUji9Ib0gvQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=AFpDvj1FOUWclobnGdMUJSG1Ruv4AHHQ+oE8BkXTLsN1poZ7kpgc8zneJmHyrPWI3
         Fp8td3RzxwlkrEP2Hzy25f3isU2S2a9ekSEAmOTYdwgXGLmCoagdHFeqEPwBobCDAo
         bS5Pyj43wE3jtr7O0kMEDG+KY3OCv2QIyLdRarU27jNOMRSN4d22eq4rScGNuumHp3
         S0RIJ8n23kC7C/kXybcDviuoiLel+7eAMENNnF48M74mdzNcLUdhybG/AeZv8yXWQO
         fhjunbwf819FllEoEkb+O3FynD8kHQl4JYlvJ0vi5FLohuXmC6tz+Ju0JN6UJ+g+sk
         0L8qhRUgYUkvQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/29/19 8:10 AM, Dmitry Osipenko wrote:
> 28.06.2019 5:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra210.c | 115 +++++++++++++++++++++++++++++++=
+++++++-
>>   drivers/clk/tegra/clk.c          |  14 +++++
>>   drivers/clk/tegra/clk.h          |   1 +
>>   3 files changed, 127 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-te=
gra210.c
>> index 1c08c53482a5..1b839544e086 100644
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
>>  =20
>>   #include "clk.h"
>> +#include "clk-dfll.h"
>>   #include "clk-id.h"
>>  =20
>>   /*
>> @@ -225,6 +228,7 @@
>>  =20
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>> +#define CPU_SOFTRST_CTRL 0x380
>>  =20
>>   #define LVL2_CLK_GATE_OVRA 0xf8
>>   #define LVL2_CLK_GATE_OVRC 0x3a0
>> @@ -2820,6 +2824,7 @@ static int tegra210_enable_pllu(void)
>>   	struct tegra_clk_pll_freq_table *fentry;
>>   	struct tegra_clk_pll pllu;
>>   	u32 reg;
>> +	int ret;
>>  =20
>>   	for (fentry =3D pll_u_freq_table; fentry->input_rate; fentry++) {
>>   		if (fentry->input_rate =3D=3D pll_ref_freq)
>> @@ -2847,10 +2852,10 @@ static int tegra210_enable_pllu(void)
>>   	fence_udelay(1, clk_base);
>>   	reg |=3D PLL_ENABLE;
>>   	writel(reg, clk_base + PLLU_BASE);
>> +	fence_udelay(1, clk_base);
>>  =20
>> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>> -					  reg & PLL_BASE_LOCK, 2, 1000);
>> -	if (!(reg & PLL_BASE_LOCK)) {
>> +	ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>> +	if (ret) {
>>   		pr_err("Timed out waiting for PLL_U to lock\n");
>>   		return -ETIMEDOUT;
>>   	}
>> @@ -3283,6 +3288,103 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>   }
>>  =20
>>   #ifdef CONFIG_PM_SLEEP
>> +static u32 cpu_softrst_ctx[3];
>> +static struct platform_device *dfll_pdev;
>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_of=
f) * 4))
>> +#define car_writel(_val, _base, _off) \
>> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>> +
>> +static int tegra210_clk_suspend(void)
>> +{
>> +	unsigned int i;
>> +	struct device_node *node;
>> +
>> +	tegra_cclkg_burst_policy_save_context();
>> +
>> +	if (!dfll_pdev) {
>> +		node =3D of_find_compatible_node(NULL, NULL,
>> +					       "nvidia,tegra210-dfll");
>> +		if (node)
>> +			dfll_pdev =3D of_find_device_by_node(node);
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
>> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>> +		cpu_softrst_ctx[i] =3D car_readl(CPU_SOFTRST_CTRL, i);
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra210_clk_resume(void)
>> +{
>> +	unsigned int i;
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
>> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
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
>> +	parent =3D clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
>> +	clk =3D clks[TEGRA210_CLK_PLL_X];
>> +	if (parent !=3D __clk_get_hw(clk))
>> +		tegra_clk_sync_state_pll(__clk_get_hw(clk));
>> +
>> +	/* Disable PLL_OUT_CPU after DFLL resume */
>> +	tegra_clk_set_pllp_out_cpu(false);
>> +}
>> +
>>   static void tegra210_cpu_clock_suspend(void)
>>   {
>>   	/* switch coresite to clk_m, save off original source */
>> @@ -3298,6 +3400,11 @@ static void tegra210_cpu_clock_resume(void)
>>   }
>>   #endif
>>  =20
>> +static struct syscore_ops tegra_clk_syscore_ops =3D {
>> +	.suspend =3D tegra210_clk_suspend,
>> +	.resume =3D tegra210_clk_resume,
>> +};
>> +
>>   static struct tegra_cpu_car_ops tegra210_cpu_car_ops =3D {
>>   	.wait_for_reset	=3D tegra210_wait_cpu_in_reset,
>>   	.disable_clock	=3D tegra210_disable_cpu_clock,
>> @@ -3583,5 +3690,7 @@ static void __init tegra210_clock_init(struct devi=
ce_node *np)
>>   	tegra210_mbist_clk_init();
>>  =20
>>   	tegra_cpu_car_ops =3D &tegra210_cpu_car_ops;
>> +
>> +	register_syscore_ops(&tegra_clk_syscore_ops);
>>   }
> Is it really worthwhile to use syscore_ops for suspend/resume given that =
drivers for
> won't resume before the CLK driver anyway? Are there any other options fo=
r CLK
> suspend/resume?
>
> I'm also not sure whether PM runtime API could be used at all in the cont=
ext of
> syscore_ops ..
>
> Secondly, what about to use generic clk_save_context() / clk_restore_cont=
ext()
> helpers for the suspend-resume? It looks to me that some other essential =
(and proper)
> platform driver (soc/tegra/? PMC?) should suspend-resume the clocks using=
 the generic
> CLK Framework API.

Clock resume should happen very early to restore peripheral and cpu=20
clocks very early than peripheral drivers resume happens.

this patch series uses clk_save_context and clk_restore_context for=20
corresponding divider, pll, pllout.. save and restore context.

But as there is dependency on dfll resume and cpu and pllx clocks=20
restore, couldnt use clk_save_context and clk_restore_context for dfll.

So implemented recommended dfll resume sequence in main Tegra210 clock=20
driver along with invoking clk_save_context/clk_restore_context where=20
all other clocks save/restore happens as per clock tree traversal.

