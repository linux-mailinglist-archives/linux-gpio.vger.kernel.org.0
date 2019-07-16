Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F49D6AB36
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 17:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfGPPAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 11:00:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37847 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfGPPAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 11:00:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id z28so20344394ljn.4;
        Tue, 16 Jul 2019 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fDXHXukmqVU81soTlNeE/Qat/McVs867H+Cn2IJoFDs=;
        b=gecOJZVM4OcQiUpOqailnBHkjfBooumMjKmB78rHVsli1K/IWvzEKnY50M41bR+SXX
         BCvzNBbThA94NL0bmD7VS1YZcDSNR7F4eR6EwO5Ytm+/PaHipOYH9bhGnUNO20xEf09P
         gbCpeGoNHnfxjsyUqSVQuQn8ZE+gAaBtnNEScCcfJXx24GWI7do2c1jeqso8aszTrEgS
         y33b0lPbS/m13EXbER7EKj6SR0Qwa4OMKOdeMXllhiZ5NJ7iQbU1FK5xxh0vUBqxy+gm
         rSaDHoRLZhyPwYBMm/UcaUZPoQfyt69jkOUYK1E5U4dw+6jdqrC6tYAb0CiAa9yegg4C
         SEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fDXHXukmqVU81soTlNeE/Qat/McVs867H+Cn2IJoFDs=;
        b=EB/GDdpD3Q0WjiSmmYIvALyHRB/60qk0JM8cjoAxtLk3r7cmWI0S4T5MKO5hKuLyDK
         NUBzwy1nJli+2wXjqRyYvquxg8h7c5/hAHo6H2HxsPVUDnLlLM5ZSorFgHw5OdWZmPDy
         ROAr/I7KPz4AsVDX/dvsC8i1NwKselM9FF1onbYzdHRHYhpjNzi75grPebAnx9Eh0s6r
         NSxnc8Uew07Oa3OFjK3Zd5uBdLK3/riJibyZGNJGiW97jas5n8Y+rkFw4naBZsdiiDue
         xw068xiNrI+e664zwzIHkuWWtdd9gTRiGZ4hMqLUA+XN1MPOaf2WIBOGbtNFlewl9PUJ
         qHDw==
X-Gm-Message-State: APjAAAUyEBmp7jk9p5nt+jVxwa4f8N7j9t2yu9gufYS8GQ9IbM5q2Qv+
        6asU4zOGfHigZpA3zkk7aBibA0qe
X-Google-Smtp-Source: APXvYqybnR2SPB8V1NG5Xyi+7sFdN4IOM0FsCmdXSXTqxyloVOhDBpmLe2S2l84NFhB//Gx4I7vK0w==
X-Received: by 2002:a2e:b1c1:: with SMTP id e1mr17732360lja.228.1563289250440;
        Tue, 16 Jul 2019 08:00:50 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id q4sm4210952lje.99.2019.07.16.08.00.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 08:00:49 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
Date:   Tue, 16 Jul 2019 18:00:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

16.07.2019 11:06, Peter De Schrijver пишет:
> On Tue, Jul 16, 2019 at 03:24:26PM +0800, Joseph Lo wrote:
>>> OK, Will add to CPUFreq driver...
>>>>
>>>> The other thing that also need attention is that T124 CPUFreq driver
>>>> implicitly relies on DFLL driver to be probed first, which is icky.
>>>>
>>> Should I add check for successful dfll clk register explicitly in
>>> CPUFreq driver probe and defer till dfll clk registers?

Probably you should use the "device links". See [1][2] for the example.

[1]
https://elixir.bootlin.com/linux/v5.2.1/source/drivers/gpu/drm/tegra/dc.c#L2383

[2] https://www.kernel.org/doc/html/latest/driver-api/device_link.html

Return EPROBE_DEFER instead of EINVAL if device_link_add() fails. And
use of_find_device_by_node() to get the DFLL's device, see [3].

[3]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/devfreq/tegra20-devfreq.c#n100

>> Sorry, I didn't follow the mail thread. Just regarding the DFLL part.
>>
>> As you know it, the DFLL clock is one of the CPU clock sources and
>> integrated with DVFS control logic with the regulator. We will not switch
>> CPU to other clock sources once we switched to DFLL. Because the CPU has
>> been regulated by the DFLL HW with the DVFS table (CVB or OPP table you see
>> in the driver.). We shouldn't reparent it to other sources with unknew
>> freq/volt pair. That's not guaranteed to work. We allow switching to
>> open-loop mode but different sources.

Okay, then the CPUFreq driver will have to enforce DFLL freq to PLLP's
rate before switching to PLLP in order to have a proper CPU voltage.

>> And I don't exactly understand why we need to switch to PLLP in CPU idle
>> driver. Just keep it on CL-DVFS mode all the time.
>>
>> In SC7 entry, the dfll suspend function moves it the open-loop mode. That's
>> all. The sc7-entryfirmware will handle the rest of the sequence to turn off
>> the CPU power.
>>
>> In SC7 resume, the warmboot code will handle the sequence to turn on
>> regulator and power up the CPU cluster. And leave it on PLL_P. After
>> resuming to the kernel, we re-init DFLL, restore the CPU clock policy (CPU
>> runs on DFLL open-loop mode) and then moving to close-loop mode.

The DFLL is re-inited after switching CCLK to DFLL parent during of the
early clocks-state restoring by CaR driver. Hence instead of having odd
hacks in the CaR driver, it is much nicer to have a proper
suspend-resume sequencing of the device drivers. In this case CPUFreq
driver is the driver that enables DFLL and switches CPU to that clock
source, which means that this driver is also should be responsible for
management of the DFLL's state during of suspend/resume process. If
CPUFreq driver disables DFLL during suspend and re-enables it during
resume, then looks like the CaR driver hacks around DFLL are not needed.

>> The DFLL part looks good to me. BTW, change the patch subject to "Add
>> suspend-resume support" seems more appropriate to me.
>>
> 
> To clarify this, the sequences for DFLL use are as follows (assuming all
> required DFLL hw configuration has been done)
> 
> Switch to DFLL:
> 0) Save current parent and frequency
> 1) Program DFLL to open loop mode
> 2) Enable DFLL
> 3) Change cclk_g parent to DFLL
> For OVR regulator:
> 4) Change PWM output pin from tristate to output
> 5) Enable DFLL PWM output
> For I2C regulator:
> 4) Enable DFLL I2C output
> 6) Program DFLL to closed loop mode
> 
> Switch away from DFLL:
> 0) Change cclk_g parent to PLLP so the CPU frequency is ok for any vdd_cpu voltage
> 1) Program DFLL to open loop mode
> 
> For OVR regulator:
> 2) Change PWM output pin from output to tristate: vdd_cpu will go back
>    to hardwired boot voltage.
> 3) Disable DFLL PWM output
> 
> For I2C regulator:
> 2) Program vdd_cpu regulator voltage to the boot voltage
> 3) Disable DFLL I2C output
> 
> 4) Reprogram parent saved in step 0 of 'Switch to DFLL' to the saved
>    frequency
> 5) Change cclk_g parent to saved parent
> 6) Disable DFLL

Thanks!
