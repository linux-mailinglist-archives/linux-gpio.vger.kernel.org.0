Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2789E6FA5E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 09:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727640AbfGVHaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 03:30:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:47052 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfGVHaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 03:30:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so36603430ljg.13;
        Mon, 22 Jul 2019 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Enm8v4RAgR83Be49/cqG60/zTx7s58tZjunbxgRDe3c=;
        b=jn6VsPoUSljOj1bsmFvw0R/zMujom/lErjknUpMcbJGFvHSz6bC1fUY8aV0ulV27/z
         s2PLYvwgjEt/OETRQvGXf0WtGDWM81gmB8VvwLRx2yP07lNBU8Qyz87jIQog39pQ2hf7
         NkFUXSFEoL+f65WqmQy1cljk8/lJd4tdGJkIa0u55tPG0ZrZrqCBiMxuJ1mrMIOU1OYQ
         qNluo6bHwGckvqHDDTYTydW07WNwa0LyZx5DPC/GhXcHsYjN0XWEmSBTJE7Xobk/WOUW
         fFTfr8+hhAip7kfEMC+TZU10B3xHpUyIhqfpNbtDsQhurPmv9TCkrN+WixxaYRIo/Vcw
         QnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Enm8v4RAgR83Be49/cqG60/zTx7s58tZjunbxgRDe3c=;
        b=KQ9F1pJr6MrGmnYfl4gfrxRNQz71foWGuYYOdxisS4MS06QqCwshdBHETdgSWP3ncj
         aZVWr7euwK/hu2LVW4VAKFbMkjvFxiosPnXwBPchjfizptZdodAklpSwNlXgsqndANiO
         +hdPeSvLquEBGdwP76b3syPVm6xh4ZyhDDUyBWRa2ju0FnAYrVvExShN2Q1zNdNQpCA7
         Uko/ilb2ITnIiHvzaqu6PYgayIe8fhND4nw8eXmP2Qe8cVUAAcD2Q+zAltW+pG/nEGd1
         SS59ONbPH1RvQmpMUSLVmWkVLWGbEcyjL6CfZwwKuBLFkxPY5e5KkaMhi5TMxNB196wy
         olsA==
X-Gm-Message-State: APjAAAXEwWLGVUY8Crs292c7NlbYYmow/rQi6cVPNF+u/mp28sgAiZtA
        R+QlUjE936pqETxYiH5HQ85cPDic
X-Google-Smtp-Source: APXvYqwhU0rTU2TghFxry+PbjBfUtQeoo188WCJHNFHmbHZ+OMO/KC5GFXnt/5vrA4vobm2GQsMzig==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr13172118lji.188.1563780603912;
        Mon, 22 Jul 2019 00:30:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id f24sm6624262lfk.72.2019.07.22.00.30.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 00:30:03 -0700 (PDT)
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
 <07897688-2a02-b7a7-7048-72c4078d26a2@gmail.com>
 <90e1a90b-1d33-a5db-9af8-dc5c5d45b65f@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc6403e6-0022-f505-8864-70bc047207c9@gmail.com>
Date:   Mon, 22 Jul 2019 10:30:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <90e1a90b-1d33-a5db-9af8-dc5c5d45b65f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 10:24, Sowjanya Komatineni пишет:
> 
> On 7/22/19 12:17 AM, Dmitry Osipenko wrote:
>> 22.07.2019 10:12, Sowjanya Komatineni пишет:
>>> On 7/21/19 11:32 PM, Dmitry Osipenko wrote:
>>>> 22.07.2019 6:17, Sowjanya Komatineni пишет:
>>>>> On 7/21/19 3:39 PM, Sowjanya Komatineni wrote:
>>>>>> On 7/21/19 2:16 PM, Dmitry Osipenko wrote:
>>>>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>>>>> This patch has a fix to enable PLLP branches to CPU before changing
>>>>>>>> the CPU clusters clock source to PLLP for Gen5 Super clock.
>>>>>>>>
>>>>>>>> During system suspend entry and exit, CPU source will be switched
>>>>>>>> to PLLP and this needs PLLP branches to be enabled to CPU prior to
>>>>>>>> the switch.
>>>>>>>>
>>>>>>>> On system resume, warmboot code enables PLLP branches to CPU and
>>>>>>>> powers up the CPU with PLLP clock source.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> ---
>>>>>>>>     drivers/clk/tegra/clk-super.c            | 11 +++++++++++
>>>>>>>>     drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
>>>>>>>>     drivers/clk/tegra/clk.h                  |  4 ++++
>>>>>>>>     3 files changed, 17 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/clk/tegra/clk-super.c
>>>>>>>> b/drivers/clk/tegra/clk-super.c
>>>>>>>> index 39ef31b46df5..d73c587e4853 100644
>>>>>>>> --- a/drivers/clk/tegra/clk-super.c
>>>>>>>> +++ b/drivers/clk/tegra/clk-super.c
>>>>>>>> @@ -28,6 +28,9 @@
>>>>>>>>     #define super_state_to_src_shift(m, s) ((m->width * s))
>>>>>>>>     #define super_state_to_src_mask(m) (((1 << m->width) - 1))
>>>>>>>>     +#define CCLK_SRC_PLLP_OUT0 4
>>>>>>>> +#define CCLK_SRC_PLLP_OUT4 5
>>>>>>>> +
>>>>>>>>     static u8 clk_super_get_parent(struct clk_hw *hw)
>>>>>>>>     {
>>>>>>>>         struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
>>>>>>>> @@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw
>>>>>>>> *hw, u8 index)
>>>>>>>>             if (index == mux->div2_index)
>>>>>>>>                 index = mux->pllx_index;
>>>>>>>>         }
>>>>>>>> +
>>>>>>>> +    /*
>>>>>>>> +     * Enable PLLP branches to CPU before selecting PLLP source
>>>>>>>> +     */
>>>>>>>> +    if ((mux->flags & TEGRA_CPU_CLK) &&
>>>>>>>> +        ((index == CCLK_SRC_PLLP_OUT0) || (index ==
>>>>>>>> CCLK_SRC_PLLP_OUT4)))
>>>>>>>> +        tegra_clk_set_pllp_out_cpu(true);
>>>>>>> Should somewhere here be tegra_clk_set_pllp_out_cpu(false) when
>>>>>>> switching from PLLP?
>>>>>> PLLP may be used for other CPU clusters.
>>>>> Though to avoid flag and check needed to make sure other CPU is not
>>>>> using before disabling PLLP branch to CPU.
>>>>>
>>>>> But leaving it enabled shouldn't impact much as clock source mux is
>>>>> after this in design anyway.
>>>>>
>>>>> But can add as well if its clear that way.
>>>> The TRM doc says "The CPU subsystem supports a switch-cluster mode
>>>> meaning that only one of the clusters can be active at any given time".
>>>>
>>>> Given that cluster-switching isn't supported in upstream, I don't think
>>>> that you need to care about the other cluster at all, at least for now.
>>>>
>>>> The cluster-switching implementation in upstream is very complicated
>>>> because it requires a special "hotplugging" CPU governor, which
>>>> apparently no other platform needs.
>>>>
>>>> [snip]
>>> This patch enables PLLP branches to CPU for both CPUG & CPULP if they
>>> use PLLP source.
>>>
>>> So, to disable PLLP out CPU when not in use, we still need check for
>>> other cluster because during resume both LP CPU and G CPU gets restored.
>>> CPUG runs from PLLP on resume and when it does super clk restore for LP
>>> CPU which may not be using PLLP, but as both uses same super mux
>>> clk_ops, without check (for PLLP branch to CPU in use) disabling PLLP
>>> branch to CPU during LP CPU restore looses clock to CPU G as well which
>>> is running from PLLP.
>>>
>>> Will add check and disable PLLP if not in use in next version... this
>>> need extern flag as well to mark PLLP usage with either of CPU's.
>> I still don't understand why do you need to care about LP cluster at
>> all, given that it's always in a power-gated state.
> 
> cclk_lp is registered thru super clk mux which uses same clk_ops as cclk_g.
> 
> during restore, cclk_lp also gets restored. So both cclk_lp & cclk_g
> goes thru same clk_ops
> 
> In this patch, I marked super flags with TEGRA_CPU_CLK for both cclk_lp
> & cclk_g.
> 
> So when cclk_lp restore happens, it goes thru same set_parent clk_ops
> and as its source is not PLLP, it tries to disable PLLP_OUT_CPU if its
> disabled without adding check for PLLP being in use by other cluster.

Ah, okay.

> So either I should not mark cclk_lp as TEGRA_CPU_CLK and mark cclk_g
> only as TEGRA_CPU_CLK so PLLP out to CPU can be disabled without check
> if its not the source.
> 
> OR
> 
> With TEGRA_CPU_CLK used for both cclk_lp & cclk_g, need to add check if
> PLLP is in use so during cclk_lp restore it doesnt disable PLLP out to CPU.
> 
> 
> To simplify without check, will just mark cclk_g super clock flag only
> as TEGRA_CPU_CLK so PLLP_OUT_CPU enable or disable happens only for CPUG

Sounds good. Then please add a brief comment to the CPULP, telling why
it misses the flag, for the record.
