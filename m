Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0E36C296
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 23:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbfGQV3d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 17:29:33 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19178 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfGQV3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 17:29:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2f93400002>; Wed, 17 Jul 2019 14:29:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 17 Jul 2019 14:29:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 17 Jul 2019 14:29:30 -0700
Received: from [10.2.164.12] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Jul
 2019 21:29:26 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
 <0ee06d1a-310d-59f7-0aa6-b688b33447f5@nvidia.com>
 <cedfafd0-4114-0821-0c4b-efc17c213449@gmail.com>
 <707c4679-fde6-1714-ced0-dcf7ca8380a9@nvidia.com>
 <c6c0a205-c083-fd46-361c-175bd8840c6e@nvidia.com>
 <055457fd-621b-6c93-b671-d5e5380698c6@nvidia.com>
 <20190717071105.3750a021@dimatab>
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
Message-ID: <fd8f5243-7073-2e0a-caab-308aa6bc0d63@nvidia.com>
Date:   Wed, 17 Jul 2019 14:29:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563398976; bh=A/rZkmRs3HqsksgbhbZcC22VRb12uhS4s/x3pwTLsbU=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=COzKXjKPS7SyhRL/bAQxF6GVchGEqfotxvvYSu2pRK/Bf8cLPal5uyANLaKG/R1gn
         OyJYx5SSQeP45B7fC0odm/HdUYcIsqeIHDkugEYPB+3XeNio+I+8dNtqCUdJXMoR6X
         KheADalkxFdSc9QAfr1P8UWCknau0yM5KprlPKE64VTYmPwUbvW1vN5hm2OPADHRUx
         4pFTKMAEXcHX/DbRvEvcIgwD0qO1htxTlXuOCpNWlv/T38LNrFjHX+vggpGTylViAV
         nr9afOdMRuJXWWvSPgOTt05Ss3ZqJlkkhJ+f9WXUJxynNiL/4zy+nesQ7xfW60YDUX
         K59KQipd79OAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/17/19 1:11 PM, Sowjanya Komatineni wrote:
>
> On 7/17/19 1:01 PM, Sowjanya Komatineni wrote:
>>
>> On 7/17/19 12:43 PM, Dmitry Osipenko wrote:
>>> 17.07.2019 21:54, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/17/19 11:51 AM, Sowjanya Komatineni wrote:
>>>>> On 7/17/19 11:32 AM, Dmitry Osipenko wrote:
>>>>>> 17.07.2019 20:29, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On 7/17/19 8:17 AM, Dmitry Osipenko wrote:
>>>>>>>> 17.07.2019 9:36, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>> On 7/16/19 11:33 PM, Dmitry Osipenko wrote:
>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 22:55:52 -0700
>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>>>>>>>>>
>>>>>>>>>>> On 7/16/19 10:42 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 22:25:25 -0700
>>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=
=88=D0=B5=D1=82:
>>>>>>>>>>>>> On 7/16/19 9:11 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>> =D0=92 Tue, 16 Jul 2019 19:35:49 -0700
>>>>>>>>>>>>>> Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=
=88=D0=B5=D1=82:
>>>>>>>>>>>>>>> On 7/16/19 7:18 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>> On 7/16/19 3:06 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>> On 7/16/19 3:00 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>> 17.07.2019 0:35, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>> On 7/16/19 2:21 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>> 17.07.2019 0:12, Sowjanya Komatineni =D0=BF=D0=B8=D1=
=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>> On 7/16/19 1:47 PM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 22:26, Sowjanya Komatineni =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:43 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:30, Sowjanya Komatineni =D0=BF=D0=B8=
=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 11:25 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 21:19, Sowjanya Komatineni =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 16.07.2019 11:06, Peter De Schrijver =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800,=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Joseph
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Lo wrote:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> OK, Will add to CPUFreq driver...
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The other thing that also need=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> attention is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> that T124 CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> implicitly relies on DFLL driver to be=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> probed
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> first, which is
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> icky.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Should I add check for successful dfll clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> register explicitly in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver probe and defer till=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll clk
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> registers?
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Probably you should use the "device=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> links". See
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [1][2] for the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> example.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://elixir.bootlin.com/linux/v5.2.1/sourc=
e/drivers/gpu/drm/tegra/dc.c#L2383=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [2]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/driver=
-api/device_link.html=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Return EPROBE_DEFER instead of EINVAL if
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device_link_add() fails.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> And
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> use of_find_device_by_node() to get the=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device, see [3].
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [3]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/g=
it/next/linux-next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>> Will go thru and add...
>>>>>>>>>>>>>>>>>>>>>>>>>> Looks like I initially confused this case with
>>>>>>>>>>>>>>>>>>>>>>>>>> getting
>>>>>>>>>>>>>>>>>>>>>>>>>> orphaned clock.
>>>>>>>>>>>>>>>>>>>>>>>>>> I'm now seeing that the DFLL driver registers=20
>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>> clock and then
>>>>>>>>>>>>>>>>>>>>>>>>>> clk_get(dfll) should be returning=20
>>>>>>>>>>>>>>>>>>>>>>>>>> EPROBE_DEFER until
>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL driver is
>>>>>>>>>>>>>>>>>>>>>>>>>> probed, hence everything should be fine as-is=20
>>>>>>>>>>>>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>>>>>>>>>>>>> there is no real
>>>>>>>>>>>>>>>>>>>>>>>>>> need
>>>>>>>>>>>>>>>>>>>>>>>>>> for the 'device link'. Sorry for the confusion!
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sorry, I didn't follow the mail thread.=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Just
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regarding the DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> part.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> As you know it, the DFLL clock is one of=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock sources and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> integrated with DVFS control logic with the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator. We will not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to other clock sources once we=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switched to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL. Because the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU has
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> been regulated by the DFLL HW with the DVFS
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> (CVB or OPP
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> table
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> you see
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> in the driver.). We shouldn't reparent=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> it to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> other sources with
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> unknew
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> freq/volt pair. That's not guaranteed to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> work. We
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> allow switching to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> open-loop mode but different sources.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Okay, then the CPUFreq driver will have to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> enforce
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> rate before switching to PLLP in order to=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> proper CPU voltage.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP freq is safe to work for any CPU voltage.
>>>>>>>>>>>>>>>>>>>>>>>>>>>> So no
>>>>>>>>>>>>>>>>>>>>>>>>>>>> need to enforce
>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL freq to PLLP rate before changing CCLK_G
>>>>>>>>>>>>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>>>>>>>>>>>>> to PLLP during
>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>>>>>>>>>>>>> Sorry, please ignore my above comment. During
>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend, need to change
>>>>>>>>>>>>>>>>>>>>>>>>>>> CCLK_G source to PLLP when dfll is in closed=20
>>>>>>>>>>>>>>>>>>>>>>>>>>> loop
>>>>>>>>>>>>>>>>>>>>>>>>>>> mode first and
>>>>>>>>>>>>>>>>>>>>>>>>>>> then
>>>>>>>>>>>>>>>>>>>>>>>>>>> dfll need to be set to open loop.
>>>>>>>>>>>>>>>>>>>>>>>>>> Okay.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> And I don't exactly understand why we=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> need to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switch to PLLP in
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> idle
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver. Just keep it on CL-DVFS mode all=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> time.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 entry, the dfll suspend function
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> moves it
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the open-loop
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> mode. That's
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> all. The sc7-entryfirmware will handle=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the rest
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> of the sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn off
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU power.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> In SC7 resume, the warmboot code will=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> handle
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> sequence to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> turn on
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> regulator and power up the CPU cluster. And
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> leave
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> it on PLL_P.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> After
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> resuming to the kernel, we re-init DFLL,
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> restore
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the CPU clock
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> policy (CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> runs on DFLL open-loop mode) and then=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> moving to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> close-loop mode.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL is re-inited after switching CCLK to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> parent during of
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> early clocks-state restoring by CaR=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver. Hence
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> instead of having
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> odd
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> hacks in the CaR driver, it is much nicer to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> have a
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> proper suspend-resume sequencing of the=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> device
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> drivers. In this case
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> driver is the driver that enables DFLL and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> switches
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPU to that
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> clock
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> source, which means that this driver is also
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> should
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> be responsible for
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> management of the DFLL's state during of
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend/resume process. If
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CPUFreq driver disables DFLL during=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend and
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> re-enables it
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> resume, then looks like the CaR driver hacks
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> around
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DFLL are not
>>>>>>>>>>>>>>>>>>>>>>>>>>>>> needed.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> The DFLL part looks good to me. BTW,=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> change the
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> patch subject to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "Add
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> suspend-resume support" seems more
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> appropriate to
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> me.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> To clarify this, the sequences for DFLL use
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> are as
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> follows (assuming
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> all
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> required DFLL hw configuration has been=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> done)
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch to DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Save current parent and frequency
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2) Enable DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 3) Change cclk_g parent to DFLL
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> For OVR regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Change PWM output pin from tristate to=20
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 5) Enable DFLL PWM output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> For I2C regulator:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 4) Enable DFLL I2C output
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 6) Program DFLL to closed loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Switch away from DFLL:
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 0) Change cclk_g parent to PLLP so the CPU
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> frequency is ok for
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> any
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> vdd_cpu voltage
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>>>>>>>>>>>>>>>>>>>>> I see during switch away from DFLL (suspend),
>>>>>>>>>>>>>>>>>>>>>>>>>>> cclk_g
>>>>>>>>>>>>>>>>>>>>>>>>>>> parent is not
>>>>>>>>>>>>>>>>>>>>>>>>>>> changed to PLLP before changing dfll to open=20
>>>>>>>>>>>>>>>>>>>>>>>>>>> loop
>>>>>>>>>>>>>>>>>>>>>>>>>>> mode.
>>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>>> Will add this ...
>>>>>>>>>>>>>>>>>>>>>>>>>> The CPUFreq driver switches parent to PLLP=20
>>>>>>>>>>>>>>>>>>>>>>>>>> during
>>>>>>>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>>>>>>>> probe, similar
>>>>>>>>>>>>>>>>>>>>>>>>>> should be done on suspend.
>>>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>>>> I'm also wondering if it's always safe to=20
>>>>>>>>>>>>>>>>>>>>>>>>>> switch to
>>>>>>>>>>>>>>>>>>>>>>>>>> PLLP in the probe.
>>>>>>>>>>>>>>>>>>>>>>>>>> If CPU is running on a lower freq than PLLP,=20
>>>>>>>>>>>>>>>>>>>>>>>>>> then
>>>>>>>>>>>>>>>>>>>>>>>>>> some
>>>>>>>>>>>>>>>>>>>>>>>>>> other more
>>>>>>>>>>>>>>>>>>>>>>>>>> appropriate intermediate parent should be=20
>>>>>>>>>>>>>>>>>>>>>>>>>> selected.
>>>>>>>>>>>>>>>>>>>>>>>>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X=20
>>>>>>>>>>>>>>>>>>>>>>>>> always
>>>>>>>>>>>>>>>>>>>>>>>>> runs at higher
>>>>>>>>>>>>>>>>>>>>>>>>> rate
>>>>>>>>>>>>>>>>>>>>>>>>> so switching to PLL_P during CPUFreq probe=20
>>>>>>>>>>>>>>>>>>>>>>>>> prior to
>>>>>>>>>>>>>>>>>>>>>>>>> dfll clock enable
>>>>>>>>>>>>>>>>>>>>>>>>> should be safe.
>>>>>>>>>>>>>>>>>>>>>>>> AFAIK, PLLX could run at ~200MHz. There is also a
>>>>>>>>>>>>>>>>>>>>>>>> divided output of
>>>>>>>>>>>>>>>>>>>>>>>> PLLP
>>>>>>>>>>>>>>>>>>>>>>>> which CCLKG supports, the PLLP_OUT4.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> Probably, realistically, CPU is always running=20
>>>>>>>>>>>>>>>>>>>>>>>> off a
>>>>>>>>>>>>>>>>>>>>>>>> fast PLLX during
>>>>>>>>>>>>>>>>>>>>>>>> boot, but I'm wondering what may happen on=20
>>>>>>>>>>>>>>>>>>>>>>>> KEXEC. I
>>>>>>>>>>>>>>>>>>>>>>>> guess ideally CPUFreq driver should also have a
>>>>>>>>>>>>>>>>>>>>>>>> 'shutdown' callback to teardown DFLL
>>>>>>>>>>>>>>>>>>>>>>>> on a reboot, but likely that there are other
>>>>>>>>>>>>>>>>>>>>>>>> clock-related problems as
>>>>>>>>>>>>>>>>>>>>>>>> well that may break KEXEC and thus it is not very
>>>>>>>>>>>>>>>>>>>>>>>> important at the
>>>>>>>>>>>>>>>>>>>>>>>> moment.
>>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>>>>>>>>>>>>> During bootup CPUG sources from PLL_X. By PLL_P=20
>>>>>>>>>>>>>>>>>>>>>>> source
>>>>>>>>>>>>>>>>>>>>>>> above I meant
>>>>>>>>>>>>>>>>>>>>>>> PLL_P_OUT4.
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> As per clock policies, PLL_X is always used for=20
>>>>>>>>>>>>>>>>>>>>>>> high
>>>>>>>>>>>>>>>>>>>>>>> freq
>>>>>>>>>>>>>>>>>>>>>>> like
>>>>>>>>>>>>>>>>>>>>>>>> 800Mhz
>>>>>>>>>>>>>>>>>>>>>>> and for low frequency it will be sourced from PLLP.
>>>>>>>>>>>>>>>>>>>>>> Alright, then please don't forget to pre-initialize
>>>>>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate to a
>>>>>>>>>>>>>>>>>>>>>> reasonable value using tegra_clk_init_table or
>>>>>>>>>>>>>>>>>>>>>> assigned-clocks.
>>>>>>>>>>>>>>>>>>>>> PLLP_OUT4 rate update is not needed as it is safe to
>>>>>>>>>>>>>>>>>>>>> run at
>>>>>>>>>>>>>>>>>>>>> 408Mhz because it is below fmax @ Vmin
>>>>>>>>>>>>>>>>>>>> So even 204MHz CVB entries are having the same=20
>>>>>>>>>>>>>>>>>>>> voltage as
>>>>>>>>>>>>>>>>>>>> 408MHz, correct? It's not instantly obvious to me=20
>>>>>>>>>>>>>>>>>>>> from the
>>>>>>>>>>>>>>>>>>>> DFLL driver's code where the fmax @ Vmin is=20
>>>>>>>>>>>>>>>>>>>> defined, I see
>>>>>>>>>>>>>>>>>>>> that there is the min_millivolts
>>>>>>>>>>>>>>>>>>>> and frequency entries starting from 204MHZ defined
>>>>>>>>>>>>>>>>>>>> per-table.
>>>>>>>>>>>>>>>>>>> Yes at Vmin CPU Fmax is ~800Mhz. So anything below that
>>>>>>>>>>>>>>>>>>> will
>>>>>>>>>>>>>>>>>>> work at Vmin voltage and PLLP max is 408Mhz.
>>>>>>>>>>>>>>>>>> Thank you for the clarification. It would be good to=20
>>>>>>>>>>>>>>>>>> have
>>>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>>>> commented
>>>>>>>>>>>>>>>>>> in the code as well.
>>>>>>>>>>>>>>>>> OK, Will add...
>>>>>>>>>>>>>>>> Regarding, adding suspend/resume to CPUFreq, CPUFreq=20
>>>>>>>>>>>>>>>> suspend
>>>>>>>>>>>>>>>> happens very early even before disabling non-boot CPUs and
>>>>>>>>>>>>>>>> also
>>>>>>>>>>>>>>>> need to export clock driver APIs to CPUFreq.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Was thinking of below way of implementing this...
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Clock DFLL driver Suspend:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 - Save CPU clock policy registers, and=20
>>>>>>>>>>>>>>>> Perform
>>>>>>>>>>>>>>>> dfll
>>>>>>>>>>>>>>>> suspend which sets in open loop mode
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> CPU Freq driver Suspend: does nothing
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Clock DFLL driver Resume:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 - Re-init DFLL, Set in Open-Loop mode,=20
>>>>>>>>>>>>>>>> restore
>>>>>>>>>>>>>>>> CPU
>>>>>>>>>>>>>>>> Clock policy registers which actually sets source to DFLL
>>>>>>>>>>>>>>>> along
>>>>>>>>>>>>>>>> with other CPU Policy register restore.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> CPU Freq driver Resume:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 - do clk_prepare_enable which acutally sets
>>>>>>>>>>>>>>>> DFLL in
>>>>>>>>>>>>>>>> Closed loop mode
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Adding one more note: Switching CPU Clock to PLLP is not
>>>>>>>>>>>>>>>> needed
>>>>>>>>>>>>>>>> as CPU CLock can be from dfll in open-loop mode as DFLL=20
>>>>>>>>>>>>>>>> is not
>>>>>>>>>>>>>>>> disabled anywhere throught the suspend/resume path and SC7
>>>>>>>>>>>>>>>> entry
>>>>>>>>>>>>>>>> FW and Warm boot code will switch CPU source to PLLP.
>>>>>>>>>>>>>> Since CPU resumes on PLLP, it will be cleaner to suspend=20
>>>>>>>>>>>>>> it on
>>>>>>>>>>>>>> PLLP as well. And besides, seems that currently disabling=20
>>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>>> clock will disable DFLL completely and then you'd want to
>>>>>>>>>>>>>> re-init
>>>>>>>>>>>>>> the DFLL on resume any ways. So better to just disable DFLL
>>>>>>>>>>>>>> completely on suspend, which should happen on=20
>>>>>>>>>>>>>> clk_disable(dfll).
>>>>>>>>>>>>> Will switch to PLLP during CPUFreq suspend. With decision of
>>>>>>>>>>>>> using
>>>>>>>>>>>>> clk_disable during suspend, its mandatory to switch to=20
>>>>>>>>>>>>> PLLP as
>>>>>>>>>>>>> DFLL
>>>>>>>>>>>>> is completely disabled.
>>>>>>>>>>>>>
>>>>>>>>>>>>> My earlier concern was on restoring CPU policy as we can't do
>>>>>>>>>>>>> that
>>>>>>>>>>>>> from CPUFreq driver and need export from clock driver.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Clear now and will do CPU clock policy restore in after dfll
>>>>>>>>>>>>> re-init.
>>>>>>>>>>>> Why the policy can't be saved/restored by the CaR driver as a
>>>>>>>>>>>> context of any other clock?
>>>>>>>>>>> restoring cpu clock policy involves programming source and
>>>>>>>>>>> super_cclkg_divider.
>>>>>>>>>>>
>>>>>>>>>>> cclk_g is registered as clk_super_mux and it doesn't use
>>>>>>>>>>> frac_div ops
>>>>>>>>>>> to do save/restore its divider.
>>>>>>>>>> That can be changed of course and I guess it also could be as
>>>>>>>>>> simple as
>>>>>>>>>> saving and restoring of two raw u32 values of the policy/divider
>>>>>>>>>> registers.
>>>>>>>>>>
>>>>>>>>>>> Also, during clock context we cant restore cclk_g as cclk_g=20
>>>>>>>>>>> source
>>>>>>>>>>> will be dfll and dfll will not be resumed/re-initialized by the
>>>>>>>>>>> time
>>>>>>>>>>> clk_super_mux save/restore happens.
>>>>>>>>>>>
>>>>>>>>>>> we can't use save/restore context for dfll clk_ops because
>>>>>>>>>>> dfllCPU_out parent to CCLK_G is first in the clock tree and
>>>>>>>>>>> dfll_ref
>>>>>>>>>>> and dfll_soc peripheral clocks are not restored by the time=20
>>>>>>>>>>> dfll
>>>>>>>>>>> restore happens. Also dfll peripheral clock enables need to be
>>>>>>>>>>> restored before dfll restore happens which involves programming
>>>>>>>>>>> dfll
>>>>>>>>>>> controller for re-initialization.
>>>>>>>>>>>
>>>>>>>>>>> So dfll resume/re-init is done in clk-tegra210 at end of all=20
>>>>>>>>>>> clocks
>>>>>>>>>>> restore in V5 series but instead of in clk-tegra210 driver I=20
>>>>>>>>>>> moved
>>>>>>>>>>> now to dfll-fcpu driver pm_ops as all dfll dependencies will be
>>>>>>>>>>> restored thru clk_restore_context by then. This will be in V6.
>>>>>>>>>> Since DFLL is now guaranteed to be disabled across CaR
>>>>>>>>>> suspend/resume
>>>>>>>>>> (hence it has nothing to do in regards to CCLK) and given=20
>>>>>>>>>> that PLLs
>>>>>>>>>> state is restored before the rest of the clocks, I don't see why
>>>>>>>>>> not to
>>>>>>>>>> implement CCLK save/restore in a generic fasion. CPU policy=20
>>>>>>>>>> wull be
>>>>>>>>>> restored to either PLLP or PLLX (if CPUFreq driver is disabled).
>>>>>>>>>>
>>>>>>>>> CCLK_G save/restore should happen in clk_super_mux ops
>>>>>>>>> save/context and
>>>>>>>>> clk_super_mux save/restore happens very early as cclk_g is first
>>>>>>>>> in the
>>>>>>>>> clock tree and save/restore traverses through the tree top-bottom
>>>>>>>>> order.
>>>>>>>> If CCLK_G is restored before the PLLs, then just change the clocks
>>>>>>>> order
>>>>>>>> such that it won't happen.
>>>>>>>>
>>>>>>> I dont think we can change clocks order for CCLK_G.
>>>>>>>
>>>>>>> During bootup, cclk_g is registered after all pll's and peripheral
>>>>>>> clocks which is the way we wanted, So cclk_g will be the first=20
>>>>>>> one in
>>>>>>> the clk list as clk_register adds new clock first in the list.
>>>>>>>
>>>>>>> When clk_save_context and clk_restore_context APIs iterates over=20
>>>>>>> the
>>>>>>> list, cclk_g is the first
>>>>>> Looking at clk_core_restore_context(), I see that it walks up=20
>>>>>> CLKs list
>>>>>> from parent to children, hence I don't understand how it can ever=20
>>>>>> happen
>>>>>> that CCLK will be restored before the parent. The clocks=20
>>>>>> registration
>>>>>> order doesn't matter at all in that case.
>>>>> yes from parent to children and dfllCPU_out is the top in the list=20
>>>>> and
>>>>> its child is cclk_g.
>>>>>
>>>>> the way clocks are registered is the order I see in the clock list=20
>>>>> and
>>>>> looking into clk_register API it adds new node first in the list.
>>>>>
>>>> cclkg_g & dfll register happens after all plls and peripheral=20
>>>> clocks as
>>>> it need ref, soc and peripheral clocks to be enabled.
>>>>> So they are the last to get registered and so becomes first in the=20
>>>>> list.
>>>>>
>>>>> During save/restore context, it traverses thru this list and first in
>>>>> the list is dfllcpu_OUT (parent) and its child (cclk_g)
>>>>>
>>>>> saving should not be an issue at all but we cant restore cclk_g/dfll
>>>>> in normal way thru clk_ops restore as plls and peripherals restore
>>>>> doesn't happen by that time.
>>>>>
>>>> I was referring to clk_restore_context where it iterates thru root=20
>>>> list
>>>> and for each core from the root list clk_core_restore does restore of
>>>> parent and children.
>>>>
>>>> dfllCPU_Out gets first in the list and its child is cclk_g
>>>>
>>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/clk/clk.c#L1105
>>> What list you're talking about? clk_summary? It shows current *active*
>>> clocks configuration, if you'll try to disable CPUFreq driver then the
>>> parent of CCLK_G should be PLLX. Similarly when CPU is reparented to
>>> PLLP on driver's suspend, then PLLP is the parent.
>>>
>>>>>>>>> DFLL enable thru CPUFreq resume happens after all=20
>>>>>>>>> clk_restore_context
>>>>>>>>> happens. So during clk_restore_context, dfll re-init doesnt=20
>>>>>>>>> happen
>>>>>>>>> and
>>>>>>>>> doing cpu clock policy restore during super_mux clk_ops will=20
>>>>>>>>> crash as
>>>>>>>>> DFLL is not initialized and its clock is not enabled but CPU=20
>>>>>>>>> clock
>>>>>>>>> restore sets source to DFLL if we restore during super_clk_mux
>>>>>>>> If CPU was suspended on PLLP, then it will be restored on PLLP by
>>>>>>>> CaR. I
>>>>>>>> don't understand what DFLL has to do with the CCLK in that case=20
>>>>>>>> during
>>>>>>>> the clocks restore.
>>>>>>> My above comment is in reference to your request of doing=20
>>>>>>> save/restore
>>>>>>> for cclk_g in normal fashion thru save/restore context. Because=20
>>>>>>> of the
>>>>>>> clk order I mentioned above, we cclk_g will be the first one to=20
>>>>>>> go thru
>>>>>>> save/context.
>>>>>>>
>>>>>>> During save_context of cclk_g, source can be from PLLX, dfll.
>>>>>>>
>>>>>>> Issue will be when we do restore during clk_restore_context of
>>>>>>> cclk_g as
>>>>>>> by that time PLLX/dfll will not be restored.
>>>>>>>
>>>>>> Seems we already agreed that DFLL will be disabled by the CPUFreq=20
>>>>>> driver
>>>>>> on suspend. Hence CCLK can't be from DFLL if CPU is reparented to=20
>>>>>> PLLP
>>>>>> on CPUFreq driver's suspend, otherwise CPU keeps running from a
>>>>>> boot-state PLLX if CPUFreq driver is disabled.
>>>>> Yes suspend should not be an issue but issue will be during resume
>>>>> where if we do cclk_g restore in normal way thru clk_restore_context,
>>>>> cclk_g restore happens very early as dfllCPU out is the first one=20
>>>>> that
>>>>> goes thru restore context and plls/peripherals are not resumed by=20
>>>>> then.
>>>>>
>>>>> CPU runs from PLLX if dfll clock enable fails during boot. So when it
>>>>> gets to suspend, we save CPU running clock source as either PLLX or
>>>>> DFLL and then we switch to PLLP.
>>>>>
>>>>>
>>>>> On resume, CPU runs from PLLP by warm boot code and we need to=20
>>>>> restore
>>>>> back its source to the one it was using from saved source context
>>>>> (which can be either PLLX or DFLL)
>>>>>
>>>>> So PLLs & DFLL resume need to happen before CCLKG restore/resume.
>>>>>
>>>>>
>>>>> With all above discussions, we do DFLL disable in CPUFreq driver on
>>>>> suspend and on CPUFreq resume we enable DFLL back and restore CPU
>>>>> clock source it was using during suspend (which will be either=20
>>>>> PLLX if
>>>>> dfll enable fails during probe or it will be using DFLL).
>>> During suspend CPU's parent shall be PLLP and not DFLL (note that it is
>>> disabled) after reparenting to PLLP by the CPUFreq driver.
>>>
>> CPU source context should be saved before switching to safe source of=20
>> PLLP as on resume we need to restore back to source it was using=20
>> before we switch to safe source during suspend entry.
>>
>> So saved context for CPU Source will be either dfll or PLLX
>>
> PLLP reparenting is only during suspend/entry to have it as safe=20
> source but actual CPU source it was running from before suspending is=20
> either dfll/pllx which should be the one to be restored on CPUFreq=20
> resume. Resume happens with CPU running from PLLP till it gets to the=20
> point of restoring its original source (dfll or pllx)
>>>>> So i was trying to say dfll/cclk_g restore can't be done in normal=20
>>>>> way
>>>>> thru clk_ops save/restore context
>>> Let's see what happens if CPUFreq is active:
>>>
>>> 1. CPUFreq driver probe happens
>>> =C2=A0=C2=A0=C2=A0=C2=A02. CPU is reparented to PLLP
>>> =C2=A0=C2=A0=C2=A0=C2=A03. DFLL inited
>>> =C2=A0=C2=A0=C2=A0=C2=A04. CPU is reparented to DFLL
>>>
>>> 5. CPUFreq driver suspend happens
>>> =C2=A0=C2=A0=C2=A0=C2=A06. CPU is reparented to PLLP
>>> =C2=A0=C2=A0=C2=A0=C2=A07. DFLL is disabled
>>>
>>> 8. Car suspend happens
>>> =C2=A0=C2=A0=C2=A0=C2=A09. DFLL context saved
>>> =C2=A0=C2=A0=C2=A0=C2=A010. PLLP/PLLX context saved
>>> =C2=A0=C2=A0=C2=A0=C2=A011. CCLK context saved
>>>
>>> 12. Car resume happens
>>> =C2=A0=C2=A0=C2=A0=C2=A013. DFLL context restored
>>> =C2=A0=C2=A0=C2=A0=C2=A014. PLLP/PLLX context restored
>>> =C2=A0=C2=A0=C2=A0=C2=A015. CCLK context restored
>>>
>>> 16. CPUFreq driver resume happens
>>> =C2=A0=C2=A0=C2=A0=C2=A017. DFLL re-inited
>>> =C2=A0=C2=A0=C2=A0=C2=A018. CPU is reparented to DFLL
>>
>>
>> Below is the order of sequence it should be based on the order of clk=20
>> register.
>>
>> My comments inline in this sequence.
>>
>> 1. CPUFreq driver probe happens
>> =C2=A0=C2=A0=C2=A0=C2=A02. CPU is reparented to PLLP
>> =C2=A0=C2=A0=C2=A0=C2=A03. DFLL inited
>> =C2=A0=C2=A0=C2=A0=C2=A04. CPU is reparented to DFLL
>>
>>
>> 5. CPUFreq driver suspend happens
>> =C2=A0=C2=A0=C2=A0=C2=A06. Save CPU source which could be either dfll or=
 pllx
>> =C2=A0=C2=A0=C2=A0=C2=A07. CPU is reparented to safe known source PLLP
>> =C2=A0=C2=A0=C2=A0=C2=A08. DFLL is disabled
>>
>> 8. Car suspend happens
>> =C2=A0=C2=A0=C2=A0=C2=A09. DFLL context saved (With DFLL disabled in CPU=
Freq suspend,=20
>> nothing to be saved here as last freq req will always be saved).
>> =C2=A0=C2=A0=C2=A0=C2=A010. CCLK context saved (CPU clock source will be=
 saved in CPUFreq=20
>> driver suspend which could be either dfll or pllx)
>> =C2=A0=C2=A0=C2=A0=C2=A011. PLLP/PLLX context saved
>> =C2=A0=C2=A0=C2=A0=C2=A012. Peripheral Clock saved
>>
>> 12. Car resume happens
>> =C2=A0=C2=A0=C2=A0=C2=A013. DFLL context restored : No DFLL context to b=
e restored and we=20
>> only need to reinitialize DFLL and re-initialize can't be done here=20
>> as this is the 1st to get restored and PLL/Peripheral clocks are not=20
>> restored by this time. So we can't use clk_ops restore for DFLL
>> =C2=A0=C2=A0=C2=A0=C2=A014. CCLK context restored
>> CCLK cant be restored here as context could be either dfll or pllx=20
>> which is the source orginally it was actually using before we force=20
>> switch to safe PLLP for suspend entry. So we can't use clk_ops=20
>> restore for DFLL
>>
>> 15. PLLP/PLLX context restored
>> =C2=A0=C2=A0=C2=A0=C2=A016. Peripheral context restored
>>
>> 16. CPUFreq driver resume happens
>> =C2=A0=C2=A0=C2=A0=C2=A017. DFLL re-inited (Invoking DFLL re-init in CPU=
Freq resume need=20
>> exporting DFLL reinit from Clock driver to CPUFreq driver)
>> =C2=A0=C2=A0=C2=A0=C2=A018. CPU is reparented to DFLL or PLLX based on s=
aved context from=20
>> step 9.
>>
>> Note: instead of exporting, we can do DFLL re-init from clock-dfll=20
>> driver itself thru dfll-fcpu pm_ops resume. So dfll will be=20
>> re-initialized by the time CPUFreq driver resumes and switches to use=20
>> DFLL source.
>>
Tested above commented sequence and looks as expected. Will send V6=20
after addressing other comments of V5 patch series for further review...


