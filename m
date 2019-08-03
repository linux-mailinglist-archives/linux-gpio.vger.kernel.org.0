Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDE34808A4
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 01:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfHCXol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Aug 2019 19:44:41 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14433 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfHCXol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Aug 2019 19:44:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d461c5f0002>; Sat, 03 Aug 2019 16:44:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 03 Aug 2019 16:44:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 03 Aug 2019 16:44:21 -0700
Received: from [10.2.165.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Aug
 2019 23:44:20 +0000
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <d82de63a-02a3-8fb0-57e7-7fe00d6b86ab@nvidia.com>
 <8d30f325-1c63-3802-7c21-f313115f8e55@gmail.com>
 <274e67b1-16b8-2475-d026-68bd89b090ec@nvidia.com>
Message-ID: <4dec8efb-bc3b-0275-8dea-7600a8f9e478@nvidia.com>
Date:   Sat, 3 Aug 2019 16:44:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <274e67b1-16b8-2475-d026-68bd89b090ec@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564875871; bh=++HJ8KUzB4/EcwXI912rdHh/TVUn5/3eBsNa4C2ZPog=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VDN6m1f823feYOsEH1i/KJhAzAP0pWTp8MXNzLmXokdq77hs+6mtAeZLL13XIb/V+
         UiufZyhs6DLhyEP+Ca3euMhiOy7PPDqTNdHDgiyrKWW5DqXfD6d7b0baID3VDhx3JI
         Kcbb8UdueUCqqDhq5rB3uznGXHL1/JnR5awhJGtS/UdiFR97hP7CjDLGHxGG45Ccqc
         EbhZDXawsoAzAKwlG8GGsSgk2Z0xMFhofS+ZGpBEB67/Yzm7za9eonJM9tBcF9H7B4
         9/X+6Xl3dk9bdBxodqsS5bE2f/FkIIglPn/Dstmrf4ys0vdqOWLxyVybqlNUrsFFTt
         RTr2Iba5O5fxg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/3/19 10:01 AM, Sowjanya Komatineni wrote:
>
> On 8/3/19 3:33 AM, Dmitry Osipenko wrote:
>> 03.08.2019 2:51, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 8/2/19 2:15 PM, Dmitry Osipenko wrote:
>>>> 02.08.2019 23:32, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 8/2/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>> 02.08.2019 23:13, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> 02.08.2019 21:33, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> On 8/2/19 5:38 AM, Dmitry Osipenko wrote:
>>>>>>>>> 02.08.2019 2:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>> On 8/1/19 4:19 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>> On 8/1/19 2:30 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>> On 8/1/19 1:54 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>> 01.08.2019 23:31, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>> On 8/1/19 1:17 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>> 01.08.2019 22:42, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>>> On 8/1/19 12:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>> 01.08.2019 20:58, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>> On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>> 31.07.2019 12:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=
=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>> This patch implements save and restore context for
>>>>>>>>>>>>>>>>>>>>>> peripheral
>>>>>>>>>>>>>>>>>>>>>> fixed
>>>>>>>>>>>>>>>>>>>>>> clock ops, peripheral gate clock ops, sdmmc mux=20
>>>>>>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>>>>>>> ops, and
>>>>>>>>>>>>>>>>>>>>>> peripheral clock ops.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> During system suspend, core power goes off and
>>>>>>>>>>>>>>>>>>>>>> looses the
>>>>>>>>>>>>>>>>>>>>>> settings
>>>>>>>>>>>>>>>>>>>>>> of the Tegra CAR controller registers.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> So during suspend entry clock and reset state of
>>>>>>>>>>>>>>>>>>>>>> peripherals is
>>>>>>>>>>>>>>>>>>>>>> saved
>>>>>>>>>>>>>>>>>>>>>> and on resume they are restored to have clocks=20
>>>>>>>>>>>>>>>>>>>>>> back to
>>>>>>>>>>>>>>>>>>>>>> same
>>>>>>>>>>>>>>>>>>>>>> rate and
>>>>>>>>>>>>>>>>>>>>>> state as before suspend.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni
>>>>>>>>>>>>>>>>>>>>>> <skomatineni@nvidia.com>
>>>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph-fixed.c | 33
>>>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph-gate.c | 34
>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-periph.c | 37
>>>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk-sdmmc-mux.c | 28
>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>>>> drivers/clk/tegra/clk.h | 6 ++++++
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 f=
iles changed, 138 insertions(+)
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>> index c088e7a280df..21b24530fa00 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>>>>>>>>>>>>>>>>>>>> @@ -60,11 +60,44 @@
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return (unsigned long)rate;
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +st=
atic int
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_save_context(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *f=
ixed =3D
>>>>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % =
32);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fixed->enb_ctx =3D readl_relaxed=
(fixed->base +
>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_reg) &
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mask;
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 fixed->rst_ctx =3D readl_relaxed=
(fixed->base +
>>>>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg) &
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mask;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +static void
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *f=
ixed =3D
>>>>>>>>>>>>>>>>>>>>>> to_tegra_clk_periph_fixed(hw);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % =
32);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (fixed->enb_ctx)
>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_set_reg);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>> fixed->regs->enb_clr_reg);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(2);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!fixed->rst_ctx) {
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udelay(5=
); /* reset propogation delay */
>>>>>>>>>>>>>>>>>>>>>> + writel_relaxed(mask, fixed->base +
>>>>>>>>>>>>>>>>>>>>>> fixed->regs->rst_reg);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
tic const struct clk_ops
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_ops
>>>>>>>>>>>>>>>>>>>>>> =3D {
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .is_enabled =3D
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_is_enabled,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable =3D=20
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_enable,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .disable =3D=20
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_disable,
>>>>>>>>>>>>>>>>>>>>>> .recalc_rate =3D
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_recalc_rate,
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_save_context,
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_fixed_restore_context,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0 struct clk
>>>>>>>>>>>>>>>>>>>>>> *tegra_clk_register_periph_fixed(const
>>>>>>>>>>>>>>>>>>>>>> char
>>>>>>>>>>>>>>>>>>>>>> *name,
>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>>>>>>>>>>>>>>>>>>>> @@ -25,6 +25,8 @@ static
>>>>>>>>>>>>>>>>>>>>>> DEFINE_SPINLOCK(periph_ref_lock);
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0 #define read_rst(gate) \
>>>>>>>>>>>>>>>>>>>>>> readl_relaxed(gate->clk_base +
>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_reg))
>>>>>>>>>>>>>>>>>>>>>> +#define write_rst_set(val, gate) \
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, gate->clk_ba=
se +
>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_set_reg))
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #de=
fine write_rst_clr(val, gate) \
>>>>>>>>>>>>>>>>>>>>>> writel_relaxed(val, gate->clk_base +
>>>>>>>>>>>>>>>>>>>>>> (gate->regs->rst_clr_reg))
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @@ =
-110,10 +112,42 @@ static void
>>>>>>>>>>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>>>>> spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +st=
atic int=20
>>>>>>>>>>>>>>>>>>>>>> clk_periph_gate_save_context(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *ga=
te =3D
>>>>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + gate->clk_state_ctx =3D read_enb(gate) &
>>>>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>>>>> + gate->rst_state_ctx =3D read_rst(gate) &
>>>>>>>>>>>>>>>>>>>>>> periph_clk_to_bit(gate);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +static void clk_periph_gate_restore_context(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *ga=
te =3D
>>>>>>>>>>>>>>>>>>>>>> to_clk_periph_gate(hw);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (gate->clk_state_ctx)
>>>>>>>>>>>>>>>>>>>>>> + write_enb_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>>>>> + write_enb_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(5);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(gate->flags & TEGRA_PERIPH=
_NO_RESET) &&
>>>>>>>>>>>>>>>>>>>>>> + !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gate=
->rst_state_ctx)
>>>>>>>>>>>>>>>>>>>>>> + write_rst_set(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>>>>>>>>>>>>> + write_rst_clr(periph_clk_to_bit(gate), gate);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st struct clk_ops
>>>>>>>>>>>>>>>>>>>>>> tegra_clk_periph_gate_ops =3D {
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .is_enabled =3D clk_periph_is_enabled,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable =3D clk_periph_enable,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .disable =3D clk_periph_disable,
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D clk_periph_gat=
e_save_context,
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D
>>>>>>>>>>>>>>>>>>>>>> clk_periph_gate_restore_context,
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0 struct clk
>>>>>>>>>>>>>>>>>>>>>> *tegra_clk_register_periph_gate(const
>>>>>>>>>>>>>>>>>>>>>> char *name,
>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>> b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>> index 58437da25156..06fb62955768 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>>>>>>>>>>>>>>>>>>>> @@ -99,6 +99,37 @@ static void
>>>>>>>>>>>>>>>>>>>>>> clk_periph_disable(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> gate_ops->disable(gate_hw);
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +st=
atic int clk_periph_save_context(struct
>>>>>>>>>>>>>>>>>>>>>> clk_hw *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =
=3D
>>>>>>>>>>>>>>>>>>>>>> to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =
=3D=20
>>>>>>>>>>>>>>>>>>>>>> periph->gate_ops;
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &peri=
ph->gate.hw;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags &=20
>>>>>>>>>>>>>>>>>>>>>> TEGRA_PERIPH_NO_GATE))
>>>>>>>>>>>>>>>>>>>>>> + gate_ops->save_context(gate_hw);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + periph->parent_ctx =3D clk_periph_get_parent(hw);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +static void clk_periph_restore_context(struct=20
>>>>>>>>>>>>>>>>>>>>>> clk_hw
>>>>>>>>>>>>>>>>>>>>>> *hw)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =
=3D
>>>>>>>>>>>>>>>>>>>>>> to_clk_periph(hw);
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =
=3D=20
>>>>>>>>>>>>>>>>>>>>>> periph->gate_ops;
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &peri=
ph->gate.hw;
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *div_ops =
=3D=20
>>>>>>>>>>>>>>>>>>>>>> periph->div_ops;
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *div_hw =3D &perip=
h->divider.hw;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + clk_periph_set_parent(hw, periph->parent_ctx);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags &=20
>>>>>>>>>>>>>>>>>>>>>> TEGRA_PERIPH_NO_DIV))
>>>>>>>>>>>>>>>>>>>>>> + div_ops->restore_context(div_hw);
>>>>>>>>>>>>>>>>>>>>> Could you please point to where the divider's
>>>>>>>>>>>>>>>>>>>>> save_context()
>>>>>>>>>>>>>>>>>>>>> happens?
>>>>>>>>>>>>>>>>>>>>> Because I can't see it.
>>>>>>>>>>>>>>>>>>>> Ah, I now see that there is no need to save the=20
>>>>>>>>>>>>>>>>>>>> dividers
>>>>>>>>>>>>>>>>>>>> context
>>>>>>>>>>>>>>>>>>>> because
>>>>>>>>>>>>>>>>>>>> clk itself has enough info that is needed for the
>>>>>>>>>>>>>>>>>>>> context's
>>>>>>>>>>>>>>>>>>>> restoring
>>>>>>>>>>>>>>>>>>>> (like I pointed in the review to v6).
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Looks like you could also implement a new
>>>>>>>>>>>>>>>>>>>> clk_hw_get_parent_index()
>>>>>>>>>>>>>>>>>>>> generic helper to get the index instead of storing it
>>>>>>>>>>>>>>>>>>>> manually.
>>>>>>>>>>>>>>>>>>> clk_periph_get_parent basically invokes existing
>>>>>>>>>>>>>>>>>>> clk_mux_ops
>>>>>>>>>>>>>>>>>>> get_parent() which is then saved in tegra_clk_periph.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> All existing drivers are using directly get_parent()=20
>>>>>>>>>>>>>>>>>>> from
>>>>>>>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>>>>>>>> which actually gets index from the register read.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> To have this more generic w.r.t save/restore context
>>>>>>>>>>>>>>>>>>> point of
>>>>>>>>>>>>>>>>>>> view,
>>>>>>>>>>>>>>>>>>> probably instead of implementing new get_parent_index
>>>>>>>>>>>>>>>>>>> helper,
>>>>>>>>>>>>>>>>>>> I think
>>>>>>>>>>>>>>>>>>> its better to implement save_context and
>>>>>>>>>>>>>>>>>>> restore_context to
>>>>>>>>>>>>>>>>>>> clk_mux_ops along with creating parent_index field into
>>>>>>>>>>>>>>>>>>> clk_mux to
>>>>>>>>>>>>>>>>>>> cache index during set_parent.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> So we just need to invoke mux_ops save_context and
>>>>>>>>>>>>>>>>>>> restore_context.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> I hope its ok to add save/restore context to clk_mux_ops
>>>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>>>> more
>>>>>>>>>>>>>>>>>> generic w.r.t save/restore context rather than
>>>>>>>>>>>>>>>>>> get_parent_index
>>>>>>>>>>>>>>>>>> API.
>>>>>>>>>>>>>>>>>> Please confirm if you agree.
>>>>>>>>>>>>>>>>> Sounds like a good idea. I see that there is a=20
>>>>>>>>>>>>>>>>> 'restoring'
>>>>>>>>>>>>>>>>> helper for
>>>>>>>>>>>>>>>>> the generic clk_gate, seems something similar could be=20
>>>>>>>>>>>>>>>>> done
>>>>>>>>>>>>>>>>> for the
>>>>>>>>>>>>>>>>> clk_mux. And looks like anyway you'll need to=20
>>>>>>>>>>>>>>>>> associate the
>>>>>>>>>>>>>>>>> parent
>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>> with the hw index in order to restore the muxing.
>>>>>>>>>>>>>>>> by 'restoring' helper for generic clk_gate, are you
>>>>>>>>>>>>>>>> referring to
>>>>>>>>>>>>>>>> clk_gate_restore_context API?
>>>>>>>>>>>>>>> Yes.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> clk_gate_restore_context is API that's any clk drivers can
>>>>>>>>>>>>>>>> use for
>>>>>>>>>>>>>>>> clk_gate operation restore for custom gate clk_ops.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> But clk-periph is directly using generic clk_mux ops from
>>>>>>>>>>>>>>>> clk_mux
>>>>>>>>>>>>>>>> so I
>>>>>>>>>>>>>>>> think we should add .restore_context to clk_mux_ops and=20
>>>>>>>>>>>>>>>> then
>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>> clk-periph restore need to invoke=20
>>>>>>>>>>>>>>>> mux_ops->restore_context.
>>>>>>>>>>>>>>> I'm not sure whether it will be good for every driver that
>>>>>>>>>>>>>>> uses
>>>>>>>>>>>>>>> generic
>>>>>>>>>>>>>>> clk_mux ops. Should be more flexible to have a generic=20
>>>>>>>>>>>>>>> helper
>>>>>>>>>>>>>>> function
>>>>>>>>>>>>>>> that any driver could use in order to restore the clock's
>>>>>>>>>>>>>>> parent.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The clk-periph restoring also includes case of combining
>>>>>>>>>>>>>>> divider
>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>> parent restoring, so generic helper could be useful in that
>>>>>>>>>>>>>>> case
>>>>>>>>>>>>>>> as well.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It also looks like you could actually use the
>>>>>>>>>>>>>>> clk_gate_restore_context()
>>>>>>>>>>>>>>> instead of manually saving the clock's enable-state,=20
>>>>>>>>>>>>>>> couldn't
>>>>>>>>>>>>>>> you?
>>>>>>>>>>>>>> ok for clk_mux, can add generic clk_mux_restore_context API
>>>>>>>>>>>>>> rather
>>>>>>>>>>>>>> than
>>>>>>>>>>>>>> using restore_context in clk_ops and will invoke that during
>>>>>>>>>>>>>> clk_periph
>>>>>>>>>>>>>> restore.
>>>>>>>>>>>>>>
>>>>>>>>>> digging thru looks like for clk_periph source restore instead of
>>>>>>>>>> clk_mux_restore_context, i can directly do clk_hw_get_parent and
>>>>>>>>>> clk_set_parent with mux_hw as they invoke mux_ops get/set parent
>>>>>>>>>> anyway.
>>>>>>>>>> Will do this for periph clk mux
>>> Just to be clear, clk_mux don't have cached parent. get_parent is by
>>> register read. So, cant directly use get_parent and then set during
>>> restore.
>>>
>>> So will create both clk_mux_save/restore_context in generic clk driver
>>> and will invoke them during tegra peripheral clock suspend/resume.
>> Why MUX clock doesn't have a cached parent? What MUX clock you're
>> talking about?
>>
>> [snip]
>
> Please ignore got it.
>
> Will send next version after giving few more days for feedback.
>
Couple of issues:

1.) I see clk-tegra-periph driver periph_clks init_data entries for some=20
peripherals are not correct for Tegra 114 and later chips.

Eg I2C TEGRA_INIT_DATA_TABLE entries in clk-tegra-periph are used for=20
all Tegra chipsets currently in the driver.

These entries are using MUX shift of 30 and MUX mask only for 2 bits=20
which is correct for T30 and prior.
But for later Tegra chips, it should be MUX shift 29 and MASK(3).

Also, I2C parent idx entries in mux_pllp_clkm_idx are different from=20
Tegra114 onwards.

As we are using only PLLP and CLKM sources only for I2C, their=20
corresponding mux values from register spec by using upper 2 bits for=20
T114 onwards match actual 2 bits of MUX value on T30 and prior.

Not sure if this something known pending to port actual clock MUX table=20
changes for Tegra114 onwards?

Or

Are we purposely using upper 2 bits only for clock source for T114 and=20
later as the upper 2 bit values of the limited clock source we are using=20
match with previous Tegra peripheral clock source mux values?

Peter/Thierry, Can you please help comment on this?


2.) Other issue is regarding using clk_set_parent directly during=20
clk_peripheral restore is clk_core_set_parent checks new parent with=20
current parent and if its same, it just returns as success which is good=20
in normal operation.

But during restore, we can't use clk_set_parent as new parent is from=20
clk_get_parent on restore and this is same as cached parent.

So clk_set_parent returns 0 but acutal register value for clk source is=20
different as it gets reset on SC7 entry/exit and to restore need to=20
invoke mux_ops set_parent with parent_index.

So this need parent index for cached parent and without using context=20
variable to store this, need an API like you were originally suggesting=20
for get_parent_index to get parent index for the specified parent clk_hw.

As we decided not to use save/restore for clk_mux ops as its generic for=20
other drivers, looks like we need get_parent_index API to use for=20
restoring peripheral source and use this with clk_mux_ops set_parent.

clk core driver already has clk_fetch_parent_index but is it OK to=20
export this?

Otherwise, will create separate API in clk driver which returns parent=20
index from parent clk_hw by using this existing clk_fetch_parent_index=20
so this API can be used by other drivers.


