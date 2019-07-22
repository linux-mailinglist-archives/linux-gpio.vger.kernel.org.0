Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08CE6FA41
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 09:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbfGVHXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 03:23:50 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1627 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfGVHXu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 03:23:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d35648b0002>; Mon, 22 Jul 2019 00:23:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 22 Jul 2019 00:23:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 00:23:48 -0700
Received: from [10.2.164.85] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 07:23:46 +0000
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
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
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
 <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
 <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
 <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
 <d9bbe208-6cd3-6a28-3e43-fdd566699b1d@nvidia.com>
 <07897688-2a02-b7a7-7048-72c4078d26a2@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <90e1a90b-1d33-a5db-9af8-dc5c5d45b65f@nvidia.com>
Date:   Mon, 22 Jul 2019 00:24:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <07897688-2a02-b7a7-7048-72c4078d26a2@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563780235; bh=UQ0YMGzS5HHeJDikl5gEeLd1E8bvStNLrs6qMhE0DbA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=MgqmwlB765Iesf5MvUwEFQY3mymP6n/qgl0Yn/Ba9yKR9nrnYFLjWL5RWe86l84FR
         R3tqj90uSF9wqaLSXF3McZbhFensXxs3cffNVVTIsOzezaRPAaTiwnyxNUCR98dbNy
         a7KUye3Y0rnZSmzYJ97fonXGNqLdPZVBQ0OKZPyuOd60uT9XOnvNh8qC0dFixoFQGY
         aUiLI6tz6GrWySXNtsRe3uPOHJ9qi/LexNT0nWwiugAk67038X7+MCzQOfQH7pEo5W
         SZcN5gB27kcp1rS5thV36Bx0Zz3jD0xuvEr/55JLtv6skPTr62x1kWr/i32EDaHTrb
         olg+z+SX1iYSw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/22/19 12:17 AM, Dmitry Osipenko wrote:
> 22.07.2019 10:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/21/19 11:32 PM, Dmitry Osipenko wrote:
>>> 22.07.2019 6:17, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>>>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>>>>
>>>>>>> During system suspend entry and exit, CPU source will be switched
>>>>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>>>>> the switch.
>>>>>>>
>>>>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>>>>> powers up the CPU with PLLP clock source.
>>>>>>>
>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> ---
>>>>>>>  =C2=A0=C2=A0 drivers/clk/tegra/clk-super.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>>>>>>  =C2=A0=C2=A0 drivers/clk/tegra/clk-tegra-super-gen4.c |=C2=A0 4 ++=
--
>>>>>>>  =C2=A0=C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++++
>>>>>>>  =C2=A0=C2=A0 3 files changed, 17 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>>>>> b/drivers/clk/tegra/clk-super.c
>>>>>>> index 39ef31b46df5..d73c587e4853 100644
>>>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>>>> @@ -28,6 +28,9 @@
>>>>>>>  =C2=A0=C2=A0 #define super_state_to_src_shift(m, s) ((m->width * s=
))
>>>>>>>  =C2=A0=C2=A0 #define super_state_to_src_mask(m) (((1 << m->width) =
- 1))
>>>>>>>  =C2=A0=C2=A0 +#define CCLK_SRC_PLLP_OUT0 4
>>>>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>>>>> +
>>>>>>>  =C2=A0=C2=A0 static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>>>>  =C2=A0=C2=A0 {
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_super_mux *m=
ux =3D to_clk_super_mux(hw);
>>>>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>>>>> *hw, u8 index)
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i=
ndex =3D=3D mux->div2_index)
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index =3D mux->pllx_index;
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>> +
>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Enable PLLP branches to CPU before sele=
cting PLLP source
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0 if ((mux->flags & TEGRA_CPU_CLK) &&
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((index =3D=3D CCLK_SRC=
_PLLP_OUT0) || (index =3D=3D
>>>>>>> CCLK_SRC_PLLP_OUT4)))
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_=
cpu(true);
>>>>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>>>>> switching from PLLP?
>>>>> PLLP may be used for other CPU clusters.
>>>> Though to avoid flag and check needed to make sure other CPU is not
>>>> using before disabling PLLP branch to CPU.
>>>>
>>>> But leaving it enabled shouldn't impact much as clock source mux is
>>>> after this in design anyway.
>>>>
>>>> But can add as well if its clear that way.
>>> The TRM doc says "The CPU subsystem supports a switch-cluster mode
>>> meaning that only one of the clusters can be active at any given time".
>>>
>>> Given that cluster-switching isn't supported in upstream, I don't think
>>> that you need to care about the other cluster at all, at least for now.
>>>
>>> The cluster-switching implementation in upstream is very complicated
>>> because it requires a special "hotplugging" CPU governor, which
>>> apparently no other platform needs.
>>>
>>> [snip]
>> This patch enables PLLP branches to CPU for both CPUG & CPULP if they
>> use PLLP source.
>>
>> So, to disable PLLP out CPU when not in use, we still need check for
>> other cluster because during resume both LP CPU and G CPU gets restored.
>> CPUG runs from PLLP on resume and when it does super clk restore for LP
>> CPU which may not be using PLLP, but as both uses same super mux
>> clk_ops, without check (for PLLP branch to CPU in use) disabling PLLP
>> branch to CPU during LP CPU restore looses clock to CPU G as well which
>> is running from PLLP.
>>
>> Will add check and disable PLLP if not in use in next version... this
>> need extern flag as well to mark PLLP usage with either of CPU's.
> I still don't understand why do you need to care about LP cluster at
> all, given that it's always in a power-gated state.

cclk_lp is registered thru super clk mux which uses same clk_ops as cclk_g.

during restore, cclk_lp also gets restored. So both cclk_lp & cclk_g=20
goes thru same clk_ops

In this patch, I marked super flags with TEGRA_CPU_CLK for both cclk_lp=20
& cclk_g.

So when cclk_lp restore happens, it goes thru same set_parent clk_ops=20
and as its source is not PLLP, it tries to disable PLLP_OUT_CPU if its=20
disabled without adding check for PLLP being in use by other cluster.

So either I should not mark cclk_lp as TEGRA_CPU_CLK and mark cclk_g=20
only as TEGRA_CPU_CLK so PLLP out to CPU can be disabled without check=20
if its not the source.

OR

With TEGRA_CPU_CLK used for both cclk_lp & cclk_g, need to add check if=20
PLLP is in use so during cclk_lp restore it doesnt disable PLLP out to CPU.


To simplify without check, will just mark cclk_g super clock flag only=20
as TEGRA_CPU_CLK so PLLP_OUT_CPU enable or disable happens only for CPUG


