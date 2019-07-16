Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACCB96AE85
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 20:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbfGPSZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 14:25:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36490 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPSZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 14:25:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id i21so20958025ljj.3;
        Tue, 16 Jul 2019 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dzpCNoG2ecZyjqfMDdyuZcENn8NrTEOFK08CpMGbvNk=;
        b=f2CD1akNpWD4M95i5XFUstpraEgED6ua7PGVAKs7UR0lWfH/T5653gz/gUX29znlB7
         rGDKbloSwq0s8CadV9xzfGAirF8n0X04P6vIFfq/WjQx7+w3p+xzGTA2ifknVzwY3h6j
         oiKBBILmd6GkDHkKs2oG7nPibb/J+h5yJThjZijgxbF4Sw8VGL4JWupo7VW/xWGGgEv7
         oL2TJtsCjSqQTM4t8V9LFzw7XecXcLyLvFGsPPUYFxsxUJehxTUWJTqto6IUEpbIHw+U
         bkd6U8Xt2nDMC6yJ2o9QObmP+hVZ5UP+tQA5DqMmFNz/P/CT60CV2Ub8KNGApoEEmbKa
         Wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzpCNoG2ecZyjqfMDdyuZcENn8NrTEOFK08CpMGbvNk=;
        b=Xwfbd+qXu5+tgOr50ytc6+THV3H4aatDvyZCssT0DvDqBXLYPMmPYk5n78/buNSuaO
         KCXa11ZpTXiybbIc4cJA4MQY6PkZ+qEO86+ytwlVTNq7IXCJArsHXnNbQd06yBIjrKjZ
         NJ/cBrF0bcoVhTrmOI+2XX2loak/Edq/mLeECFtzvJTVmwFbyARp/adUlL6Eh8l26xQq
         d84CUiuXw2b+86OuPdL9sJn0/mz+n0awu0rYOfSV69vd+PHos2EQu4lnRxcMO2X4fG7d
         cnCLPPZSFWJSapXst4VDlRcoDb7Lzyk/4i4esFth279SgkXUMqBs2nXN3dmIIdmNvzxk
         MLCA==
X-Gm-Message-State: APjAAAX6efjoDXK6e7CRmtW/lXufXxMCo9DQ14g0f1It6UumPzQy9dJI
        lvSUMYoXqfvfp5/nTa3FpqpHipJF
X-Google-Smtp-Source: APXvYqwOE1NBW5Zq1L9LiV/JN0r6gZRvQoR56JkIdauJQ78fpUGBQFQB1UFIHFMHjl0kB2J8ADadJA==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr1359792ljs.54.1563301545821;
        Tue, 16 Jul 2019 11:25:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id t3sm2943552lfk.59.2019.07.16.11.25.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:25:45 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com,
        pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
Date:   Tue, 16 Jul 2019 21:25:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

16.07.2019 21:19, Sowjanya Komatineni пишет:
> 
> On 7/16/19 9:50 AM, Sowjanya Komatineni wrote:
>>
>> On 7/16/19 8:00 AM, Dmitry Osipenko wrote:
>>> 16.07.2019 11:06, Peter De Schrijver пишет:
>>>> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
>>>>>> OK, Will add to CPUFreq driver...
>>>>>>> The other thing that also need attention is that T124 CPUFreq driver
>>>>>>> implicitly relies on DFLL driver to be probed first, which is icky.
>>>>>>>
>>>>>> Should I add check for successful dfll clk register explicitly in
>>>>>> CPUFreq driver probe and defer till dfll clk registers?
>>> Probably you should use the "device links". See [1][2] for the example.
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra/dc.c#L2383
>>>
>>>
>>> [2] https://www.kernel.org/doc/html/latest/driver-api/device_link.html
>>>
>>> Return EPROBE_DEFER instead of EINVAL if device_link_add() fails. And
>>> use of_find_device_by_node() to get the DFLL's device, see [3].
>>>
>>> [3]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100
>>>
>> Will go thru and add...

Looks like I initially confused this case with getting orphaned clock.
I'm now seeing that the DFLL driver registers the clock and then
clk_get(dfll) should be returning EPROBE_DEFER until DFLL driver is
probed, hence everything should be fine as-is and there is no real need
for the 'device link'. Sorry for the confusion!

>>>>> Sorry, I didn't follow the mail thread. Just regarding the DFLL part.
>>>>>
>>>>> As you know it, the DFLL clock is one of the CPU clock sources and
>>>>> integrated with DVFS control logic with the regulator. We will not
>>>>> switch
>>>>> CPU to other clock sources once we switched to DFLL. Because the
>>>>> CPU has
>>>>> been regulated by the DFLL HW with the DVFS table (CVB or OPP table
>>>>> you see
>>>>> in the driver.). We shouldn't reparent it to other sources with unknew
>>>>> freq/volt pair. That's not guaranteed to work. We allow switching to
>>>>> open-loop mode but different sources.
>>> Okay, then the CPUFreq driver will have to enforce DFLL freq to PLLP's
>>> rate before switching to PLLP in order to have a proper CPU voltage.
>>
>> PLLP freq is safe to work for any CPU voltage. So no need to enforce
>> DFLL freq to PLLP rate before changing CCLK_G source to PLLP during
>> suspend
>>
> Sorry, please ignore my above comment. During suspend, need to change
> CCLK_G source to PLLP when dfll is in closed loop mode first and then
> dfll need to be set to open loop.

Okay.

>>>>> And I don't exactly understand why we need to switch to PLLP in CPU
>>>>> idle
>>>>> driver. Just keep it on CL-DVFS mode all the time.
>>>>>
>>>>> In SC7 entry, the dfll suspend function moves it the open-loop
>>>>> mode. That's
>>>>> all. The sc7-entryfirmware will handle the rest of the sequence to
>>>>> turn off
>>>>> the CPU power.
>>>>>
>>>>> In SC7 resume, the warmboot code will handle the sequence to turn on
>>>>> regulator and power up the CPU cluster. And leave it on PLL_P. After
>>>>> resuming to the kernel, we re-init DFLL, restore the CPU clock
>>>>> policy (CPU
>>>>> runs on DFLL open-loop mode) and then moving to close-loop mode.
>>> The DFLL is re-inited after switching CCLK to DFLL parent during of the
>>> early clocks-state restoring by CaR driver. Hence instead of having odd
>>> hacks in the CaR driver, it is much nicer to have a proper
>>> suspend-resume sequencing of the device drivers. In this case CPUFreq
>>> driver is the driver that enables DFLL and switches CPU to that clock
>>> source, which means that this driver is also should be responsible for
>>> management of the DFLL's state during of suspend/resume process. If
>>> CPUFreq driver disables DFLL during suspend and re-enables it during
>>> resume, then looks like the CaR driver hacks around DFLL are not needed.
>>>
>>>>> The DFLL part looks good to me. BTW, change the patch subject to "Add
>>>>> suspend-resume support" seems more appropriate to me.
>>>>>
>>>> To clarify this, the sequences for DFLL use are as follows (assuming
>>>> all
>>>> required DFLL hw configuration has been done)
>>>>
>>>> Switch to DFLL:
>>>> 0) Save current parent and frequency
>>>> 1) Program DFLL to open loop mode
>>>> 2) Enable DFLL
>>>> 3) Change cclk_g parent to DFLL
>>>> For OVR regulator:
>>>> 4) Change PWM output pin from tristate to output
>>>> 5) Enable DFLL PWM output
>>>> For I2C regulator:
>>>> 4) Enable DFLL I2C output
>>>> 6) Program DFLL to closed loop mode
>>>>
>>>> Switch away from DFLL:
>>>> 0) Change cclk_g parent to PLLP so the CPU frequency is ok for any
>>>> vdd_cpu voltage
>>>> 1) Program DFLL to open loop mode
>>>>
> I see during switch away from DFLL (suspend), cclk_g parent is not
> changed to PLLP before changing dfll to open loop mode.
> 
> Will add this ...

The CPUFreq driver switches parent to PLLP during the probe, similar
should be done on suspend.

I'm also wondering if it's always safe to switch to PLLP in the probe.
If CPU is running on a lower freq than PLLP, then some other more
appropriate intermediate parent should be selected.

>>>> For OVR regulator:
>>>> 2) Change PWM output pin from output to tristate: vdd_cpu will go back
>>>>     to hardwired boot voltage.
>>>> 3) Disable DFLL PWM output
>>>>
>>>> For I2C regulator:
>>>> 2) Program vdd_cpu regulator voltage to the boot voltage
>>>> 3) Disable DFLL I2C output
>>>>
>>>> 4) Reprogram parent saved in step 0 of 'Switch to DFLL' to the saved
>>>>     frequency
>>>> 5) Change cclk_g parent to saved parent
>>>> 6) Disable DFLL
>>
>> This is the same sequence currently implemented. But dfll
>> suspend/resume calls are thru Tegra210 clock driver.
>>
>> Dmitry wants to have dfll suspend/resume along with CCLK_G restore to
>> happen from CPUFreq driver pm_ops rather than tegra210 clock driver or
>> tegra dfll driver.
>>
>> Will move it to CPUFreq driver...
>>
> Thanks!
