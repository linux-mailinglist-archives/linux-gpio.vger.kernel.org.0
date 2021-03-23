Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8B534551C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 02:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhCWBsx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 21:48:53 -0400
Received: from mail-bn8nam12on2059.outbound.protection.outlook.com ([40.107.237.59]:8864
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230006AbhCWBsr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 21:48:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcOqMkYy+IpJDPN5geyCw0VAYViUjFyFZB32OTKFFwt/Nndd09/e9YW07sL9Ox5zWEe+jhhVMAAo3iINY+ss28HT5rFPBMd1WMwzT/yC1uoMwV+zcI61iMwIJlj5F4oPerwNSx3HWgfBalAO6JERTrCIO1WhyYbeVdcq3JV4+sBvuLHzW8Juo5snzXgBLEgMAB7/TJIpzGtvqBTwgV6adzr6y5VfbM7CIOk8kes8HdqI7d7+cQyo7EKI69YSc6gUXCofWk19YqrkaTP7l/zqMVKBcMt355DAVTKCrSL53DPhssAV3AMZnhHBxHss1lM3oKFS3272FLSMpTEiHEjpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM5fZFVJ94FDIGg2owcPWq3lXKb9d1kghwQEI5vQGT8=;
 b=Q30itbJLv5RaUQ60krs1pnS+g6jwc1Xi+zNP5jEHbYFOloF4I3Jsp3ewJGi9VbciRSIJnnYZ+7mqPzreEBlwYH5W5aJGAK+d13jsUF37YLv6ysqG1UIG3c5ab+fr1hNtIiCuWtJwZZfpv6H/MGkIFobcnyzHM3DQWq3YEiP847yTiLHwd86eipZajY/uUJG6hDvJLtV0kMmsKuy4Xt68Zn5SOzimqe0u91/V+dxu73v9fDTY7HuSZzFEsk9+b2GroJwjK+JMyIEaDl1oTV+1YuwLOGeTBwZ1DyJKmAEWIZaswVBg4Xwi39AwQI53FAqLB9HAJHGjr2ft/DOdlvwBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uM5fZFVJ94FDIGg2owcPWq3lXKb9d1kghwQEI5vQGT8=;
 b=gT5IDzx7U5rDAE0jZMBxgWVOZ0H9YJ8qTdjQHbSwWRUMdBUoeuwVDkTOmtYGzm/00/4ppmObTqxNz8XFQCGwaXblgxvNHlHjqAvX1t5fSTbdf3UV1rcHK+hZTOaTCmlhFbCk1r4QehDeZE/aTocEorsEyYox2jRkOhFjDxElaFF1VtEEZT8Fsp+Z/+UsCVajQD40TXE48MwtJ/w34urBt3mxYqvlmpUXKEPXfoxmQxrb2onkKxzyL2BuWi8RVDed1pKRsSDE+SuT83gVSht2zLMC5E6p5EH1YKYFK1VMZRC31QyjYJY3RUoPD7My5WMHARKfr2m9acYF0pgpklA46w==
Received: from DM6PR04CA0024.namprd04.prod.outlook.com (2603:10b6:5:334::29)
 by MWHPR1201MB0240.namprd12.prod.outlook.com (2603:10b6:301:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 01:48:43 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::cc) by DM6PR04CA0024.outlook.office365.com
 (2603:10b6:5:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 01:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 01:48:43 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 18:48:42 -0700
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 01:48:42 +0000
Subject: Re: GTE - The hardware timestamping engine
To:     Kent Gibson <warthog618@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "Richard Cochran" <richardcochran@gmail.com>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com> <20210323003208.GA6105@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <7961d9df-4120-e37c-d042-528655bd0270@nvidia.com>
Date:   Mon, 22 Mar 2021 18:53:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210323003208.GA6105@sol>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be21cd0-b90d-46c0-7d8d-08d8ed9dca8b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0240:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB024012E217BC413CB59AD786AE649@MWHPR1201MB0240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLrO2o4YWe+JS5CulIw/8u5o6QZNSCpOYOWSBg7rv8pxQyYmGr+cLlvHmGFUC3GCg8HF+INMlbQEZ8hg+iD6hgm70PkbsMZpKOvJMgbTqhrkUD165Q4/X21oye2A47SSsw8QPbj58S2npEDCJWmojRbHp172I8CHsDIHvkknE/xCP5t6F1DC8yP1yIi6jVpzvG8NgloHCbudaz3SUvn8ItspNbtDPXt7o2opDV0K+xhES1OMigqxHwlpz7Z8aOR4CMfq4gVHbDNuI61/FnbNZ7qQE5pSQzU1+0n4imyOKG0tBGetp86CAZ9WIa/I7hW/DltnsG1H1EELB+szbJrnmFHfR1TrdxOhIiqdCxFt76oQwisZsy82Kd67MuUtLKq+G8J7s3F3M6qna1vRcTwp2ghK2OtUTp2LtE6MoElV5AodRkHlF/WFQB+SFtSoQRoLe8C/XzRq+xPteLMhC5YCP44Y6Np3TahL0k7SGlReC2Sqbc/+SrzwjbOIxp1n0w/Unj5KyCqs+H90I4KMoIsOFjdcjsPwlBxzixmPeuR5eSHuv7MrJQh7XayvFILBNoALXOnXHnNjPYi0SRpvDCzbrdVBwBqSmdbbYebNnio8H4nWhnKyf3epoVz7P4yveZhh1Q5XqVI37grjaXqFL1yvEs5NkVPVIuQDJi9zYvYSI7CqhOJQc7ubr+hN3BvHDVmI
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(82310400003)(2616005)(4326008)(7416002)(82740400003)(7636003)(426003)(356005)(6666004)(8676002)(36860700001)(86362001)(2906002)(47076005)(30864003)(31686004)(31696002)(54906003)(6916009)(16576012)(36756003)(316002)(478600001)(8936002)(70586007)(70206006)(186003)(5660300002)(83380400001)(53546011)(26005)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 01:48:43.5203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be21cd0-b90d-46c0-7d8d-08d8ed9dca8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0240
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/22/21 5:32 PM, Kent Gibson wrote:
> On Mon, Mar 22, 2021 at 01:21:46PM -0700, Dipen Patel wrote:
>> Hi Linus and Kent,
>>
>> Thanks you so much for your valuable inputs and time, Please see below, my follow ups.
>>
>> On 3/21/21 11:00 PM, Kent Gibson wrote:
>>> On Sat, Mar 20, 2021 at 12:56:36PM +0100, Linus Walleij wrote:
>>>> Hi Dipen,
>>>>
>>>> thanks for your mail!
>>>>
>>>> I involved some other kernel people to get some discussion.
>>>> I think Kent Gibson can be of great help because he is using
>>>> GPIOs with high precision.
>>>>
>>>
>>> Actually I just extended the cdev uAPI to provide the REALTIME option,
>>> which was the event clock until we changed to MONOTONIC in Linux 5.7,
>>> as there were some users that were requiring the REALTIME clock.
>>>
>>>> We actually discussed this a bit when adding support for
>>>> realtime timestamps.
>>>>
>>>> On Wed, Mar 17, 2021 at 11:29 PM Dipen Patel <dipenp@nvidia.com> wrote:
>>>>
>>>>> Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
>>>>> can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
>>>>> detecting the change, it can timestamp and store in its internal hardware FIFO.
>>>>> The advantage of the GTE module can be realized in applications like robotics
>>>>> or autonomous vehicle where it can help record events with precise timestamp.
>>>>
>>>> That sounds very useful.
>>>>
>>>
>>> Indeed - it could remove the latency and jitter that results from
>>> timestamping events in the IRQ handler.
>>>
>>>> Certainly the kernel shall be able to handle this.
>>>>
>>>>> ============
>>>>> For GPIO:
>>>>> ============
>>>>> 1.  GPIO has to be configured as input and IRQ must be enabled.
>>>>> 2.  Ask GPIO controller driver to set corresponding timestamp bit in the
>>>>>     specified GPIO config register.
>>>>> 3.  Translate GPIO specified by the client to its internal bitmap.
>>>>> 3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
>>>>>     register.
>>>>> 4.  Set internal bits to enable monitoring in GTE module
>>>>> 5.  Additionally GTE driver can open up lanes for the user space application
>>>>>     as a client and can send timestamping events directly to the application.
>>>>
>>>> I have some concerns:
>>>>
>>>> 1. GPIO should for all professional applications be used with the character
>>>> device /dev/gpiochipN, under no circumstances shall the old sysfs
>>>> ABI be used for this. In this case it is necessary because the
>>>> character device provides events in a FIFO to userspace, which is
>>>> what we need.
>>>>
>>>
>>> The cdev uAPI would certainly be the most sensible place to expose
>>> this to userspace - its line events being a direct analog to what the GTE
>>> provides.
>>>
>>>> The timestamp provided to userspace is an opaque 64bit
>>>> unsigned value. I suppose we assume it is monotonic but
>>>> you can actually augment the semantics for your specific
>>>> stamp, as long as 64 bits is gonna work.
>>>>
>>>> 2. The timestamp for the chardev is currently obtained in
>>>> drivers/gpio/gpiolib-cdev.c like this:
>>>>
>>>> static u64 line_event_timestamp(struct line *line)
>>>> {
>>>>         if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>>>                 return ktime_get_real_ns();
>>>>
>>>>         return ktime_get_ns();
>>>> }
>>>>
>>>> What you want to do is to add a new flag for hardware timestamps
>>>> and use that if available. FLAG_EVENT_CLOCK_HARDWARE?
>>>> FLAG_EVENT_CLOCK_NATIVE?
>>>>
>>>
>>> HARDWARE looks better to me, as NATIVE is more vague.
>>>
>>>> Then you need to figure out a mechanism so we can obtain
>>>> the right timestamp from the hardware event right here,
>>>> you can hook into the GPIO driver if need be, we can
>>>> figure out the gpio_chip for a certain line for sure.
>>>>
>>>
>>> Firstly, line_event_timestamp() is called from the IRQ handler context.
>>> That is obviously more constraining than if it were only called from the
>>> IRQ thread. If the GTE is providing the timestamp then that could be
>>> put off until the IRQ thread.
>>> So you probably want to refactor line_event_timestamp() into two flavours
>>> - one for IRQ handler that returns 0 if HARDWARE is set, and the other for
>>> IRQ thread, where there is already a fallback call to
>>> line_event_timestamp() for the nested threaded interrupt case, that gets
>>> the timestamp from the GTE.
>>>
>>
>> My follow-up concerns on both Linus's and Kent's feedback:
>>
>> 1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
>>     serves the userspace clients.
>> 1.a What about kernel drivers wanting to use this feature for monitoring its
>>     GPIO lines, see gyroscope example somewhere below. In that regards,
>>     lineevent implementation is not sufficient.
>> 1.b Are you also implying to extend lineevent implementation to kernel
>>     drivers?
>> 2.  For both above cases 1.a and 1.b, gpiolib* then would become holder
>>     of all the GTE related datastructures per userspace or kernel clients,
>>     is this acceptable? In another words, gpilib-cdev framework will become
>>     client to GTE framework on behalf of those drivers. I believe we
>>     can embed gte related data to per lineevent structures.
>> 3.  I believe Kent touched on this, but double confirming, there will be a
>>     use-case or scenario where in-kernel clients will want to block until
>>     the next timestaming event. We need to cover that scenario as well.   
>> 4.  What about kernel drivers wanting monitor certain IRQ lines? For example,
>>     gycroscope drivers wants to monitor i2c IRQ line for transaction complete.
>> 4.a Or you are suggesting all the GPIOs related requests will go through
>>     gpiolib-cdev --> gte framework ---> gte driver and for the rests, it
>>     it will be "some kernel driver" ---> gte framework --> gte driver.
>>
>> I am assuming there will be gte framework/infrastructure for all above cases.
>>
>>> But my primary concern here would be keeping the two event FIFOs (GTE and
>>> cdev) in sync.  Masking and unmasking in hardware and the kernel needs to
>>> be coordinated to prevent races that would result in sync loss.
>>> So this probably needs to be configured in the GTE driver via the irq
>>> path, rather than pinctrl?
>>>
>>> Is every event detected by the GTE guaranteed to trigger an interrupt in
>>> the kernel?
>>
>> GTE interrupt will be triggered when its internal FIFO meets configurable
>> thresholds, which could be set to 1 for example, in that case will trigger
>> interrupt for every event detected.
>>
>> Can you elaborate more on pinctrl part?
>>
>>>
>>> How to handle GTE FIFO overflows?  Can they be detected or prevented?
>>>
>> Currently, there is no hardware support to detect the overflow, it can be
>> done certainly through software.
>>
> 
> In response to all your comments above...
> 
> Firstly, I'm not suggesting that other kernel modules would use the
> cdev lineevents, only that they would use the same mechanism that
> gpiolib-cdev would use to timestamp the lineevents for userspace.
> 
Sure, I just wanted to mention the different scenarios and wanted to know
how can we fit all those together. Having said that, shouldn't this serve
an opportunity to extend the linevent framework to accommodate kernel
drivers as a clients?

If we can't, then there is a risk of duplicating lineevent mechanism in all
of those kernel drivers or at least in GTE framework/infrastructure as far
as GPIO related GTE part is concerned.
 
> As to that mechanism, my current thinking is that the approach of
> associating GTE event FIFO entries with particular physical IRQ events is
> problematic, as keeping the two in sync would be difficult, if not
> impossible.
>
> A more robust approach is to ignore the physical IRQs and instead service
> the GTE event FIFO, generating IRQs from those events in software -
> essentially a pre-timestamped IRQ.  The IRQ framework could provide the
> timestamping functionality, equivalent to line_event_timestamp(), for
> the IRQ handler/thread and in this case provide the timestamp from the GTE
> event.
> 

I have not fully understood above two paragraphs (except about
lineevent_event_timestamp related part).

I have no idea what it means to "ignore the physical IRQs and service the
GTE event FIFO". Just like GPIO clients, there could be IRQ clients which
want to monitor certain IRQ line, like ethernet driver wanted to retrieve
timestamp for its IRQ line and so on.

> So this would be an IRQ feature of which the gpiolib would just be another
> client.  But I don't know enough about the IRQ framework to do more
> than just float the idea - I'm already way out over my skis here.
>
> Btw, the pinctrl API is what the gpiolib uses to control the GPIO aspects
> of physical hardware such as direction, value, bias and the like.
> Almost certainly not relevant to this feature, so forget I mentioned it.
> 
> Cheers,
> Kent.
> 
>>>> So you first need to augment the userspace
>>>> ABI and the character device code to add this. See
>>>> commit 26d060e47e25f2c715a1b2c48fea391f67907a30
>>>> "gpiolib: cdev: allow edge event timestamps to be configured as REALTIME"
>>>> by Kent Gibson to see what needs to be done.
>>>>
>>>
>>> You should also extend gpio_v2_line_flags_validate() to disallow setting
>>> of multiple event clock flags, similar to the bias flag checks.
>>> Currently there is only the one event clock flag, so no need to check.
>>>
>>>> 3. Also patch tools/gpio/gpio-event-mon.c to support this flag and use that
>>>> for prototyping and proof of concept.
>>>>
>>>
>>> The corresponding commit for the REALTIME option is
>>> commit e0822cf9b892ed051830daaf57896aca48c8567b
>>> "tools: gpio: add option to report wall-clock time to gpio-event-mon"
>>>
>>> Cheers,
>>> Kent.
>>>
>>>>> ============
>>>>> For IRQ:
>>>>> ============
>>>>
>>>> Marc Zyngier and/or Thomas Gleixner know this stuff.
>>>>
>>>> It does make sense to add some infrastructure so that GPIO events
>>>> and IRQs can use the same timestamping hardware.
>>>>
>>>> And certainly you will also want to use this timestamp for
>>>> IIO devices? If it is just GPIOs and IRQs today, it will be
>>>> gyroscopes and accelerometers tomorrow, am I right?
>>>>
>>
>> Gyroscope, accelerometers or any IIO are built on top of i2c/spi and/or GPIOs.
>> So they are covered as long as they serve as client to GTE framework, For
>> example, if gyroscope uses GPIO as an interrupt to indicate frame
>> ready, GTE could timestamp that GPIO as well any IRQs like i2c transaction
>> complete IRQ. To this to happen, gycroscope then register itself with
>> GTE framework and enable required signals that it interfaces/interested with.
>>
>>>> Yours,
>>>> Linus Walleij
>>
>> Best Regards,
>> Dipen Patel
