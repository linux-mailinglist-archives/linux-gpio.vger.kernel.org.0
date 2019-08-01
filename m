Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591377E1C5
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 19:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731702AbfHAR6l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 13:58:41 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15702 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731616AbfHAR6l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 13:58:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4328580003>; Thu, 01 Aug 2019 10:58:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 01 Aug 2019 10:58:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 10:58:39 -0700
Received: from [10.110.103.107] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Aug
 2019 17:58:38 +0000
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
 <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
 <67cf6c13-688d-0305-61e2-c63c8e8b4729@nvidia.com>
Message-ID: <550de191-f982-4544-6fbc-bf16dfeae2c6@nvidia.com>
Date:   Thu, 1 Aug 2019 10:58:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <67cf6c13-688d-0305-61e2-c63c8e8b4729@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564682328; bh=qMCQRi3DA6ypa30HZCQhswHwXFjFLHqxjvvvqG3zQz4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=XYDFzXjE78Hfzsozj9PGnGvpUyzSPbE4YoO0zlPIb7nPC8+klYzYy31BfV8M4uLEM
         rrqNgiKhVNJgg+FIW46YsEZsmGmY+3+mFZqogEy9mwCdPBWM6MtVN2BhXL4wvpUNDw
         W679n9ARv92ZHvEu8D6ji8l1gqrrVY7tVZxkgicBD5uelI+NFgRwLGxdct/8/c+D/v
         JUs1mSoZc94gIMifR9419rtzE4Ci+rZqmYnGkRS/FHIdHXPZvE9edO1DCqa0JpFwj4
         ihjqH11Fd68rW1AjvtVShYRRwsvWXdQDfB/xmUM8td8KlV7OSDUPN2rRNNOSsKrZ8Q
         AClRuzcrV+DUQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/19 4:09 PM, Sowjanya Komatineni wrote:
>
> On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
>> 31.07.2019 12:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> This patch implements save and restore context for peripheral fixed
>>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>>> peripheral clock ops.
>>>>
>>>> During system suspend, core power goes off and looses the settings
>>>> of the Tegra CAR controller registers.
>>>>
>>>> So during suspend entry clock and reset state of peripherals is saved
>>>> and on resume they are restored to have clocks back to same rate and
>>>> state as before suspend.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>> =C2=A0 drivers/clk/tegra/clk-periph-fixed.c | 33=20
>>>> ++++++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/clk/tegra/clk-periph-gate.c=C2=A0 | 34=20
>>>> +++++++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/clk/tegra/clk-periph.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 37=20
>>>> ++++++++++++++++++++++++++++++++++++
>>>> =C2=A0 drivers/clk/tegra/clk-sdmmc-mux.c=C2=A0=C2=A0=C2=A0 | 28=20
>>>> +++++++++++++++++++++++++++
>>>> =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
>>>> =C2=A0 5 files changed, 138 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c=20
>>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>>> index c088e7a280df..21b24530fa00 100644
>>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct=20
>>>> clk_hw *hw,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (unsigned long)rate;
>>>> =C2=A0 }
>>>> =C2=A0 +static int tegra_clk_periph_fixed_save_context(struct clk_hw *=
hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixed =3D=20
>>>> to_tegra_clk_periph_fixed(hw);
>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 fixed->enb_ctx =3D readl_relaxed(fixed->base +=20
>>>> fixed->regs->enb_reg) &
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mask;
>>>> +=C2=A0=C2=A0=C2=A0 fixed->rst_ctx =3D readl_relaxed(fixed->base +=20
>>>> fixed->regs->rst_reg) &
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mask;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_fixed *fixed =3D=20
>>>> to_tegra_clk_periph_fixed(hw);
>>>> +=C2=A0=C2=A0=C2=A0 u32 mask =3D 1 << (fixed->num % 32);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (fixed->enb_ctx)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->enb_set_reg);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->enb_clr_reg);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 udelay(2);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!fixed->rst_ctx) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udelay(5); /* reset propog=
ation delay */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(mask, fixed=
->base + fixed->regs->rst_reg);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> =C2=A0 static const struct clk_ops tegra_clk_periph_fixed_ops =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .is_enabled =3D tegra_clk_periph_fixed_=
is_enabled,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .enable =3D tegra_clk_periph_fixed_enab=
le,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .disable =3D tegra_clk_periph_fixed_dis=
able,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .recalc_rate =3D tegra_clk_periph_fixed=
_recalc_rate,
>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D tegra_clk_periph_fixed_save_cont=
ext,
>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D tegra_clk_periph_fixed_restor=
e_context,
>>>> =C2=A0 };
>>>> =C2=A0 =C2=A0 struct clk *tegra_clk_register_periph_fixed(const char *=
name,
>>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c=20
>>>> b/drivers/clk/tegra/clk-periph-gate.c
>>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>>> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>>>> =C2=A0 =C2=A0 #define read_rst(gate) \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 readl_relaxed(gate->clk_base + (gate->r=
egs->rst_reg))
>>>> +#define write_rst_set(val, gate) \
>>>> +=C2=A0=C2=A0=C2=A0 writel_relaxed(val, gate->clk_base + (gate->regs->=
rst_set_reg))
>>>> =C2=A0 #define write_rst_clr(val, gate) \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel_relaxed(val, gate->clk_base + (g=
ate->regs->rst_clr_reg))
>>>> =C2=A0 @@ -110,10 +112,42 @@ static void clk_periph_disable(struct=20
>>>> clk_hw *hw)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&periph_ref_lock=
, flags);
>>>> =C2=A0 }
>>>> =C2=A0 +static int clk_periph_gate_save_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *gate =3D to_clk_peri=
ph_gate(hw);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 gate->clk_state_ctx =3D read_enb(gate) & periph_cl=
k_to_bit(gate);
>>>> +=C2=A0=C2=A0=C2=A0 gate->rst_state_ctx =3D read_rst(gate) & periph_cl=
k_to_bit(gate);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static void clk_periph_gate_restore_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph_gate *gate =3D to_clk_peri=
ph_gate(hw);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (gate->clk_state_ctx)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_enb_set(periph_clk_t=
o_bit(gate), gate);
>>>> +=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_enb_clr(periph_clk_t=
o_bit(gate), gate);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 udelay(5);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(gate->flags & TEGRA_PERI=
PH_MANUAL_RESET)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gate->rst_state_ctx)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wr=
ite_rst_set(periph_clk_to_bit(gate), gate);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wr=
ite_rst_clr(periph_clk_to_bit(gate), gate);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> =C2=A0 const struct clk_ops tegra_clk_periph_gate_ops =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .is_enabled =3D clk_periph_is_enabled,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .enable =3D clk_periph_enable,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .disable =3D clk_periph_disable,
>>>> +=C2=A0=C2=A0=C2=A0 .save_context =3D clk_periph_gate_save_context,
>>>> +=C2=A0=C2=A0=C2=A0 .restore_context =3D clk_periph_gate_restore_conte=
xt,
>>>> =C2=A0 };
>>>> =C2=A0 =C2=A0 struct clk *tegra_clk_register_periph_gate(const char *n=
ame,
>>>> diff --git a/drivers/clk/tegra/clk-periph.c=20
>>>> b/drivers/clk/tegra/clk-periph.c
>>>> index 58437da25156..06fb62955768 100644
>>>> --- a/drivers/clk/tegra/clk-periph.c
>>>> +++ b/drivers/clk/tegra/clk-periph.c
>>>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct clk_hw *hw)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gate_ops->disable(gate_hw);
>>>> =C2=A0 }
>>>> =C2=A0 +static int clk_periph_save_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =3D to_clk_periph(=
hw);
>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =3D periph->gate_op=
s;
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &periph->gate.hw;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gate_ops->save_context(gat=
e_hw);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 periph->parent_ctx =3D clk_periph_get_parent(hw);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static void clk_periph_restore_context(struct clk_hw *hw)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_clk_periph *periph =3D to_clk_periph(=
hw);
>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *gate_ops =3D periph->gate_op=
s;
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *gate_hw =3D &periph->gate.hw;
>>>> +=C2=A0=C2=A0=C2=A0 const struct clk_ops *div_ops =3D periph->div_ops;
>>>> +=C2=A0=C2=A0=C2=A0 struct clk_hw *div_hw =3D &periph->divider.hw;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 clk_periph_set_parent(hw, periph->parent_ctx);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div_ops->restore_context(d=
iv_hw);
>>> Could you please point to where the divider's save_context() happens?
>>> Because I can't see it.
>> Ah, I now see that there is no need to save the dividers context because
>> clk itself has enough info that is needed for the context's restoring
>> (like I pointed in the review to v6).
>>
>> Looks like you could also implement a new clk_hw_get_parent_index()
>> generic helper to get the index instead of storing it manually.
>
> clk_periph_get_parent basically invokes existing clk_mux_ops=20
> get_parent() which is then saved in tegra_clk_periph.
>
> All existing drivers are using directly get_parent() from clk_mux=20
> which actually gets index from the register read.
>
> To have this more generic w.r.t save/restore context point of view,=20
> probably instead of implementing new get_parent_index helper, I think=20
> its better to implement save_context and restore_context to=20
> clk_mux_ops along with creating parent_index field into clk_mux to=20
> cache index during set_parent.
>
> So we just need to invoke mux_ops save_context and restore_context.
>
I hope its ok to add save/restore context to clk_mux_ops to be more=20
generic w.r.t save/restore context rather than get_parent_index API.=20
Please confirm if you agree.


