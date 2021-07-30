Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625DB3DB3ED
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 08:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237606AbhG3GwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 02:52:16 -0400
Received: from mail-bn8nam08on2046.outbound.protection.outlook.com ([40.107.100.46]:32352
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230040AbhG3GwP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 02:52:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVIVUBlV78n8Of33lSdnAIpxifFeiKreG18xsCD+bpcBwZJzBhKdOKXF/Gs8PSk10OFYEWGOhxgMepfjRVtl00GmCa4iJAp0f4M5T6iQiitkKSqGn1k+2an40laz+IAI56sdOqRdYGELjk/5C7fOgJR3Udz/N/HwmkdOzm8+e9pxTDgRN6iOVvv9VTiG3b5BxXP/X73Jw7CkboJNXKz+9HZtODwmlzx5ztxCN2hx+1HkS6ZSQflxrFOyfqrMfWAzYPIhPwJfXlT5AcgXBzVqDfuiMeLxIlCuhZQfYjEfJlpVAX9wknJv952YegNxkYWWQ5NfNAUHRhUoWUrO4wLwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMvEaSZtVVvIxG0xUufuxfkHE0FiE7BnuAsQNsX4DC0=;
 b=VS0yJ85pQgpjlpadNiYU7ezoN6fhaa73iG5mL/zA5z4RExsQcfIi2+dfM6+rOJe3A0xorb2CwMYgIllSDYLSzf19AH0TNo01EuEJuRb/j6HyxdTc4k5RStWUJhPzOyT2C9qd2UQ3MepQROhZ31Cb9LblmTS62/y18JwYhpHUtRk+rhfsESVOIPBT6A6lwmIzhnQS+76BhFIAagG2vzP3XqYZEvCXhmxBuDcuGhicQ6glPAGN+TILZoZlNv4hI6xsBeYR/q0IAWXCcgxUsWD/6qogvFa+YafaJKZYhGXFIXmLH13OHAEYYqO4UyW3LPVUe/cTipEvYieUN4Nlnvesbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMvEaSZtVVvIxG0xUufuxfkHE0FiE7BnuAsQNsX4DC0=;
 b=lZpfQXiNytQ4X7bkN3tZe7rpWYumCm71kDymSnVRHbdMPHpimLxg/5T1LXtI+8kvPCELRJGWDjxta2FrBCqJgRZb8GXPWB737QRIxLcdQc3tWr3pJbHL/Hk2zBbE/egwNo5hIK4m81op25kYt2278ejpmkRwidyCQs1buwESQqVI6HwFemb05nRbPoiTMOiecI5LSOHMEFSye2Hsfu358QiCMyPUHnuW2Ii1p2Nq826nZwuusRwNPqP0czvnpQPfo+to90EAsE0ZHC0iFNDkn6DkJW+iXQuOG34inCPWLzwIcv490+uRi04e46vAdiIKT7YaGQBB6T8946RGbPUUaA==
Received: from DM6PR17CA0028.namprd17.prod.outlook.com (2603:10b6:5:1b3::41)
 by MWHPR12MB1632.namprd12.prod.outlook.com (2603:10b6:301:10::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 30 Jul
 2021 06:52:08 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::77) by DM6PR17CA0028.outlook.office365.com
 (2603:10b6:5:1b3::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 06:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 06:52:08 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 06:52:07 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
From:   Dipen Patel <dipenp@nvidia.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <928b9d68-c0be-49d7-96be-5f12aa699402@nvidia.com>
Date:   Fri, 30 Jul 2021 00:01:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1411abd-046d-4f4e-1512-08d953268ca7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1632:
X-Microsoft-Antispam-PRVS: <MWHPR12MB163250E1EFFB5F2F05EA015AAEEC9@MWHPR12MB1632.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VyOajw+fXpfoFYsSrDSZSHbia8IPS2rCO6geQ17wdIpnDl8x/pHJ/ZkPceP+iE6IAUnqw6QCQDRPNuI80i1kQMwhyHBftUOFguTG+O/9fAYFSgVlOsYpsIuieu5QeA+gCvMVqBoNTdaL08LsVXECAd+91ez/RvM8NHYCET29I1TUp803mnBnm1E3bjA57jLYNpcXOf9RzmpfKTbxSQYq+uRwxuYV8XKxlS9jA+G7+gBO6iAS9RRNY9s6mnmPNuCKALv/dHKtf6nwKfw7NFqFXkixpPWDL6e68h0ccyRBszq8FxrATBkWsrxHDFw6MPXSN1bC8JsYCCrRmB0+/rRXGHY63MbukCEkxbTw8F8Lp3xDF2vL/7knQICAC1cAbFGptEksjAPpKe10SjeKpEBOg5bC34ynJDIQEztxmvAw4VDscEbvhBUXCST5PbVffC0BvJF5wXUc/pGlj/Jt9s2tJ+Ep+pjXbElOrbLEIfZQPNRNFfdgqpAMHHpCdH9FSJr3Ntvkndkt9PZvx8D12idMFn7+qO+5gnoEZDMS7MG/jPPYBJAk4rZzOcULIoOSiMWLCuyXQbfA0qXEJPpuLkMo/TibJNNAsPX3aO8qIc0Nq2QtH5y96djOgB1drVwNYmmmf1uarViy/mIqc0i//7uHN/RgZIbf4OHdhZ3Rxb4M+eEYeaT9j2y3q2bVgRGHTUlrJJ3fk3Gp86XZll88KywoNK8IhMhhZVb/B1Ru2vvCuM=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(36756003)(356005)(8676002)(336012)(5660300002)(6916009)(8936002)(426003)(70206006)(4326008)(508600001)(31696002)(70586007)(16526019)(47076005)(53546011)(86362001)(186003)(16576012)(82310400003)(26005)(54906003)(36860700001)(83380400001)(31686004)(316002)(2906002)(7636003)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 06:52:08.2249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1411abd-046d-4f4e-1512-08d953268ca7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1632
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/28/21 4:59 PM, Dipen Patel wrote:
> Thanks Kent for the review comment. My responses inline.
>
> On 7/1/21 7:21 AM, Kent Gibson wrote:
>> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
>>> Tegra194 device has multiple HTE instances also known as GTE
>>> (Generic hardware Timestamping Engine) which can timestamp subset of
>>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>>> and exposes timestamping ability on those lines to the consumers
>>> through HTE subsystem.
>>>
>>> Also, with this patch, added:
>>> - documentation about this provider and its capabilities at
>>> Documentation/hte.
>>> - Compilation support in Makefile and Kconfig
>>>
>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>>> ---
>>>  Documentation/hte/index.rst        |  21 ++
>>>  Documentation/hte/tegra194-hte.rst |  65 ++++
>>>  Documentation/index.rst            |   1 +
>>>  drivers/hte/Kconfig                |  12 +
>>>  drivers/hte/Makefile               |   1 +
>>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>>>  6 files changed, 654 insertions(+)
>>>  create mode 100644 Documentation/hte/index.rst
>>>  create mode 100644 Documentation/hte/tegra194-hte.rst
>>>  create mode 100644 drivers/hte/hte-tegra194.c
>>>
>>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
>>> new file mode 100644
>>> index 000000000000..f311ebec6b47
>>> --- /dev/null
>>> +++ b/Documentation/hte/index.rst
>>> @@ -0,0 +1,21 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +============================================
>>> +The Linux Hardware Timestamping Engine (HTE)
>>> +============================================
>>> +
>>> +The HTE Subsystem
>>> +=================
>>> +
>>> +.. toctree::
>>> +   :maxdepth: 1
>>> +
>>> +   hte
>>> +
>>> +HTE Tegra Provider
>>> +==================
>>> +
>>> +.. toctree::
>>> +   :maxdepth: 1
>>> +
>>> +   tegra194-hte
>>> \ No newline at end of file
>>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>>> new file mode 100644
>>> index 000000000000..c23eaafcf080
>>> --- /dev/null
>>> +++ b/Documentation/hte/tegra194-hte.rst
>>> @@ -0,0 +1,65 @@
>>> +HTE Kernel provider driver
>>> +==========================
>>> +
>>> +Description
>>> +-----------
>>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
>>> +known as generic timestamping engine (GTE). This provider driver implements
>>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
>>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
>>> +driver converts clock tick rate to nano seconds before storing it as timestamp
>>> +value.
>>> +
>>> +GPIO GTE
>>> +--------
>>> +
>>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
>>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
>>> +always on (AON) gpio controller instance supports timestamping GPIOs in
>>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
>>> +controller as it requires very specific bits to be set in GPIO config register.
>>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
>>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
>>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
>>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
>>> +subsystem and GPIO GTE for in kernel consumers.
>>> +
>>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
>>> +
>>> +	To enable HTE on given GPIO line.
>>> +
>>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
>>> +
>>> +	To retrieve hardwre timestamp in nano seconds.
>>> +
>>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
>>> +
>>> +	To query if HTE is enabled on the given GPIO.
>>> +
>>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
>>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
>>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
>>> +in nano second.
>>> +
>> <snip>
>>
>>> +
>>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>>> +{
>>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>>> +	u64 tsc;
>>> +	int dir;
>>> +	struct hte_ts_data el;
>>> +
>>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
>>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
>>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
>>> +		tsc = (((u64)tsh << 32) | tsl);
>>> +
>>> +		src = tegra_hte_readl(gs, HTE_TESRC);
>>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
>>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
>>> +
>>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
>>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
>>> +		acv = pv ^ cv;
>>> +		while (acv) {
>>> +			bit_index = __builtin_ctz(acv);
>>> +			if ((pv >> bit_index) & BIT(0))
>>> +				dir = HTE_EVENT_RISING_EDGE;
>>> +			else
>>> +				dir = HTE_EVENT_FALLING_EDGE;
>>> +
>>> +			line_id = bit_index + (slice << 5);
>>> +			el.dir = dir;
>>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
>>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
>>> +					      sizeof(el));
>>> +			acv &= ~BIT(bit_index);
>>> +		}
>>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
>>> +	}
>>> +}
>> What happens when the hte_push_ts_ns_atomic() fails?
>> The timestamp will be quietly dropped?
>> What happens when the interrupt corresponding to that dropped timestamp
>> asks for it?  The irq handler thread will block until it can get a
>> timestamp from the subsequent interrupt?
> Two things happen, 1) at the push, HTE core increments seq counter
>
> 2) If the consumer has provided callback, it will either call that callback
>
> with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect
>
> view of dropped ts. However, I see the problem with the consumers not
>
> providing callback, in that case, push_ts* API just wakes up process without
>
> indicating why (assuming notify variable is true or else there is a chance for
>
> the thread to block forever). One easy approach I can think of for now is to
>
> make callback mandatory (which is optional right now), I will have to rethink
>
> that scenario and will push corrected version next RFC version.
>
> Thanks for pointing out.
>
>> Which brings me back to the concern I have with the approach used in
>> the hte/gpiolib integration - how do you guarantee that the timestamp
>> returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
>> being handled, particularly in the face of errors such as:
>>  - overflows of the timestamp FIFO in the chip
> I currently do not have any indication mechanism as the providers
>
> I am dealing with right now does not have overflow hardware detection
>
> support. If the chip supports, it should be easy to integrate that feature.
>
> I will provide some hook function or change in push_* API to accommodate
>
> this in next version of RFC.
>
>>  - overflows of software FIFOs as here
> HTE core records sequence counter as well it callsback the consumer with
>
> HTE_TS_DROPPED.
>
>>  - lost interupts (if the hw generates interrupts faster than the CPU
>>    can service them)
> For this, I have no idea unless hardware supports some sort of mechanism
>
> to catch that. For the current providers, as soon as it detects changes on lines
>
> it captures TS in its hw fifo. Its interrupt gets generated based on threshold
>
> set in that hw fifo. This interrupt is different than the lines of actual device
>
> that is why I said I have no idea how we can tackle that. Let me know if there
>
> is any idea or reference of the codes which does tackle this.
>
>
> Regarding HTE/GPIOLIB integration comment:
>
> You are right, currently, I have only tsc field returned from struct hte_ts_data
>
> to gpiolib. If I can extend that to return hte_ts_data structure which has seq
>
> counter, which I believe can be used to track the overflow situation. The

The reason I only return timestamp and not other details like its seq

counter, is because to comply with line_event_timestamp since it returns

only u64. Not sure which is the best way to extend and bring out its seq.

>
> dropped scenario can be easily tracked if gpiolib can be notified with above
>
> mentioned DROP event through callback. If that is the case, is it ok to have
>
> some sort of callback per gpio in gpiolib?
>
>
> Any idea how I can integrate callback notification with gpiolib if you do not agree on
>
> above callback suggestion?
>
>> ?
>>
>> Cheers,
>> Kent.
>>
