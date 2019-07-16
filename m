Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64946AFBD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 21:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfGPT0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 15:26:12 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12914 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPT0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 15:26:12 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2e24d00003>; Tue, 16 Jul 2019 12:26:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 16 Jul 2019 12:26:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 16 Jul 2019 12:26:10 -0700
Received: from [10.2.164.12] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jul
 2019 19:26:08 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <talho@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mperttunen@nvidia.com>,
        <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <a5e1a6df-dff7-9e0c-9551-f78103a5462f@gmail.com>
 <a9b5c364-52b4-bee1-5881-47197f043950@nvidia.com>
 <e9d4bc0e-fd5d-ae02-2d67-86c7f7c9620f@gmail.com>
 <3938092a-bbc7-b304-641d-31677539598d@nvidia.com>
 <932d4d50-120c-9191-6a9a-23bf9c96633b@nvidia.com>
 <0ee055ad-d397-32e5-60ee-d62c14c6f77b@gmail.com>
 <86fc07d5-ab2e-a52a-a570-b1dfff4c20fe@nvidia.com>
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
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ef63f72a-db03-ef28-a371-e578f351c713@nvidia.com>
Date:   Tue, 16 Jul 2019 12:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563305168; bh=53q2dsOurWE7k2pr0LvSFOX7ZaAz3JdPLgUSCKquct0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=M+hIBBBXXWNkgMx/ntwjOXRS5SokgOBqg7En4HeWWRaVX31mpCVNRZqczx0jOVbBD
         BfIt2uVd58UN0y2RA2YvSATlQoTWCk0L0eKwpLVhjD+4cq2pKtM5+g7XGexWrO+eJV
         laSoc6HiuaujupJEREY3/n+e2MQNQ5BY4qlpeGJPcl03vKyIzBIIYku7EQS3O3k6pi
         gbj926UvmNooSdC/v3z5/F/osEOa7P8uf6TjTfhlvgYM2OQHk32Z1ZidpHalxIoBH2
         o1tR+1H3YQ03QyX+jt053E4nkPyY5aJouxu+ITa8sRBGaBKCwikvpR1PdRZS/q2tFx
         uA3q9ElWrdk+g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/16/19 11:43 AM, Dmitry Osipenko wrote:
> 16.07.2019 21:30, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/16/19 11:25 AM, Dmitry Osipenko wrote:
>>> 16.07.2019 21:19, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>>>>> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>>>>>> 16.07.2019 11:06, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
>>>>>>>>> OK, Will add to CPUFreq driver...
>>>>>>>>>> The other thing that also need attention is that T124 CPUFreq
>>>>>>>>>> driver
>>>>>>>>>> implicitly relies on DFLL driver to be probed first, which is
>>>>>>>>>> icky.
>>>>>>>>>>
>>>>>>>>> Should I add check for successful dfll clk register explicitly in
>>>>>>>>> CPUFreq driver probe and defer till dfll clk registers?
>>>>>> Probably you should use the "device links". See [1][2] for the
>>>>>> example.
>>>>>>
>>>>>> [1]
>>>>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra=
/dc.c#L2383
>>>>>>
>>>>>>
>>>>>>
>>>>>> [2] https://www.kernel.org/doc/html/latest/driver-api/device_link.ht=
ml
>>>>>>
>>>>>> Return EPROBE_DEFER instead of EINVAL if device_link_add() fails. An=
d
>>>>>> use of_find_device_by_node() to get the DFLL's device, see [3].
>>>>>>
>>>>>> [3]
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
tree/drivers/devfreq/tegra20-devfreq.c#n100
>>>>>>
>>>>>>
>>>>> Will go thru and add...
>>> Looks like I initially confused this case with getting orphaned clock.
>>> I'm now seeing that the DFLL driver registers the clock and then
>>> clk_get(dfll) should be returning EPROBE_DEFER until DFLL driver is
>>> probed, hence everything should be fine as-is and there is no real need
>>> for the 'device link'. Sorry for the confusion!
>>>
>>>>>>>> Sorry, I didn't follow the mail thread. Just regarding the DFLL
>>>>>>>> part.
>>>>>>>>
>>>>>>>> As you know it, the DFLL clock is one of the CPU clock sources and
>>>>>>>> integrated with DVFS control logic with the regulator. We will not
>>>>>>>> switch
>>>>>>>> CPU to other clock sources once we switched to DFLL. Because the
>>>>>>>> CPU has
>>>>>>>> been regulated by the DFLL HW with the DVFS table (CVB or OPP tabl=
e
>>>>>>>> you see
>>>>>>>> in the driver.). We shouldn't reparent it to other sources with
>>>>>>>> unknew
>>>>>>>> freq/volt pair. That's not guaranteed to work. We allow switching =
to
>>>>>>>> open-loop mode but different sources.
>>>>>> Okay, then the CPUFreq driver will have to enforce DFLL freq to PLLP=
's
>>>>>> rate before switching to PLLP in order to have a proper CPU voltage.
>>>>> PLLP freq is safe to work for any CPU voltage. So no need to enforce
>>>>> DFLL freq to PLLP rate before changing CCLK_G source to PLLP during
>>>>> suspend
>>>>>
>>>> Sorry, please ignore my above comment. During suspend, need to change
>>>> CCLK_G source to PLLP when dfll is in closed loop mode first and then
>>>> dfll need to be set to open loop.
>>> Okay.
>>>
>>>>>>>> And I don't exactly understand why we need to switch to PLLP in CP=
U
>>>>>>>> idle
>>>>>>>> driver. Just keep it on CL-DVFS mode all the time.
>>>>>>>>
>>>>>>>> In SC7 entry, the dfll suspend function moves it the open-loop
>>>>>>>> mode. That's
>>>>>>>> all. The sc7-entryfirmware will handle the rest of the sequence to
>>>>>>>> turn off
>>>>>>>> the CPU power.
>>>>>>>>
>>>>>>>> In SC7 resume, the warmboot code will handle the sequence to turn =
on
>>>>>>>> regulator and power up the CPU cluster. And leave it on PLL_P. Aft=
er
>>>>>>>> resuming to the kernel, we re-init DFLL, restore the CPU clock
>>>>>>>> policy (CPU
>>>>>>>> runs on DFLL open-loop mode) and then moving to close-loop mode.
>>>>>> The DFLL is re-inited after switching CCLK to DFLL parent during of
>>>>>> the
>>>>>> early clocks-state restoring by CaR driver. Hence instead of having
>>>>>> odd
>>>>>> hacks in the CaR driver, it is much nicer to have a proper
>>>>>> suspend-resume sequencing of the device drivers. In this case CPUFre=
q
>>>>>> driver is the driver that enables DFLL and switches CPU to that cloc=
k
>>>>>> source, which means that this driver is also should be responsible f=
or
>>>>>> management of the DFLL's state during of suspend/resume process. If
>>>>>> CPUFreq driver disables DFLL during suspend and re-enables it during
>>>>>> resume, then looks like the CaR driver hacks around DFLL are not
>>>>>> needed.
>>>>>>
>>>>>>>> The DFLL part looks good to me. BTW, change the patch subject to
>>>>>>>> "Add
>>>>>>>> suspend-resume support" seems more appropriate to me.
>>>>>>>>
>>>>>>> To clarify this, the sequences for DFLL use are as follows (assumin=
g
>>>>>>> all
>>>>>>> required DFLL hw configuration has been done)
>>>>>>>
>>>>>>> Switch to DFLL:
>>>>>>> 0) Save current parent and frequency
>>>>>>> 1) Program DFLL to open loop mode
>>>>>>> 2) Enable DFLL
>>>>>>> 3) Change cclk_g parent to DFLL
>>>>>>> For OVR regulator:
>>>>>>> 4) Change PWM output pin from tristate to output
>>>>>>> 5) Enable DFLL PWM output
>>>>>>> For I2C regulator:
>>>>>>> 4) Enable DFLL I2C output
>>>>>>> 6) Program DFLL to closed loop mode
>>>>>>>
>>>>>>> Switch away from DFLL:
>>>>>>> 0) Change cclk_g parent to PLLP so the CPU frequency is ok for any
>>>>>>> vdd_cpu voltage
>>>>>>> 1) Program DFLL to open loop mode
>>>>>>>
>>>> I see during switch away from DFLL (suspend), cclk_g parent is not
>>>> changed to PLLP before changing dfll to open loop mode.
>>>>
>>>> Will add this ...
>>> The CPUFreq driver switches parent to PLLP during the probe, similar
>>> should be done on suspend.
>>>
>>> I'm also wondering if it's always safe to switch to PLLP in the probe.
>>> If CPU is running on a lower freq than PLLP, then some other more
>>> appropriate intermediate parent should be selected.
>>>
>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X always runs at higher rate
>> so switching to PLL_P during CPUFreq probe prior to dfll clock enable
>> should be safe.
> AFAIK, PLLX could run at ~200MHz. There is also a divided output of PLLP
> which CCLKG supports, the PLLP_OUT4.
>
> Probably, realistically, CPU is always running off a fast PLLX during
> boot, but I'm wondering what may happen on KEXEC. I guess ideally
> CPUFreq driver should also have a 'shutdown' callback to teardown DFLL
> on a reboot, but likely that there are other clock-related problems as
> well that may break KEXEC and thus it is not very important at the moment=
.
>
> [snip]

During bootup CPUG sources from PLL_X. By PLL_P source above I meant=20
PLL_P_OUT4.

As per clock policies, PLL_X is always used for high freq like >800Mhz=20
and for low frequency it will be sourced from PLLP.


