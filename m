Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C686FA10
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 09:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbfGVHM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 03:12:27 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19993 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfGVHM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 03:12:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d3561e00001>; Mon, 22 Jul 2019 00:12:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 22 Jul 2019 00:12:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 22 Jul 2019 00:12:24 -0700
Received: from [10.2.164.85] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 07:12:22 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <d9bbe208-6cd3-6a28-3e43-fdd566699b1d@nvidia.com>
Date:   Mon, 22 Jul 2019 00:12:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563779552; bh=VjM8oEknReGeoMhBMs7AVwElLU3e57069PCdHhzjZYU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=TFnseOYAmdpnmugrGAhlnP58Y2qPeZmw6ZuLErMsH/SRL+f57/cFgUX2YLEJ9TzgB
         vPgowHnoKi2xPYz86AdzYdcEgXyNeoLfywa8E3s/7W4IsAxB+Zw3L7v9LPgI1vhlUY
         NpfAxyyQcI3A1lKAWRaTcSwiCn7WUh6pLtlLlwiSmKbVkXB7IYrjUgSxyIwA/2AA2H
         Sf/wr1tyAZPtGhORUfoz139YhmkH255MIHJlo0+RXhRDjsk7GXhCoIZ02o+HQZ+6Mr
         4gJ8q3LxiWOaYONiwWrzTTvIwyhmoxn7K5dyUyFeyN2oYEN6OBLclc/jhTkRrzZt+N
         YNeLs8vqQPwJA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/21/19 11:32 PM, Dmitry Osipenko wrote:
> 22.07.2019 6:17, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>>
>>>>> During system suspend entry and exit, CPU source will be switched
>>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>>> the switch.
>>>>>
>>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>>> powers up the CPU with PLLP clock source.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>  =C2=A0 drivers/clk/tegra/clk-super.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>>>>  =C2=A0 drivers/clk/tegra/clk-tegra-super-gen4.c |=C2=A0 4 ++--
>>>>>  =C2=A0 drivers/clk/tegra/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
4 ++++
>>>>>  =C2=A0 3 files changed, 17 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>>> b/drivers/clk/tegra/clk-super.c
>>>>> index 39ef31b46df5..d73c587e4853 100644
>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>> @@ -28,6 +28,9 @@
>>>>>  =C2=A0 #define super_state_to_src_shift(m, s) ((m->width * s))
>>>>>  =C2=A0 #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>>>>  =C2=A0 +#define CCLK_SRC_PLLP_OUT0 4
>>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>>> +
>>>>>  =C2=A0 static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>>  =C2=A0 {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_clk_super_mux *mux =3D t=
o_clk_super_mux(hw);
>>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>>> *hw, u8 index)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (index =3D=
=3D mux->div2_index)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 index =3D mux->pllx_index;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Enable PLLP branches to CPU before select=
ing PLLP source
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 if ((mux->flags & TEGRA_CPU_CLK) &&
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((index =3D=3D CCLK_SRC_P=
LLP_OUT0) || (index =3D=3D
>>>>> CCLK_SRC_PLLP_OUT4)))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_clk_set_pllp_out_cp=
u(true);
>>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>>> switching from PLLP?
>>> PLLP may be used for other CPU clusters.
>> Though to avoid flag and check needed to make sure other CPU is not
>> using before disabling PLLP branch to CPU.
>>
>> But leaving it enabled shouldn't impact much as clock source mux is
>> after this in design anyway.
>>
>> But can add as well if its clear that way.
> The TRM doc says "The CPU subsystem supports a switch-cluster mode
> meaning that only one of the clusters can be active at any given time".
>
> Given that cluster-switching isn't supported in upstream, I don't think
> that you need to care about the other cluster at all, at least for now.
>
> The cluster-switching implementation in upstream is very complicated
> because it requires a special "hotplugging" CPU governor, which
> apparently no other platform needs.
>
> [snip]

This patch enables PLLP branches to CPU for both CPUG & CPULP if they=20
use PLLP source.

So, to disable PLLP out CPU when not in use, we still need check for=20
other cluster because during resume both LP CPU and G CPU gets restored.=20
CPUG runs from PLLP on resume and when it does super clk restore for LP=20
CPU which may not be using PLLP, but as both uses same super mux=20
clk_ops, without check (for PLLP branch to CPU in use) disabling PLLP=20
branch to CPU during LP CPU restore looses clock to CPU G as well which=20
is running from PLLP.

Will add check and disable PLLP if not in use in next version... this=20
need extern flag as well to mark PLLP usage with either of CPU's.


