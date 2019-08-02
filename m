Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3518034A
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Aug 2019 01:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732045AbfHBXwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 19:52:06 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19159 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfHBXwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 19:52:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d44ccaa0004>; Fri, 02 Aug 2019 16:52:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 02 Aug 2019 16:52:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 16:52:00 -0700
Received: from [10.2.165.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 23:51:59 +0000
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
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
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
 <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
 <67cf6c13-688d-0305-61e2-c63c8e8b4729@nvidia.com>
 <550de191-f982-4544-6fbc-bf16dfeae2c6@nvidia.com>
 <c85ba067-af68-0b4a-d347-501ed7ed0ef9@gmail.com>
 <a81b85a2-5634-cfa2-77c5-94c23c4847bd@nvidia.com>
 <ef9e865f-359b-0873-a414-3d548bd4e590@gmail.com>
 <50bad1d3-df41-d1e5-a7c7-4be9c661ed14@nvidia.com>
 <62a5c6ed-21b1-8403-6fac-9c5d99b5a255@gmail.com>
 <85cd5100-467e-d08e-0ae5-ae57a6de5312@nvidia.com>
 <61652889-2e77-8f1e-9ed4-b7e525a40b10@nvidia.com>
 <9f6fc791-5c76-76d5-98fb-fd8facfd75d7@nvidia.com>
 <8bca50b2-a78c-c6b1-6547-4cec98a3e9cb@gmail.com>
 <314b5572-4113-d5c5-5956-1a55555a573c@nvidia.com>
 <a64472fd-46b7-5ff9-3140-11f71d5f88ff@gmail.com>
 <90268663-e5a7-4715-bd1a-31644c2fe9ab@gmail.com>
 <c6e1d744-3a7a-fe1b-2c86-a3d49f022232@nvidia.com>
 <73cd521b-782c-7fb2-d904-ae8b07927d47@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d82de63a-02a3-8fb0-57e7-7fe00d6b86ab@nvidia.com>
Date:   Fri, 2 Aug 2019 16:51:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <73cd521b-782c-7fb2-d904-ae8b07927d47@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564789930; bh=brVEnoDA2u1ZoizrNbotUjy3VdBQNuX5IXBvm9TpBjE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Qn/Gdm8CUJscLYBWtmMOI809KqcLqiC+0i7v7BZ2l1iEwOuiAfR155I/a67vfWrKk
         fU8bGRa4Rcqk+XG3liWHwXfyLBb8pg/SxPmU21LQB/oiPA/BCqKTWs5FdmnsUqPUgB
         rJYq5KhgB/V1L5dkRkNvgG0XxlxHVdIPbDPyiDXqDbrg8mNpE/i1hHw+Rp+Lc/ChwA
         4L89uQzJAv/4JyoPKHzjHuzxsoy0iqat1hVmktKdPoZPKMMr8A7v5T5h7qTFFRBDbu
         mJ/u4ItobSwO2d+eohGoUUdm3JfBo1Omm64B9PaEAqFgado+awSHbv5Tr9qdObW/uS
         5/KsDzgvo3q5w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/2/19 2:15 PM, Dmitry Osipenko wrote:
> 02.08.2019 23:32, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/2/19 1:17 PM, Dmitry Osipenko wrote:
>>> 02.08.2019 23:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 02.08.2019 21:33, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 8/2/19 5:38 AM, Dmitry Osipenko wrote:
>>>>>> 02.08.2019 2:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 8/1/19 4:19 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 8/1/19 2:30 PM, Sowjanya Komatineni wrote:
>>>>>>>>> On 8/1/19 1:54 PM, Dmitry Osipenko wrote:
>>>>>>>>>> 01.08.2019 23:31, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>> On 8/1/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>> 01.08.2019 22:42, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>>>> On 8/1/19 12:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>> 01.08.2019 20:58, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>> On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>> 31.07.2019 12:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>>>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>> This patch implements save and restore context for
>>>>>>>>>>>>>>>>>>> peripheral
>>>>>>>>>>>>>>>>>>> fixed
>>>>>>>>>>>>>>>>>>> clock ops, peripheral gate clock ops, sdmmc mux clock
>>>>>>>>>>>>>>>>>>> ops, and
>>>>>>>>>>>>>>>>>>> peripheral clock ops.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> During system suspend, core power goes off and looses t=
he
>>>>>>>>>>>>>>>>>>> settings
>>>>>>>>>>>>>>>>>>> of the Tegra CAR controller registers.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> So during suspend entry clock and reset state of
>>>>>>>>>>>>>>>>>>> peripherals is
>>>>>>>>>>>>>>>>>>> saved
>>>>>>>>>>>>>>>>>>> and on resume they are restored to have clocks back to
>>>>>>>>>>>>>>>>>>> same
>>>>>>>>>>>>>>>>>>> rate and
>>>>>>>>>>>>>>>>>>> state as before suspend.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni
>>>>>>>>>>>>>>>>>>> <skomatineni@nvidia.com>
>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/clk/tegra=
/clk-periph-fixed.c | 33
>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/clk/tegra=
/clk-periph-gate.c=C2=A0 | 34
>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/clk/tegra=
/clk-periph.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37
>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/clk/tegra=
/clk-sdmmc-mux.c=C2=A0=C2=A0=C2=A0 | 28
>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drivers/clk/tegra=
/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 6 ++++++
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 files changed, =
138 insertions(+)
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>> index c088e7a280df..21b24530fa00 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>> @@ -60,11 +60,44 @@
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate(struct
>>>>>>>>>>>>>>>>>>> clk_hw *hw,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return (unsigned long)rate;
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +static int
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_save_context(struct
>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixe=
d =3D
>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32)=
;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fixed->enb_ctx =3D readl_relaxed(fi=
xed->base +
>>>>>>>>>>>>>>>>>>> fixed->regs->enb_reg) &
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mask;
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fixed->rst_ctx =3D readl_relaxed(fi=
xed->base +
>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg) &
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mask;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +static void
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context(struct
>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixe=
d =3D
>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32)=
;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (fixed->enb_ctx)
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_rela=
xed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>> fixed->regs->enb_set_reg);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_rela=
xed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>> fixed->regs->enb_clr_reg);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(2);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!fixed->rst_ctx) {
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udelay(5); =
/* reset propogation delay */
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_rela=
xed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const stru=
ct clk_ops
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_ops
>>>>>>>>>>>>>>>>>>> =3D {
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .is_enabled =3D
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_is_enabled,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .enable =3D tegra_clk_periph_fixed_enable,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .disable =3D tegra_clk_periph_fixed_disable,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .recalc_rate =3D
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate,
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D tegra_clk_periph_=
fixed_save_context,
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D
>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 struct clk
>>>>>>>>>>>>>>>>>>> *tegra_clk_register_periph_fixed(const
>>>>>>>>>>>>>>>>>>> char
>>>>>>>>>>>>>>>>>>> *name,
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>> @@ -25,6 +25,8 @@ static
>>>>>>>>>>>>>>>>>>> DEFINE_SPINLOCK(periph_ref_lock);
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 #define re=
ad_rst(gate) \
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 readl_relaxed(gate->clk_base +
>>>>>>>>>>>>>>>>>>> (gate->regs->rst_reg))
>>>>>>>>>>>>>>>>>>> +#define write_rst_set(val, gate) \
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, gate->clk_base =
+
>>>>>>>>>>>>>>>>>>> (gate->regs->rst_set_reg))
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #define write_rst=
_clr(val, gate) \
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>>>>>>>> (gate->regs->rst_clr_reg))
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @@ -110,10 +112,4=
2 @@ static void
>>>>>>>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>> spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +static int clk_p=
eriph_gate_save_context(struct
>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *gate =
=3D
>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 gate->clk_state_ctx =3D read_enb(ga=
te) &
>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 gate->rst_state_ctx =3D read_rst(ga=
te) &
>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +static void clk_periph_gate_restore_context(struct
>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *gate =
=3D
>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (gate->clk_state_ctx)
>>>>>>>>>>>>>>>>>>> + write_enb_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>> + write_enb_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(5);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(gate->flags & TEGRA_PERIPH_NO=
_RESET) &&
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(gate->fla=
gs & TEGRA_PERIPH_MANUAL_RESET)) {
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gate->r=
st_state_ctx)
>>>>>>>>>>>>>>>>>>> + write_rst_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>> + write_rst_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct clk_=
ops tegra_clk_periph_gate_ops =3D {
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .is_enabled =3D clk_periph_is_enabled,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .enable =3D clk_periph_enable,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 .disable =3D clk_periph_disable,
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D clk_periph_gate_s=
ave_context,
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D clk_periph_gat=
e_restore_context,
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 struct clk=
 *tegra_clk_register_periph_gate(const
>>>>>>>>>>>>>>>>>>> char *name,
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>> index 58437da25156..06fb62955768 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struc=
t
>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 gate_ops->disable(gate_hw);
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +static int clk_p=
eriph_save_context(struct
>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =3D=
 to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =3D =
periph->gate_ops;
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &periph-=
>gate.hw;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags & TEGRA_PE=
RIPH_NO_GATE))
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gate_ops->s=
ave_context(gate_hw);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 periph->parent_ctx =3D clk_periph_g=
et_parent(hw);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +static void clk_periph_restore_context(struct clk_hw
>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =3D=
 to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =3D =
periph->gate_ops;
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &periph-=
>gate.hw;
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *div_ops =3D p=
eriph->div_ops;
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *div_hw =3D &periph->=
divider.hw;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 clk_periph_set_parent(hw, periph->p=
arent_ctx);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags & TEGRA_PE=
RIPH_NO_DIV))
>>>>>>>>>>>>>>>>>>> + div_ops->restore_context(div_hw);
>>>>>>>>>>>>>>>>>> Could you please point to where the divider's
>>>>>>>>>>>>>>>>>> save_context()
>>>>>>>>>>>>>>>>>> happens?
>>>>>>>>>>>>>>>>>> Because I can't see it.
>>>>>>>>>>>>>>>>> Ah, I now see that there is no need to save the dividers
>>>>>>>>>>>>>>>>> context
>>>>>>>>>>>>>>>>> because
>>>>>>>>>>>>>>>>> clk itself has enough info that is needed for the context=
's
>>>>>>>>>>>>>>>>> restoring
>>>>>>>>>>>>>>>>> (like I pointed in the review to v6).
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Looks like you could also implement a new
>>>>>>>>>>>>>>>>> clk_hw_get_parent_index()
>>>>>>>>>>>>>>>>> generic helper to get the index instead of storing it
>>>>>>>>>>>>>>>>> manually.
>>>>>>>>>>>>>>>> clk_periph_get_parent basically invokes existing clk_mux_o=
ps
>>>>>>>>>>>>>>>> get_parent() which is then saved in tegra_clk_periph.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> All existing drivers are using directly get_parent() from
>>>>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>>>>> which actually gets index from the register read.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> To have this more generic w.r.t save/restore context
>>>>>>>>>>>>>>>> point of
>>>>>>>>>>>>>>>> view,
>>>>>>>>>>>>>>>> probably instead of implementing new get_parent_index
>>>>>>>>>>>>>>>> helper,
>>>>>>>>>>>>>>>> I think
>>>>>>>>>>>>>>>> its better to implement save_context and restore_context t=
o
>>>>>>>>>>>>>>>> clk_mux_ops along with creating parent_index field into
>>>>>>>>>>>>>>>> clk_mux to
>>>>>>>>>>>>>>>> cache index during set_parent.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> So we just need to invoke mux_ops save_context and
>>>>>>>>>>>>>>>> restore_context.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I hope its ok to add save/restore context to clk_mux_ops
>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>> more
>>>>>>>>>>>>>>> generic w.r.t save/restore context rather than
>>>>>>>>>>>>>>> get_parent_index
>>>>>>>>>>>>>>> API.
>>>>>>>>>>>>>>> Please confirm if you agree.
>>>>>>>>>>>>>> Sounds like a good idea. I see that there is a 'restoring'
>>>>>>>>>>>>>> helper for
>>>>>>>>>>>>>> the generic clk_gate, seems something similar could be done
>>>>>>>>>>>>>> for the
>>>>>>>>>>>>>> clk_mux. And looks like anyway you'll need to associate the
>>>>>>>>>>>>>> parent
>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>> with the hw index in order to restore the muxing.
>>>>>>>>>>>>> by 'restoring' helper for generic clk_gate, are you
>>>>>>>>>>>>> referring to
>>>>>>>>>>>>> clk_gate_restore_context API?
>>>>>>>>>>>> Yes.
>>>>>>>>>>>>
>>>>>>>>>>>>> clk_gate_restore_context is API that's any clk drivers can
>>>>>>>>>>>>> use for
>>>>>>>>>>>>> clk_gate operation restore for custom gate clk_ops.
>>>>>>>>>>>>>
>>>>>>>>>>>>> But clk-periph is directly using generic clk_mux ops from
>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>> so I
>>>>>>>>>>>>> think we should add .restore_context to clk_mux_ops and then
>>>>>>>>>>>>> during
>>>>>>>>>>>>> clk-periph restore need to invoke mux_ops->restore_context.
>>>>>>>>>>>> I'm not sure whether it will be good for every driver that use=
s
>>>>>>>>>>>> generic
>>>>>>>>>>>> clk_mux ops. Should be more flexible to have a generic helper
>>>>>>>>>>>> function
>>>>>>>>>>>> that any driver could use in order to restore the clock's
>>>>>>>>>>>> parent.
>>>>>>>>>>>>
>>>>>>>>>>>> The clk-periph restoring also includes case of combining divid=
er
>>>>>>>>>>>> and
>>>>>>>>>>>> parent restoring, so generic helper could be useful in that ca=
se
>>>>>>>>>>>> as well.
>>>>>>>>>>>>
>>>>>>>>>>>> It also looks like you could actually use the
>>>>>>>>>>>> clk_gate_restore_context()
>>>>>>>>>>>> instead of manually saving the clock's enable-state, couldn't
>>>>>>>>>>>> you?
>>>>>>>>>>> ok for clk_mux, can add generic clk_mux_restore_context API
>>>>>>>>>>> rather
>>>>>>>>>>> than
>>>>>>>>>>> using restore_context in clk_ops and will invoke that during
>>>>>>>>>>> clk_periph
>>>>>>>>>>> restore.
>>>>>>>>>>>
>>>>>>> digging thru looks like for clk_periph source restore instead of
>>>>>>> clk_mux_restore_context, i can directly do clk_hw_get_parent and
>>>>>>> clk_set_parent with mux_hw as they invoke mux_ops get/set parent
>>>>>>> anyway.
>>>>>>> Will do this for periph clk mux

Just to be clear, clk_mux don't have cached parent. get_parent is by=20
register read. So, cant directly use get_parent and then set during restore=
.

So will create both clk_mux_save/restore_context in generic clk driver=20
and will invoke them during tegra peripheral clock suspend/resume.



>>>>>>>>>>> Reg clk_gate, looks like we cant use generic
>>>>>>>>>>> clk_gate_restore_context
>>>>>>>>>>> for clk-periph as it calls enable/disable callbacks and
>>>>>>>>>>> clk_periph_enable/disable in clk-periph-gate also updated
>>>>>>>>>>> refcnt and
>>>>>>>>>>> depending on that actual enable/disable is set.
>>>>>>>>>>>
>>>>>>>>>>> During suspend, peripherals that are already enabled have their
>>>>>>>>>>> refcnt >
>>>>>>>>>>> 1, so they dont go thru enable/disable on restore if we use sam=
e
>>>>>>>>>>> enable/disable callback.
>>>>>>>>>> Looks like you could just decrement the gate's enable_refcnt on
>>>>>>>>>> save_context, wouldn't that work?
>>>>>>>>>>
>>>>>>>> gate->enable_refcnt is within clk-periph-gate which gets updated
>>>>>>>> when
>>>>>>>> enable/disable callbacks get execute thru clk_core_enable/disable.
>>>>>>>> But actual enable_count used in clk_gate_restore_context is the on=
e
>>>>>>>> which gets updated with in the clk core enable/disable functions
>>>>>>>> which
>>>>>>>> invokes these callbacks. Depending on this enable_count in clk
>>>>>>>> core it
>>>>>>>> invokes enable/disable.
>>>>>>>>
>>>>>>>> So, this will cause mismatch if we handle refcnt during save/resto=
re
>>>>>>>> of tegra_clk_periph_gate_ops and also enable/disable thru this
>>>>>>>> clk_gate_restore_context is based on enable_count from clk core.
>>>>>>>>
>>>>>>>>>>> Also to align exact reset state along with CLK (like for case
>>>>>>>>>>> where
>>>>>>>>>>> CLK
>>>>>>>>>>> is enabled but peripheral might be in reset state), implemented
>>>>>>>>>>> save/restore in tegra specific tegra_clk_periph_gate_ops
>>>>>>>>>> I'm wondering whether instead of saving/restoring reset-state of
>>>>>>>>>> every
>>>>>>>>>> clock, you could simply save/restore the whole RST_DEV_x_SET
>>>>>>>>>> register.
>>>>>>>>>> Couldn't you?
>>>>>>>>> Thats what I was doing in first version of patch. But later as we
>>>>>>>>> moved to use clk_save_context and clk_restore_context, peripheral
>>>>>>>>> clk_hw RST & CLK enables happen thru its corresponding save/resto=
re
>>>>>>>>> after source restore
>>>>>>>> Also, to align both CLK & RST to the exact state of register, doin=
g
>>>>>>>> save/restore in tegra_clk_periph_gate_ops and invoking this after
>>>>>>>> source restore for peripheral clock, seems cleaner to avoid any
>>>>>>>> misconfiguration b/w rst & clk settings.
>>>>>>>>
>>>>>> It looks to me that it is very wasteful to store/restore each
>>>>>> individual
>>>>>> gate and reset state, also given that some of them are shared. I thi=
nk
>>>>>> that the gates and resets should be restored separately for the
>>>>>> peripherals by a custom tegra_clk_save/restore_periph_gates/resets()=
.
>>>>> clk_periph_fixed_disable just disables clock only without deasserting
>>>>> the corresponding peripheral.
>>>>>
>>>>> corresponding peripheral drivers can also issue reset assert/deassert
>>>>> thru reset_control_assert/deassert.
>>>>>
>>>>> So, we will not get the actual state of clk and rst unless we read an=
d
>>>>> save state of reset and clock separately during save_context.
>>>>>
>>>>> Currently patch is already using custom
>>>>> tegra_clk_periph_fixed_save/restore_context for corresponding clk_ops=
.
>>>>> Are you suggesting to do save and restore of complete CLK_ENB/RST_DEV
>>>>> register settings instead of individual peripheral bits?
>>>> Yes, I'm suggesting to do a complete ungate/reset handling of the
>>>> devices in a separate function. All enabling/deassertion will be done =
in
>>>> a single hop, hence using 7us delay and four u32 words, which is much
>>>> nicer IMHO.
>>> Actually six words, three for CLKs and three for RSTs.
>> OK, So with separate function doing complete register save/restore for
>> clk & rst, we can't do this thru clk_ops save/restore as clk_ops
>> save_restore happens per peripheral wise. So if we decide to do this,
>> then this should be invoked in clk-tegra210 driver suspend/resume.
> Yes, per-clock save/restore should be used for setting rate and parent.
> The ungating and resetting could be done separately to keep things cleane=
r.
>
