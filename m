Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5B13DF7D1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Aug 2021 00:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhHCWby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 18:31:54 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com ([40.107.94.78]:4801
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229611AbhHCWby (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 18:31:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpyG8AetGnwzR1K27uSNnHMYAZlOleGpZtHG9pCpdobfIB++igN2vxaKtsErl5dZEfuWTamaXxKGq4ec7dsxpbcScSMO4PEbmoFIo+OV4cQVlrcjik47najWJyrAUw9EilW2DGZITpHZeMg+bvAY8RAzb9c5rPde/zYEfrOdV+oNyC4LOUwcdEzR7ZB/QNED2zwp7gBcquIDzTg4gFQLtW0zJ9v8Zs8E5VYjX4c08IZswc09aByrwpMCbkcrOjGc2cDV+umvGswUB8aAGvlM5Sw4Eas0H0TUJWo8j87X+1LFX0SpMeffCHLMvrqc/jkwoGWu0C2a0ycFq5FzaenpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jhd4cV1rRALCQyWnHc9JU7/h3T2GK9F7UnCLW0PtRxo=;
 b=WLIADYlnqOa4EY61J8x/0wemKF0vofaA33NqKPS6CyzsSpwgv9UHXOrq+9dmr7xu79gQzN+WhCVenVIgMhrEs9kGDSfxi96zJTBhwSlIcq8TPcdBX/eFbL4e60W6IqRKo+HDOlAL12RffubQsKNZkp00PIi0/aFI/wOALScsccwMSmuVP7vtJDM/RPdJlyINLomPnIGhsVa9tKsZOSKUxPDPuKh9BFzghbDeKybdGCf2/2TfwchsydWFwsEiDK0Xrl1Hk9rb5XPsZt29bfuA6YEjZE7CrfWIP2jk+1/1QA2Vw74HtAK5137GR8uCjqnf9q0UuY6xbDRQSV7IbF7Zeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jhd4cV1rRALCQyWnHc9JU7/h3T2GK9F7UnCLW0PtRxo=;
 b=eVvAWJ1LGtAwzDpxtyY/hv2bVK/IMkXNNA2dkVHF9ZaJbai2sct8lr5nyUvap7PvkTi1CD2Urv3upSNsBSe9wA3/PCWIXefTejMfeKaQ+f7d5QCjd8Rm/gmI0NwZY550jmsP4JOZ+wVCAU+lMO66xpXJrubt17tnEmWErs5poahQfj89eZwDojhAJBA99yqFqtSrrfQE3TpdRVao/1ZDulYYALZU7AypO017LvWMhU2Vjl9PmeS8RvD5zJ5FMUhqSbc4LD+rLfeje8eaIjdmfv/9CIo7cDLQLXSmb2JahIi87Ma2G27MINBsUljdk5tsGkK1e1h0KarIDgyu7UfjrA==
Received: from DM5PR2001CA0001.namprd20.prod.outlook.com (2603:10b6:4:16::11)
 by DM6PR12MB2636.namprd12.prod.outlook.com (2603:10b6:5:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Tue, 3 Aug
 2021 22:31:41 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::ce) by DM5PR2001CA0001.outlook.office365.com
 (2603:10b6:4:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Tue, 3 Aug 2021 22:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 22:31:41 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug
 2021 22:31:40 +0000
Received: from [172.17.173.69] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021
 22:31:39 +0000
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
From:   Dipen Patel <dipenp@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <6429d26d-7835-c4f7-96b3-c8b0ba730187@nvidia.com>
Date:   Tue, 3 Aug 2021 15:40:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210731154323.GA24906@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23d567a6-682f-4baa-7a3b-08d956ce7725
X-MS-TrafficTypeDiagnostic: DM6PR12MB2636:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2636B279F2437B42D78B58F5AEF09@DM6PR12MB2636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NdlrU+dvkEFlvld+ZSfdyx3QY7pchb8yucpzKqjWnt4rC1Tk6SyK11XDT/ogPAT9pZ0jc4vzVgkWX0NQFfuP59PQH62hFIYl6Q4jx4HjAoz8bIUSFjTyWNmLl1AVkfZHuDrnIwJjY8vwtp/u3w18aJRYryRL26f35I564BIzedQJoXltDxJmIXAqKSAvKby0EUuxiQEhtEVtB7hL4xt1kRXV1LzkxsB+WOGv0/+v+1+M9/v/HPQG6XBg7UMJaXlPK/LCBYkol5DXmNzZbTyjNRXPsf7UdzYqL2Ak6PTCrJs5qKeQb/r9hQASyUgFNZOVTvLEM8YupzNwVvD39vGCjfGuTF+QWMUtnLJ4ouOKhLztPUDNASNT2tpOnlPQcCBgSSE0kqDnkME2Z0pBgXtR9Nr33d+B+zFvFcn2f+zbjrnrpzIsCGY9anYnRjNLqrh9dsFj1P+XwdSdA43z6yx4p5VtZ7gEr+koQXmcyfvB2sRp8eEV5m0Ih78qMNI4rlBEsCBX05a0VzUP+M+T0CLHEkSpnY31Va3U9EKxPGf0Z3HTk1ifdp6kuOsCP/v4PuQqwaLW2MUZdXVOezTAhItseZs2Y+hS39PYzyx06XSD2pvDVEv7OZEGWox0WLYb0Qr7dmryWTvoHDv2AxdMiSv1ltpBnyYUxhrqI0LLG5mKIqo2nlaY01ySFRGkAoCxiwS1lI541C/xS3+kJ1NOVSDV82oqQqYM/IPdUh0m1rg7d80=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(47076005)(7416002)(70586007)(2616005)(82310400003)(70206006)(8676002)(426003)(7636003)(5660300002)(6916009)(31686004)(2906002)(6666004)(8936002)(36756003)(53546011)(478600001)(26005)(54906003)(16526019)(186003)(86362001)(4326008)(36906005)(36860700001)(316002)(16576012)(30864003)(31696002)(83380400001)(82740400003)(356005)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 22:31:41.0792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d567a6-682f-4baa-7a3b-08d956ce7725
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2636
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/31/21 8:43 AM, Kent Gibson wrote:
> On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
>> Thanks Kent for the review comment. My responses inline.
>>
>> On 7/1/21 7:21 AM, Kent Gibson wrote:
>>> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
>>>> Tegra194 device has multiple HTE instances also known as GTE
>>>> (Generic hardware Timestamping Engine) which can timestamp subset of
>>>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>>>> and exposes timestamping ability on those lines to the consumers
>>>> through HTE subsystem.
>>>>
>>>> Also, with this patch, added:
>>>> - documentation about this provider and its capabilities at
>>>> Documentation/hte.
>>>> - Compilation support in Makefile and Kconfig
>>>>
>>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>>> ---
>>>>  Documentation/hte/index.rst        |  21 ++
>>>>  Documentation/hte/tegra194-hte.rst |  65 ++++
>>>>  Documentation/index.rst            |   1 +
>>>>  drivers/hte/Kconfig                |  12 +
>>>>  drivers/hte/Makefile               |   1 +
>>>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>>>>  6 files changed, 654 insertions(+)
>>>>  create mode 100644 Documentation/hte/index.rst
>>>>  create mode 100644 Documentation/hte/tegra194-hte.rst
>>>>  create mode 100644 drivers/hte/hte-tegra194.c
>>>>
>>>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
>>>> new file mode 100644
>>>> index 000000000000..f311ebec6b47
>>>> --- /dev/null
>>>> +++ b/Documentation/hte/index.rst
>>>> @@ -0,0 +1,21 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +============================================
>>>> +The Linux Hardware Timestamping Engine (HTE)
>>>> +============================================
>>>> +
>>>> +The HTE Subsystem
>>>> +=================
>>>> +
>>>> +.. toctree::
>>>> +   :maxdepth: 1
>>>> +
>>>> +   hte
>>>> +
>>>> +HTE Tegra Provider
>>>> +==================
>>>> +
>>>> +.. toctree::
>>>> +   :maxdepth: 1
>>>> +
>>>> +   tegra194-hte
>>>> \ No newline at end of file
>>>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>>>> new file mode 100644
>>>> index 000000000000..c23eaafcf080
>>>> --- /dev/null
>>>> +++ b/Documentation/hte/tegra194-hte.rst
>>>> @@ -0,0 +1,65 @@
>>>> +HTE Kernel provider driver
>>>> +==========================
>>>> +
>>>> +Description
>>>> +-----------
>>>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
>>>> +known as generic timestamping engine (GTE). This provider driver implements
>>>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
>>>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
>>>> +driver converts clock tick rate to nano seconds before storing it as timestamp
>>>> +value.
>>>> +
>>>> +GPIO GTE
>>>> +--------
>>>> +
>>>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
>>>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
>>>> +always on (AON) gpio controller instance supports timestamping GPIOs in
>>>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
>>>> +controller as it requires very specific bits to be set in GPIO config register.
>>>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
>>>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
>>>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
>>>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
>>>> +subsystem and GPIO GTE for in kernel consumers.
>>>> +
>>>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
>>>> +
>>>> +	To enable HTE on given GPIO line.
>>>> +
>>>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
>>>> +
>>>> +	To retrieve hardwre timestamp in nano seconds.
>>>> +
>>>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
>>>> +
>>>> +	To query if HTE is enabled on the given GPIO.
>>>> +
>>>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>>>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
>>>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
>>>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
>>>> +in nano second.
>>>> +
>>> <snip>
>>>
>>>> +
>>>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>>>> +{
>>>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>>>> +	u64 tsc;
>>>> +	int dir;
>>>> +	struct hte_ts_data el;
>>>> +
>>>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>>>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>>>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
>>>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
>>>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
>>>> +		tsc = (((u64)tsh << 32) | tsl);
>>>> +
>>>> +		src = tegra_hte_readl(gs, HTE_TESRC);
>>>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
>>>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
>>>> +
>>>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
>>>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
>>>> +		acv = pv ^ cv;
>>>> +		while (acv) {
>>>> +			bit_index = __builtin_ctz(acv);
>>>> +			if ((pv >> bit_index) & BIT(0))
>>>> +				dir = HTE_EVENT_RISING_EDGE;
>>>> +			else
>>>> +				dir = HTE_EVENT_FALLING_EDGE;
>>>> +
>>>> +			line_id = bit_index + (slice << 5);
>>>> +			el.dir = dir;
>>>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
>>>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
>>>> +					      sizeof(el));
>>>> +			acv &= ~BIT(bit_index);
>>>> +		}
>>>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
>>>> +	}
>>>> +}
>>> What happens when the hte_push_ts_ns_atomic() fails?
>>> The timestamp will be quietly dropped?
>>> What happens when the interrupt corresponding to that dropped timestamp
>>> asks for it?  The irq handler thread will block until it can get a
>>> timestamp from the subsequent interrupt?
>> Two things happen, 1) at the push, HTE core increments seq counter
>>
>> 2) If the consumer has provided callback, it will either call that callback
>>
>> with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect
>>
>> view of dropped ts. However, I see the problem with the consumers not
>>
>> providing callback, in that case, push_ts* API just wakes up process without
>>
>> indicating why (assuming notify variable is true or else there is a chance for
>>
>> the thread to block forever). One easy approach I can think of for now is to
>>
>> make callback mandatory (which is optional right now), I will have to rethink
>>
>> that scenario and will push corrected version next RFC version.
>>
>> Thanks for pointing out.
>>
> I'm not sure you understood my question, which was intended to
> demonstrate how an overflow here would break your gpio integration, but I
> am certain that I don't understand your answer.
>
> Using the callback to signal fifo overflow to the consumer is crazy.
> If the consumer is too busy to service the fifo then they probably wont
> be prepared to deal with the callback either. And the primary purpose of
> the fifo is to decouple the producer and consumer, so requiring a callback
> defeats the whole purpose of having the fifo there in the first place.
>
>>> Which brings me back to the concern I have with the approach used in
>>> the hte/gpiolib integration - how do you guarantee that the timestamp
>>> returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
>>> being handled, particularly in the face of errors such as:
>>>  - overflows of the timestamp FIFO in the chip
>> I currently do not have any indication mechanism as the providers
>>
>> I am dealing with right now does not have overflow hardware detection
>>
>> support. If the chip supports, it should be easy to integrate that feature.
>>
>> I will provide some hook function or change in push_* API to accommodate
>>
>> this in next version of RFC.
>>
>>>  - overflows of software FIFOs as here
>> HTE core records sequence counter as well it callsback the consumer with
>>
>> HTE_TS_DROPPED.
>>
>>>  - lost interupts (if the hw generates interrupts faster than the CPU
>>>    can service them)
>> For this, I have no idea unless hardware supports some sort of mechanism
>>
>> to catch that. For the current providers, as soon as it detects changes on lines
>>
>> it captures TS in its hw fifo. Its interrupt gets generated based on threshold
>>
>> set in that hw fifo. This interrupt is different than the lines of actual device
>>
>> that is why I said I have no idea how we can tackle that. Let me know if there
>>
>> is any idea or reference of the codes which does tackle this.
>>
> As far as I am aware there is no solution, given your suggested
> architecture.
>
> Your architecture is inherently fragile, as you try to use one stream
> of data (the timestamp fifo) to provide supplementary info for another
> (the physical irq).  Guaranteeing that the two are synchronised is
> impossible - even if you can get them synced at some point, they can
> fall out of sync without any indication.
> That is a recipe for Ingenuity flight 6.
>
> My solution would be to use the hte timestamp fifo as the event source,
> rather than the physical irq.  With only one event source the 
> synchronisation problem disappears.  As to how to implement that,
> gpiolib-cdev would request a line from the hte subsystem and register
> and event handler for it, much as it does currently with the irq
> subsystem. 
Regarding "

much as it does currently with the irq
subsystem

" Statment, do you mean edge_irq_handler?
> That event handler would translate the hte events into gpio
> events.
>
> You still have to deal with possible fifo overflows, but if the fifo
> overflows result in discarding the oldest event, rather than the most
> recent, then everything comes out in the wash.  If not then the final
> event in a burst may not correspond to the actual state so you need
> some additional mechanism to address that.
> Either way the consumer needs to be aware that events may be lost - but
> with the event seqno for consumers to detect those lost events we
> already have that covered.
>
>> Regarding HTE/GPIOLIB integration comment:
>>
>> You are right, currently, I have only tsc field returned from struct hte_ts_data
>>
>> to gpiolib. If I can extend that to return hte_ts_data structure which has seq
>>
>> counter, which I believe can be used to track the overflow situation. The
>>
>> dropped scenario can be easily tracked if gpiolib can be notified with above
>>
>> mentioned DROP event through callback. If that is the case, is it ok to have
>>
>> some sort of callback per gpio in gpiolib?
>>
> Even better if you can provide the whole struct hte_ts_data so we have
> the direction as well (assuming all hte providers provide direction?).
> Otherwise gpiolib-cdev may need to read the physical line state and that
> may have changed since the hardware captured the event.
> In the solution I outlined above, the hte_ts_data would be provided to
> the event handler registered by gpiolib-cdev.

How is this event handler different then cdev providing callback to

hte core? I am guessing even cdev registers event handler with HTE

it is some sort of function  pointer so does callbacks.

> And in this case you could skip buffering the event in hte - it could be
> passed to the event handler as soon as it is read from the hardware - 
> gpiolib-cdev does its own buffering of gpio events.
>
>> Any idea how I can integrate callback notification with gpiolib if you do not agree on
>>
>> above callback suggestion?
>>
> See above.  But this is just my take, so I would get feedback from the
> relevant maintainers or SMEs before you act on anything suggested above.
>
> Cheers,
> Kent.
>
