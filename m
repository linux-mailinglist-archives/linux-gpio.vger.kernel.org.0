Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D344F2E669
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 22:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfE2UrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 16:47:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44759 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfE2UrL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 16:47:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id e13so3847018ljl.11;
        Wed, 29 May 2019 13:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yV8ZGOSAaBTmrYL8Q6K1zkAiI1xSYAEEQ+zw5Yv+xjY=;
        b=fB4e6ou3vZGC4IjFzCK2pfhbudjn543TYZG/M9MQikQQnRsc32NLFrgf8LWhnkHnoV
         9Q3MilbtLygCsacbQQ4mq4OMgj4OpnACY/NUuDj1/Yeyizmjm7sQ/+sQsvcWMBto+KA2
         7XTE0/GMVly8dUQZ8jinkBLQ2L+yEX4qzpIuo2q6MKJlKBKoVUHgA4Zc3ukj3TPaNzdG
         9cl8zBt7Hakqflarsfd+Be6ydq9HN+0gC0OO5bnTK2ISmRgSjmjytFtIyeSrpIfq2BnZ
         8Ag0H49G9dwakYF+SEyMOkW1h7VcmV0sozR/bpDC4pKcND2CHOSLNRidfznKgQB2y0YW
         qbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yV8ZGOSAaBTmrYL8Q6K1zkAiI1xSYAEEQ+zw5Yv+xjY=;
        b=QXjNlqiqShzjuXv1vv8I9k1MNlV7ng2fU0VD1xkIcSDm5sTaopkXyMgwn2UpNvFlJg
         mtGZ5MbA+cMERdQkVgzDFH502ftZtUEQyqnROHDsXrVSH/XNn9iVdJoaGz5KSiICRgM0
         yWpWOZe6j/PL1sjRuO1TdqsGCO6Ym4A0bkF8Y5wgnnXVDYT4NqlhYtfbn3qDjk5BuRs9
         IhfMrAp+mYx4tSzPzwI0H/DP8Rvkykqu1505GrBmQ8/oULs0RJYbqlN+xmdh+TeHr/fz
         ZAKaZLgFT3TuN1xojLZ6hh2IkmoKnTmQsrI6BNeqFhKIDv6J7pfLUuctCX1DLlvjp7wW
         ga4g==
X-Gm-Message-State: APjAAAWSUpUeYlT+1wPoD6aPccQVsWbz9B1uSp625ehgDC+zeZhKaMya
        BXHXozWUuVMFZuNTdp9V451W0pxe
X-Google-Smtp-Source: APXvYqzXbubS9THAIk8gBZRL3Mu/OmSbOO79qThoYZT8S9c9WpMjDzfH+By/IJ5tRboBQfMux2LHRA==
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr16730777ljs.214.1559162828243;
        Wed, 29 May 2019 13:47:08 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id e12sm110511lfb.70.2019.05.29.13.47.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 13:47:07 -0700 (PDT)
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
 <11fe4d9a-6d8e-bc4f-b764-a849571fb6b0@gmail.com>
 <0f087659-cdde-9f89-55a2-d399ee539431@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <34480b14-48da-2745-086d-6a8900c5a049@gmail.com>
Date:   Wed, 29 May 2019 23:47:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0f087659-cdde-9f89-55a2-d399ee539431@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.05.2019 23:11, Sowjanya Komatineni пишет:
> 
> On 5/29/19 12:32 PM, Dmitry Osipenko wrote:
>> 29.05.2019 21:14, Sowjanya Komatineni пишет:
>>> On 5/29/19 8:29 AM, Dmitry Osipenko wrote:
>>>> 29.05.2019 2:08, Sowjanya Komatineni пишет:
>>>>> This patch adds suspend and resume support for Tegra pinctrl driver
>>>>> and registers them to syscore so the pinmux settings are restored
>>>>> before the devices resume.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra.c    | 68
>>>>> +++++++++++++++++++++++++++++++-
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra.h    |  3 ++
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra210.c |  1 +
>>>>>    drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>>>>>    7 files changed, 75 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> index a5008c066bac..bdc47e62c457 100644
>>>>> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
>>>>> @@ -28,11 +28,18 @@
>>>>>    #include <linux/pinctrl/pinmux.h>
>>>>>    #include <linux/pinctrl/pinconf.h>
>>>>>    #include <linux/slab.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>>      #include "../core.h"
>>>>>    #include "../pinctrl-utils.h"
>>>>>    #include "pinctrl-tegra.h"
>>>>>    +#define EMMC2_PAD_CFGPADCTRL_0            0x1c8
>>>>> +#define EMMC4_PAD_CFGPADCTRL_0            0x1e0
>>>>> +#define EMMC_DPD_PARKING            (0x1fff << 14)
>>>>> +
>>>>> +static struct tegra_pmx *pmx;
>>>>> +
>>>>>    static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32
>>>>> reg)
>>>>>    {
>>>>>        return readl(pmx->regs[bank] + reg);
>>>>> @@ -629,6 +636,50 @@ static void
>>>>> tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>>>>>        }
>>>>>    }
>>>>>    +static int __maybe_unused tegra_pinctrl_suspend(void)
>>>>> +{
>>>>> +    u32 *backup_regs = pmx->backup_regs;
>>>>> +    u32 *regs;
>>>>> +    int i, j;
>>>>> +
>>>>> +    for (i = 0; i < pmx->nbanks; i++) {
>>>>> +        regs = pmx->regs[i];
>>>>> +        for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>>>> +            *backup_regs++ = readl(regs++);
>>>>> +    }
>>>>> +
>>>>> +    return pinctrl_force_sleep(pmx->pctl);
>>>>> +}
>>>>> +
>>>>> +static void __maybe_unused tegra_pinctrl_resume(void)
>>>>> +{
>>>>> +    u32 *backup_regs = pmx->backup_regs;
>>>>> +    u32 *regs;
>>>>> +    u32 val;
>>>>> +    int i, j;
>>>>> +
>>>>> +    for (i = 0; i < pmx->nbanks; i++) {
>>>>> +        regs = pmx->regs[i];
>>>>> +        for (j = 0; j < pmx->reg_bank_size[i] / 4; j++)
>>>>> +            writel(*backup_regs++, regs++);
>>>>> +    }
>>>>> +
>>>>> +    if (pmx->soc->has_park_padcfg) {
>>>>> +        val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
>>>>> +        val &= ~EMMC_DPD_PARKING;
>>>>> +        pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
>>>>> +
>>>>> +        val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
>>>>> +        val &= ~EMMC_DPD_PARKING;
>>>>> +        pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
>>>>> +    }
>>>>> +}
>>>>>
>>>> But the CFGPADCTRL registers are already programmed by restoring the
>>>> backup_regs and hence the relevant EMMC's are already unparked. Hence
>>>> why do you need to force-unpark both of the EMMC's? What if EMMC is
>>>> unpopulated on a board, why do you need to unpark it then?
>>> PARK bit for EMMC2/EMMC4 (EMMC2_PAD_CFGPADCTRL and EMMC4_PAD_CFGPADCTRL)
>>> are not part of pinmux.
>>>
>>> They are part of CFGPADCTRL register so pinctrl driver pingroup doesn't
>>> include these registers.
>> I'm looking at the tegra210_groups and it clearly has these both
>> registers as a part of pinctrl setup because the rest of the bits
>> configure drive of the pads.
>>
>>  From pinctrl-tegra210.c:
>>
>> #define DRV_PINGROUP_REG_A        0x8d4    /* bank 0 */
>>
>> DRV_PINGROUP(sdmmc2, 0xa9c, 2,  6,  8,  6,  28, 2,  30, 2),
>> DRV_PINGROUP(sdmmc4, 0xab4, 2,  6,  8,  6,  28, 2,  30, 2),
>>
>> ...
>>
>> 0xa9c - 0x8d4 = 0x1c8
>> 0xab4 - 0x8d4 = 0x1e0
>>
>> Hence the PARK bits are already getting unset by restoring the
>> backup_regs because the CFGPADCTRL registers are a part of the "bank 0"
>> registers.
>>
>> Am I still missing something?
> 
> DRV_PINGROUP parked_bit is -1 and will not be programmed so store and
> restore will not take care of it.
> 
> Also EMMC PADCFG is the only padcfg register which has parked bit and
> for other IO pads its part of pinmux

You're storing raw values of all of the PINCTRL registers and then
restoring the raw values (if I'm not misreading that part on the patch),
it's absolutely meaningless that DRV_PINGROUP doesn't define the PARK bits.

In a result, the backup_regs array contains raw CFGPADCTRL value with
the PARK bits being unset on store, that value is written out on the
restore as-is and hence the PARK bits are getting unset as well.

And why DRV_PINGROUP misses PARK bits for the EMMC's? Looks like a
driver's drawback that need to be addressed.
