Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3043E336D
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 06:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhHGEow (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Aug 2021 00:44:52 -0400
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:60161
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230150AbhHGEoA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 7 Aug 2021 00:44:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noyss6DxO47LEv/vDMc2owDxckk3kRfg9+RPOmFZTVnynqdd8v/Sd7iVHm/c0SWCxp8I+MgIEiVDqpDIAFvJdJUJRXCuEaYJ8QOGtM5Vbt42EIN7qToIhXjJcjj1wplHfB3nJuf72yA7xD7/7zuDzdocUi3nBPMWd81k+UfbDSTqNLj5lFUBsNVaMVVjT9QtuGUtdv8b1QbqeMbouwezGvX8iK9ia7R4ZrbyRfsqhEJCy17PQ4Vh6ptoL+QElBIsCvMx4+/rmEIBoJvgLoD48tEP3LxDWNU/voJimHLkfy1SD2QowL4fjHR3OVBG7VeY6WRCFQLGhfSb82Mtf1KeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5KsMuHqiHK/38QBDEOsx/AQ0xWEly1+CDS1wk/z/+s=;
 b=a+jjsr1V+Y/iRwVkYzY1NbiwvEz94HUt6KK/wlw8XBwfOIcsU1d61jDIeUEUgbM+DP+JFs/ZrmTKVxiowrE9PpC6vmcBVu/K/VRIOHqLOGlcALKmHVGEsUc2496LQPY/WPI4wpVXbsLyhXYsMOkV50zDd+ZlmpYgGvcfeNXfIpeHn4T/1E48LEh3hdnk9O7QfiUWECpLmQPkAFcEqYqTc7Lmn6TE3QSzm3bP/kvOY88pjK7TpR1JLeSkFJZ9s2RYbQjsDin0X0Yx0SUytQPb6q+UThRydwlvB7dXBktY3APtta85snkvzM3dlXh+1+HoN8NzOqkSln+WGz5wrGFJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5KsMuHqiHK/38QBDEOsx/AQ0xWEly1+CDS1wk/z/+s=;
 b=MYvzHSfZ5kj7N52r5wSgD4Tb0BjwWLSAp/J9hg29bnM7PDtOcLMRJO0DZdwx/mXjPaJ1LOKHbLtmV7w0GoANKh4NZHZdP7vH+PG2ATi55O34/nufUM7cPh9JsH+7WoriVPrYsY4IkdUwZKMwMZgTMtRuJQokldvmV2IW4USeF6uiA66N19hi5GJRwDbNHImmjcAZpUH0iyzDWYq5buskOL3YbxzXoUmnqlLnfHyVksBUHFrLOrbwf9v2mcOvy90yEHWG5CKdox2Lgn7IhHI/yRlThNe3jSNAIxTKrLbFK/oQdBH45Arwyj15GEWjPXTyXUWelSgb6h6kPbeYbiHrOw==
Received: from DM6PR08CA0011.namprd08.prod.outlook.com (2603:10b6:5:80::24) by
 BYAPR12MB3254.namprd12.prod.outlook.com (2603:10b6:a03:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Sat, 7 Aug
 2021 04:43:38 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::68) by DM6PR08CA0011.outlook.office365.com
 (2603:10b6:5:80::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Sat, 7 Aug 2021 04:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4394.16 via Frontend Transport; Sat, 7 Aug 2021 04:43:37 +0000
Received: from [172.17.173.69] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 7 Aug
 2021 04:43:37 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com> <20210807030746.GA9850@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <91a173b3-18dc-5d6b-002f-893e7478717b@nvidia.com>
Date:   Fri, 6 Aug 2021 21:52:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807030746.GA9850@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46936662-e1f6-4a3e-c1aa-08d9595dec3a
X-MS-TrafficTypeDiagnostic: BYAPR12MB3254:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3254D8E2CB6E4CF7586F1D2FAEF49@BYAPR12MB3254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjoobWWPIalBNAeapDh5CXWUHilXhPtrtgDUx0fEM30+mt1xFiys7fSUbkD22DdQJqcAVwl0dkFqEGwi1n41x8vD5PtvfX1waKFBJQdfOm56/s8vcDkYfpZKsj49lIgsMAhnsshv8rk3c1PLt4GRZ/6tZP01/94hAbAe00oY+umH/I2HYMaQ3afpul8eugLMoKtJZttpA8PsGp3+Q9Mgf/nZhJCtsmxB78kpYU12itAbGLZTFo+dMORNUY4trRruBVrXcliXnJG7/sPfwOVriSrjeVp6G8UdS1Z0GANYALNXFgCDJUenexbsLXM7NIHuCxC+DtEbVYj8xGg//Rb71OaEkEJEbWJT2y/mwEGx+ur+WVeYW1yTe1xxoX7CkSMcQmhUPaKopv/34may3aUIRtpTAedhPXqOmgubVjjGPIEqCbt5X1zYxHPoJWfD7vVOZQ+0XFFhW6y23iQL5ZKt9pnl3ujrZIQ6vmRSkVnUAWCHSdw1rE4C1I4yMUQIs82jjXw56PH1WYUjdiHd3GuefqxNnQKgeKFDekPEDPGTlyEJTOznPBI6V17CglDD10MEufJuxLCYE57unYxG5mM1PofvrMgqWHQxyyPEcqFo0X5nuBPjr2kqXf8zhbjqpPgL5hzspG8jOafxD+dej5V1YHjHQxsg0VrzphggbnB8jEhSvvB2TbWCFrLAnatqkU02zfvd0HlIAkTg7Hk8nnADLX1AyA77g4/q437sbdmSClo=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(16576012)(30864003)(6916009)(31686004)(5660300002)(31696002)(47076005)(4326008)(36860700001)(508600001)(6666004)(70586007)(70206006)(82310400003)(7636003)(316002)(426003)(53546011)(36756003)(54906003)(8676002)(86362001)(2616005)(7416002)(2906002)(16526019)(336012)(356005)(36906005)(186003)(8936002)(26005)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2021 04:43:37.8290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46936662-e1f6-4a3e-c1aa-08d9595dec3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3254
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 8/6/21 8:07 PM, Kent Gibson wrote:
> On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
>> On 7/31/21 8:43 AM, Kent Gibson wrote:
>>> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
>>>> Thanks Kent for the review comment. My responses inline.
>>>>
>>>> On 7/1/21 7:21 AM, Kent Gibson wrote:
>>>>> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
>>>>>> Tegra194 device has multiple HTE instances also known as GTE
>>>>>> (Generic hardware Timestamping Engine) which can timestamp subset of
>>>>>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>>>>>> and exposes timestamping ability on those lines to the consumers
>>>>>> through HTE subsystem.
>>>>>>
>>>>>> Also, with this patch, added:
>>>>>> - documentation about this provider and its capabilities at
>>>>>> Documentation/hte.
>>>>>> - Compilation support in Makefile and Kconfig
>>>>>>
>>>>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>>>>> ---
>>>>>>  Documentation/hte/index.rst        |  21 ++
>>>>>>  Documentation/hte/tegra194-hte.rst |  65 ++++
>>>>>>  Documentation/index.rst            |   1 +
>>>>>>  drivers/hte/Kconfig                |  12 +
>>>>>>  drivers/hte/Makefile               |   1 +
>>>>>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>>>>>>  6 files changed, 654 insertions(+)
>>>>>>  create mode 100644 Documentation/hte/index.rst
>>>>>>  create mode 100644 Documentation/hte/tegra194-hte.rst
>>>>>>  create mode 100644 drivers/hte/hte-tegra194.c
>>>>>>
>>>>>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..f311ebec6b47
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/hte/index.rst
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +============================================
>>>>>> +The Linux Hardware Timestamping Engine (HTE)
>>>>>> +============================================
>>>>>> +
>>>>>> +The HTE Subsystem
>>>>>> +=================
>>>>>> +
>>>>>> +.. toctree::
>>>>>> +   :maxdepth: 1
>>>>>> +
>>>>>> +   hte
>>>>>> +
>>>>>> +HTE Tegra Provider
>>>>>> +==================
>>>>>> +
>>>>>> +.. toctree::
>>>>>> +   :maxdepth: 1
>>>>>> +
>>>>>> +   tegra194-hte
>>>>>> \ No newline at end of file
>>>>>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..c23eaafcf080
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/hte/tegra194-hte.rst
>>>>>> @@ -0,0 +1,65 @@
>>>>>> +HTE Kernel provider driver
>>>>>> +==========================
>>>>>> +
>>>>>> +Description
>>>>>> +-----------
>>>>>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
>>>>>> +known as generic timestamping engine (GTE). This provider driver implements
>>>>>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
>>>>>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
>>>>>> +driver converts clock tick rate to nano seconds before storing it as timestamp
>>>>>> +value.
>>>>>> +
>>>>>> +GPIO GTE
>>>>>> +--------
>>>>>> +
>>>>>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
>>>>>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
>>>>>> +always on (AON) gpio controller instance supports timestamping GPIOs in
>>>>>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
>>>>>> +controller as it requires very specific bits to be set in GPIO config register.
>>>>>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
>>>>>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
>>>>>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
>>>>>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
>>>>>> +subsystem and GPIO GTE for in kernel consumers.
>>>>>> +
>>>>>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
>>>>>> +
>>>>>> +	To enable HTE on given GPIO line.
>>>>>> +
>>>>>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
>>>>>> +
>>>>>> +	To retrieve hardwre timestamp in nano seconds.
>>>>>> +
>>>>>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
>>>>>> +
>>>>>> +	To query if HTE is enabled on the given GPIO.
>>>>>> +
>>>>>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>>>>>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
>>>>>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
>>>>>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
>>>>>> +in nano second.
>>>>>> +
>>>>> <snip>
>>>>>
>>>>>> +
>>>>>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>>>>>> +{
>>>>>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>>>>>> +	u64 tsc;
>>>>>> +	int dir;
>>>>>> +	struct hte_ts_data el;
>>>>>> +
>>>>>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>>>>>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>>>>>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
>>>>>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
>>>>>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
>>>>>> +		tsc = (((u64)tsh << 32) | tsl);
>>>>>> +
>>>>>> +		src = tegra_hte_readl(gs, HTE_TESRC);
>>>>>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
>>>>>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
>>>>>> +
>>>>>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
>>>>>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
>>>>>> +		acv = pv ^ cv;
>>>>>> +		while (acv) {
>>>>>> +			bit_index = __builtin_ctz(acv);
>>>>>> +			if ((pv >> bit_index) & BIT(0))
>>>>>> +				dir = HTE_EVENT_RISING_EDGE;
>>>>>> +			else
>>>>>> +				dir = HTE_EVENT_FALLING_EDGE;
>>>>>> +
>>>>>> +			line_id = bit_index + (slice << 5);
>>>>>> +			el.dir = dir;
>>>>>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
>>>>>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
>>>>>> +					      sizeof(el));
>>>>>> +			acv &= ~BIT(bit_index);
>>>>>> +		}
>>>>>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
>>>>>> +	}
>>>>>> +}
>>>>> What happens when the hte_push_ts_ns_atomic() fails?
>>>>> The timestamp will be quietly dropped?
>>>>> What happens when the interrupt corresponding to that dropped timestamp
>>>>> asks for it?  The irq handler thread will block until it can get a
>>>>> timestamp from the subsequent interrupt?
>>>> Two things happen, 1) at the push, HTE core increments seq counter
>>>>
>>>> 2) If the consumer has provided callback, it will either call that callback
>>>>
>>>> with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect
>>>>
>>>> view of dropped ts. However, I see the problem with the consumers not
>>>>
>>>> providing callback, in that case, push_ts* API just wakes up process without
>>>>
>>>> indicating why (assuming notify variable is true or else there is a chance for
>>>>
>>>> the thread to block forever). One easy approach I can think of for now is to
>>>>
>>>> make callback mandatory (which is optional right now), I will have to rethink
>>>>
>>>> that scenario and will push corrected version next RFC version.
>>>>
>>>> Thanks for pointing out.
>>>>
>>> I'm not sure you understood my question, which was intended to
>>> demonstrate how an overflow here would break your gpio integration, but I
>>> am certain that I don't understand your answer.
>>>
>>> Using the callback to signal fifo overflow to the consumer is crazy.
>>> If the consumer is too busy to service the fifo then they probably wont
>>> be prepared to deal with the callback either. And the primary purpose of
>>> the fifo is to decouple the producer and consumer, so requiring a callback
>>> defeats the whole purpose of having the fifo there in the first place.
>>>
>>>>> Which brings me back to the concern I have with the approach used in
>>>>> the hte/gpiolib integration - how do you guarantee that the timestamp
>>>>> returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
>>>>> being handled, particularly in the face of errors such as:
>>>>>  - overflows of the timestamp FIFO in the chip
>>>> I currently do not have any indication mechanism as the providers
>>>>
>>>> I am dealing with right now does not have overflow hardware detection
>>>>
>>>> support. If the chip supports, it should be easy to integrate that feature.
>>>>
>>>> I will provide some hook function or change in push_* API to accommodate
>>>>
>>>> this in next version of RFC.
>>>>
>>>>>  - overflows of software FIFOs as here
>>>> HTE core records sequence counter as well it callsback the consumer with
>>>>
>>>> HTE_TS_DROPPED.
>>>>
>>>>>  - lost interupts (if the hw generates interrupts faster than the CPU
>>>>>    can service them)
>>>> For this, I have no idea unless hardware supports some sort of mechanism
>>>>
>>>> to catch that. For the current providers, as soon as it detects changes on lines
>>>>
>>>> it captures TS in its hw fifo. Its interrupt gets generated based on threshold
>>>>
>>>> set in that hw fifo. This interrupt is different than the lines of actual device
>>>>
>>>> that is why I said I have no idea how we can tackle that. Let me know if there
>>>>
>>>> is any idea or reference of the codes which does tackle this.
>>>>
>>> As far as I am aware there is no solution, given your suggested
>>> architecture.
>>>
>>> Your architecture is inherently fragile, as you try to use one stream
>>> of data (the timestamp fifo) to provide supplementary info for another
>>> (the physical irq).  Guaranteeing that the two are synchronised is
>>> impossible - even if you can get them synced at some point, they can
>>> fall out of sync without any indication.
>>> That is a recipe for Ingenuity flight 6.
>>>
>>> My solution would be to use the hte timestamp fifo as the event source,
>>> rather than the physical irq.  With only one event source the 
>>> synchronisation problem disappears.  As to how to implement that,
>>> gpiolib-cdev would request a line from the hte subsystem and register
>>> and event handler for it, much as it does currently with the irq
>>> subsystem. That event handler would translate the hte events into gpio
>>> events.
>> I have to circle back to here regarding the event handler thing. I
>>
>> surely did not understand fifo as event source rather than physical irq
>>
>> part? I believe you are suggesting to have somekind of buffer abstraction
>>
>> layer for the hardware fifo similar to what I have with software buffer and
>>
>> register handler to that buffer, right?
>>
> No, what is the purpose of that buffering and watermarking in software?
> Just pass the timestamped edge event direct to the consumer.
> Let the consumer do any buffering if necessary, as Jonathon Cameron
> also suggested in the 02/11 thread.
>
>> The current implementation I have (not with gpiolib/HTE integration)
>>
>> is partially simlar to event handler mechanism except that it does not send data
>>
>> with it. See hte-tegra194-irq-test.c in this patch.
>>
>>
>> Coming back to gpiolib/hte integration part and your suggestion about
>>
>> providing event handler during hte registration. I have below doubts:
>>
>> 1. When HTE calls this provided hte_handler, will it store data into
>>
>> hte->timestamp_ns directly, I am guessing yes.
>>
> This is implementation detail of the hte/gpiolib interface that I leave
> for you to suggest.  Work something out.
>
>> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
>>
>> hte_handler, for the worst case scenario as below?
>>
> No.  If hardware timestamp is selected then no irq is requested from the
> irq subsystem for that line - only from the hte subsystem instead.
> So there will be no edge_irq_handler call for that line, so no possible race.

That is not possible for certain providers, for example the one I am dealing

with which requires GPIO line to be requested as input and IRQ needs to

be enabled on them.

>
>> 2.a edge_irq_handler runs first, checks some kind of flag to see if
>>
>> we are using hardware clock and if yes, directly accesses timestamp_ns
>>
>> instead of calling line_event_timestamp.
>>
>> 2.b finds timestamp_ns to be invalid since it ran first before hte event handler did.
>>
>> 2.c returns and invokes edge_irq_thread.
>>
>> 2.c.1 Here, should edge_irq_thread wait in cdev till hte handler to be called? If yes,
>>
>> Doesn't it have case where it will wait forever till hte handler gets called, also not
>>
>> to mention keeping irq line disabled since IRQF_ONESHOT is specified, could be possible
>>
>> when provider has gone rogue?
>>
>> 3. I am guessing there will not be dropped event in this suggestion since are
>>
>> directly sending data without buffering in HTE, that is the good part I believe.
>>
>>
>>> You still have to deal with possible fifo overflows, but if the fifo
>>> overflows result in discarding the oldest event, rather than the most
>>> recent, then everything comes out in the wash.  If not then the final
>>> event in a burst may not correspond to the actual state so you need
>>> some additional mechanism to address that.
>>> Either way the consumer needs to be aware that events may be lost - but
>>> with the event seqno for consumers to detect those lost events we
>>> already have that covered.
>> Correct (for the seqno part), you already have seqno, cdev does not need
>>
>> struct hte_ts_data's u64 seq counter.
>>
>>
>> On similar note, I was looking at the linereq_put_event
>>
>> function and I have below doubts:
>>
>> 1. IIUC, you are discarding oldest data when fifo is full, right?
>>
> Correct.
>
>> 2. There is no indication to waiting client if overflow is true beside pr_debug print.
>>
>> 2.a Does this not block waiting client infinitely since there is no wake_up_poll call
>>
>> in case of overflow == 1?
>>
> No - there already was a wake_up_poll call for the entry discarded by
> the kfifo_skip().
>
> You dropped 2.b intentionally, right?  Buffer overflow perhaps??
>
>> 2.c If I have missed, what current mechanism cdev provides to client beside seqno
>>
>> to indicate there is a drop and if there is a drop, what it does to re-sync?
>>
> Just seqno.  Overflows in the cdev event buffer discard the oldest
> events, so the final event that the client reads will correspond to
> current state. There is an event waiting for the client that, due to
> the seqno jump, indicates the overflow.  What else do they need?
> And what is there to resync?
>
> Not sorry if I'm getting short with you here - I'm getting really tired
> of this subject as we're clearly not communicating well and are repeatedly
> covering the same ground.
Sure, no problem...
>
> Cheers,
> Kent.
