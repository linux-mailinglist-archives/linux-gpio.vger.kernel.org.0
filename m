Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D651A6FA00
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 09:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfGVHJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 03:09:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33478 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfGVHJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 03:09:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id x3so25898044lfc.0;
        Mon, 22 Jul 2019 00:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X97ALT2dwZb1nlOyv2R/lJmcMkDzP4lwhhkJyiaa0KQ=;
        b=kKGNxMh0JiZtLsSrrZjhq1MHDfpZvNWNgwictQVgnvSNZ2460NAsOar2+eBIK0cJPh
         C//sfrn4HoV6qEym7pmSHfEqmBLavCOmqw5Tg15QNg++2rrpY2bCwSd+vEw8p9CIijAv
         W7z1OnDunBJfVxJ9D9SIh12UqxAkPNI0EnePuTiANPiYaU6aUZTnw1b9aEPu3WECp9F6
         X+fUC1KPpxNeN/qJDQzhkt8AIF/4UT8R8QIJngJpFMAOFiCKekSnJN1KU6Wn9M1/aQ5p
         hObcuM0dINI8ZvIQV+oHZlYIACXN4kMt0xG1G+KTZen7GSr+hiWakKSLoXkeoQ0Mo0Da
         EBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X97ALT2dwZb1nlOyv2R/lJmcMkDzP4lwhhkJyiaa0KQ=;
        b=P8a84WLFsq3pabgiM7gYZ1grF41M60mm3eR6KYSXDS/r8PrMygnDY7wGpi4L4fYSft
         WF6IlhgNL54y9k/Pp8QSxWGT26vDqosylQcdMgm1gPZXxJ9qM71zLTCaT0kEIaRQvllT
         6XG8pZd5rXbwf5P0O6Xsh3X8mfCRdQgHv88z/Bt4w3eFvUpBZ1Hz6NzEFiy6GLvIWiFX
         dszucApE14+Jt8GCw8LonjTPFHF55OCmjEWjj94Bjdfvi3UWRM/piBxVkI+gF4KG7gtc
         wGSNCRl/HorM/sHqhDoa7vCmd6Hbj2K12Mv5N4M7E7Oqwz/PcqW47xFK/sKe8sBgxlDd
         /FAw==
X-Gm-Message-State: APjAAAWFCW09IRmXqtHe9Ng4emJ8Pl1CHLmXNPHHGqgGmkLDSijZjPSn
        SFPai+ramKspu/c4Wbe/WdmUvuD+
X-Google-Smtp-Source: APXvYqwHr5VnqLHRX48A5TA3ejhuPLGltYRnoKB1MAKSvFTwGtFcVYfu5jiJecndRZaWY4Dd8WnmZQ==
X-Received: by 2002:ac2:5492:: with SMTP id t18mr32201449lfk.41.1563779350248;
        Mon, 22 Jul 2019 00:09:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id g4sm5944696lfb.31.2019.07.22.00.09.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 00:09:09 -0700 (PDT)
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
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
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
 <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
 <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
 <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
 <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5054f178-db27-9286-d123-3e2b2a885717@gmail.com>
Date:   Mon, 22 Jul 2019 10:09:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.07.2019 9:52, Sowjanya Komatineni пишет:
> 
> On 7/21/19 11:10 PM, Dmitry Osipenko wrote:
>> 22.07.2019 1:45, Sowjanya Komatineni пишет:
>>> On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>>
>>>>> All the CAR controller settings are lost on suspend when core
>>>>> power goes off.
>>>>>
>>>>> This patch has implementation for saving and restoring all PLLs
>>>>> and clocks context during system suspend and resume to have the
>>>>> clocks back to same state for normal operation.
>>>>>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    drivers/clk/tegra/clk-tegra210.c | 68
>>>>> ++++++++++++++++++++++++++++++++++++++--
>>>>>    drivers/clk/tegra/clk.c          | 14 +++++++++
>>>>>    drivers/clk/tegra/clk.h          |  1 +
>>>>>    3 files changed, 80 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>>>>> b/drivers/clk/tegra/clk-tegra210.c
>>>>> index 55a88c0824a5..68271873acc1 100644
>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>> @@ -9,6 +9,7 @@
>>>>>    #include <linux/clkdev.h>
>>>>>    #include <linux/of.h>
>>>>>    #include <linux/of_address.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>>    #include <linux/delay.h>
>>>>>    #include <linux/export.h>
>>>>>    #include <linux/mutex.h>
>>>>> @@ -220,11 +221,15 @@
>>>>>    #define CLK_M_DIVISOR_SHIFT 2
>>>>>    #define CLK_M_DIVISOR_MASK 0x3
>>>>>    +#define CLK_MASK_ARM    0x44
>>>>> +#define MISC_CLK_ENB    0x48
>>>>> +
>>>>>    #define RST_DFLL_DVCO 0x2f4
>>>>>    #define DVFS_DFLL_RESET_SHIFT 0
>>>>>      #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>>    #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>      #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>    #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>>>>>        struct tegra_clk_pll_freq_table *fentry;
>>>>>        struct tegra_clk_pll pllu;
>>>>>        u32 reg;
>>>>> +    int ret;
>>>>>          for (fentry = pll_u_freq_table; fentry->input_rate;
>>>>> fentry++) {
>>>>>            if (fentry->input_rate == pll_ref_freq)
>>>>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>>>>        reg |= PLL_ENABLE;
>>>>>        writel(reg, clk_base + PLLU_BASE);
>>>>>    -    readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>>>> -                      reg & PLL_BASE_LOCK, 2, 1000);
>>>>> -    if (!(reg & PLL_BASE_LOCK)) {
>>>>> +    ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>>>> +    if (ret) {
>>>> Why this is needed? Was there a bug?
>>>>
>>> during resume pllu init is needed and to use same terga210_init_pllu,
>>> poll_timeout_atomic can't be used as its ony for atomic context.
>>>
>>> So changed to use wait_for_mask which should work in both cases.
>> Atomic variant could be used from any context, not sure what do you
>> mean. The 'atomic' part only means that function won't cause scheduling
>> and that's it.
> 
> Sorry, replied incorrect. readx_poll_timeout_atomic uses ktime_get() and
> during resume timekeeping suspend/resume happens later than clock
> suspend/resume. So using tegra210_wait_for_mask.
> 
> both timekeeping and clk-tegra210 drivers are registered as syscore but
> not ordered.

Okay, thank you for the clarification.

[snip]
