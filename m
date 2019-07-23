Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0BC27232A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 01:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfGWXjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 19:39:52 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17895 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGWXjw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 19:39:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d379ac30002>; Tue, 23 Jul 2019 16:39:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 23 Jul 2019 16:39:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 16:39:49 -0700
Received: from [10.110.103.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 23:39:48 +0000
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
 <97096b6c-f2f5-b82a-b172-802f4a06d1af@nvidia.com>
 <a58de350-f6ce-9308-1ae0-885e732b575d@gmail.com>
 <a545cc66-45cd-504a-4390-8274b8b79540@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <6fefa6cc-f762-d473-a0ce-248d352a9a53@nvidia.com>
Date:   Tue, 23 Jul 2019 16:39:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a545cc66-45cd-504a-4390-8274b8b79540@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563925187; bh=N3IAqUEIz3E0SgyUkBMkTKLZhH0EQt+e9lHD4yC0uO4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=L8nIHQ59PSpUcwpKRDR3FjqTowbPJp34pVRXt5RGBQLy5h8bt1XNBJa607GMuXzja
         m7QKPtHZ3HEDJkG775dX0EFJXNlLv0SX4WDuCR0asQBNy70UJFP8JDol9g0wLycvo4
         mAnL82sbch4NPm4bNfhXfPscXTMg9CqXVAkE9MGbEbr+7fBwU7H4FgLQGNeYhxnVHD
         Wgd+77HiZQmJZ+qeG/Majj9ReW0lAxO18jz4VL07GvlxedCVHrefPIDUgOAOMaQMl5
         NRIjdukWxXYFGbA+C5FSp0CduZaWm51E5UV+7uM3LMLy8osh0nhzv7aUYBpIKbdmwr
         D6jipUCOqZqLQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/23/19 7:27 AM, Dmitry Osipenko wrote:
> 23.07.2019 6:43, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 23.07.2019 6:31, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 7/22/19 8:25 PM, Dmitry Osipenko wrote:
>>>> 23.07.2019 6:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 7/22/19 8:03 PM, Dmitry Osipenko wrote:
>>>>>> 23.07.2019 4:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
>>>>>>>> 23.07.2019 4:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>> 23.07.2019 3:58, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>> This patch implements PMC wakeup sequence for Tegra210 and defi=
nes
>>>>>>>>>>> common used RTC alarm wake event.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  =C2=A0=C2=A0 drivers/soc/tegra/pmc.c | 111
>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>  =C2=A0=C2=A0 1 file changed, 111 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>>>>>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>>>>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>>>>>>> @@ -57,6 +57,12 @@
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 PMC_CNTRL_SYSCLK_OE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(11) /* system clock
>>>>>>>>>>> enable */
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 PMC_CNTRL_SYSCLK_POLARITY=C2=A0=C2=
=A0=C2=A0 BIT(10) /* sys clk
>>>>>>>>>>> polarity */
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 PMC_CNTRL_MAIN_RST=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>>>>>>>>>>> +#define=C2=A0 PMC_CNTRL_LATCH_WAKEUPS=C2=A0=C2=A0=C2=A0 BIT(5)
>>>>>>>>> Please follow the TRM's bits naming.
>>>>>>>>>
>>>>>>>>> PMC_CNTRL_LATCHWAKE_EN
>>>>>>>>>
>>>>>>>>>>> +#define PMC_WAKE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0c
>>>>>>>>>>> +#define PMC_WAKE_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x10
>>>>>>>>>>> +#define PMC_WAKE_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x14
>>>>>>>>>>> +#define PMC_SW_WAKE_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x18
>>>>>>>>>>>  =C2=A0=C2=A0 =C2=A0 #define DPD_SAMPLE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x020
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 DPD_SAMPLE_ENABLE=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>>>>>>>>>>> @@ -87,6 +93,11 @@
>>>>>>>>>>>  =C2=A0=C2=A0 =C2=A0 #define PMC_SCRATCH41=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x140
>>>>>>>>>>>  =C2=A0=C2=A0 +#define PMC_WAKE2_MASK=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x160
>>>>>>>>>>> +#define PMC_WAKE2_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x164
>>>>>>>>>>> +#define PMC_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x168
>>>>>>>>>>> +#define PMC_SW_WAKE2_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x16c
>>>>>>>>>>> +
>>>>>>>>>>>  =C2=A0=C2=A0 #define PMC_SENSOR_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1b0
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_SCRATCH_WRITE=C2=A0=
=C2=A0=C2=A0 BIT(2)
>>>>>>>>>>>  =C2=A0=C2=A0 #define=C2=A0 PMC_SENSOR_CTRL_ENABLE_RST=C2=A0=C2=
=A0=C2=A0 BIT(1)
>>>>>>>>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops
>>>>>>>>>>> tegra_pmc_irq_domain_ops =3D {
>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .alloc =3D tegra_pmc_irq_=
alloc,
>>>>>>>>>>>  =C2=A0=C2=A0 };
>>>>>>>>>>>  =C2=A0=C2=A0 +static int tegra210_pmc_irq_set_wake(struct irq_=
data *data,
>>>>>>>>>>> unsigned int on)
>>>>>>>>>>> +{
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_pmc *pmc =3D irq_data_get_irq_=
chip_data(data);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int offset, bit;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 u32 value;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq =3D=3D ULONG_MAX)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 offset =3D data->hwirq / 32;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 bit =3D data->hwirq % 32;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Latch wakeups to SW_WAKE_STATUS reg=
ister to capture events
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * that would not make it into wakeup =
event register during
>>>>>>>>>>> LP0 exit.
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(120);
>>>>>>>>>> Why it takes so much time to latch the values? Shouldn't some
>>>>>>>>>> status-bit
>>>>>>>>>> be polled for the completion of latching?
>>>>>>>>>>
>>>>>>>>>> Is this register-write really getting buffered in the PMC?
>>>>>>>>>>
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 udelay(120);
>>>>>>>>>> 120 usecs to remove latching, really?
>>>>>>>>>>
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS=
);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATU=
S);
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /* enable PMC wake */
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->hwirq >=3D 32)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE=
2_MASK;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offset =3D PMC_WAKE=
_MASK;
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 value =3D tegra_pmc_readl(pmc, offset);
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (on)
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D 1 << bit=
;
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~(1 << b=
it);
>>>>>>>>>>> +
>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 tegra_pmc_writel(pmc, value, offset);
>>>>>>>>>> Why the latching is done *before* writing into the WAKE register=
s?
>>>>>>>>>> What
>>>>>>>>>> it is latching then?
>>>>>>>>> I'm looking at the TRM doc and it says that latching should be do=
ne
>>>>>>>>> *after* writing to the WAKE_MASK / LEVEL registers.
>>>>>>>>>
>>>>>>>>> Secondly it says that it's enough to do:
>>>>>>>>>
>>>>>>>>> value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>>>> value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>>
>>>>>>>>> in order to latch. There is no need for the delay and to remove t=
he
>>>>>>>>> "LATCHWAKE_EN" bit, it should be a oneshot action.
>>>>>>>> Although, no. TRM says "stops latching on transition from 1
>>>>>>>> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action=
.
>>>>>>>>
>>>>>>>> Have you tested this code at all? I'm wondering how it happens to
>>>>>>>> work
>>>>>>>> without a proper latching.
>>>>>>> Yes, ofcourse its tested and this sequence to do transition is
>>>>>>> recommendation from Tegra designer.
>>>>>>> Will check if TRM doesn't have update properly or will re-confirm
>>>>>>> internally on delay time...
>>>>>>>
>>>>>>> On any of the wake event PMC wakeup happens and WAKE_STATUS registe=
r
>>>>>>> will have bits set for all events that triggered wake.
>>>>>>> After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC
>>>>>>> design.
>>>>>>> SW latch register added in design helps to provide a way to capture
>>>>>>> those events that happen right during wakeup time and didnt make it=
 to
>>>>>>> SW_WAKE_STATUS register.
>>>>>>> So before next suspend entry, latching all prior wake events into S=
W
>>>>>>> WAKE_STATUS and then clearing them.
>>>>>> I'm now wondering whether the latching cold be turned ON permanently
>>>>>> during of the PMC's probe, for simplicity.
>>>>> latching should be done on suspend-resume cycle as wake events gets
>>>>> generates on every suspend-resume cycle.
>>>> You're saying that PMC "doesn't update SW_WAKE_STATUS" after wake-up,
>>>> then I don't quite understand what's the point of disabling the latchi=
ng
>>>> at all.
>>> When latch wake enable is set, events are latched and during 1 to 0
>>> transition latching is disabled.
>>>
>>> This is to avoid sw_wake_status and wake_status showing diff events.
>> Okay.
>>
>>> Currently driver is not relying on SW_WAKE_STATUS but its good to latch
>>> and clear so even at some point for some reason when SW_WAKE_STATUS is
>>> used, this wlil not cause mismatch with wake_status.
>> Then the latching need to be enabled on suspend and disabled early on
>> resume to get a proper WAKE status.
> Actually, it will be better to simply not implement the latching until
> it will become really needed. In general you shouldn't add into the
> patchset anything that is unused.

OK, will remove latch_wake for now.

Will send next version once I get all the review feedback ..

