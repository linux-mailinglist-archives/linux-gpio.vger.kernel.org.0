Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCAA3D99BD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 01:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbhG1XuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 19:50:20 -0400
Received: from mail-mw2nam12on2040.outbound.protection.outlook.com ([40.107.244.40]:18538
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232609AbhG1XuT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 19:50:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxH5tB5YJe4yZUWQe9Kxqs9p0RNbTAwHzIzDuXe3+mf7yHqjq09eUq89yMw9U8QpEM5tUnEaDVPdN/tH5sQc/OeNDDpkCEuWUOJ81vij0EJltGqKoPfHPED1G8Erxamtm/ai9e+Suwy9y1kTH7DO2wHNRFoDC3yOLDeus9x3pdeUNjdchwRykWxF4uWFF1GoaFh/sL6HOLT9k+RjDtL3iTDdKi3yVRg2GY74oqQ3VXSwtpY+IaLjPx6qjv5aXIBpsgEYth2evG1slb1SFZPrHfoFVGBFJW8LnAibotlpcYVA+q6ez3TS2/L1HUiLp69jI32Ai7hJj+YYynE2bMrR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yy2w4ujsT7d+nJjbn4vLmkqFX4O3yaDDM7eWnCG/GM=;
 b=BTpE2aUFY7hkBGSOgT84EOQ4B+7BXNMp0CmVzYFmMpc+oodqzcZ2eneU5JVoeMtNVVzHKb/Y549ZbNMZOqvKhk3+SzFYliFH3OELOMP01yl7gcLEoQyimbGix92C4TXsUJibhSv31OnHZoLHL0GbpNKK7F7qUlsrwlR2JcuatSIPwa6yVoJYCrxJE5BOuvw997x8iXldNsH60/xpeaydmYgASAbuvP/Z5RmzTW/o2hGN/xh80T/kiTM5HIMrtvAlSy90hWACNYAd+IMNaG8u8FEaaDGBNKoqrgj8fNE0/Rb1z/t+0tjAzHVZrjKEY+QKcC+0E6V/OuTaWOqKPX7M6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yy2w4ujsT7d+nJjbn4vLmkqFX4O3yaDDM7eWnCG/GM=;
 b=VQSinunWEn8VT+2y0nefjeEhvGgWyFT7M+qo/+XoAkMNhr9VwIksDjWnp8P0Q8rG4Eg0NwQHxqYf5UcnUZse6uBmPIocVqXHPcr8inJ5OsdRyMGeUW7qeJ4EGxqIOcdC2q/sYb8iZb332epu8KSjUw/WJ7ByEiv2z6OAYI1nasG59acJhmyK4LWe8f5l68ahoqT1L+Y8sU4gWDcWn8qb6cZqlu4zIobsn0eJ/cOprQ3bkPiiK9m1cz+U67dnUre8Bbv6hSAwdS+eBqOmDzzn1yMQ1dQipBs0jKKgXG/yz6ypSMlwhesOLj//BsLNipcObDkTuox8wN5eB67X2fvPMg==
Received: from DM6PR11CA0010.namprd11.prod.outlook.com (2603:10b6:5:190::23)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 23:50:14 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::1a) by DM6PR11CA0010.outlook.office365.com
 (2603:10b6:5:190::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 23:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 23:50:13 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Jul
 2021 23:50:10 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
To:     Kent Gibson <warthog618@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com> <20210701142156.GA34285@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
Date:   Wed, 28 Jul 2021 16:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701142156.GA34285@sol>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e188f1-66bb-4144-09ac-08d9522271b2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4340:
X-Microsoft-Antispam-PRVS: <DM6PR12MB43400766D0AEA9C5013BE94BAEEA9@DM6PR12MB4340.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hSkaVSOtqLo9BQ6J46GolkgM8AoUYo+5/GoCTmOT4S6ZIx/MxP2fRglTr2QfYCn+Z4UFmb/X6UcM1xD0N4ye2hLA/r8wOEbrrTU4IlEz56VvGz/a55iOsk8a561zRQ5WY441u3aFfz9Hzlnr/FjqbIMCLPpNCmplwirndMptm4gXE6MKm4mHWFhm7d//xMG4ZjRnehheC93ZgxbcH/VH8EuAuVYHlvrBpzv6xpta11iunghw1Q4RUyRH2LzIIskoz8qkocHRGux4Z2B4hYkmN2Bysk2/6FB18HuQ7dmDBHJ/U8V3sbGSp4OcgXhsZmQa+VOxXcbazC48AH+rO1uZDLJPV0eAMvDWXX/RyAcsIc1aGDMrnS2EC1HHXMlaqdkLDg18n3qnuxOqEDgP3+2Xct5/38X0gLZRiWdNpFBJZ2Sc64wqLg4UtbJ84P0z5Z/yjr0DkF9WhyEFYi574/tuLeRKtl4WSluhhOT1GpQB43fLHswTTbastGvKbln+iyWzjTUsj4P7b0FUK8kaj5pDYgUO1R8pYqyS/k3zD2pZJJrP7FtwYSGoria4yQOucb8/wprdTxg7FC+lZgZkp3UPJ+uISozYuYHX6O3jYC3v9+6sSWVk7wwS2acRea2HxLKkIkNRTTNA8vYDB75ZaIFonKM/F60ODj6282f9tgdglDEmwXKhohwcQe3UnE8+oM7s7ItLJcPXcStM/r65Pmq+LGtmFIepsajL9Ne0JVL6JA=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(46966006)(356005)(31686004)(53546011)(82310400003)(83380400001)(26005)(186003)(54906003)(6916009)(16576012)(36906005)(336012)(86362001)(316002)(36756003)(16526019)(31696002)(8676002)(478600001)(70206006)(70586007)(36860700001)(2906002)(4326008)(7636003)(47076005)(5660300002)(82740400003)(2616005)(426003)(7416002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 23:50:13.8245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e188f1-66bb-4144-09ac-08d9522271b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Kent for the review comment. My responses inline.

On 7/1/21 7:21 AM, Kent Gibson wrote:
> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
>> Tegra194 device has multiple HTE instances also known as GTE
>> (Generic hardware Timestamping Engine) which can timestamp subset of
>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>> and exposes timestamping ability on those lines to the consumers
>> through HTE subsystem.
>>
>> Also, with this patch, added:
>> - documentation about this provider and its capabilities at
>> Documentation/hte.
>> - Compilation support in Makefile and Kconfig
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  Documentation/hte/index.rst        |  21 ++
>>  Documentation/hte/tegra194-hte.rst |  65 ++++
>>  Documentation/index.rst            |   1 +
>>  drivers/hte/Kconfig                |  12 +
>>  drivers/hte/Makefile               |   1 +
>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>>  6 files changed, 654 insertions(+)
>>  create mode 100644 Documentation/hte/index.rst
>>  create mode 100644 Documentation/hte/tegra194-hte.rst
>>  create mode 100644 drivers/hte/hte-tegra194.c
>>
>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
>> new file mode 100644
>> index 000000000000..f311ebec6b47
>> --- /dev/null
>> +++ b/Documentation/hte/index.rst
>> @@ -0,0 +1,21 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +============================================
>> +The Linux Hardware Timestamping Engine (HTE)
>> +============================================
>> +
>> +The HTE Subsystem
>> +=================
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   hte
>> +
>> +HTE Tegra Provider
>> +==================
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   tegra194-hte
>> \ No newline at end of file
>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>> new file mode 100644
>> index 000000000000..c23eaafcf080
>> --- /dev/null
>> +++ b/Documentation/hte/tegra194-hte.rst
>> @@ -0,0 +1,65 @@
>> +HTE Kernel provider driver
>> +==========================
>> +
>> +Description
>> +-----------
>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
>> +known as generic timestamping engine (GTE). This provider driver implements
>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
>> +driver converts clock tick rate to nano seconds before storing it as timestamp
>> +value.
>> +
>> +GPIO GTE
>> +--------
>> +
>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
>> +always on (AON) gpio controller instance supports timestamping GPIOs in
>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
>> +controller as it requires very specific bits to be set in GPIO config register.
>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
>> +subsystem and GPIO GTE for in kernel consumers.
>> +
>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
>> +
>> +	To enable HTE on given GPIO line.
>> +
>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
>> +
>> +	To retrieve hardwre timestamp in nano seconds.
>> +
>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
>> +
>> +	To query if HTE is enabled on the given GPIO.
>> +
>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
>> +in nano second.
>> +
> <snip>
>
>> +
>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>> +{
>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>> +	u64 tsc;
>> +	int dir;
>> +	struct hte_ts_data el;
>> +
>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
>> +		tsc = (((u64)tsh << 32) | tsl);
>> +
>> +		src = tegra_hte_readl(gs, HTE_TESRC);
>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
>> +
>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
>> +		acv = pv ^ cv;
>> +		while (acv) {
>> +			bit_index = __builtin_ctz(acv);
>> +			if ((pv >> bit_index) & BIT(0))
>> +				dir = HTE_EVENT_RISING_EDGE;
>> +			else
>> +				dir = HTE_EVENT_FALLING_EDGE;
>> +
>> +			line_id = bit_index + (slice << 5);
>> +			el.dir = dir;
>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
>> +					      sizeof(el));
>> +			acv &= ~BIT(bit_index);
>> +		}
>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
>> +	}
>> +}
> What happens when the hte_push_ts_ns_atomic() fails?
> The timestamp will be quietly dropped?
> What happens when the interrupt corresponding to that dropped timestamp
> asks for it?  The irq handler thread will block until it can get a
> timestamp from the subsequent interrupt?

Two things happen, 1) at the push, HTE core increments seq counter

2) If the consumer has provided callback, it will either call that callback

with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect

view of dropped ts. However, I see the problem with the consumers not

providing callback, in that case, push_ts* API just wakes up process without

indicating why (assuming notify variable is true or else there is a chance for

the thread to block forever). One easy approach I can think of for now is to

make callback mandatory (which is optional right now), I will have to rethink

that scenario and will push corrected version next RFC version.

Thanks for pointing out.

>
> Which brings me back to the concern I have with the approach used in
> the hte/gpiolib integration - how do you guarantee that the timestamp
> returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
> being handled, particularly in the face of errors such as:
>  - overflows of the timestamp FIFO in the chip

I currently do not have any indication mechanism as the providers

I am dealing with right now does not have overflow hardware detection

support. If the chip supports, it should be easy to integrate that feature.

I will provide some hook function or change in push_* API to accommodate

this in next version of RFC.

>  - overflows of software FIFOs as here

HTE core records sequence counter as well it callsback the consumer with

HTE_TS_DROPPED.

>  - lost interupts (if the hw generates interrupts faster than the CPU
>    can service them)

For this, I have no idea unless hardware supports some sort of mechanism

to catch that. For the current providers, as soon as it detects changes on lines

it captures TS in its hw fifo. Its interrupt gets generated based on threshold

set in that hw fifo. This interrupt is different than the lines of actual device

that is why I said I have no idea how we can tackle that. Let me know if there

is any idea or reference of the codes which does tackle this.


Regarding HTE/GPIOLIB integration comment:

You are right, currently, I have only tsc field returned from struct hte_ts_data

to gpiolib. If I can extend that to return hte_ts_data structure which has seq

counter, which I believe can be used to track the overflow situation. The

dropped scenario can be easily tracked if gpiolib can be notified with above

mentioned DROP event through callback. If that is the case, is it ok to have

some sort of callback per gpio in gpiolib?


Any idea how I can integrate callback notification with gpiolib if you do not agree on

above callback suggestion?

> ?
>
> Cheers,
> Kent.
>
