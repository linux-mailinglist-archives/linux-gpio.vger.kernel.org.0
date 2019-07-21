Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 452E96F67C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfGUWoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:44:55 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18959 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfGUWoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:44:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34eaeb0002>; Sun, 21 Jul 2019 15:44:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 15:44:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 15:44:52 -0700
Received: from [10.2.164.85] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 22:44:50 +0000
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
 <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
Date:   Sun, 21 Jul 2019 15:45:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563749099; bh=/4YB/4D+OYvtr1PBXTbrPiByzZ/4P/MghOn2PPEBonA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=R4kTxPbqbd8MoZyndkRy6oHxbDrBfhhoS5GxsWRd5ckcnsA4hZ1sDI55w59h2kjvH
         M2WYNLlA4X4Cd8T034b+fleiMZCPuGlMnrWFOiMibnIn0dGI68jSvP9UzS2y73yUee
         ds18KHIEZY6fgDR3pkn729xDjAAeCBFXGFpH61Zyxe5gqDw/bTiwmzwuDAWBp05YsL
         gEW0Th0IUBx/6m4lUCUopoU8vBjhzOf7TViyAafnF6BRHp2xI6xW+Fj0yHBW7+xGJW
         nrCLlE2T/l60TPVNh459VtqqQS342qrdCAcCtkeg6e96nnHehIli94FJYjojDlO1V0
         yQ5JtJv3aQe/g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds support for clk: tegra210: suspend-resume.
>>
>> All the CAR controller settings are lost on suspend when core
>> power goes off.
>>
>> This patch has implementation for saving and restoring all PLLs
>> and clocks context during system suspend and resume to have the
>> clocks back to same state for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-tegra210.c | 68 ++++++++++++++++++++++++++++++++=
++++++--
>>   drivers/clk/tegra/clk.c          | 14 +++++++++
>>   drivers/clk/tegra/clk.h          |  1 +
>>   3 files changed, 80 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-te=
gra210.c
>> index 55a88c0824a5..68271873acc1 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/clkdev.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>> +#include <linux/syscore_ops.h>
>>   #include <linux/delay.h>
>>   #include <linux/export.h>
>>   #include <linux/mutex.h>
>> @@ -220,11 +221,15 @@
>>   #define CLK_M_DIVISOR_SHIFT 2
>>   #define CLK_M_DIVISOR_MASK 0x3
>>  =20
>> +#define CLK_MASK_ARM	0x44
>> +#define MISC_CLK_ENB	0x48
>> +
>>   #define RST_DFLL_DVCO 0x2f4
>>   #define DVFS_DFLL_RESET_SHIFT 0
>>  =20
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>   #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>> +#define CPU_SOFTRST_CTRL 0x380
>>  =20
>>   #define LVL2_CLK_GATE_OVRA 0xf8
>>   #define LVL2_CLK_GATE_OVRC 0x3a0
>> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>>   	struct tegra_clk_pll_freq_table *fentry;
>>   	struct tegra_clk_pll pllu;
>>   	u32 reg;
>> +	int ret;
>>  =20
>>   	for (fentry =3D pll_u_freq_table; fentry->input_rate; fentry++) {
>>   		if (fentry->input_rate =3D=3D pll_ref_freq)
>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>   	reg |=3D PLL_ENABLE;
>>   	writel(reg, clk_base + PLLU_BASE);
>>  =20
>> -	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>> -					  reg & PLL_BASE_LOCK, 2, 1000);
>> -	if (!(reg & PLL_BASE_LOCK)) {
>> +	ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>> +	if (ret) {
> Why this is needed? Was there a bug?
>
during resume pllu init is needed and to use same terga210_init_pllu,=20
poll_timeout_atomic can't be used as its ony for atomic context.

So changed to use wait_for_mask which should work in both cases.

>>   		pr_err("Timed out waiting for PLL_U to lock\n");
>>   		return -ETIMEDOUT;
>>   	}
>> @@ -3288,6 +3293,56 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>   }
>>  =20
>>   #ifdef CONFIG_PM_SLEEP
>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_of=
f) * 4))
>> +#define car_writel(_val, _base, _off) \
>> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
>> +
>> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
>> +static u32 cpu_softrst_ctx[3];
>> +
>> +static int tegra210_clk_suspend(void)
>> +{
>> +	unsigned int i;
>> +
>> +	clk_save_context();
>> +
>> +	/*
>> +	 * save the bootloader configured clock registers SPARE_REG0,
>> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL
> Nit: Start all multi-line comments with a capital letter and put dot in
> the end of sentence.
>
>> +	 */
>> +	spare_reg_ctx =3D readl_relaxed(clk_base + SPARE_REG0);
>> +	misc_clk_enb_ctx =3D readl_relaxed(clk_base + MISC_CLK_ENB);
>> +	clk_msk_arm_ctx =3D readl_relaxed(clk_base + CLK_MASK_ARM);
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
>> +
>> +	tegra_clk_osc_resume(clk_base);
>> +
>> +	/*
>> +	 * restore the bootloader configured clock registers SPARE_REG0,
>> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.
> Same here.
>
>> +	 */
>> +	writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
>> +	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
>> +	writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
>> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
>> +
>> +	fence_udelay(5, clk_base);
>> +
>> +	tegra210_init_pllu();
>> +	clk_restore_context();
>> +}
>> +
>>   static void tegra210_cpu_clock_suspend(void)
>>   {
>>   	/* switch coresite to clk_m, save off original source */
>> @@ -3303,6 +3358,11 @@ static void tegra210_cpu_clock_resume(void)
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
>> @@ -3587,5 +3647,7 @@ static void __init tegra210_clock_init(struct devi=
ce_node *np)
>>   	tegra210_mbist_clk_init();
>>  =20
>>   	tegra_cpu_car_ops =3D &tegra210_cpu_car_ops;
>> +
>> +	register_syscore_ops(&tegra_clk_syscore_ops);
>>   }
>>   CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>> index 573e3c967ae1..eb08047fd02f 100644
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
>> @@ -199,6 +200,19 @@ const struct tegra_clk_periph_regs *get_reg_bank(in=
t clkid)
>>   	}
>>   }
>>  =20
>> +void tegra_clk_set_pllp_out_cpu(bool enable)
>> +{
>> +	u32 val;
>> +
>> +	val =3D readl_relaxed(clk_base + CLK_OUT_ENB_Y);
>> +	if (enable)
>> +		val |=3D CLK_ENB_PLLP_OUT_CPU;
>> +	else
>> +		val &=3D ~CLK_ENB_PLLP_OUT_CPU;
>> +
>> +	writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
>> +}
>> +
>>   struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int b=
anks)
>>   {
>>   	clk_base =3D regs;
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 562a3ee2d537..0ffa763c755b 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -863,6 +863,7 @@ int div_frac_get(unsigned long rate, unsigned parent=
_rate, u8 width,
>>   		 u8 frac_width, u8 flags);
>>   void tegra_clk_sync_state_pll(struct clk_hw *hw);
>>   void tegra_clk_osc_resume(void __iomem *clk_base);
>> +void tegra_clk_set_pllp_out_cpu(bool enable);
>>  =20
>>   /* Combined read fence with delay */
>>   #define fence_udelay(delay, reg)	\
>>
