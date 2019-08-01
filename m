Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6FE7E269
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 20:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731930AbfHASmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 14:42:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40157 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727198AbfHASmp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 14:42:45 -0400
Received: by mail-lj1-f195.google.com with SMTP id m8so36795822lji.7;
        Thu, 01 Aug 2019 11:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HpAJm7JHif5wEh1Zz0Hmfl8/tOLT+/K6NfvF69ElWR0=;
        b=F+YmTNZNrSMPL8XzF/2MZhiQFdTC1Iq+gdvZ/Wh8RzZND+J7dqAL/AcoAh+lYGXMeN
         hf53jSzKUtnC7VkRmiVSVOxtjc/k7cGyUgVDNZGO9AYwUZtzFLFzB2mNAZP442bDE6//
         oIxcEb3rk8vmcS6Dl3fVgHr7EYWax6ltM0QoD2tDqDiUW/JA7Ho6djgrWWZ+3IcifXKp
         Qv3JLYCWjEPmTHaAvd3EJZ5ZbGGUPiizAtCHIm/b4crNQGUfQaXBMAIacfCCUsCB8U1B
         RTqdw88jy/O5b7rQJ2cTEQARUOvykdt0NeEDQoA08hcKitNIjo1j4imBowW8VRXKQ5Rl
         84hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HpAJm7JHif5wEh1Zz0Hmfl8/tOLT+/K6NfvF69ElWR0=;
        b=Lvi0HYKf10YK2opaLnpHByCdl/0rwoIySLY0m77E5YWW/TG0DWTH6FrPhRrfsYTCEB
         cbTWPelvB3cRol3s+1RgzkE+pRwxj1k/Fv4MCTmizrtJjsrJHOVSWcT7rnMCYqbrA4TD
         U0LWnGb3cDUvOjNzVFAXa73DvgFQbkUVYb+G4BWgXNZsG7fZuZ+nLngmySqqIOU3Y6Z+
         x31iK0kTgunPUW0wMqQ3XFQGGknhRykl4OGCqW8VYeEZqEaJebg2+taFBuVmpxsFY9El
         34HhtfJRyJHfOFwALMW1Ggz+0pUW3hyANvm6JhVRsznMP1eijEUJejZ+qUPI/IBLTaEU
         SvhA==
X-Gm-Message-State: APjAAAVXyuZymHkCXQ/dWQ5NQXyZvmMy03kpw6IDc+1gT7bGNPmAw5s3
        APiso1mRCjfXrxWTTDXYtIxpOsyH
X-Google-Smtp-Source: APXvYqyc1PCaVxJmFQAEk7HeDZylAweK0JgWoEF4iIE2xbLpiEqWoHs2fIqi/JWCxW4bZioMV7RgGw==
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr12872416ljj.0.1564684961383;
        Thu, 01 Aug 2019 11:42:41 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id s19sm14520493lji.38.2019.08.01.11.42.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 11:42:40 -0700 (PDT)
Subject: Re: [PATCH v7 06/20] clk: tegra: Support for OSC context save and
 restore
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-7-git-send-email-skomatineni@nvidia.com>
 <16cca6aa-1034-f38a-49d1-d87b37fb6bbb@gmail.com>
 <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
 <3b55a112-42a6-212b-beea-10b64d5341d9@gmail.com>
 <cd9c5116-4235-758c-7a09-d7185d52b22b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c873d974-f594-d5eb-5c88-c487b8049e3d@gmail.com>
Date:   Thu, 1 Aug 2019 21:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cd9c5116-4235-758c-7a09-d7185d52b22b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.08.2019 21:06, Sowjanya Komatineni пишет:
> 
> On 8/1/19 3:53 AM, Dmitry Osipenko wrote:
>> 01.08.2019 0:04, Sowjanya Komatineni пишет:
>>> On 7/31/19 4:11 AM, Dmitry Osipenko wrote:
>>>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>>>> This patch adds support for saving OSC clock frequency and the
>>>>> drive-strength during OSC clock init and creates an API to restore
>>>>> OSC control register value from the saved context.
>>>>>
>>>>> This API is invoked by Tegra210 clock driver during system resume
>>>>> to restore the  OSC clock settings.
>>>>>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>>>>>    drivers/clk/tegra/clk.h             |  1 +
>>>>>    2 files changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c
>>>>> b/drivers/clk/tegra/clk-tegra-fixed.c
>>>>> index 8d91b2b191cf..7c6c8abfcde6 100644
>>>>> --- a/drivers/clk/tegra/clk-tegra-fixed.c
>>>>> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
>>>>> @@ -17,6 +17,10 @@
>>>>>    #define OSC_CTRL            0x50
>>>>>    #define OSC_CTRL_OSC_FREQ_SHIFT        28
>>>>>    #define OSC_CTRL_PLL_REF_DIV_SHIFT    26
>>>>> +#define OSC_CTRL_MASK            (0x3f2 |    \
>>>>> +                    (0xf << OSC_CTRL_OSC_FREQ_SHIFT))
>>>>> +
>>>>> +static u32 osc_ctrl_ctx;
>>>>>      int __init tegra_osc_clk_init(void __iomem *clk_base, struct
>>>>> tegra_clk *clks,
>>>>>                      unsigned long *input_freqs, unsigned int num,
>>>>> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem
>>>>> *clk_base, struct tegra_clk *clks,
>>>>>        unsigned osc_idx;
>>>>>          val = readl_relaxed(clk_base + OSC_CTRL);
>>>>> +    osc_ctrl_ctx = val & OSC_CTRL_MASK;
>>>>>        osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
>>>>>          if (osc_idx < num)
>>>>> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk
>>>>> *tegra_clks)
>>>>>            *dt_clk = clk;
>>>>>        }
>>>>>    }
>>>>> +
>>>>> +void tegra_clk_osc_resume(void __iomem *clk_base)
>>>>> +{
>>>>> +    u32 val;
>>>>> +
>>>>> +    val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
>>>>> +    val |= osc_ctrl_ctx;
>>>>> +    writel_relaxed(val, clk_base + OSC_CTRL);
>>>> Why a full raw u32 OSC_CTRL value couldn't be simply saved and
>>>> restored?
>>> Storing and restoring only required fields to avoid accidental
>>> misconfiguration.
>>>
>>> OSC_CTRL register has other bits (PLL_REF_DIV) which are configured by
>>> BR depending on OSC_FREQ and also setting PLL_REF_DIV while PLLS are in
>>> use is not safe.
>> I'm looking at the clk-driver sources and see that none of the Tegra
>> drivers ever change the OSC_CTRL configuration, T30/114 even have
>> #defines for the OSC_CTRL that are unused.
>>
>> So, this leads to a question.. does any bootloader really ever change
>> the OSC_CTRL such that it differs after resume from suspend in
>> comparison to the value at the time of kernel's booting up?
> 
> For Tegra210, bootloader programs OSC_CTRL register for drivestrength
> programming.
> 
> These settings need to be restored to the same on SC7 exit as they gets
> reset during SC7 entry.

Okay, thank you for the clarification.
