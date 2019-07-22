Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FCE6F9B8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfGVGwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:52:10 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18434 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfGVGwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 02:52:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d355d170001>; Sun, 21 Jul 2019 23:52:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 23:52:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 23:52:06 -0700
Received: from [10.2.164.85] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 06:52:04 +0000
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
 <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
 <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
Date:   Sun, 21 Jul 2019 23:52:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563778327; bh=vP4SkrYhYzNNAV0+qE7l5liBK1EkC1O/3ORz0+36xyk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=oRszHZrrLbse1VsHTfLZCJVDskALYwFTfitoo8lsVDQjVx1vdxM/eLXB9cExxXfuJ
         UZM07KoadfAWcEZXsci7QmVSzQX82Ic1NLIm2N5HOfKOkJT6PqQHUsfsS6LKdF8uxA
         +CQdyZPLlNMaFj/MC4Peu2TFI8bTmTHyCn2J8QPM3ACh5TkJ6UGIKQLtApFp1hPYML
         s4gE5p+b5PVbe638JFDJ0AoMLuUMYUxSSL5elMRKEEnmzLrjh2omUdNnEVbJuhI1oT
         aDB8PkHE5WrPBWxYz0nW7bfj9kK4Ea1tAUnm/dyfWlvftLZum+CArsgyO4ZQb/ZaTV
         a+R3egfLcZ8Sg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 11:10 PM, Dmitry Osipenko wrote:
> 22.07.2019 1:45, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>
>>>> All the CAR controller settings are lost on suspend when core
>>>> power goes off.
>>>>
>>>> This patch has implementation for saving and restoring all PLLs
>>>> and clocks context during system suspend and resume to have the
>>>> clocks back to same state for normal operation.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/clk/tegra/clk-tegra210.c | 68
>>>> ++++++++++++++++++++++++++++++++++++++--
>>>>  =C2=A0 drivers/clk/tegra/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 14 +++++++++
>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>  =C2=A0 3 files changed, 80 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>>>> b/drivers/clk/tegra/clk-tegra210.c
>>>> index 55a88c0824a5..68271873acc1 100644
>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>> @@ -9,6 +9,7 @@
>>>>  =C2=A0 #include <linux/clkdev.h>
>>>>  =C2=A0 #include <linux/of.h>
>>>>  =C2=A0 #include <linux/of_address.h>
>>>> +#include <linux/syscore_ops.h>
>>>>  =C2=A0 #include <linux/delay.h>
>>>>  =C2=A0 #include <linux/export.h>
>>>>  =C2=A0 #include <linux/mutex.h>
>>>> @@ -220,11 +221,15 @@
>>>>  =C2=A0 #define CLK_M_DIVISOR_SHIFT 2
>>>>  =C2=A0 #define CLK_M_DIVISOR_MASK 0x3
>>>>  =C2=A0 +#define CLK_MASK_ARM=C2=A0=C2=A0=C2=A0 0x44
>>>> +#define MISC_CLK_ENB=C2=A0=C2=A0=C2=A0 0x48
>>>> +
>>>>  =C2=A0 #define RST_DFLL_DVCO 0x2f4
>>>>  =C2=A0 #define DVFS_DFLL_RESET_SHIFT 0
>>>>  =C2=A0 =C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>  =C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>  =C2=A0 =C2=A0 #define LVL2_CLK_GATE_OVRA 0xf8
>>>>  =C2=A0 #define LVL2_CLK_GATE_OVRC 0x3a0
>>>> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll_freq_table *fentr=
y;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll pllu;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg;
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (fentry =3D pll_u_freq_tabl=
e; fentry->input_rate; fentry++) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fentry->in=
put_rate =3D=3D pll_ref_freq)
>>>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg |=3D PLL_ENABLE;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(reg, clk_base + PLLU_BASE);
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 readl_relaxed_poll_timeout_atomic(clk_base=
 + PLLU_BASE, reg,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg & PLL_BASE_LO=
CK, 2, 1000);
>>>> -=C2=A0=C2=A0=C2=A0 if (!(reg & PLL_BASE_LOCK)) {
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, P=
LL_BASE_LOCK);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>> Why this is needed? Was there a bug?
>>>
>> during resume pllu init is needed and to use same terga210_init_pllu,
>> poll_timeout_atomic can't be used as its ony for atomic context.
>>
>> So changed to use wait_for_mask which should work in both cases.
> Atomic variant could be used from any context, not sure what do you
> mean. The 'atomic' part only means that function won't cause scheduling
> and that's it.

Sorry, replied incorrect. readx_poll_timeout_atomic uses ktime_get() and=20
during resume timekeeping suspend/resume happens later than clock=20
suspend/resume. So using tegra210_wait_for_mask.

both timekeeping and clk-tegra210 drivers are registered as syscore but=20
not ordered.

>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Timed =
out waiting for PLL_U to lock\n");
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ETIMED=
OUT;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> @@ -3288,6 +3293,56 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>>>  =C2=A0 }
>>>>  =C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) +
>>>> ((_off) * 4))
>>>> +#define car_writel(_val, _base, _off) \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(_val, clk_b=
ase + (_base) + ((_off) * 4))
>>>> +
>>>> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
>>>> +static u32 cpu_softrst_ctx[3];
>>>> +
>>>> +static int tegra210_clk_suspend(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 clk_save_context();
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * save the bootloader configured clock regis=
ters SPARE_REG0,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CT=
RL
>>> Nit: Start all multi-line comments with a capital letter and put dot in
>>> the end of sentence.
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 spare_reg_ctx =3D readl_relaxed(clk_base + SPARE_R=
EG0);
>>>> +=C2=A0=C2=A0=C2=A0 misc_clk_enb_ctx =3D readl_relaxed(clk_base + MISC=
_CLK_ENB);
>>>> +=C2=A0=C2=A0=C2=A0 clk_msk_arm_ctx =3D readl_relaxed(clk_base + CLK_M=
ASK_ARM);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++=
)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_softrst_ctx[i] =3D car=
_readl(CPU_SOFTRST_CTRL, i);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static void tegra210_clk_resume(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 tegra_clk_osc_resume(clk_base);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * restore the bootloader configured clock re=
gisters SPARE_REG0,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CT=
RL from saved context.
>>> Same here.
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG=
0);
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_C=
LK_ENB);
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MAS=
K_ARM);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++=
)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 car_writel(cpu_softrst_ctx=
[i], CPU_SOFTRST_CTRL, i);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 fence_udelay(5, clk_base);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 tegra210_init_pllu();
>>>> +=C2=A0=C2=A0=C2=A0 clk_restore_context();
>>>> +}
>>>> +
>>>>  =C2=A0 static void tegra210_cpu_clock_suspend(void)
>>>>  =C2=A0 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* switch coresite to clk_m, save off =
original source */
>>>> @@ -3303,6 +3358,11 @@ static void tegra210_cpu_clock_resume(void)
>>>>  =C2=A0 }
>>>>  =C2=A0 #endif
>>>>  =C2=A0 +static struct syscore_ops tegra_clk_syscore_ops =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .suspend =3D tegra210_clk_suspend,
>>>> +=C2=A0=C2=A0=C2=A0 .resume =3D tegra210_clk_resume,
>>>> +};
>>>> +
>>>>  =C2=A0 static struct tegra_cpu_car_ops tegra210_cpu_car_ops =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .wait_for_reset=C2=A0=C2=A0=C2=A0 =3D =
tegra210_wait_cpu_in_reset,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .disable_clock=C2=A0=C2=A0=C2=A0 =3D t=
egra210_disable_cpu_clock,
>>>> @@ -3587,5 +3647,7 @@ static void __init tegra210_clock_init(struct
>>>> device_node *np)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra210_mbist_clk_init();
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_cpu_car_ops =3D &tegra210=
_cpu_car_ops;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 register_syscore_ops(&tegra_clk_syscore_ops);
>>>>  =C2=A0 }
>>>>  =C2=A0 CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock=
_init);
>>>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>>>> index 573e3c967ae1..eb08047fd02f 100644
>>>> --- a/drivers/clk/tegra/clk.c
>>>> +++ b/drivers/clk/tegra/clk.c
>>>> @@ -23,6 +23,7 @@
>>>>  =C2=A0 #define CLK_OUT_ENB_W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x364
>>>>  =C2=A0 #define CLK_OUT_ENB_X=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x280
>>>>  =C2=A0 #define CLK_OUT_ENB_Y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x298
>>>> +#define CLK_ENB_PLLP_OUT_CPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(31)
>>>>  =C2=A0 #define CLK_OUT_ENB_SET_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x320
>>>>  =C2=A0 #define CLK_OUT_ENB_CLR_L=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x324
>>>>  =C2=A0 #define CLK_OUT_ENB_SET_H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x328
>>>> @@ -199,6 +200,19 @@ const struct tegra_clk_periph_regs
>>>> *get_reg_bank(int clkid)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>>  =C2=A0 +void tegra_clk_set_pllp_out_cpu(bool enable)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 u32 val;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 val =3D readl_relaxed(clk_base + CLK_OUT_ENB_Y);
>>>> +=C2=A0=C2=A0=C2=A0 if (enable)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D CLK_ENB_PLLP_OUT_=
CPU;
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val &=3D ~CLK_ENB_PLLP_OUT=
_CPU;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, clk_base + CLK_OUT_ENB_Y);
>>>> +}
>>>> +
>>>>  =C2=A0 struct clk ** __init tegra_clk_init(void __iomem *regs, int nu=
m,
>>>> int banks)
>>>>  =C2=A0 {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_base =3D regs;
>>>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>>>> index 562a3ee2d537..0ffa763c755b 100644
>>>> --- a/drivers/clk/tegra/clk.h
>>>> +++ b/drivers/clk/tegra/clk.h
>>>> @@ -863,6 +863,7 @@ int div_frac_get(unsigned long rate, unsigned
>>>> parent_rate, u8 width,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 frac_=
width, u8 flags);
>>>>  =C2=A0 void tegra_clk_sync_state_pll(struct clk_hw *hw);
>>>>  =C2=A0 void tegra_clk_osc_resume(void __iomem *clk_base);
>>>> +void tegra_clk_set_pllp_out_cpu(bool enable);
>>>>  =C2=A0 =C2=A0 /* Combined read fence with delay */
>>>>  =C2=A0 #define fence_udelay(delay, reg)=C2=A0=C2=A0=C2=A0 \
>>>>
