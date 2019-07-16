Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E1E6AE66
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 20:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388491AbfGPSTV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 14:19:21 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16753 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388277AbfGPSTU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 14:19:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2e15260005>; Tue, 16 Jul 2019 11:19:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jul 2019 11:19:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jul 2019 11:19:18 -0700
Received: from [10.2.164.12] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jul
 2019 18:19:16 +0000
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
Date:   Tue, 16 Jul 2019 11:19:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563301158; bh=FuKTSWYK7diCw3ba9hgteLgJvAX2nn8e5onsr3teNzQ=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gUr9I9k0I4xr9IV+6tVIwd59F3B9MGrqcZN0Pl21rtiY9TE0h/vqZNjObGeixY61i
         JyuwZFYvhGNqFpAAldTz0SLcDXtBG0XpWs/TeBIUwj6eIKxQw6agqW9AnwF3X+SMtt
         J41dGarUNmEugiv3D6Mi7bce6Hj9cWYgEICivLbLLlq6DxoVGGlPAWu3HdKIxzloN0
         bl0VPmI1QvOQk0adV6v2YZoT10MY1PrKgB8dl0kC+bDGzVwtetiuAb8Jmw4DoxOKlF
         ueVVchWHqJpJIhWLq+WISyb/x/y7EFFeQ2wrlfDkx1+tgFtSrP3Plshq2OQSe7p5jM
         VwnFGffWIq2mQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>
> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>> 16.07.2019 11:06, Peter De Schrijver =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
>>>>> OK, Will add to CPUFreq driver...
>>>>>> The other thing that also need attention is that T124 CPUFreq driver
>>>>>> implicitly relies on DFLL driver to be probed first, which is icky.
>>>>>>
>>>>> Should I add check for successful dfll clk register explicitly in
>>>>> CPUFreq driver probe and defer till dfll clk registers?
>> Probably you should use the "device links". See [1][2] for the example.
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra/dc.=
c#L2383=20
>>
>>
>> [2] https://www.kernel.org/doc/html/latest/driver-api/device_link.html
>>
>> Return EPROBE_DEFER instead of EINVAL if device_link_add() fails. And
>> use of_find_device_by_node() to get the DFLL's device, see [3].
>>
>> [3]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree=
/drivers/devfreq/tegra20-devfreq.c#n100=20
>>
> Will go thru and add...
>>>> Sorry, I didn't follow the mail thread. Just regarding the DFLL part.
>>>>
>>>> As you know it, the DFLL clock is one of the CPU clock sources and
>>>> integrated with DVFS control logic with the regulator. We will not=20
>>>> switch
>>>> CPU to other clock sources once we switched to DFLL. Because the=20
>>>> CPU has
>>>> been regulated by the DFLL HW with the DVFS table (CVB or OPP table=20
>>>> you see
>>>> in the driver.). We shouldn't reparent it to other sources with unknew
>>>> freq/volt pair. That's not guaranteed to work. We allow switching to
>>>> open-loop mode but different sources.
>> Okay, then the CPUFreq driver will have to enforce DFLL freq to PLLP's
>> rate before switching to PLLP in order to have a proper CPU voltage.
>
> PLLP freq is safe to work for any CPU voltage. So no need to enforce=20
> DFLL freq to PLLP rate before changing CCLK_G source to PLLP during=20
> suspend
>
Sorry, please ignore my above comment. During suspend, need to change=20
CCLK_G source to PLLP when dfll is in closed loop mode first and then=20
dfll need to be set to open loop.
>>>> And I don't exactly understand why we need to switch to PLLP in CPU=20
>>>> idle
>>>> driver. Just keep it on CL-DVFS mode all the time.
>>>>
>>>> In SC7 entry, the dfll suspend function moves it the open-loop=20
>>>> mode. That's
>>>> all. The sc7-entryfirmware will handle the rest of the sequence to=20
>>>> turn off
>>>> the CPU power.
>>>>
>>>> In SC7 resume, the warmboot code will handle the sequence to turn on
>>>> regulator and power up the CPU cluster. And leave it on PLL_P. After
>>>> resuming to the kernel, we re-init DFLL, restore the CPU clock=20
>>>> policy (CPU
>>>> runs on DFLL open-loop mode) and then moving to close-loop mode.
>> The DFLL is re-inited after switching CCLK to DFLL parent during of the
>> early clocks-state restoring by CaR driver. Hence instead of having odd
>> hacks in the CaR driver, it is much nicer to have a proper
>> suspend-resume sequencing of the device drivers. In this case CPUFreq
>> driver is the driver that enables DFLL and switches CPU to that clock
>> source, which means that this driver is also should be responsible for
>> management of the DFLL's state during of suspend/resume process. If
>> CPUFreq driver disables DFLL during suspend and re-enables it during
>> resume, then looks like the CaR driver hacks around DFLL are not needed.
>>
>>>> The DFLL part looks good to me. BTW, change the patch subject to "Add
>>>> suspend-resume support" seems more appropriate to me.
>>>>
>>> To clarify this, the sequences for DFLL use are as follows (assuming=20
>>> all
>>> required DFLL hw configuration has been done)
>>>
>>> Switch to DFLL:
>>> 0) Save current parent and frequency
>>> 1) Program DFLL to open loop mode
>>> 2) Enable DFLL
>>> 3) Change cclk_g parent to DFLL
>>> For OVR regulator:
>>> 4) Change PWM output pin from tristate to output
>>> 5) Enable DFLL PWM output
>>> For I2C regulator:
>>> 4) Enable DFLL I2C output
>>> 6) Program DFLL to closed loop mode
>>>
>>> Switch away from DFLL:
>>> 0) Change cclk_g parent to PLLP so the CPU frequency is ok for any=20
>>> vdd_cpu voltage
>>> 1) Program DFLL to open loop mode
>>>
I see during switch away from DFLL (suspend), cclk_g parent is not=20
changed to PLLP before changing dfll to open loop mode.

Will add this ...

>>> For OVR regulator:
>>> 2) Change PWM output pin from output to tristate: vdd_cpu will go back
>>> =C2=A0=C2=A0=C2=A0 to hardwired boot voltage.
>>> 3) Disable DFLL PWM output
>>>
>>> For I2C regulator:
>>> 2) Program vdd_cpu regulator voltage to the boot voltage
>>> 3) Disable DFLL I2C output
>>>
>>> 4) Reprogram parent saved in step 0 of 'Switch to DFLL' to the saved
>>> =C2=A0=C2=A0=C2=A0 frequency
>>> 5) Change cclk_g parent to saved parent
>>> 6) Disable DFLL
>
> This is the same sequence currently implemented. But dfll=20
> suspend/resume calls are thru Tegra210 clock driver.
>
> Dmitry wants to have dfll suspend/resume along with CCLK_G restore to=20
> happen from CPUFreq driver pm_ops rather than tegra210 clock driver or=20
> tegra dfll driver.
>
> Will move it to CPUFreq driver...
>
Thanks!
