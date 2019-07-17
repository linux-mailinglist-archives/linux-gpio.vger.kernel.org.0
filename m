Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96B06B53E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 06:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbfGQEBw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 00:01:52 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7687 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfGQEBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 00:01:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2e9da90003>; Tue, 16 Jul 2019 21:01:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jul 2019 21:01:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jul 2019 21:01:47 -0700
Received: from [10.2.164.12] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jul
 2019 04:01:45 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
 <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
 <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
 <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
 <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
 <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
 <0706576a-ce61-1cf3-bed1-05f54a1e2489@nvidia.com>
 <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
 <ef63f72a-db03-ef28-a371-e578f351c713@nvidia.com>
 <27641e30-fdd1-e53a-206d-71e1f23343fd@gmail.com>
 <10c4b9a2-a857-d124-c22d-7fd71a473079@nvidia.com>
 <fd8bad73-464b-54f1-be94-fe3ac8b23e6e@gmail.com>
 <0ee06d1a-310d-59f7-0aa6-b688b33447f5@nvidia.com>
 <cedfafd0-4114-0821-0c4b-efc17c213449@gmail.com>
 <707c4679-fde6-1714-ced0-dcf7ca8380a9@nvidia.com>
 <c6c0a205-c083-fd46-361c-175bd8840c6e@nvidia.com>
 <20190717065431.27f27a07@dimatab>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b8c641d9-39f0-b800-e00a-6eadf680ecd9@nvidia.com>
Date:   Tue, 16 Jul 2019 21:01:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717065431.27f27a07@dimatab>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563336106; bh=+7VUgkyWMf56eExu/UowMapKk7/WX6q9L1xq0yXSqB4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=rdwwbplNxp5lNNlFrcOlD+sfyFMPkopmI2TYJbCu6/IQJJNYztOIgxLmpkgOAYV5y
         Vn7JPcAm2EAdx1nw0kKsqg4+gQOktUue3iE6Vl7JyOLBICr2MwN849NE0fSesptQ9C
         Ede5REDeoEQnKm2q/Ra4yIERUu3Q0gnmcuVsyntQaWc4tx4XTIqnO38KeCS1QLburr
         CtNIPQCl3RIb3V9vLqJkNYbWX4UoHR9SBfXnhOPyXFoWyIcYQ7C3U68767Ls1bp7U6
         PpYsnnFyJszksTqjBXF/AcEqc3zcFnZmKLXGB5x9bwVocDYwwztForWSLhp9up9ZK+
         B1I9lTkqVuvKg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/16/19 8:54 PM, Dmitry Osipenko wrote:
> =D0=92 Tue, 16 Jul 2019 19:18:19 -0700
> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>
>> On 7/16/19 3:06 PM, Sowjanya Komatineni wrote:
>>> On 7/16/19 3:00 PM, Dmitry Osipenko wrote:
>>>> 17.07.2019 0:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On 7/16/19 2:21 PM, Dmitry Osipenko wrote:
>>>>>> 17.07.2019 0:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On 7/16/19 1:47 PM, Dmitry Osipenko wrote:
>>>>>>>> 16.07.2019 22:26, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>> On 7/16/19 11:43 AM, Dmitry Osipenko wrote:
>>>>>>>>>> 16.07.2019 21:30, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>> On 7/16/19 11:25 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>> 16.07.2019 21:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>>>>>>>>>>>>> On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>> 16.07.2019 11:06, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo
>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>> OK, Will add to CPUFreq driver...
>>>>>>>>>>>>>>>>>>> The other thing that also need attention is that
>>>>>>>>>>>>>>>>>>> T124 CPUFreq
>>>>>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>>>>>> implicitly relies on DFLL driver to be probed first,
>>>>>>>>>>>>>>>>>>> which is
>>>>>>>>>>>>>>>>>>> icky.
>>>>>>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>>>>>>> Should I add check for successful dfll clk register
>>>>>>>>>>>>>>>>>> explicitly in
>>>>>>>>>>>>>>>>>> CPUFreq driver probe and defer till dfll clk
>>>>>>>>>>>>>>>>>> registers?
>>>>>>>>>>>>>>> Probably you should use the "device links". See [1][2]
>>>>>>>>>>>>>>> for the
>>>>>>>>>>>>>>> example.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/=
drm/tegra/dc.c#L2383
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [2]
>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/driver-api/device_li=
nk.html
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Return EPROBE_DEFER instead of EINVAL if
>>>>>>>>>>>>>>> device_link_add() fails.
>>>>>>>>>>>>>>> And
>>>>>>>>>>>>>>> use of_find_device_by_node() to get the DFLL's device,
>>>>>>>>>>>>>>> see [3].
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> [3]
>>>>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>>> Will go thru and add...
>>>>>>>>>>>> Looks like I initially confused this case with getting
>>>>>>>>>>>> orphaned clock.
>>>>>>>>>>>> I'm now seeing that the DFLL driver registers the clock
>>>>>>>>>>>> and then clk_get(dfll) should be returning EPROBE_DEFER
>>>>>>>>>>>> until DFLL driver is
>>>>>>>>>>>> probed, hence everything should be fine as-is and there is
>>>>>>>>>>>> no real
>>>>>>>>>>>> need
>>>>>>>>>>>> for the 'device link'. Sorry for the confusion!
>>>>>>>>>>>>  =20
>>>>>>>>>>>>>>>>> Sorry, I didn't follow the mail thread. Just
>>>>>>>>>>>>>>>>> regarding the DFLL
>>>>>>>>>>>>>>>>> part.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> As you know it, the DFLL clock is one of the CPU clock
>>>>>>>>>>>>>>>>> sources and
>>>>>>>>>>>>>>>>> integrated with DVFS control logic with the
>>>>>>>>>>>>>>>>> regulator. We will not
>>>>>>>>>>>>>>>>> switch
>>>>>>>>>>>>>>>>> CPU to other clock sources once we switched to DFLL.
>>>>>>>>>>>>>>>>> Because the
>>>>>>>>>>>>>>>>> CPU has
>>>>>>>>>>>>>>>>> been regulated by the DFLL HW with the DVFS table
>>>>>>>>>>>>>>>>> (CVB or OPP
>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>> you see
>>>>>>>>>>>>>>>>> in the driver.). We shouldn't reparent it to other
>>>>>>>>>>>>>>>>> sources with
>>>>>>>>>>>>>>>>> unknew
>>>>>>>>>>>>>>>>> freq/volt pair. That's not guaranteed to work. We
>>>>>>>>>>>>>>>>> allow switching to
>>>>>>>>>>>>>>>>> open-loop mode but different sources.
>>>>>>>>>>>>>>> Okay, then the CPUFreq driver will have to enforce DFLL
>>>>>>>>>>>>>>> freq to
>>>>>>>>>>>>>>> PLLP's
>>>>>>>>>>>>>>> rate before switching to PLLP in order to have a proper
>>>>>>>>>>>>>>> CPU voltage.
>>>>>>>>>>>>>> PLLP freq is safe to work for any CPU voltage. So no
>>>>>>>>>>>>>> need to enforce
>>>>>>>>>>>>>> DFLL freq to PLLP rate before changing CCLK_G source to
>>>>>>>>>>>>>> PLLP during
>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>> Sorry, please ignore my above comment. During suspend,
>>>>>>>>>>>>> need to change
>>>>>>>>>>>>> CCLK_G source to PLLP when dfll is in closed loop mode
>>>>>>>>>>>>> first and
>>>>>>>>>>>>> then
>>>>>>>>>>>>> dfll need to be set to open loop.
>>>>>>>>>>>> Okay.
>>>>>>>>>>>>  =20
>>>>>>>>>>>>>>>>> And I don't exactly understand why we need to switch
>>>>>>>>>>>>>>>>> to PLLP in
>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>> idle
>>>>>>>>>>>>>>>>> driver. Just keep it on CL-DVFS mode all the time.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> In SC7 entry, the dfll suspend function moves it the
>>>>>>>>>>>>>>>>> open-loop
>>>>>>>>>>>>>>>>> mode. That's
>>>>>>>>>>>>>>>>> all. The sc7-entryfirmware will handle the rest of the
>>>>>>>>>>>>>>>>> sequence to
>>>>>>>>>>>>>>>>> turn off
>>>>>>>>>>>>>>>>> the CPU power.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> In SC7 resume, the warmboot code will handle the
>>>>>>>>>>>>>>>>> sequence to
>>>>>>>>>>>>>>>>> turn on
>>>>>>>>>>>>>>>>> regulator and power up the CPU cluster. And leave it
>>>>>>>>>>>>>>>>> on PLL_P.
>>>>>>>>>>>>>>>>> After
>>>>>>>>>>>>>>>>> resuming to the kernel, we re-init DFLL, restore the
>>>>>>>>>>>>>>>>> CPU clock
>>>>>>>>>>>>>>>>> policy (CPU
>>>>>>>>>>>>>>>>> runs on DFLL open-loop mode) and then moving to
>>>>>>>>>>>>>>>>> close-loop mode.
>>>>>>>>>>>>>>> The DFLL is re-inited after switching CCLK to DFLL
>>>>>>>>>>>>>>> parent during of
>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>> early clocks-state restoring by CaR driver. Hence
>>>>>>>>>>>>>>> instead of having
>>>>>>>>>>>>>>> odd
>>>>>>>>>>>>>>> hacks in the CaR driver, it is much nicer to have a
>>>>>>>>>>>>>>> proper suspend-resume sequencing of the device drivers.
>>>>>>>>>>>>>>> In this case CPUFreq
>>>>>>>>>>>>>>> driver is the driver that enables DFLL and switches CPU
>>>>>>>>>>>>>>> to that
>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>> source, which means that this driver is also should be
>>>>>>>>>>>>>>> responsible for
>>>>>>>>>>>>>>> management of the DFLL's state during of suspend/resume
>>>>>>>>>>>>>>> process. If
>>>>>>>>>>>>>>> CPUFreq driver disables DFLL during suspend and
>>>>>>>>>>>>>>> re-enables it during
>>>>>>>>>>>>>>> resume, then looks like the CaR driver hacks around
>>>>>>>>>>>>>>> DFLL are not
>>>>>>>>>>>>>>> needed.
>>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>>>>>> The DFLL part looks good to me. BTW, change the patch
>>>>>>>>>>>>>>>>> subject to
>>>>>>>>>>>>>>>>> "Add
>>>>>>>>>>>>>>>>> suspend-resume support" seems more appropriate to me.
>>>>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>>>>> To clarify this, the sequences for DFLL use are as
>>>>>>>>>>>>>>>> follows (assuming
>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>> required DFLL hw configuration has been done)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Switch to DFLL:
>>>>>>>>>>>>>>>> 0) Save current parent and frequency
>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>> 2) Enable DFLL
>>>>>>>>>>>>>>>> 3) Change cclk_g parent to DFLL
>>>>>>>>>>>>>>>> For OVR regulator:
>>>>>>>>>>>>>>>> 4) Change PWM output pin from tristate to output
>>>>>>>>>>>>>>>> 5) Enable DFLL PWM output
>>>>>>>>>>>>>>>> For I2C regulator:
>>>>>>>>>>>>>>>> 4) Enable DFLL I2C output
>>>>>>>>>>>>>>>> 6) Program DFLL to closed loop mode
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Switch away from DFLL:
>>>>>>>>>>>>>>>> 0) Change cclk_g parent to PLLP so the CPU frequency
>>>>>>>>>>>>>>>> is ok for
>>>>>>>>>>>>>>>> any
>>>>>>>>>>>>>>>> vdd_cpu voltage
>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>  =20
>>>>>>>>>>>>> I see during switch away from DFLL (suspend), cclk_g
>>>>>>>>>>>>> parent is not
>>>>>>>>>>>>> changed to PLLP before changing dfll to open loop mode.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Will add this ...
>>>>>>>>>>>> The CPUFreq driver switches parent to PLLP during the
>>>>>>>>>>>> probe, similar
>>>>>>>>>>>> should be done on suspend.
>>>>>>>>>>>>
>>>>>>>>>>>> I'm also wondering if it's always safe to switch to PLLP
>>>>>>>>>>>> in the probe.
>>>>>>>>>>>> If CPU is running on a lower freq than PLLP, then some
>>>>>>>>>>>> other more
>>>>>>>>>>>> appropriate intermediate parent should be selected.
>>>>>>>>>>>>  =20
>>>>>>>>>>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X always runs
>>>>>>>>>>> at higher
>>>>>>>>>>> rate
>>>>>>>>>>> so switching to PLL_P during CPUFreq probe prior to dfll
>>>>>>>>>>> clock enable
>>>>>>>>>>> should be safe.
>>>>>>>>>> AFAIK, PLLX could run at ~200MHz. There is also a divided
>>>>>>>>>> output of
>>>>>>>>>> PLLP
>>>>>>>>>> which CCLKG supports, the PLLP_OUT4.
>>>>>>>>>>
>>>>>>>>>> Probably, realistically, CPU is always running off a fast
>>>>>>>>>> PLLX during
>>>>>>>>>> boot, but I'm wondering what may happen on KEXEC. I guess
>>>>>>>>>> ideally CPUFreq driver should also have a 'shutdown'
>>>>>>>>>> callback to teardown DFLL
>>>>>>>>>> on a reboot, but likely that there are other clock-related
>>>>>>>>>> problems as
>>>>>>>>>> well that may break KEXEC and thus it is not very important
>>>>>>>>>> at the moment.
>>>>>>>>>>
>>>>>>>>>> [snip]
>>>>>>>>> During bootup CPUG sources from PLL_X. By PLL_P source above
>>>>>>>>> I meant
>>>>>>>>> PLL_P_OUT4.
>>>>>>>>>
>>>>>>>>> As per clock policies, PLL_X is always used for high freq
>>>>>>>>> like
>>>>>>>>>> 800Mhz
>>>>>>>>> and for low frequency it will be sourced from PLLP.
>>>>>>>> Alright, then please don't forget to pre-initialize PLLP_OUT4
>>>>>>>> rate to a
>>>>>>>> reasonable value using tegra_clk_init_table or
>>>>>>>> assigned-clocks.
>>>>>>> PLLP_OUT4 rate update is not needed as it is safe to run at
>>>>>>> 408Mhz because it is below fmax @ Vmin
>>>>>> So even 204MHz CVB entries are having the same voltage as 408MHz,
>>>>>> correct? It's not instantly obvious to me from the DFLL driver's
>>>>>> code where the fmax @ Vmin is defined, I see that there is the
>>>>>> min_millivolts
>>>>>> and frequency entries starting from 204MHZ defined per-table.
>>>>> Yes at Vmin CPU Fmax is ~800Mhz. So anything below that will work
>>>>> at Vmin voltage and PLLP max is 408Mhz.
>>>> Thank you for the clarification. It would be good to have that
>>>> commented in the code as well.
>>> OK, Will add...
>> Regarding, adding suspend/resume to CPUFreq, CPUFreq suspend happens
>> very early even before disabling non-boot CPUs and also need to
>> export clock driver APIs to CPUFreq.
>>
>> Was thinking of below way of implementing this...
>>
>>
>> Clock DFLL driver Suspend:
>>
>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Save CPU clock policy register=
s, and Perform dfll suspend
>> which sets in open loop mode
>>
>> CPU Freq driver Suspend: does nothing
>>
>>
>> Clock DFLL driver Resume:
>>
>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - Re-init DFLL, Set in Open-Loop=
 mode, restore CPU Clock
>> policy registers which actually sets source to DFLL along with other
>> CPU Policy register restore.
>>
>> CPU Freq driver Resume:
>>
>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 - do clk_prepare_enable which ac=
utally sets DFLL in Closed
>> loop mode
>
> It doesn't matter much when CPUFreq driver suspends, it's only
> important that it suspends before CaR.
>
> I'm not sure why do you need anything else from DFLL driver other than
> what is already exposed via generic CCF API. It looks to me
> that switching CPU's parent clock away from DFLL and then disabling
> DFLL's clock is enough for suspend, accordingly to what Peter wrote. And
> resuming is the same as what's done on CPUFreq's driver probe. The CCLK
> policy should be saved and restored by the CaR driver, you don't need to
> care about it. The cpufreq-dt driver sets
> CPUFREQ_NEED_INITIAL_FREQ_CHECK, hence you don't need to care about
> restoring the original CPU freq on resume, IIUC.
>
>
CPU policy save/restore are part of this patch and it wasn't there=20
earlier and when I moved suspend/resume to clock-dfll I moved cpu=20
restore also to clock-dfll driver.

Thought to restore cpu source to dfll in CPUFreq driver which requires=20
exporting API from clock driver. But leaving CPU restore in Tegra210=20
clock driver, we can do dfll suspend/resume thru CPUFreq driver pm_ops=20
without exporting clock APIs

Will update ...

> With
