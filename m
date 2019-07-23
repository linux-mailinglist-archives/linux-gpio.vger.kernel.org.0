Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 802A670FA9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 05:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732411AbfGWDJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 23:09:53 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3363 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbfGWDJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 23:09:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d367a7e0002>; Mon, 22 Jul 2019 20:09:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 22 Jul 2019 20:09:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 20:09:50 -0700
Received: from [10.2.168.41] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 03:09:48 +0000
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <629826f9-c453-386a-9e88-bd64d23b8eab@nvidia.com>
Date:   Mon, 22 Jul 2019 20:09:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <70ad28cb-c268-cbbe-36f5-39df26617d8e@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563851390; bh=lfFSnkh5Hkzd0Zd63bph0IPNudRWUvLzk86izWNSQS0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=L86qszZWpLXoSRG6wiUSQh0JHXkYp3akB/FF5efYZB496mLn0Cu1ZyX97Qp2+vVgQ
         7uwE7sLDbTCj8dyNkP7YWzPbMgh2iUwHlaWJ6LWrAYH+7rOW7xZUlggvWTcpFkzlMw
         Dq6k36najw824e7A6Ke+AH0HHWC2ELEl1LVywPIJRxVFEr2j3j/qt0JICqSYjnyucD
         fHsaf3B/pMAwONMlK5nUrS8+4TtBcO8Fnr8q2GJPCjz7sZNRNIVNfYpMbyiOQiTo+Q
         LpGIxtPNTWPX+2leWMJtnWLM3RVTQm20R114Re6kSCS0T0FBbQvXNFCWYeXnbMnPRB
         BUay4Aex5uhIQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/22/19 8:03 PM, Dmitry Osipenko wrote:
> 23.07.2019 4:52, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
>>> 23.07.2019 4:08, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 23.07.2019 3:58, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> 21.07.2019 22:40, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>>>> common used RTC alarm wake event.
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>   drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++=
++++++++++++
>>>>>>   1 file changed, 111 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>> @@ -57,6 +57,12 @@
>>>>>>   #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>>>>>   #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>>>>>   #define  PMC_CNTRL_MAIN_RST		BIT(4)
>>>>>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
>>>> Please follow the TRM's bits naming.
>>>>
>>>> PMC_CNTRL_LATCHWAKE_EN
>>>>
>>>>>> +#define PMC_WAKE_MASK			0x0c
>>>>>> +#define PMC_WAKE_LEVEL			0x10
>>>>>> +#define PMC_WAKE_STATUS			0x14
>>>>>> +#define PMC_SW_WAKE_STATUS		0x18
>>>>>>  =20
>>>>>>   #define DPD_SAMPLE			0x020
>>>>>>   #define  DPD_SAMPLE_ENABLE		BIT(0)
>>>>>> @@ -87,6 +93,11 @@
>>>>>>  =20
>>>>>>   #define PMC_SCRATCH41			0x140
>>>>>>  =20
>>>>>> +#define PMC_WAKE2_MASK			0x160
>>>>>> +#define PMC_WAKE2_LEVEL			0x164
>>>>>> +#define PMC_WAKE2_STATUS		0x168
>>>>>> +#define PMC_SW_WAKE2_STATUS		0x16c
>>>>>> +
>>>>>>   #define PMC_SENSOR_CTRL			0x1b0
>>>>>>   #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>>>>   #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_=
irq_domain_ops =3D {
>>>>>>   	.alloc =3D tegra_pmc_irq_alloc,
>>>>>>   };
>>>>>>  =20
>>>>>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigne=
d int on)
>>>>>> +{
>>>>>> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>>>>>> +	unsigned int offset, bit;
>>>>>> +	u32 value;
>>>>>> +
>>>>>> +	if (data->hwirq =3D=3D ULONG_MAX)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	offset =3D data->hwirq / 32;
>>>>>> +	bit =3D data->hwirq % 32;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
>>>>>> +	 * that would not make it into wakeup event register during LP0 ex=
it.
>>>>>> +	 */
>>>>>> +	value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>> +	value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>> +	udelay(120);
>>>>> Why it takes so much time to latch the values? Shouldn't some status-=
bit
>>>>> be polled for the completion of latching?
>>>>>
>>>>> Is this register-write really getting buffered in the PMC?
>>>>>
>>>>>> +	value &=3D ~PMC_CNTRL_LATCH_WAKEUPS;
>>>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>> +	udelay(120);
>>>>> 120 usecs to remove latching, really?
>>>>>
>>>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>>>> +
>>>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>>>> +
>>>>>> +	/* enable PMC wake */
>>>>>> +	if (data->hwirq >=3D 32)
>>>>>> +		offset =3D PMC_WAKE2_MASK;
>>>>>> +	else
>>>>>> +		offset =3D PMC_WAKE_MASK;
>>>>>> +
>>>>>> +	value =3D tegra_pmc_readl(pmc, offset);
>>>>>> +
>>>>>> +	if (on)
>>>>>> +		value |=3D 1 << bit;
>>>>>> +	else
>>>>>> +		value &=3D ~(1 << bit);
>>>>>> +
>>>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>>> Why the latching is done *before* writing into the WAKE registers? Wh=
at
>>>>> it is latching then?
>>>> I'm looking at the TRM doc and it says that latching should be done
>>>> *after* writing to the WAKE_MASK / LEVEL registers.
>>>>
>>>> Secondly it says that it's enough to do:
>>>>
>>>> value =3D tegra_pmc_readl(pmc, PMC_CNTRL);
>>>> value |=3D PMC_CNTRL_LATCH_WAKEUPS;
>>>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>
>>>> in order to latch. There is no need for the delay and to remove the
>>>> "LATCHWAKE_EN" bit, it should be a oneshot action.
>>> Although, no. TRM says "stops latching on transition from 1
>>> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
>>>
>>> Have you tested this code at all? I'm wondering how it happens to work
>>> without a proper latching.
>> Yes, ofcourse its tested and this sequence to do transition is
>> recommendation from Tegra designer.
>> Will check if TRM doesn't have update properly or will re-confirm
>> internally on delay time...
>>
>> On any of the wake event PMC wakeup happens and WAKE_STATUS register
>> will have bits set for all events that triggered wake.
>> After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC desig=
n.
>> SW latch register added in design helps to provide a way to capture
>> those events that happen right during wakeup time and didnt make it to
>> SW_WAKE_STATUS register.
>> So before next suspend entry, latching all prior wake events into SW
>> WAKE_STATUS and then clearing them.
> I'm now wondering whether the latching cold be turned ON permanently
> during of the PMC's probe, for simplicity.
latching should be done on suspend-resume cycle as wake events gets=20
generates on every suspend-resume cycle.
>> LATCHWAKE_EN - When set, enables latching and stops latching on
>> transition from 1 to 0
>> There is recommendation of min 120uSec for this transition to stop
>> latching. Will double-check why 120uSec
> Yes, please check.
>
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>>   static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsign=
ed int on)
>>>>>>   {
>>>>>>   	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>>>>>> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct i=
rq_data *data, unsigned int on)
>>>>>>   	return 0;
>>>>>>   }
>>>>>>  =20
>>>>>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigne=
d int type)
>>>>>> +{
>>>>>> +	struct tegra_pmc *pmc =3D irq_data_get_irq_chip_data(data);
>>>>>> +	unsigned int offset, bit;
>>>>>> +	u32 value;
>>>>>> +
>>>>>> +	if (data->hwirq =3D=3D ULONG_MAX)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	offset =3D data->hwirq / 32;
>>>>>> +	bit =3D data->hwirq % 32;
>>>>>> +
>>>>>> +	if (data->hwirq >=3D 32)
>>>>>> +		offset =3D PMC_WAKE2_LEVEL;
>>>>>> +	else
>>>>>> +		offset =3D PMC_WAKE_LEVEL;
>>>>>> +
>>>>>> +	value =3D tegra_pmc_readl(pmc, offset);
>>>>>> +
>>>>>> +	switch (type) {
>>>>>> +	case IRQ_TYPE_EDGE_RISING:
>>>>>> +	case IRQ_TYPE_LEVEL_HIGH:
>>>>>> +		value |=3D 1 << bit;
>>>>>> +		break;
>>>>>> +
>>>>>> +	case IRQ_TYPE_EDGE_FALLING:
>>>>>> +	case IRQ_TYPE_LEVEL_LOW:
>>>>>> +		value &=3D ~(1 << bit);
>>>>>> +		break;
>>>>>> +
>>>>>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>>>>>> +		value ^=3D 1 << bit;
>>>>>> +		break;
>>>>>> +
>>>>>> +	default:
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>>> Shouldn't the WAKE_LEVEL be latched as well?
>> WAKE_LEVELs dont need any latch as they are the levels SW sets for wake
>> trigger and they are not status
> Okay.
>
> [snip]
