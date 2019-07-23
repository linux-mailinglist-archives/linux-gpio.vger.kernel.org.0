Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0DED7101C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 05:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730857AbfGWDbI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 23:31:08 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17278 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbfGWDbG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 23:31:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d367f800002>; Mon, 22 Jul 2019 20:31:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 22 Jul 2019 20:31:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 20:31:04 -0700
Received: from [10.2.168.41] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 03:31:03 +0000
Subject: Re: [PATCH V6 16/21] soc/tegra: pmc: Add pmc wake support for
 tegra210
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
 <1563738060-30213-17-git-send-email-skomatineni@nvidia.com>
 <0b3d08ea-4633-8a54-ba66-c3f3146a1ece@gmail.com>
 <ca32c2d8-d752-3ecd-3a3f-232366730c7b@gmail.com>
 <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
 <71a88a9c-a542-557a-0eaa-3c90112dee0e@nvidia.com>
 <70ad28cb-c268-cbbe-36f5-39df26617d8e@gmail.com>
 <629826f9-c453-386a-9e88-bd64d23b8eab@nvidia.com>
 <71c8cab1-bf72-c073-be30-4263c6b7c871@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <97096b6c-f2f5-b82a-b172-802f4a06d1af@nvidia.com>
Date:   Mon, 22 Jul 2019 20:31:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <71c8cab1-bf72-c073-be30-4263c6b7c871@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563852672; bh=E735sLC3+ac8IdFC3fOpe23muS5oyHebkeGSBgwhLuQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Nmj8UbXMbNTmjQ7RynZXonJBXg89WRoZ6SGZrvb2VWjnKbUvnHk/USx9lQqB1lH1n
         Kl5tHniBOHz77nyajegxbgX6LdYN7T+gFxFXhDDBz/NhZ7m61Knz93TeafGDoHehnq
         y81Rr4B+zUEhkIYZHc2Xxq/dx4R2+ETeR3DDAzZHHCOAWI5oZAG/9UHBjDnDBeGFaS
         QAU9ot/y3hx6ATzp4KjadhFifJuqLzxE4RiWzd6Y/Vf4oDPZGy4QQtQRzoWR5tWwCU
         IJZ5JBQmerWD9R0zfsXt7X8ifgmwgEhzbBk88+Z8AGcXiPP+eTRS311OxGMDIGNePC
         1DjiAS2jbeilg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/22/19 8:25 PM, Dmitry Osipenko wrote:
> 23.07.2019 6:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/22/19 8:03 PM, Dmitry Osipenko wrote:
>>> 23.07.2019 4:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
>>>>> 23.07.2019 4:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> 23.07.2019 3:58, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>>>>>> common used RTC alarm wake event.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> ---
>>>>>>>>  =C2=A0 drivers/soc/tegra/pmc.c | 111
>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>  =C2=A0 1 file changed, 111 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>>>> @@ -57,6 +57,12 @@
>>>>>>>>  =C2=A0 #define=C2=A0 PMC_CNTRL_SYSCLK_OE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(11) /* system clock
>>>>>>>> enable */
>>>>>>>>  =C2=A0 #define=C2=A0 PMC_CNTRL_SYSCLK_POLARITY=C2=A0=C2=A0=C2=A0 =
BIT(10) /* sys clk
>>>>>>>> polarity */
>>>>>>>>  =C2=A0 #define=C2=A0 PMC_CNTRL_MAIN_RST=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>>>>>>>> +#define=C2=A0 PMC_CNTRL_LATCH_WAKEUPS=C2=A0=C2=A0=C2=A0 BIT(5)
>>>>>> Please follow the TRM's bits naming.
>>>>>>
>>>>>> PMC_CNTRL_LATCHWAKE_EN
>>>>>>
>>>>>>>> +#define PMC_WAKE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x0c
>>>>>>>> +#define PMC_WAKE_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x10
>>>>>>>> +#define PMC_WAKE_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x14
>>>>>>>> +#define PMC_SW_WAKE_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x18
>>>>>>>>  =C2=A0 =C2=A0 #define DPD_SAMPLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x020
>>>>>>>>  =C2=A0 #define=C2=A0 DPD_SAMPLE_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(0)
>>>>>>>> @@ -87,6 +93,11 @@
>>>>>>>>  =C2=A0 =C2=A0 #define PMC_SCRATCH41=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x140
>>>>>>>>  =C2=A0 +#define PMC_WAKE2_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x160
>>>>>>>> +#define PMC_WAKE2_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x164
>>>>>>>> +#define PMC_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x168
>>>>>>>> +#define PMC_SW_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x16c
>>>>>>>> +
>>>>>>>>  =C2=A0 #define PMC_SENSOR_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b0
>>>>>>>>  =C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_SCRATCH_WRITE=C2=A0=C2=A0=C2=
=A0 BIT(2)
>>>>>>>>  =C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_ENABLE_RST=C2=A0=C2=A0=C2=A0=
 BIT(1)
>>>>>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops
>>>>>>>> tegra_pmc_irq_domain_ops =3D {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .alloc =3D tegra_pmc_irq_alloc,
>>>>>>>>  =C2=A0 };
>>>>>>>>  =C2=A0 +static int tegra210_pmc_irq_set_wake(struct irq_data *dat=
a,
>>>>>>>> unsigned int on)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_pmc *pmc =3D irq_data_get_irq_chi=
p_data(data);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int offset, bit;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 value;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq =3D=3D ULONG_MAX)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 offset =3D data->hwirq / 32;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 bit =3D data->hwirq % 32;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Latch wakeups to SW_WAKE_STATUS regist=
er to capture events
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * that would not make it into wakeup eve=
nt register during
>>>>>>>> LP0 exit.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(120);
>>>>>>> Why it takes so much time to latch the values? Shouldn't some
>>>>>>> status-bit
>>>>>>> be polled for the completion of latching?
>>>>>>>
>>>>>>> Is this register-write really getting buffered in the PMC?
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0 value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(120);
>>>>>>> 120 usecs to remove latching, really?
>>>>>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* enable PMC wake */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq >=3D 32)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE2_M=
ASK;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE_MA=
SK;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, offset);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (on)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D 1 << bit;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~(1 << bit)=
;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, offset);
>>>>>>> Why the latching is done *before* writing into the WAKE registers?
>>>>>>> What
>>>>>>> it is latching then?
>>>>>> I'm looking at the TRM doc and it says that latching should be done
>>>>>> *after* writing to the WAKE_MASK / LEVEL registers.
>>>>>>
>>>>>> Secondly it says that it's enough to do:
>>>>>>
>>>>>> value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>> value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>>>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>
>>>>>> in order to latch. There is no need for the delay and to remove the
>>>>>> "LATCHWAKE_EN" bit, it should be a oneshot action.
>>>>> Although, no. TRM says "stops latching on transition from 1
>>>>> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
>>>>>
>>>>> Have you tested this code at all? I'm wondering how it happens to wor=
k
>>>>> without a proper latching.
>>>> Yes, ofcourse its tested and this sequence to do transition is
>>>> recommendation from Tegra designer.
>>>> Will check if TRM doesn't have update properly or will re-confirm
>>>> internally on delay time...
>>>>
>>>> On any of the wake event PMC wakeup happens and WAKE_STATUS register
>>>> will have bits set for all events that triggered wake.
>>>> After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC
>>>> design.
>>>> SW latch register added in design helps to provide a way to capture
>>>> those events that happen right during wakeup time and didnt make it to
>>>> SW_WAKE_STATUS register.
>>>> So before next suspend entry, latching all prior wake events into SW
>>>> WAKE_STATUS and then clearing them.
>>> I'm now wondering whether the latching cold be turned ON permanently
>>> during of the PMC's probe, for simplicity.
>> latching should be done on suspend-resume cycle as wake events gets
>> generates on every suspend-resume cycle.
> You're saying that PMC "doesn't update SW_WAKE_STATUS" after wake-up,
> then I don't quite understand what's the point of disabling the latching
> at all.
When latch wake enable is set, events are latched and during 1 to 0=20
transition latching is disabled.

This is to avoid sw_wake_status and wake_status showing diff events.

Currently driver is not relying on SW_WAKE_STATUS but its good to latch=20
and clear so even at some point for some reason when SW_WAKE_STATUS is=20
used, this wlil not cause mismatch with wake_status.

>>>> LATCHWAKE_EN - When set, enables latching and stops latching on
>>>> transition from 1 to 0
>>>> There is recommendation of min 120uSec for this transition to stop
>>>> latching. Will double-check why 120uSec
>>> Yes, please check.
>>>
>>>>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>  =C2=A0 static int tegra186_pmc_irq_set_wake(struct irq_data *data=
,
>>>>>>>> unsigned int on)
>>>>>>>>  =C2=A0 {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_pmc *pmc =3D irq_data=
_get_irq_chip_data(data);
>>>>>>>> @@ -1954,6 +2014,49 @@ static int
>>>>>>>> tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>  =C2=A0 }
>>>>>>>>  =C2=A0 +static int tegra210_pmc_irq_set_type(struct irq_data *dat=
a,
>>>>>>>> unsigned int type)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_pmc *pmc =3D irq_data_get_irq_chi=
p_data(data);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int offset, bit;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 value;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq =3D=3D ULONG_MAX)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 offset =3D data->hwirq / 32;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 bit =3D data->hwirq % 32;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq >=3D 32)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE2_L=
EVEL;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE_LE=
VEL;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, offset);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 switch (type) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case IRQ_TYPE_EDGE_RISING:
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case IRQ_TYPE_LEVEL_HIGH:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D 1 << bit;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case IRQ_TYPE_EDGE_FALLING:
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case IRQ_TYPE_LEVEL_LOW:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~(1 << bit)=
;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALL=
ING:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value ^=3D 1 << bit;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, offset);
>>>>>>> Shouldn't the WAKE_LEVEL be latched as well?
>>>> WAKE_LEVELs dont need any latch as they are the levels SW sets for wak=
e
>>>> trigger and they are not status
>>> Okay.
>>>
>>> [snip]
