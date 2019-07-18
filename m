Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC9D6C3C9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 02:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfGRAZt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 20:25:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7993 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfGRAZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 20:25:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2fbc8d0001>; Wed, 17 Jul 2019 17:25:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 17 Jul 2019 17:25:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 17 Jul 2019 17:25:43 -0700
Received: from [10.2.164.12] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 00:25:41 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>, <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <77df234f-aa40-0319-a593-f1f19f0f1c2a@nvidia.com>
 <20190717084221.2e9af56c@dimatab>
 <093462f3-8c6d-d084-9822-ae4eff041c64@nvidia.com>
 <20190717093317.70fefb27@dimatab>
 <6e73dcee-6e24-b646-97a4-4b34aedd231d@nvidia.com>
 <16f8b146-2581-a842-4997-53ab05b62c70@gmail.com>
 <d7892bfc-2cbf-27af-518d-dc7e243815b8@nvidia.com>
 <71272e9a-0f2a-c20d-6532-7e9057ad985c@gmail.com>
 <78fd19b9-b652-8ac3-1f57-3b4adadee03f@nvidia.com>
 <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <c759d71b-1549-2562-f0cf-db5f9e51329e@nvidia.com>
Date:   Wed, 17 Jul 2019 17:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563409549; bh=B33FX79HqGQniiM+kA8c6h3ZjbhiZThet3Pghn0By0g=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=QpZZEsjMCjMrgHZuJM0dQ8BUN2zQK8tTwt1hoP5FhxvZtF856X2F66G+z+4Whfi57
         ydPEys6i8HsODqdRfHcPWUdmsyz5xfifEYyXt9xCDW6scxK2o7azpijRj+/zBaU0kp
         YbhfvBu3PqsrAJbEIY/a+HL03851vkHspZGJXj4tHFhW98RzDfZWPsY6VVRM7gocig
         JKvbgYNLuU4HvKr60T5YeVAju5L2Im2bbZlJjblCan6/FNiUMfdUsnCv92/ey6Uppi
         ntf/bN0lj7Ona2XQiGz27spJ7o5xAl8kpROoVMqAHvBqA5ru+kjkGrtTEN/GBuU/3s
         H4zsHivBdAXxg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/17/19 4:44 PM, Dmitry Osipenko wrote:
> 18.07.2019 2:36, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/17/19 3:48 PM, Dmitry Osipenko wrote:
>>> 18.07.2019 0:57, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/17/19 2:51 PM, Sowjanya Komatineni wrote:
>>>>> On 7/17/19 2:30 PM, Dmitry Osipenko wrote:
>>>>>> 17.07.2019 23:11, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On 7/17/19 1:01 PM, Sowjanya Komatineni wrote:
>>>>>>>> On 7/17/19 12:43 PM, Dmitry Osipenko wrote:
>>>>>>>>> 17.07.2019 21:54, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>> On 7/17/19 11:51 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>> On 7/17/19 11:32 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>> 17.07.2019 20:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>>>> On 7/17/19 8:17 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>> 17.07.2019 9:36, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>> On 7/16/19 11:33 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 22:55:52 -0700
>>>>>>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 7/16/19 10:42 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 22:25:25 -0700
>>>>>>>>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>> On 7/16/19 9:11 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 19:35:49 -0700
>>>>>>>>>>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>> On 7/16/19 7:18 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 3:06 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 3:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>> 17.07.2019 0:35, Sowjanya Komatineni =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 2:21 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>> 17.07.2019 0:12, Sowjanya Komatineni =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 1:47 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 22:26, Sowjanya Komatineni =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:43 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:30, Sowjanya Komatineni =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:25 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:19, Sowjanya Komatineni =D0=
=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 9:50 AM, Sowjanya Komatineni
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 8:00 AM, Dmitry Osipenko wrot=
e:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 11:06, Peter De Schrijver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On Tue, Jul 16, 2019 at 03:24:26PM
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +0800,
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Joseph
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Lo wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> OK, Will add to CPUFreq driver...
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The other thing that also need
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> attention is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> that T124 CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> implicitly relies on DFLL driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> probed
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> first, which is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> icky.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Should I add check for successful
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> register explicitly in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver probe and defer till
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> registers?
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Probably you should use the "device
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> links".
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> See
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [1][2] for the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> example.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://elixir.bootlin.com/linux/v5.2.1=
/source/drivers/gpu/drm/tegra/dc.c#L2383
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [2]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/=
driver-api/device_link.html
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Return EPROBE_DEFER instead of EINVAL i=
f
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device_link_add() fails.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> And
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> use of_find_device_by_node() to get the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device, see [3].
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [3]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Will go thru and add...
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Looks like I initially confused this case
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> getting
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> orphaned clock.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> I'm now seeing that the DFLL driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> registers the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock and then
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clk_get(dfll) should be returning
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EPROBE_DEFER
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> until
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL driver is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> probed, hence everything should be fine
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> as-is and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> there is no real
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> need
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> for the 'device link'. Sorry for the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> confusion!
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sorry, I didn't follow the mail
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> thread. Just
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regarding the DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> part.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> As you know it, the DFLL clock is one
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> of the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock sources and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> integrated with DVFS control logic
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> with the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator. We will not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to other clock sources once we
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switched to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL. Because the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU has
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> been regulated by the DFLL HW with th=
e
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DVFS
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (CVB or OPP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> you see
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> in the driver.). We shouldn't reparen=
t
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> it to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> other sources with
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> unknew
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> freq/volt pair. That's not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> guaranteed to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> work. We
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> allow switching to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> open-loop mode but different sources.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Okay, then the CPUFreq driver will
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> enforce
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> rate before switching to PLLP in order =
to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> proper CPU voltage.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP freq is safe to work for any CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> voltage.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> So no
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> need to enforce
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to PLLP rate before changing
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CCLK_G
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> to PLLP during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sorry, please ignore my above comment.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> During
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend, need to change
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CCLK_G source to PLLP when dfll is in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> closed
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> loop
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> mode first and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> then
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll need to be set to open loop.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Okay.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> And I don't exactly understand why we
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> need to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch to PLLP in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> idle
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver. Just keep it on CL-DVFS mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> all the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> time.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 entry, the dfll suspend functi=
on
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> moves it
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the open-loop
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> mode. That's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> all. The sc7-entryfirmware will handl=
e
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the rest
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> of the sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn off
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU power.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 resume, the warmboot code will
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> handle
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn on
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator and power up the CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> cluster. And
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> leave
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> it on PLL_P.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> After
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> resuming to the kernel, we re-init
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL,
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> restore
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU clock
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> policy (CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> runs on DFLL open-loop mode) and then
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> moving to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> close-loop mode.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL is re-inited after switching
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CCLK to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> parent during of
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> early clocks-state restoring by CaR
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Hence
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> instead of having
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> odd
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> hacks in the CaR driver, it is much
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> nicer to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> proper suspend-resume sequencing of the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> drivers. In this case
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver is the driver that enables DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switches
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to that
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> source, which means that this driver is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> also
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> should
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> be responsible for
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> management of the DFLL's state during o=
f
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend/resume process. If
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver disables DFLL during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> re-enables it
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> resume, then looks like the CaR driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> hacks
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> around
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL are not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> needed.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL part looks good to me. BTW,
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> change the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> patch subject to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "Add
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend-resume support" seems more
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> appropriate to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> me.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> To clarify this, the sequences for DFL=
L
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> use
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> are as
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> follows (assuming
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> required DFLL hw configuration has bee=
n
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> done)
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch to DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Save current parent and frequency
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2) Enable DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3) Change cclk_g parent to DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> For OVR regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Change PWM output pin from
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> tristate to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5) Enable DFLL PWM output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> For I2C regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Enable DFLL I2C output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6) Program DFLL to closed loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch away from DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Change cclk_g parent to PLLP so
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> frequency is ok for
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> any
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vdd_cpu voltage
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> I see during switch away from DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (suspend),
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> cclk_g
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> parent is not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> changed to PLLP before changing dfll to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> open
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> loop
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> mode.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Will add this ...
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The CPUFreq driver switches parent to PLLP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> probe, similar
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> should be done on suspend.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> I'm also wondering if it's always safe to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP in the probe.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> If CPU is running on a lower freq than
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP, then
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> some
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> other more
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> appropriate intermediate parent should be
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> selected.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU parents are PLL_X, PLL_P, and dfll. PLL=
_X
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> always
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> runs at higher
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> rate
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> so switching to PLL_P during CPUFreq probe
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prior to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll clock enable
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> should be safe.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AFAIK, PLLX could run at ~200MHz. There is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> also a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> divided output of
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> which CCLKG supports, the PLLP_OUT4.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Probably, realistically, CPU is always runni=
ng
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> off a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> fast PLLX during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> boot, but I'm wondering what may happen on
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> KEXEC. I
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> guess ideally CPUFreq driver should also
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 'shutdown' callback to teardown DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> on a reboot, but likely that there are other
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock-related problems as
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> well that may break KEXEC and thus it is not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> very
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> important at the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> moment.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> During bootup CPUG sources from PLL_X. By PLL=
_P
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> above I meant
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLL_P_OUT4.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> As per clock policies, PLL_X is always used
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> for high
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> freq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> like
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 800Mhz
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> and for low frequency it will be sourced from
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> Alright, then please don't forget to
>>>>>>>>>>>>>>>>>>>>>>>>>>>> pre-initialize
>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate to a
>>>>>>>>>>>>>>>>>>>>>>>>>>>> reasonable value using tegra_clk_init_table or
>>>>>>>>>>>>>>>>>>>>>>>>>>>> assigned-clocks.
>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate update is not needed as it is
>>>>>>>>>>>>>>>>>>>>>>>>>>> safe to
>>>>>>>>>>>>>>>>>>>>>>>>>>> run at
>>>>>>>>>>>>>>>>>>>>>>>>>>> 408Mhz because it is below fmax @ Vmin
>>>>>>>>>>>>>>>>>>>>>>>>>> So even 204MHz CVB entries are having the same
>>>>>>>>>>>>>>>>>>>>>>>>>> voltage as
>>>>>>>>>>>>>>>>>>>>>>>>>> 408MHz, correct? It's not instantly obvious to m=
e
>>>>>>>>>>>>>>>>>>>>>>>>>> from the
>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL driver's code where the fmax @ Vmin is
>>>>>>>>>>>>>>>>>>>>>>>>>> defined,
>>>>>>>>>>>>>>>>>>>>>>>>>> I see
>>>>>>>>>>>>>>>>>>>>>>>>>> that there is the min_millivolts
>>>>>>>>>>>>>>>>>>>>>>>>>> and frequency entries starting from 204MHZ defin=
ed
>>>>>>>>>>>>>>>>>>>>>>>>>> per-table.
>>>>>>>>>>>>>>>>>>>>>>>>> Yes at Vmin CPU Fmax is ~800Mhz. So anything belo=
w
>>>>>>>>>>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>>>>>>>>>>> will
>>>>>>>>>>>>>>>>>>>>>>>>> work at Vmin voltage and PLLP max is 408Mhz.
>>>>>>>>>>>>>>>>>>>>>>>> Thank you for the clarification. It would be good
>>>>>>>>>>>>>>>>>>>>>>>> to have
>>>>>>>>>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>>>>>>>>>> commented
>>>>>>>>>>>>>>>>>>>>>>>> in the code as well.
>>>>>>>>>>>>>>>>>>>>>>> OK, Will add...
>>>>>>>>>>>>>>>>>>>>>> Regarding, adding suspend/resume to CPUFreq, CPUFreq
>>>>>>>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>>>>>>>> happens very early even before disabling non-boot
>>>>>>>>>>>>>>>>>>>>>> CPUs and
>>>>>>>>>>>>>>>>>>>>>> also
>>>>>>>>>>>>>>>>>>>>>> need to export clock driver APIs to CPUFreq.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Was thinking of below way of implementing this...
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Clock DFLL driver Suspend:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Save CPU clock policy registers, and
>>>>>>>>>>>>>>>>>>>>>> Perform
>>>>>>>>>>>>>>>>>>>>>> dfll
>>>>>>>>>>>>>>>>>>>>>> suspend which sets in open loop mode
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> CPU Freq driver Suspend: does nothing
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Clock DFLL driver Resume:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Re-init DFLL, Set in Open-Loop mode,
>>>>>>>>>>>>>>>>>>>>>> restore
>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>> Clock policy registers which actually sets source to
>>>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>>>> along
>>>>>>>>>>>>>>>>>>>>>> with other CPU Policy register restore.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> CPU Freq driver Resume:
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - do clk_prepare_enable which acutally
>>>>>>>>>>>>>>>>>>>>>> sets
>>>>>>>>>>>>>>>>>>>>>> DFLL in
>>>>>>>>>>>>>>>>>>>>>> Closed loop mode
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Adding one more note: Switching CPU Clock to PLLP
>>>>>>>>>>>>>>>>>>>>>> is not
>>>>>>>>>>>>>>>>>>>>>> needed
>>>>>>>>>>>>>>>>>>>>>> as CPU CLock can be from dfll in open-loop mode as
>>>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>>>> is not
>>>>>>>>>>>>>>>>>>>>>> disabled anywhere throught the suspend/resume path
>>>>>>>>>>>>>>>>>>>>>> and SC7
>>>>>>>>>>>>>>>>>>>>>> entry
>>>>>>>>>>>>>>>>>>>>>> FW and Warm boot code will switch CPU source to PLLP=
.
>>>>>>>>>>>>>>>>>>>> Since CPU resumes on PLLP, it will be cleaner to suspe=
nd
>>>>>>>>>>>>>>>>>>>> it on
>>>>>>>>>>>>>>>>>>>> PLLP as well. And besides, seems that currently
>>>>>>>>>>>>>>>>>>>> disabling
>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>> clock will disable DFLL completely and then you'd
>>>>>>>>>>>>>>>>>>>> want to
>>>>>>>>>>>>>>>>>>>> re-init
>>>>>>>>>>>>>>>>>>>> the DFLL on resume any ways. So better to just disable
>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>> completely on suspend, which should happen on
>>>>>>>>>>>>>>>>>>>> clk_disable(dfll).
>>>>>>>>>>>>>>>>>>> Will switch to PLLP during CPUFreq suspend. With
>>>>>>>>>>>>>>>>>>> decision of
>>>>>>>>>>>>>>>>>>> using
>>>>>>>>>>>>>>>>>>> clk_disable during suspend, its mandatory to switch to
>>>>>>>>>>>>>>>>>>> PLLP as
>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>> is completely disabled.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> My earlier concern was on restoring CPU policy as we
>>>>>>>>>>>>>>>>>>> can't do
>>>>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>>>>> from CPUFreq driver and need export from clock driver.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Clear now and will do CPU clock policy restore in after
>>>>>>>>>>>>>>>>>>> dfll
>>>>>>>>>>>>>>>>>>> re-init.
>>>>>>>>>>>>>>>>>> Why the policy can't be saved/restored by the CaR driver
>>>>>>>>>>>>>>>>>> as a
>>>>>>>>>>>>>>>>>> context of any other clock?
>>>>>>>>>>>>>>>>> restoring cpu clock policy involves programming source an=
d
>>>>>>>>>>>>>>>>> super_cclkg_divider.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> cclk_g is registered as clk_super_mux and it doesn't use
>>>>>>>>>>>>>>>>> frac_div ops
>>>>>>>>>>>>>>>>> to do save/restore its divider.
>>>>>>>>>>>>>>>> That can be changed of course and I guess it also could
>>>>>>>>>>>>>>>> be as
>>>>>>>>>>>>>>>> simple as
>>>>>>>>>>>>>>>> saving and restoring of two raw u32 values of the
>>>>>>>>>>>>>>>> policy/divider
>>>>>>>>>>>>>>>> registers.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Also, during clock context we cant restore cclk_g as cclk=
_g
>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>> will be dfll and dfll will not be resumed/re-initialized
>>>>>>>>>>>>>>>>> by the
>>>>>>>>>>>>>>>>> time
>>>>>>>>>>>>>>>>> clk_super_mux save/restore happens.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> we can't use save/restore context for dfll clk_ops becaus=
e
>>>>>>>>>>>>>>>>> dfllCPU_out parent to CCLK_G is first in the clock tree a=
nd
>>>>>>>>>>>>>>>>> dfll_ref
>>>>>>>>>>>>>>>>> and dfll_soc peripheral clocks are not restored by the
>>>>>>>>>>>>>>>>> time dfll
>>>>>>>>>>>>>>>>> restore happens. Also dfll peripheral clock enables need
>>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>>> restored before dfll restore happens which involves
>>>>>>>>>>>>>>>>> programming
>>>>>>>>>>>>>>>>> dfll
>>>>>>>>>>>>>>>>> controller for re-initialization.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> So dfll resume/re-init is done in clk-tegra210 at end of
>>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>>> clocks
>>>>>>>>>>>>>>>>> restore in V5 series but instead of in clk-tegra210
>>>>>>>>>>>>>>>>> driver I
>>>>>>>>>>>>>>>>> moved
>>>>>>>>>>>>>>>>> now to dfll-fcpu driver pm_ops as all dfll dependencies
>>>>>>>>>>>>>>>>> will be
>>>>>>>>>>>>>>>>> restored thru clk_restore_context by then. This will be i=
n
>>>>>>>>>>>>>>>>> V6.
>>>>>>>>>>>>>>>> Since DFLL is now guaranteed to be disabled across CaR
>>>>>>>>>>>>>>>> suspend/resume
>>>>>>>>>>>>>>>> (hence it has nothing to do in regards to CCLK) and given
>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>> PLLs
>>>>>>>>>>>>>>>> state is restored before the rest of the clocks, I don't
>>>>>>>>>>>>>>>> see why
>>>>>>>>>>>>>>>> not to
>>>>>>>>>>>>>>>> implement CCLK save/restore in a generic fasion. CPU polic=
y
>>>>>>>>>>>>>>>> wull be
>>>>>>>>>>>>>>>> restored to either PLLP or PLLX (if CPUFreq driver is
>>>>>>>>>>>>>>>> disabled).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> CCLK_G save/restore should happen in clk_super_mux ops
>>>>>>>>>>>>>>> save/context and
>>>>>>>>>>>>>>> clk_super_mux save/restore happens very early as cclk_g is
>>>>>>>>>>>>>>> first
>>>>>>>>>>>>>>> in the
>>>>>>>>>>>>>>> clock tree and save/restore traverses through the tree
>>>>>>>>>>>>>>> top-bottom
>>>>>>>>>>>>>>> order.
>>>>>>>>>>>>>> If CCLK_G is restored before the PLLs, then just change the
>>>>>>>>>>>>>> clocks
>>>>>>>>>>>>>> order
>>>>>>>>>>>>>> such that it won't happen.
>>>>>>>>>>>>>>
>>>>>>>>>>>>> I dont think we can change clocks order for CCLK_G.
>>>>>>>>>>>>>
>>>>>>>>>>>>> During bootup, cclk_g is registered after all pll's and
>>>>>>>>>>>>> peripheral
>>>>>>>>>>>>> clocks which is the way we wanted, So cclk_g will be the firs=
t
>>>>>>>>>>>>> one in
>>>>>>>>>>>>> the clk list as clk_register adds new clock first in the list=
.
>>>>>>>>>>>>>
>>>>>>>>>>>>> When clk_save_context and clk_restore_context APIs iterates
>>>>>>>>>>>>> over the
>>>>>>>>>>>>> list, cclk_g is the first
>>>>>>>>>>>> Looking at clk_core_restore_context(), I see that it walks up
>>>>>>>>>>>> CLKs
>>>>>>>>>>>> list
>>>>>>>>>>>> from parent to children, hence I don't understand how it can
>>>>>>>>>>>> ever
>>>>>>>>>>>> happen
>>>>>>>>>>>> that CCLK will be restored before the parent. The clocks
>>>>>>>>>>>> registration
>>>>>>>>>>>> order doesn't matter at all in that case.
>>>>>>>>>>> yes from parent to children and dfllCPU_out is the top in the
>>>>>>>>>>> list and
>>>>>>>>>>> its child is cclk_g.
>>>>>>>>>>>
>>>>>>>>>>> the way clocks are registered is the order I see in the clock
>>>>>>>>>>> list and
>>>>>>>>>>> looking into clk_register API it adds new node first in the lis=
t.
>>>>>>>>>>>
>>>>>>>>>> cclkg_g & dfll register happens after all plls and peripheral
>>>>>>>>>> clocks as
>>>>>>>>>> it need ref, soc and peripheral clocks to be enabled.
>>>>>>>>>>> So they are the last to get registered and so becomes first in
>>>>>>>>>>> the
>>>>>>>>>>> list.
>>>>>>>>>>>
>>>>>>>>>>> During save/restore context, it traverses thru this list and
>>>>>>>>>>> first in
>>>>>>>>>>> the list is dfllcpu_OUT (parent) and its child (cclk_g)
>>>>>>>>>>>
>>>>>>>>>>> saving should not be an issue at all but we cant restore
>>>>>>>>>>> cclk_g/dfll
>>>>>>>>>>> in normal way thru clk_ops restore as plls and peripherals
>>>>>>>>>>> restore
>>>>>>>>>>> doesn't happen by that time.
>>>>>>>>>>>
>>>>>>>>>> I was referring to clk_restore_context where it iterates thru
>>>>>>>>>> root list
>>>>>>>>>> and for each core from the root list clk_core_restore does
>>>>>>>>>> restore of
>>>>>>>>>> parent and children.
>>>>>>>>>>
>>>>>>>>>> dfllCPU_Out gets first in the list and its child is cclk_g
>>>>>>>>>>
>>>>>>>>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/clk/clk.c=
#L1105
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> What list you're talking about? clk_summary? It shows current
>>>>>>>>> *active*
>>>>>>>>> clocks configuration, if you'll try to disable CPUFreq driver the=
n
>>>>>>>>> the
>>>>>>>>> parent of CCLK_G should be PLLX. Similarly when CPU is
>>>>>>>>> reparented to
>>>>>>>>> PLLP on driver's suspend, then PLLP is the parent.
>>>>>>>>>
>>>>>>>>>>>>>>> DFLL enable thru CPUFreq resume happens after all
>>>>>>>>>>>>>>> clk_restore_context
>>>>>>>>>>>>>>> happens. So during clk_restore_context, dfll re-init doesnt
>>>>>>>>>>>>>>> happen
>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>> doing cpu clock policy restore during super_mux clk_ops wil=
l
>>>>>>>>>>>>>>> crash as
>>>>>>>>>>>>>>> DFLL is not initialized and its clock is not enabled but CP=
U
>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>> restore sets source to DFLL if we restore during
>>>>>>>>>>>>>>> super_clk_mux
>>>>>>>>>>>>>> If CPU was suspended on PLLP, then it will be restored on
>>>>>>>>>>>>>> PLLP by
>>>>>>>>>>>>>> CaR. I
>>>>>>>>>>>>>> don't understand what DFLL has to do with the CCLK in that
>>>>>>>>>>>>>> case
>>>>>>>>>>>>>> during
>>>>>>>>>>>>>> the clocks restore.
>>>>>>>>>>>>> My above comment is in reference to your request of doing
>>>>>>>>>>>>> save/restore
>>>>>>>>>>>>> for cclk_g in normal fashion thru save/restore context. Becau=
se
>>>>>>>>>>>>> of the
>>>>>>>>>>>>> clk order I mentioned above, we cclk_g will be the first one =
to
>>>>>>>>>>>>> go thru
>>>>>>>>>>>>> save/context.
>>>>>>>>>>>>>
>>>>>>>>>>>>> During save_context of cclk_g, source can be from PLLX, dfll.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Issue will be when we do restore during clk_restore_context o=
f
>>>>>>>>>>>>> cclk_g as
>>>>>>>>>>>>> by that time PLLX/dfll will not be restored.
>>>>>>>>>>>>>
>>>>>>>>>>>> Seems we already agreed that DFLL will be disabled by the
>>>>>>>>>>>> CPUFreq
>>>>>>>>>>>> driver
>>>>>>>>>>>> on suspend. Hence CCLK can't be from DFLL if CPU is
>>>>>>>>>>>> reparented to
>>>>>>>>>>>> PLLP
>>>>>>>>>>>> on CPUFreq driver's suspend, otherwise CPU keeps running from =
a
>>>>>>>>>>>> boot-state PLLX if CPUFreq driver is disabled.
>>>>>>>>>>> Yes suspend should not be an issue but issue will be during
>>>>>>>>>>> resume
>>>>>>>>>>> where if we do cclk_g restore in normal way thru
>>>>>>>>>>> clk_restore_context,
>>>>>>>>>>> cclk_g restore happens very early as dfllCPU out is the first
>>>>>>>>>>> one that
>>>>>>>>>>> goes thru restore context and plls/peripherals are not resumed =
by
>>>>>>>>>>> then.
>>>>>>>>>>>
>>>>>>>>>>> CPU runs from PLLX if dfll clock enable fails during boot. So
>>>>>>>>>>> when it
>>>>>>>>>>> gets to suspend, we save CPU running clock source as either
>>>>>>>>>>> PLLX or
>>>>>>>>>>> DFLL and then we switch to PLLP.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On resume, CPU runs from PLLP by warm boot code and we need to
>>>>>>>>>>> restore
>>>>>>>>>>> back its source to the one it was using from saved source conte=
xt
>>>>>>>>>>> (which can be either PLLX or DFLL)
>>>>>>>>>>>
>>>>>>>>>>> So PLLs & DFLL resume need to happen before CCLKG restore/resum=
e.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> With all above discussions, we do DFLL disable in CPUFreq
>>>>>>>>>>> driver on
>>>>>>>>>>> suspend and on CPUFreq resume we enable DFLL back and restore C=
PU
>>>>>>>>>>> clock source it was using during suspend (which will be either
>>>>>>>>>>> PLLX if
>>>>>>>>>>> dfll enable fails during probe or it will be using DFLL).
>>>>>>>>> During suspend CPU's parent shall be PLLP and not DFLL (note that
>>>>>>>>> it is
>>>>>>>>> disabled) after reparenting to PLLP by the CPUFreq driver.
>>>>>>>>>
>>>>>>>> CPU source context should be saved before switching to safe
>>>>>>>> source of
>>>>>>>> PLLP as on resume we need to restore back to source it was using
>>>>>>>> before we switch to safe source during suspend entry.
>>>>>>>>
>>>>>>>> So saved context for CPU Source will be either dfll or PLLX
>>>>>>>>
>>>>>>> PLLP reparenting is only during suspend/entry to have it as safe
>>>>>>> source
>>>>>>> but actual CPU source it was running from before suspending is eith=
er
>>>>>>> dfll/pllx which should be the one to be restored on CPUFreq resume.
>>>>>>> Resume happens with CPU running from PLLP till it gets to the
>>>>>>> point of
>>>>>>> restoring its original source (dfll or pllx)
>>>>>> CaR should restore CPU to PLLP or PLLX, while CPUFreq driver restore=
s
>>>>>> CPU to DFLL. Please see more comments below.
>>>>>>
>>>>>>>>>>> So i was trying to say dfll/cclk_g restore can't be done in
>>>>>>>>>>> normal way
>>>>>>>>>>> thru clk_ops save/restore context
>>>>>>>>> Let's see what happens if CPUFreq is active:
>>>>>>>>>
>>>>>>>>> 1. CPUFreq driver probe happens
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02. CPU is reparented to PLLP
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03. DFLL inited
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04. CPU is reparented to DFLL
>>>>>>>>>
>>>>>>>>> 5. CPUFreq driver suspend happens
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A06. CPU is reparented to PLLP
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07. DFLL is disabled
>>>>>>>>>
>>>>>>>>> 8. Car suspend happens
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A09. DFLL context saved
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010. PLLP/PLLX context saved
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A011. CCLK context saved
>>>>>>>>>
>>>>>>>>> 12. Car resume happens
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A013. DFLL context restored
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A014. PLLP/PLLX context restor=
ed
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A015. CCLK context restored
>>>>>>>>>
>>>>>>>>> 16. CPUFreq driver resume happens
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A017. DFLL re-inited
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A018. CPU is reparented to DFL=
L
>>>>>>>> Below is the order of sequence it should be based on the order of
>>>>>>>> clk
>>>>>>>> register.
>>>>>>>>
>>>>>>>> My comments inline in this sequence.
>>>>>>>>
>>>>>>>> 1. CPUFreq driver probe happens
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02. CPU is reparented to PLLP
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03. DFLL inited
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04. CPU is reparented to DFLL
>>>>>>>>
>>>>>>>>
>>>>>>>> 5. CPUFreq driver suspend happens
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A06. Save CPU source which coul=
d be either dfll or pllx
>>>>>> Please see my next comment.
>>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07. CPU is reparented to safe =
known source PLLP
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08. DFLL is disabled
>>>>>>>>
>>>>>>>> 8. Car suspend happens
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A09. DFLL context saved (With D=
FLL disabled in CPUFreq suspend,
>>>>>>>> nothing to be saved here as last freq req will always be saved).
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010. CCLK context saved (CPU c=
lock source will be saved in
>>>>>>>> CPUFreq
>>>>>>>> driver suspend which could be either dfll or pllx)
>>>>>> That I don't understand. The CPU's clock source state should be
>>>>>> saved at
>>>>>> the moment of the CaR's suspending (i.e. CCLK policy will be set to
>>>>>> PLLP
>>>>>> or PLLX) and then CCLK state should be also restored by the CaR in
>>>>>> step 14.
>>>>> CPU clock to be saved and restored should be the source used before w=
e
>>>>> switch it to safe PLLP for suspend/resume operation.
>>>>>
>>>>> This original source could be either PLLX or DFLL which it was using
>>>>> before we disable DFLL during CPU Freq suspend.
>>>>>
>>>>> If we save CPU clock source at moment of CAR suspending, it will be
>>>>> PLLP as we switch to safe PLLP in CPUFreq driver suspend.
>>>>>
>>>>> Infact, we dont need to restore CPU clock source to PLLP anywhere in
>>>>> resume as it comes up with PLLP source from warm boot code itself.
>>> You must always maintain proper suspend/resume encapsulation, otherwise
>>> it's a total mess. It doesn't matter that CCLK is restored to PLLP even
>>> that CPU is already running off PLLP after warmboot.
>>>
>>>>> But we need to restore CPU source to original source it was using
>>>>> before we switch to safe PLLP source for suspend operation. This
>>>>> original source could be PLLX/DFLL and this should be re-stored in
>>>>> CPUFreq resume as by this time PLLs and peripherals are restored and
>>>>> dfll is re-initialized.
>>>>>
>>>>> So saving actual CPU source before switching to intermediate safe PLL=
P
>>>>> in CPUFreq driver and then restoring back during CPUFreq resume shoul=
d
>>>>> be good as CPUFreq resume happens right after all clocks (plls
>>>>> restore, peripherals restore, dfll resume)>>
>>>>>> CPUFreq driver should only switch CPU to PLLP and disable DFLL on
>>>>>> suspend in step 5, that's it. On resume CPUFreq driver will restore
>>>>>> CPU
>>>>>> to DFLL in step 18.
>>>>> Also I don't think we should hard-code to force CPU source to DFLL on
>>>>> CPUFreq resume.
>>>>>
>>>>> Reason is during CPU Probe when it tries to switch to dfll source, fo=
r
>>>>> some reason if dfll enable fails it sets CPU to its original source
>>>>> which will be PLLX.
>>> No!
>>>
>>> 1. CPU voltage could be too low for PLLX
>>> 2. PLLX rate can't be changed without manual reparenting CPU to
>>> intermediate clock
>>> 3. CPUFreq can't manually manage CPU voltage
>>>
>>> DFLL-restoring failure is an extreme case. CPU must be kept on a safe
>>> PLLP in that case and disable_cpufreq() must be invoked as well.
>> OK, PLLX option was also in my mind. So If we just consider sources as
>> DFLL or PLLP, then we can save source in CCLK save context and restore
>> in CCLK restore basically it will be PLLP.
>>
>> Later during CPUFreq resume we can just switch to DFLL and if DFLL
>> enable fails we will keep source as PLLP. Yes will invoke
>> disable_cpufreq as well in case of dfll enable failure for some reason.
> Sounds good!
>
>>>>> So CPU source could be either DFLL or PLLX in CPUFreq
>>>>> tegra124_cpu_switch_to_dfll
>>>>>
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A011. PLLP/PLLX context saved
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A012. Peripheral Clock saved
>>>>>>>>
>>>>>>>> 12. Car resume happens
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A013. DFLL context restored : N=
o DFLL context to be restored
>>>>>>>> and we
>>>>>>>> only need to reinitialize DFLL and re-initialize can't be done
>>>>>>>> here as
>>>>>>>> this is the 1st to get restored and PLL/Peripheral clocks are not
>>>>>>>> restored by this time. So we can't use clk_ops restore for DFLL
>>>>>> It looks to me that clk_core_restore_context() should just do
>>>>>> hlist_for_each_entry *_reverse*. Don't you think so?
>>>>> Thought of that but this is in core driver and is used by other
>>>>> non-tegra clock driver and not sure if that impacts for those.
>>> The reverse ordering should be correct, I think it's just a shortcoming
>>> of the CCF that need to be fixed. But will better to make a more
>>> thorough research, asking Stephen and Michael for the clarification.
>>>
>>>>> But with decision of switching CPUFreq with dfll clock enable/disable
>>>>> during CPUFreq suspend/resume, we can re-init dfll during dfll-fcpu
>>>>> driver resume and we don't need CCLK save/restore.
>>>>>
> Actually CPUFreq driver should implement suspend/resume regardless of
> CaR ability to restore DFLL or whatever, simply to properly handle
> possible clock restoring failure on resume as we just found out.
>
>>>> the way of all clocks order is good except cclk_g which has dependency
>>>> on multiple clocks.
>>> CCLK_G has a single parent at a time. What "multiple clocks" you're
>>> talking about? Please explain.
>> dependencies I am referring are dfll_ref, dfll_soc, and DVFS peripheral
>> clocks which need to be restored prior to DFLL reinit.
> Okay, but that shouldn't be a problem if clock dependencies are set up
> properly.
>
>>>> reverse list order during restore might not work as all other clocks a=
re
>>>> in proper order no with any ref clocks for plls getting restored prior
>>>> to their clients
>>> Why? The ref clocks should be registered first and be the roots for PLL=
s
>>> and the rest. If it's not currently the case, then this need to be
>>> fixed. You need to ensure that each clock is modeled properly. If some
>>> child clock really depends on multiple parents, then the parents need t=
o
>>> in the correct order or CCF need to be taught about such
>>> multi-dependencies.
>>>
>>> If some required feature is missed, then you have to implement it
>>> properly and for all, that's how things are done in upstream. Sometimes
>>> it's quite a lot of extra work that everyone are benefiting from in
>>> the end.
>>>
>>> [snip]
>> Yes, we should register ref/parents before their clients.
>>
>> cclk_g clk is registered last after all pll and peripheral clocks are
>> registers during clock init.
>>
>> dfllCPU_out clk is registered later during dfll-fcpu driver probe and
>> gets added to the clock list.
>>
>> Probably the issue seems to be not linking dfll_ref and dfll_soc
>> dependencies for dfllCPU_out thru clock list.
>>
>> clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk reference
>> thru DT.
> Please try to fix all missing dependencies and orderings.

Peter,

dfllCPU_OUT is the first one to go thru restore when clk_restore_context=20
traverses thru the list.

dfllCPU_OUT has dependency on DFLL_ref and DFLL_SOC but this dependency=20
is unknown to clock-tree.

We can add DFLL_REF and DFLL_SOC as parents to dfllCPU_OUT during=20
register so dfllCPU_OUT save/restore happens after their parents are=20
restored.

But DFLL needs both of these to be restored before DFLLCPU_Out and as=20
DFLL_SOC restore always happens after the REF, thinking to add DFLL_SOC=20
as parent to dfllCPU_OUT so save/restore follows after their dependencies.

Please comment.

