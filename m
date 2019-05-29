Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D4E2E566
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 21:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfE2Tdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 15:33:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33411 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2Tdw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 15:33:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so3076070lfe.0;
        Wed, 29 May 2019 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X4Z3SqYBRU5CnhsUgVz5EBro7b9YhlHplxl+AsDpg3g=;
        b=AfUUAWvNQ+0SWuHNzMDdoUzKSDFpnqMP5l7v/fYDP2fHKixUiEFn+qk6f8asiWo3hF
         nirIYf7lQ3nntinbNpqC843gd+vo4iAXf9ZEa4nz+4zfhF3yayI/Hsoze88asTtOiDx+
         RdOPu7JoAxYi8TKB8WWPq0SIhORMryA1m51Hp8XDDBIkT/tJw1krbwcAfBZt6iYp//Ne
         bqkw4zPGNRp3nMgmyT7iSSp5dNppRnCb5JJ1nOOoYD0KrK+G++ys/8P8gqaO68aTq05l
         E8P5mqIH4PFR8QamY1j3kJ2tkeRmK+P1yHeLzMM4I0d+UxuinekLyRLZy2vCsZujQScI
         dyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X4Z3SqYBRU5CnhsUgVz5EBro7b9YhlHplxl+AsDpg3g=;
        b=fnSjno6s7gT/v7EOk7TCu/1cKktSU5QYR9UnvM5q1YWarbw8tcSZawNU+56YCnDpvD
         ZJLWyAarIyBEiZqWw4Icf6sPOpwrzjDOiP3L88GgiulbCrMqVdqOhpopvBtKntf9vkqZ
         E62V0xhaiIzomYL+5U4F/U744igdi2UJw2RhmhU9c+rvVTbQCCoyePuEeLJgaN1usSi9
         pWbc9tITtT6hXHrNWNVDp6vye494P9cb+Tu54leJmiZk3z253RA1826paCJZNw8Oh7WP
         eKQ1ZgKpC5ub/dDbAflxoBiLIb+QKKkHOKVyZkjZL7Elob5JEbBG0sZS8LIubHcG805C
         lXIw==
X-Gm-Message-State: APjAAAW51D4EHJmNkqJKvX/iwQUCQpPyfZRFxZC7fXjmafjcuIOhj4lm
        KfsLQKgYAvF1e587N/OtMxx2KVL6
X-Google-Smtp-Source: APXvYqxvssSSQUHtgkxfWoSya6zYLc3xaLhVuLB8bIWAr9w0v0183Exr4x65M1oltwOClE3oMcqJKg==
X-Received: by 2002:a19:4017:: with SMTP id n23mr8725171lfa.112.1559158428625;
        Wed, 29 May 2019 12:33:48 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id p1sm46460ljj.1.2019.05.29.12.33.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 12:33:47 -0700 (PDT)
Subject: Re: [PATCH V2 02/12] pinctrl: tegra: add suspend and resume support
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
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-3-git-send-email-skomatineni@nvidia.com>
 <6273a790-d4b7-c501-3fec-d9816288b139@gmail.com>
 <d9d54f05-b0bf-6e65-9308-45e94454301e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11fe4d9a-6d8e-bc4f-b764-a849571fb6b0@gmail.com>
Date:   Wed, 29 May 2019 22:32:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d9d54f05-b0bf-6e65-9308-45e94454301e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.05.2019 21:14, Sowjanya Komatineni пишет:
> 
> On 5/29/19 8:29 AM, Dmitry Osipenko wrote:
>> 29.05.2019 2:08, Sowjanya Komatineni пишет:
>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>> and registers them to syscore so the pinmux settings are restored
>>> before the devices resume.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 68
>>> +++++++++++++++++++++++++++++++-
>>>   drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>>   drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>>>   drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>>>   drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>>>   drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>>   drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>>>   7 files changed, 75 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> index a5008c066bac..bdc47e62c457 100644
>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>> @@ -28,11 +28,18 @@
>>>   #include <linux/pinctrl/pinmux.h>
>>>   #include <linux/pinctrl/pinconf.h>
>>>   #include <linux/slab.h>
>>> +#include <linux/syscore_ops.h>
>>>     #include "../core.h"
>>>   #include "../pinctrl-utils.h"
>>>   #include "pinctrl-tegra.h"
>>>   +#define EMMC2_PAD_CFGPADCTRL_0            0x1c8
>>> +#define EMMC4_PAD_CFGPADCTRL_0            0x1e0
>>> +#define EMMC_DPD_PARKING            (0x1fff << 14)
>>> +
>>> +static struct tegra_pmx *pmx;
>>> +
>>>   static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>>>   {
>>>       return readl(pmx->regs[bank] + reg);
>>> @@ -629,6 +636,50 @@ static void
>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>       }
>>>   }
>>>   +static int __maybe_unused tegra_pinctrl_suspend(void)
>>> +{
>>> +    u32 *backup_regs = pmx->backup_regs;
>>> +    u32 *regs;
>>> +    int i, j;
>>> +
>>> +    for (i = 0; i < pmx->nbanks; i++) {
>>> +        regs = pmx->regs[i];
>>> +        for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>> +            *backup_regs++ = readl(regs++);
>>> +    }
>>> +
>>> +    return pinctrl_force_sleep(pmx->pctl);
>>> +}
>>> +
>>> +static void __maybe_unused tegra_pinctrl_resume(void)
>>> +{
>>> +    u32 *backup_regs = pmx->backup_regs;
>>> +    u32 *regs;
>>> +    u32 val;
>>> +    int i, j;
>>> +
>>> +    for (i = 0; i < pmx->nbanks; i++) {
>>> +        regs = pmx->regs[i];
>>> +        for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>> +            writel(*backup_regs++, regs++);
>>> +    }
>>> +
>>> +    if (pmx->soc->has_park_padcfg) {
>>> +        val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
>>> +        val &= ~EMMC_DPD_PARKING;
>>> +        pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
>>> +
>>> +        val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
>>> +        val &= ~EMMC_DPD_PARKING;
>>> +        pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
>>> +    }
>>> +}
>>>
>> But the CFGPADCTRL registers are already programmed by restoring the
>> backup_regs and hence the relevant EMMC's are already unparked. Hence
>> why do you need to force-unpark both of the EMMC's? What if EMMC is
>> unpopulated on a board, why do you need to unpark it then?
> 
> PARK bit for EMMC2/EMMC4 (EMMC2_PAD_CFGPADCTRL and EMMC4_PAD_CFGPADCTRL)
> are not part of pinmux.
> 
> They are part of CFGPADCTRL register so pinctrl driver pingroup doesn't
> include these registers.

I'm looking at the tegra210_groups and it clearly has these both
registers as a part of pinctrl setup because the rest of the bits
configure drive of the pads.

From pinctrl-tegra210.c:

#define DRV_PINGROUP_REG_A		0x8d4	/* bank 0 */

DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),

...

0xa9c - 0x8d4 = 0x1c8
0xab4 - 0x8d4 = 0x1e0

Hence the PARK bits are already getting unset by restoring the
backup_regs because the CFGPADCTRL registers are a part of the "bank 0"
registers.

Am I still missing something?

> backup_regs doesn't take care of this and need to handled separately for
> Tegra210.
> 
> 
> During resume we have to clear PARK bit for the pads on Tegra210 and
> this is not related to presence/absence of eMMC on the board.

Okay, thank you for the clarification.

> PAD is parked during LP0 entry to have it in DPD mode and it stays in
> DPD till its cleared by SW on resume.

Yes, this is documented in the public TRM. My main point is that it
looks like the PARK bits are unneedlessly getting unset twice in your
code (and it still looks like that to me).
