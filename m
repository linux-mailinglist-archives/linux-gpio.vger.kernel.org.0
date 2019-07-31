Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9C37D1B3
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 01:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbfGaXJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 19:09:56 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16154 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfGaXJ4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 19:09:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d421fca0002>; Wed, 31 Jul 2019 16:10:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 31 Jul 2019 16:09:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 31 Jul 2019 16:09:53 -0700
Received: from [10.110.102.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 23:09:52 +0000
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <f90cf34d-c294-b23d-38e3-6de9a8fca7d6@gmail.com>
 <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <67cf6c13-688d-0305-61e2-c63c8e8b4729@nvidia.com>
Date:   Wed, 31 Jul 2019 16:09:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e796e26e-830c-b1be-e368-c7ff177a61dd@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564614602; bh=bCESBTEjRJ2yCPeCpf0LHLzZ8JR/d7ttmqShyTrMFH4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=d+M66eBI3Q7G4ZXGia/V2zgqJl/vOgZ3mWNiE48qOmaSSgYHN/6KTtvyHujrqEqDv
         nWW9wwsgF8fWClYWe/5kv3pnAphceBOQTQaqrefRvKaSogKwPR6kV8t/xAwDShCCGL
         Ea94ji49VzFEFJLbZaf3kwJT4yliueYjJ+MYaD2PO3K+yZ8Imwnk8WjGIhw27kefEw
         5T2Gdiy7OLqDXyjHb4uoTkQ0ifilbzh21i6kMSQ4vsmdirbXDUxWyo7hFQd3P5Wzo0
         ea85PE0w7WHplFwNmwTVrI0erPiKV1J9wdFz2VCsN+rA8Xxw0bC45wnH1CBdVLM2uz
         XhI34B1mg/IXA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/19 3:44 AM, Dmitry Osipenko wrote:
> 31.07.2019 12:50, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 31.07.2019 3:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch implements save and restore context for peripheral fixed
>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>> peripheral clock ops.
>>>
>>> During system suspend, core power goes off and looses the settings
>>> of the Tegra CAR controller registers.
>>>
>>> So during suspend entry clock and reset state of peripherals is saved
>>> and on resume they are restored to have clocks back to same rate and
>>> state as before suspend.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-periph-fixed.c | 33 +++++++++++++++++++++++++++=
+++++
>>>   drivers/clk/tegra/clk-periph-gate.c  | 34 +++++++++++++++++++++++++++=
++++++
>>>   drivers/clk/tegra/clk-periph.c       | 37 +++++++++++++++++++++++++++=
+++++++++
>>>   drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk.h              |  6 ++++++
>>>   5 files changed, 138 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/c=
lk-periph-fixed.c
>>> index c088e7a280df..21b24530fa00 100644
>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *h=
w,
>>>   	return (unsigned long)rate;
>>>   }
>>>  =20
>>> +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph_fixed *fixed =3D to_tegra_clk_periph_fixed(hw=
);
>>> +	u32 mask =3D 1 << (fixed->num % 32);
>>> +
>>> +	fixed->enb_ctx =3D readl_relaxed(fixed->base + fixed->regs->enb_reg) =
&
>>> +			 mask;
>>> +	fixed->rst_ctx =3D readl_relaxed(fixed->base + fixed->regs->rst_reg) =
&
>>> +			 mask;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph_fixed *fixed =3D to_tegra_clk_periph_fixed(hw=
);
>>> +	u32 mask =3D 1 << (fixed->num % 32);
>>> +
>>> +	if (fixed->enb_ctx)
>>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
>>> +	else
>>> +		writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
>>> +
>>> +	udelay(2);
>>> +
>>> +	if (!fixed->rst_ctx) {
>>> +		udelay(5); /* reset propogation delay */
>>> +		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
>>> +	}
>>> +}
>>> +
>>>   static const struct clk_ops tegra_clk_periph_fixed_ops =3D {
>>>   	.is_enabled =3D tegra_clk_periph_fixed_is_enabled,
>>>   	.enable =3D tegra_clk_periph_fixed_enable,
>>>   	.disable =3D tegra_clk_periph_fixed_disable,
>>>   	.recalc_rate =3D tegra_clk_periph_fixed_recalc_rate,
>>> +	.save_context =3D tegra_clk_periph_fixed_save_context,
>>> +	.restore_context =3D tegra_clk_periph_fixed_restore_context,
>>>   };
>>>  =20
>>>   struct clk *tegra_clk_register_periph_fixed(const char *name,
>>> diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/cl=
k-periph-gate.c
>>> index 4b31beefc9fc..6ba5b08e0787 100644
>>> --- a/drivers/clk/tegra/clk-periph-gate.c
>>> +++ b/drivers/clk/tegra/clk-periph-gate.c
>>> @@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
>>>  =20
>>>   #define read_rst(gate) \
>>>   	readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
>>> +#define write_rst_set(val, gate) \
>>> +	writel_relaxed(val, gate->clk_base + (gate->regs->rst_set_reg))
>>>   #define write_rst_clr(val, gate) \
>>>   	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
>>>  =20
>>> @@ -110,10 +112,42 @@ static void clk_periph_disable(struct clk_hw *hw)
>>>   	spin_unlock_irqrestore(&periph_ref_lock, flags);
>>>   }
>>>  =20
>>> +static int clk_periph_gate_save_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph_gate *gate =3D to_clk_periph_gate(hw);
>>> +
>>> +	gate->clk_state_ctx =3D read_enb(gate) & periph_clk_to_bit(gate);
>>> +	gate->rst_state_ctx =3D read_rst(gate) & periph_clk_to_bit(gate);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void clk_periph_gate_restore_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph_gate *gate =3D to_clk_periph_gate(hw);
>>> +
>>> +	if (gate->clk_state_ctx)
>>> +		write_enb_set(periph_clk_to_bit(gate), gate);
>>> +	else
>>> +		write_enb_clr(periph_clk_to_bit(gate), gate);
>>> +
>>> +	udelay(5);
>>> +
>>> +	if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
>>> +	    !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
>>> +		if (gate->rst_state_ctx)
>>> +			write_rst_set(periph_clk_to_bit(gate), gate);
>>> +		else
>>> +			write_rst_clr(periph_clk_to_bit(gate), gate);
>>> +	}
>>> +}
>>> +
>>>   const struct clk_ops tegra_clk_periph_gate_ops =3D {
>>>   	.is_enabled =3D clk_periph_is_enabled,
>>>   	.enable =3D clk_periph_enable,
>>>   	.disable =3D clk_periph_disable,
>>> +	.save_context =3D clk_periph_gate_save_context,
>>> +	.restore_context =3D clk_periph_gate_restore_context,
>>>   };
>>>  =20
>>>   struct clk *tegra_clk_register_periph_gate(const char *name,
>>> diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-per=
iph.c
>>> index 58437da25156..06fb62955768 100644
>>> --- a/drivers/clk/tegra/clk-periph.c
>>> +++ b/drivers/clk/tegra/clk-periph.c
>>> @@ -99,6 +99,37 @@ static void clk_periph_disable(struct clk_hw *hw)
>>>   	gate_ops->disable(gate_hw);
>>>   }
>>>  =20
>>> +static int clk_periph_save_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph *periph =3D to_clk_periph(hw);
>>> +	const struct clk_ops *gate_ops =3D periph->gate_ops;
>>> +	struct clk_hw *gate_hw =3D &periph->gate.hw;
>>> +
>>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
>>> +		gate_ops->save_context(gate_hw);
>>> +
>>> +	periph->parent_ctx =3D clk_periph_get_parent(hw);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void clk_periph_restore_context(struct clk_hw *hw)
>>> +{
>>> +	struct tegra_clk_periph *periph =3D to_clk_periph(hw);
>>> +	const struct clk_ops *gate_ops =3D periph->gate_ops;
>>> +	struct clk_hw *gate_hw =3D &periph->gate.hw;
>>> +	const struct clk_ops *div_ops =3D periph->div_ops;
>>> +	struct clk_hw *div_hw =3D &periph->divider.hw;
>>> +
>>> +	clk_periph_set_parent(hw, periph->parent_ctx);
>>> +
>>> +	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
>>> +		div_ops->restore_context(div_hw);
>> Could you please point to where the divider's save_context() happens?
>> Because I can't see it.
> Ah, I now see that there is no need to save the dividers context because
> clk itself has enough info that is needed for the context's restoring
> (like I pointed in the review to v6).
>
> Looks like you could also implement a new clk_hw_get_parent_index()
> generic helper to get the index instead of storing it manually.

clk_periph_get_parent basically invokes existing clk_mux_ops=20
get_parent() which is then saved in tegra_clk_periph.

All existing drivers are using directly get_parent() from clk_mux which=20
actually gets index from the register read.

To have this more generic w.r.t save/restore context point of view,=20
probably instead of implementing new get_parent_index helper, I think=20
its better to implement save_context and restore_context to clk_mux_ops=20
along with creating parent_index field into clk_mux to cache index=20
during set_parent.

So we just need to invoke mux_ops save_context and restore_context.

