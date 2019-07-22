Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C26D26FA28
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 09:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfGVHR0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 03:17:26 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42697 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfGVHR0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 03:17:26 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so25841308lfb.9;
        Mon, 22 Jul 2019 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z0WGnZO7/Z4erbEFJXtlAz4VpQQFxoA/ZnqQf2BM+eg=;
        b=Fd8yseA9gCqzx7yaMON3nloZwpWND5wPXO/aEqDkPh5zM83u5LoczvrTwniRAsukLT
         C2l2jGfpBvJI8YBGy37OT2q6x/gAesw/ozvz8VLJpI1bwlko9mbVyDHvcJKrPtc11S0I
         v70I2kUtE0Xcg0w8MW13A10vU1tqKHdLfkTP2sIjoPkWCRk1VByKY3i2i2JJyIhfd/0p
         7oB7+rob0E3V9n2rdhXpMSOZatBG9J6/OxLcR41m3u9nSd4L7725tRU5CnFeEs6pMs9V
         0RtmO3xvI6XO3ETBYWfgEGipnjJ8sbdEYdR6ZJmAqwocH7u18gNAJWbPbGMj9vlrT2kl
         sJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z0WGnZO7/Z4erbEFJXtlAz4VpQQFxoA/ZnqQf2BM+eg=;
        b=AtuHhJlTjngYNWuyYU/DfmGHL0OwCMMszCgpXIlvSvP6seiDcrZkEF29DjAtLzZvSS
         O2t0QpzXMd6BMZcX4gQVX9xrezzyUS4ZUvt2WoiAnzuqunUtRNENWTDVLvWpA9geHVHY
         bQF9Yk8Fvn09vj9ESQTvyCimrk/RJQi6JwyicuA56ZGZl8Ko1mIJWZRbM89KhgvFy/+d
         uCFzESSiI8qEJqTbL5pLV/TFcMHzWqZ3KQMWFwwWZeRMkv242u/5SbgOsN/tItHICHEv
         4ynlkVJapy7Thgq4E+MKMloZ+nn3dcRcX5iBFKoXLyuCRdbYSt3L1fFc76/3fWEGk9TO
         gWaw==
X-Gm-Message-State: APjAAAUFgjGEjDkB3jxFw3Plt9lPkq+JgB7qQa14kHt3+KnDpbkTCjGR
        ydHnFbL1z5MLVsWqYx9rr4k7Q+2T
X-Google-Smtp-Source: APXvYqymW5DVgDWAMbJNr3hkhaEfXmSrFlU4NpYDViBae5vFGIW2EVKxfWCOFnUZKoZz2d1lPijPOg==
X-Received: by 2002:a19:f819:: with SMTP id a25mr32445291lff.183.1563779843135;
        Mon, 22 Jul 2019 00:17:23 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id h22sm7434994ljj.105.2019.07.22.00.17.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 00:17:22 -0700 (PDT)
Subject: Re: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP
 branches to CPU
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
 <0c86cd7f-81b5-40c5-6f1e-796e8f13b522@gmail.com>
 <042f4b43-7b9c-533d-2548-d903b34363da@nvidia.com>
 <7933a83c-3208-b551-d41d-70285ae528e3@nvidia.com>
 <f6ac50af-c3a5-1fef-2e0d-a9ecadeb2495@gmail.com>
 <d9bbe208-6cd3-6a28-3e43-fdd566699b1d@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07897688-2a02-b7a7-7048-72c4078d26a2@gmail.com>
Date:   Mon, 22 Jul 2019 10:17:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d9bbe208-6cd3-6a28-3e43-fdd566699b1d@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 10:12, Sowjanya Komatineni пишет:
> 
> On 7/21/19 11:32 PM, Dmitry Osipenko wrote:
>> 22.07.2019 6:17, Sowjanya Komatineni пишет:
>>> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>>>
>>>>>> During system suspend entry and exit, CPU source will be switched
>>>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>>>> the switch.
>>>>>>
>>>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>>>> powers up the CPU with PLLP clock source.
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>    drivers/clk/tegra/clk-super.c            | 11 +++++++++++
>>>>>>    drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
>>>>>>    drivers/clk/tegra/clk.h                  |  4 ++++
>>>>>>    3 files changed, 17 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>>>> b/drivers/clk/tegra/clk-super.c
>>>>>> index 39ef31b46df5..d73c587e4853 100644
>>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>>> @@ -28,6 +28,9 @@
>>>>>>    #define super_state_to_src_shift(m, s) ((m->width * s))
>>>>>>    #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>>>>>    +#define CCLK_SRC_PLLP_OUT0 4
>>>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>>>> +
>>>>>>    static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>>>    {
>>>>>>        struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
>>>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>>>> *hw, u8 index)
>>>>>>            if (index == mux->div2_index)
>>>>>>                index = mux->pllx_index;
>>>>>>        }
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Enable PLLP branches to CPU before selecting PLLP source
>>>>>> +     */
>>>>>> +    if ((mux->flags & TEGRA_CPU_CLK) &&
>>>>>> +        ((index == CCLK_SRC_PLLP_OUT0) || (index ==
>>>>>> CCLK_SRC_PLLP_OUT4)))
>>>>>> +        tegra_clk_set_pllp_out_cpu(true);
>>>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>>>> switching from PLLP?
>>>> PLLP may be used for other CPU clusters.
>>> Though to avoid flag and check needed to make sure other CPU is not
>>> using before disabling PLLP branch to CPU.
>>>
>>> But leaving it enabled shouldn't impact much as clock source mux is
>>> after this in design anyway.
>>>
>>> But can add as well if its clear that way.
>> The TRM doc says "The CPU subsystem supports a switch-cluster mode
>> meaning that only one of the clusters can be active at any given time".
>>
>> Given that cluster-switching isn't supported in upstream, I don't think
>> that you need to care about the other cluster at all, at least for now.
>>
>> The cluster-switching implementation in upstream is very complicated
>> because it requires a special "hotplugging" CPU governor, which
>> apparently no other platform needs.
>>
>> [snip]
> 
> This patch enables PLLP branches to CPU for both CPUG & CPULP if they
> use PLLP source.
> 
> So, to disable PLLP out CPU when not in use, we still need check for
> other cluster because during resume both LP CPU and G CPU gets restored.
> CPUG runs from PLLP on resume and when it does super clk restore for LP
> CPU which may not be using PLLP, but as both uses same super mux
> clk_ops, without check (for PLLP branch to CPU in use) disabling PLLP
> branch to CPU during LP CPU restore looses clock to CPU G as well which
> is running from PLLP.
> 
> Will add check and disable PLLP if not in use in next version... this
> need extern flag as well to mark PLLP usage with either of CPU's.

I still don't understand why do you need to care about LP cluster at
all, given that it's always in a power-gated state.
