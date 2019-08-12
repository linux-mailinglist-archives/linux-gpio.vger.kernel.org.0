Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97188A6CA
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 21:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfHLTDK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 15:03:10 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11972 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfHLTDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 15:03:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d51b7ee0002>; Mon, 12 Aug 2019 12:03:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 12 Aug 2019 12:03:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 12 Aug 2019 12:03:08 -0700
Received: from [10.110.103.110] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Aug
 2019 19:03:07 +0000
Subject: Re: [PATCH v8 14/21] clk: tegra210: Add suspend and resume support
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>,
        <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <rjw@rjwysocki.net>,
        <viresh.kumar@linaro.org>, <linux-pm@vger.kernel.org>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-15-git-send-email-skomatineni@nvidia.com>
 <a21b7464-62c3-8461-04c2-a0e863bdde85@gmail.com>
 <7d101ec9-c559-8b40-1764-6bf67a9c7a7a@nvidia.com>
 <aa823801-00c7-df88-0f63-45338bffa854@gmail.com>
 <cbe94f84-a17b-7e1a-811d-89db571784e1@nvidia.com>
 <4397de5d-772d-2b04-5f87-b2988f6c96c8@gmail.com>
 <805a825e-f19d-d056-83eb-8ed1cb1c089c@nvidia.com>
 <ca90bd2b-8088-8b46-2816-95e58a4811b8@gmail.com>
 <931b027d-fdf3-220b-167a-4177fa917781@nvidia.com>
 <1779e92b-fa4d-68ab-9218-51970eee1ec5@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <cd685e84-c0de-6142-597e-f7c77604350e@nvidia.com>
Date:   Mon, 12 Aug 2019 12:03:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1779e92b-fa4d-68ab-9218-51970eee1ec5@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565636590; bh=7XlWEYCiGiAR4X4VAwgcIi0qXW4BB3NV1aG2k3zMqes=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=NxV+xcfAb0rEOnzACQQ/RLDqDAgQauE7TyHNclfrK4gFhLu+EX+/x5FimxUdQt9F8
         icqjwtFqD6xSTIsETBRORTRxunLv5s+FDQ7qdBBdDlxUeEX5OuJ4K61ImoqI44QJ+e
         Wzo/IHoabk3torINxKEu7Vp/caNsJTpXzZqpJ/NbwflMel/IHoW9RY7gsGzXq0hjeC
         MyqAJpvAVrXGlnAXMdgcLLkHa59EEbqInvOxHX9KrpWI4QR4aKrjzxt7Srhpfz4I3/
         hxbmO69uSA9IY2z2KXi7NKOKEtffXh1nL6xS4FoVyUxJYBg5mDhAB2TZT2GfaGHhoh
         OHiwDRnJ8hzgA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/12/19 11:19 AM, Dmitry Osipenko wrote:
> 12.08.2019 20:28, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/12/19 9:25 AM, Dmitry Osipenko wrote:
>>> 11.08.2019 22:15, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 8/11/19 10:39 AM, Dmitry Osipenko wrote:
>>>>> 09.08.2019 21:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> On 8/9/19 11:18 AM, Dmitry Osipenko wrote:
>>>>>>> 09.08.2019 19:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> On 8/9/19 6:56 AM, Dmitry Osipenko wrote:
>>>>>>>>> 09.08.2019 2:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>>>>>>>
>>>>>>>>>> All the CAR controller settings are lost on suspend when core
>>>>>>>>>> power goes off.
>>>>>>>>>>
>>>>>>>>>> This patch has implementation for saving and restoring all PLLs
>>>>>>>>>> and clocks context during system suspend and resume to have the
>>>>>>>>>> clocks back to same state for normal operation.
>>>>>>>>>>
>>>>>>>>>> Clock driver suspend and resume are registered as syscore_ops as=
 clocks
>>>>>>>>>> restore need to happen before the other drivers resume to have a=
ll their
>>>>>>>>>> clocks back to the same state as before suspend.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>> ---
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/clk/tegra/clk-tegra210.c | 103 +++++=
++++++++++++++++++++++++++++++++--
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/clk/tegra/clk.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 64 ++++++++++++++++++++++++
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 ++
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 3 files changed, 166 insertions(+), 4 deleti=
ons(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegr=
a/clk-tegra210.c
>>>>>>>>>> index 998bf60b219a..8dd6f4f4debb 100644
>>>>>>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>>> @@ -9,13 +9,13 @@
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/clkdev.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/of.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/of_address.h>
>>>>>>>>>> +#include <linux/syscore_ops.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/delay.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/export.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/mutex.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/clk/tegra.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/tegra210-car.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <dt-bindings/reset/tegra210-car.h>
>>>>>>>>>> -#include <linux/iopoll.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <linux/sizes.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #include <soc/tegra/pmc.h>
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 @@ -220,11 +220,15 @@
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define CLK_M_DIVISOR_SHIFT 2
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define CLK_M_DIVISOR_MASK 0x3
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 +#define CLK_MASK_ARM=C2=A0=C2=A0=C2=A0 0x44
>>>>>>>>>> +#define MISC_CLK_ENB=C2=A0=C2=A0=C2=A0 0x48
>>>>>>>>>> +
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define RST_DFLL_DVCO 0x2f4
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define DVFS_DFLL_RESET_SHIFT 0
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_=
SET 0x2a8
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2=
ac
>>>>>>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>>>>>>> @@ -2825,6 +2829,7 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll=
_freq_table *fentry;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_pll=
 pllu;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg;
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (fentry =
=3D pll_u_freq_table; fentry->input_rate; fentry++) {
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (fentry->input_rate =3D=3D pll_ref_freq)
>>>>>>>>>> @@ -2853,9 +2858,14 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg |=3D PLL_ENABLE;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(reg, clk_base=
 + PLLU_BASE);
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 readl_relaxed_poll_timeo=
ut_atomic(clk_base + PLLU_BASE, reg,
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg & PLL_B=
ASE_LOCK, 2, 1000);
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0 if (!(reg & PLL_BASE_LOCK)) {
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * During clocks resume, same PLLU init=
 and enable sequence get
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * executed. So, readx_poll_timeout_ato=
mic can't be used here as it
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * uses ktime_get() and timekeeping res=
ume doesn't happen by that
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * time. So, using tegra210_wait_for_ma=
sk for PLL LOCK.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D tegra210_wait_for_mask(&pllu, PLLU_B=
ASE, PLL_BASE_LOCK);
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret) {
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pr_err("Timed out waiting for PLL_U to lock\n");
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -ETIMEDOUT;
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>> @@ -3288,6 +3298,84 @@ static void tegra210_disable_cpu_clock(u3=
2 cpu)
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0 #ifdef CONFIG_PM_SLEEP
>>>>>>>>>> +/*
>>>>>>>>>> + * This array lists mask values for each peripheral clk bank
>>>>>>>>>> + * to mask out reserved bits during the clocks state restore
>>>>>>>>>> + * on SC7 resume to prevent accidental writes to these reserved
>>>>>>>>>> + * bits.
>>>>>>>>>> + */
>>>>>>>>>> +static u32 periph_clk_rsvd_mask[TEGRA210_CAR_BANK_COUNT] =3D {
>>>>>>>>> Should be more natural to have a "valid_mask" instead of "rsvd_ma=
sk".
>>>>>>>>>
>>>>>>>>> What's actually wrong with touching of the reserved bits? They mu=
st be NO-OP.. or the
>>>>>>>>> reserved bits are actually some kind of "secret" bits? If those b=
its have some use-case
>>>>>>>>> outside of Silicon HW (like FPGA simulation), then this doesn't m=
atter for upstream
>>>>>>>>> and you
>>>>>>>>> have to keep the workaround locally in the downstream kernel or w=
hatever.
>>>>>>>> Will rename as valid_mask.
>>>>>>>>
>>>>>>>> some bits in these registers are undefined and is not good to writ=
e to these bits as
>>>>>>>> they
>>>>>>>> can cause pslverr.
>>>>>>> Okay, it should be explained in the comment.
>>>>>>>
>>>>>>> Is it possible to disable trapping of changing the undefined bits?
>>>>>> No its internal to design
>>>>> Okay.
>>>>>
>>>>> Also, what about to move the valid_mask into struct tegra_clk_periph_=
regs?
>>>> No, we cannot move to tegra_clk_periph_regs as its in tegra/clk.c and =
is common for all
>>>> tegra.
>>>>
>>>> Reserved bits are different on tegra chips so should come from Tegra c=
hip specific clock
>>>> driver like
>>>>
>>>> clk-tegra210 for Tegra210.
>>> Could you please check whether the reserved bits are RAZ (read as zero)=
?
>>>
>>> [snip]
>> yes all reserved bits of clk_enb register is 0. This should not be set t=
o 1.
>>
>> As I will be changing to variable name to valid_mask instead of reserved=
 mask, will also
>> change values to valid mask so it can be used directly to write to clk_e=
nb for enabling all
>> peripherals clks.
>>
> It looks to me that the tegra_clk_periph_force_on() could be made local t=
o the
> clk-tegra210.c and then the raw clk_enb values could be written directly =
instead of having
> the clk_enb[] array, probably that will be a bit cleaner

All CLK_OUT_ENB* registers are already defined in clk driver and also=20
periph_regs includes all of these to use.

To write value to enable all clocks directly without array, it need=20
total 7 individual register writes for Tegra210. Also when=20
suspend/resume is implemented for other prior tegras, they need to do=20
same in tegra clock driver.

Reason I had this in clock driver is, this can be used by all tegra=20
clock drivers and just can pass valid clocks values.

But doing individual register write with direct hard code values in=20
corresponding tegra clock driver is preferred still, will update so in=20
next revision and will move all the CLK_OUT_ENB* register defines to=20
tegra/clk.h

Currently RST_DEVICES & CLK_OUT_ENB are all in tegra/clk.c

> .
