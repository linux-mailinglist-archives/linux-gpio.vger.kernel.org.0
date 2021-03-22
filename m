Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C510345094
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 21:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhCVURY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 16:17:24 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:1761
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231621AbhCVURV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Mar 2021 16:17:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRnzWsOB6Gav8sFM0ZxUMBulRy4MsjyhTG//vafvs77MmpLP3ZjiCEbqOvNqw2AEJm4GNdMqYDEtK2/i8z/iVU0FTLQjIP5TbDBqPR3NaRQv+A6D9bWREyYaztbztWwJ8A0wnWp6wwKHUJuYW2BkvloTljwfzj5V8ggXf9R1YJrNckbke/G6kQMUymcAkzn27SgWsGoueeyHh3jKzRnBOBhBFJqhA4vK3QnVFdNd7/tjYSD9tKHOBa3QCMoT1H/iTlwbp3VcPi/DzkjByenSLk8S/82iv/rOyN9d1udfSwH6ajL0NBcNxbzuot2MzdPpski+8PJP2H9SDwbiQApm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eldhIbBAzXfncmFFIL1vnPV3D+sGaLaPodyPIpdxM0=;
 b=nU30G9LUW8cJ7UmaYSWFTa8OIGXyqZPS5VqzhF8huKMancnaRxMqsoUwy5Ulp9GTfzvbuuIxp6ZXZ82mTOR0UqA+slooKR4s6MvPiyq5P4PRdzJfUZOB45WQPb1kcFkGCVNgoPeiYBJgUt/SoujbsvTOwoHW8YX0iKwZA8n2ZrAJxeDh8jgLkz67AEfF6Ej9QhORSNU3gqcURp12B7AAI8tgiBB9cZPArbKKxf5vGS976H1JZHf0Ci8qrFaTKIsEPpDh3ewp8/4xKcslaqIQRsQEgf8TaRFqjyj4MSdruupjVvIQGdpJMmfMhjAcoBvgOGwyxPCfWripD1w4G6o8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eldhIbBAzXfncmFFIL1vnPV3D+sGaLaPodyPIpdxM0=;
 b=sVMS46kPM92jReTktxlzhccbHWqfoQBbXr86pGNb7LQH/VXgsdekZuwu1ENch0bsvhSev42KzIMGggfhVgfVZ4LY7JW+6MSfuUx80P1TXzrkRQ2hmRP4jxFrdP0PFj2sipLGTH2xcDbDdUMyArCizO8H+W3QZEdxDBzdN3tqQJ1EM/lfx+EqbZ/rugT4ZqCe7MKbKqCUNqSb7Vkftjb4oNRh7eyJtyiESDwyNxu2LwB7WqR/gUre3poi0stwCLbxZfcwOkd1zSZTUcRuRCG2N1AaXleG8bZlaTC6lq/MKfMnNu3DbeTVOEH04JoPlJfuCVAZuB++OiMawVL9qpbJtA==
Received: from DM6PR02CA0037.namprd02.prod.outlook.com (2603:10b6:5:177::14)
 by CH0PR12MB5314.namprd12.prod.outlook.com (2603:10b6:610:d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 20:17:19 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::c1) by DM6PR02CA0037.outlook.office365.com
 (2603:10b6:5:177::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 20:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 20:17:19 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 20:17:18 +0000
Received: from [172.17.173.69] (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 20:17:18 +0000
Subject: Re: GTE - The hardware timestamping engine
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
Date:   Mon, 22 Mar 2021 13:21:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210322060047.GA226745@sol>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bd37d45-715f-4fad-d026-08d8ed6f7ead
X-MS-TrafficTypeDiagnostic: CH0PR12MB5314:
X-Microsoft-Antispam-PRVS: <CH0PR12MB53148E1372DC077B2F84A616AE659@CH0PR12MB5314.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jqLsAOyO5Ga/FjNQpbWAHRejZg7gj1v7LXb4oXBZRPF0zHWM0q7s/W8kC0Qxo2mw0lE6paDVH144N9ctZj6wPaOEo+gZtVi6XoxZu0192Bq4W1g+bBZH/idbJH1wT/4lFiFlpwkmEBMErjJadfvYV/1j0KvBwro1tJJtxb0gO/2pUyAXTdYUAur7vJtc51xf+bi/LFdVVb8AyI/ozgOZIcgol2wWdUvy4N254WiGY8cB+6pPGJzP5/YcoYwmfW0ZLWzTB9On3/rfBXAby/lTf6iB4/ZmfLnAUTrapgbU6uq1WLKb3mgn95D7ZhdkEIhUe0lScsiBbJQ5FDSYCaJCms2srLfz1eY/1BQY+roJ2H7FAOxeBrODuMBzBXwSl9TuJ0gUMyEdITlahJOLHB8x3OecmeIwC7m4S5HOoWOy8IPCecjPQNQn8BCku/nji7DbJ0uPj/z+aFWBeXEYkuPLcOWtzyYi0XjmKcpmyoZYk5zF6qGmfTDrLilhkb+0SIHlnj8CNgCkSWgmcQOG5NbONp6sd4rfpT3HDhOWontT/7e+hSvceOqTMzUOISoeCo69AtAOZjjvl7DLLuO6sjRjSFm748WNfegCymK87yMn038oeQzZ7YaTAEHDlHoti9Tn4C/aRUG7yIY8ts2bQWmGgEJEq27xc7b5KUqx7fnaM50Rlvv8AKBDQzZj2XtAdqqe
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(82740400003)(54906003)(110136005)(7416002)(16576012)(36756003)(83380400001)(6666004)(53546011)(31686004)(36860700001)(478600001)(7636003)(70586007)(356005)(47076005)(36906005)(2616005)(4326008)(86362001)(8676002)(316002)(2906002)(26005)(186003)(336012)(426003)(5660300002)(82310400003)(8936002)(70206006)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 20:17:19.4318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd37d45-715f-4fad-d026-08d8ed6f7ead
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5314
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus and Kent,

Thanks you so much for your valuable inputs and time, Please see below, my follow ups.

On 3/21/21 11:00 PM, Kent Gibson wrote:
> On Sat, Mar 20, 2021 at 12:56:36PM +0100, Linus Walleij wrote:
>> Hi Dipen,
>>
>> thanks for your mail!
>>
>> I involved some other kernel people to get some discussion.
>> I think Kent Gibson can be of great help because he is using
>> GPIOs with high precision.
>>
> 
> Actually I just extended the cdev uAPI to provide the REALTIME option,
> which was the event clock until we changed to MONOTONIC in Linux 5.7,
> as there were some users that were requiring the REALTIME clock.
> 
>> We actually discussed this a bit when adding support for
>> realtime timestamps.
>>
>> On Wed, Mar 17, 2021 at 11:29 PM Dipen Patel <dipenp@nvidia.com> wrote:
>>
>>> Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
>>> can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
>>> detecting the change, it can timestamp and store in its internal hardware FIFO.
>>> The advantage of the GTE module can be realized in applications like robotics
>>> or autonomous vehicle where it can help record events with precise timestamp.
>>
>> That sounds very useful.
>>
> 
> Indeed - it could remove the latency and jitter that results from
> timestamping events in the IRQ handler.
> 
>> Certainly the kernel shall be able to handle this.
>>
>>> ============
>>> For GPIO:
>>> ============
>>> 1.  GPIO has to be configured as input and IRQ must be enabled.
>>> 2.  Ask GPIO controller driver to set corresponding timestamp bit in the
>>>     specified GPIO config register.
>>> 3.  Translate GPIO specified by the client to its internal bitmap.
>>> 3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
>>>     register.
>>> 4.  Set internal bits to enable monitoring in GTE module
>>> 5.  Additionally GTE driver can open up lanes for the user space application
>>>     as a client and can send timestamping events directly to the application.
>>
>> I have some concerns:
>>
>> 1. GPIO should for all professional applications be used with the character
>> device /dev/gpiochipN, under no circumstances shall the old sysfs
>> ABI be used for this. In this case it is necessary because the
>> character device provides events in a FIFO to userspace, which is
>> what we need.
>>
> 
> The cdev uAPI would certainly be the most sensible place to expose
> this to userspace - its line events being a direct analog to what the GTE
> provides.
> 
>> The timestamp provided to userspace is an opaque 64bit
>> unsigned value. I suppose we assume it is monotonic but
>> you can actually augment the semantics for your specific
>> stamp, as long as 64 bits is gonna work.
>>
>> 2. The timestamp for the chardev is currently obtained in
>> drivers/gpio/gpiolib-cdev.c like this:
>>
>> static u64 line_event_timestamp(struct line *line)
>> {
>>         if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>>                 return ktime_get_real_ns();
>>
>>         return ktime_get_ns();
>> }
>>
>> What you want to do is to add a new flag for hardware timestamps
>> and use that if available. FLAG_EVENT_CLOCK_HARDWARE?
>> FLAG_EVENT_CLOCK_NATIVE?
>>
> 
> HARDWARE looks better to me, as NATIVE is more vague.
> 
>> Then you need to figure out a mechanism so we can obtain
>> the right timestamp from the hardware event right here,
>> you can hook into the GPIO driver if need be, we can
>> figure out the gpio_chip for a certain line for sure.
>>
> 
> Firstly, line_event_timestamp() is called from the IRQ handler context.
> That is obviously more constraining than if it were only called from the
> IRQ thread. If the GTE is providing the timestamp then that could be
> put off until the IRQ thread.
> So you probably want to refactor line_event_timestamp() into two flavours
> - one for IRQ handler that returns 0 if HARDWARE is set, and the other for
> IRQ thread, where there is already a fallback call to
> line_event_timestamp() for the nested threaded interrupt case, that gets
> the timestamp from the GTE.
> 

My follow-up concerns on both Linus's and Kent's feedback:

1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
    serves the userspace clients.
1.a What about kernel drivers wanting to use this feature for monitoring its
    GPIO lines, see gyroscope example somewhere below. In that regards,
    lineevent implementation is not sufficient.
1.b Are you also implying to extend lineevent implementation to kernel
    drivers?
2.  For both above cases 1.a and 1.b, gpiolib* then would become holder
    of all the GTE related datastructures per userspace or kernel clients,
    is this acceptable? In another words, gpilib-cdev framework will become
    client to GTE framework on behalf of those drivers. I believe we
    can embed gte related data to per lineevent structures.
3.  I believe Kent touched on this, but double confirming, there will be a
    use-case or scenario where in-kernel clients will want to block until
    the next timestaming event. We need to cover that scenario as well.   
4.  What about kernel drivers wanting monitor certain IRQ lines? For example,
    gycroscope drivers wants to monitor i2c IRQ line for transaction complete.
4.a Or you are suggesting all the GPIOs related requests will go through
    gpiolib-cdev --> gte framework ---> gte driver and for the rests, it
    it will be "some kernel driver" ---> gte framework --> gte driver.

I am assuming there will be gte framework/infrastructure for all above cases.

> But my primary concern here would be keeping the two event FIFOs (GTE and
> cdev) in sync.  Masking and unmasking in hardware and the kernel needs to
> be coordinated to prevent races that would result in sync loss.
> So this probably needs to be configured in the GTE driver via the irq
> path, rather than pinctrl?
> 
> Is every event detected by the GTE guaranteed to trigger an interrupt in
> the kernel?

GTE interrupt will be triggered when its internal FIFO meets configurable
thresholds, which could be set to 1 for example, in that case will trigger
interrupt for every event detected.

Can you elaborate more on pinctrl part?

> 
> How to handle GTE FIFO overflows?  Can they be detected or prevented?
> 
Currently, there is no hardware support to detect the overflow, it can be
done certainly through software.

>> So you first need to augment the userspace
>> ABI and the character device code to add this. See
>> commit 26d060e47e25f2c715a1b2c48fea391f67907a30
>> "gpiolib: cdev: allow edge event timestamps to be configured as REALTIME"
>> by Kent Gibson to see what needs to be done.
>>
> 
> You should also extend gpio_v2_line_flags_validate() to disallow setting
> of multiple event clock flags, similar to the bias flag checks.
> Currently there is only the one event clock flag, so no need to check.
> 
>> 3. Also patch tools/gpio/gpio-event-mon.c to support this flag and use that
>> for prototyping and proof of concept.
>>
> 
> The corresponding commit for the REALTIME option is
> commit e0822cf9b892ed051830daaf57896aca48c8567b
> "tools: gpio: add option to report wall-clock time to gpio-event-mon"
> 
> Cheers,
> Kent.
> 
>>> ============
>>> For IRQ:
>>> ============
>>
>> Marc Zyngier and/or Thomas Gleixner know this stuff.
>>
>> It does make sense to add some infrastructure so that GPIO events
>> and IRQs can use the same timestamping hardware.
>>
>> And certainly you will also want to use this timestamp for
>> IIO devices? If it is just GPIOs and IRQs today, it will be
>> gyroscopes and accelerometers tomorrow, am I right?
>>

Gyroscope, accelerometers or any IIO are built on top of i2c/spi and/or GPIOs.
So they are covered as long as they serve as client to GTE framework, For
example, if gyroscope uses GPIO as an interrupt to indicate frame
ready, GTE could timestamp that GPIO as well any IRQs like i2c transaction
complete IRQ. To this to happen, gycroscope then register itself with
GTE framework and enable required signals that it interfaces/interested with.

>> Yours,
>> Linus Walleij

Best Regards,
Dipen Patel
