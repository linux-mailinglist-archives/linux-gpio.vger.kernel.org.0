Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B317D9B1
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 12:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfHAKyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Aug 2019 06:54:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33528 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfHAKyy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Aug 2019 06:54:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so68920175ljg.0;
        Thu, 01 Aug 2019 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oFQKCykke/lf7rDu0GMqPJgCLMHDcVhMm3FNRrZdzNY=;
        b=iTwd5sa8LtWHYdDIuBR2Oop7NofDS05cFB22pFMGOesSXQvhBHIjk0brLQ9uNaSugI
         tdDdW4TktKBGKdIv8UDCaVa0L1ltG+cndFq/19lhsX/5PieMEkoaOBG/Ibmp/Td6gYP9
         MfdN7zgol7bYD7Mc/LXpolws+miLfzk0GjHQo3wgLsLjWYv5lAi91MZFtjzBIV0Ds1qm
         oZ5Z0uIedFdBPCjjFbE3lvSVmW5jC+NBruR4EN/bZkUQ5YeT0a4M1Nvi3EC6E6hjrnd4
         zc9fIirmlVa0iJHbTQ6BKfeyCfJB2bqhf0rs6h6b4KTuePMbqzp3WVo+nzwpCqvYW7ES
         p+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oFQKCykke/lf7rDu0GMqPJgCLMHDcVhMm3FNRrZdzNY=;
        b=HtiJBLgo0WK26YGpH6wyCXEJH1qMN/HpBBqtoT/yvmDaNEwa8Wb6FSPePV0KhwTT+h
         YIU5s6PfUt0nxaLfDYxFmeOsJbUaQmgMqU34IU8+sSx16YFdbM89zPZVF6yr2M+fYay3
         0113RtQUOVKEarhoyNxTa4PySGASon9acunsf2wWmS+7tJxx2DIcmiHUzOh2ZM2xOkSa
         yd0cI9R3tfUjQ+FSc9UO5rTx5xHle2h/Dl62G8BdBerQ/PhuEjfwcQ3wAhP/uaX/MQbC
         B+4F2cPZX4RrSRQcOUQy1HsCd3ikaMrPPkFvkrIT1ZsCSyjVfJekm/iTnIqcxO7K9JcJ
         xFog==
X-Gm-Message-State: APjAAAXMDnBeSrG675d5hazl7yJIfvvbrVjxAmB1t+aCryaANdH68H3I
        MMYNxkQ7lUN9AxMdr2whII1Cfy6u
X-Google-Smtp-Source: APXvYqwNnv/kfNFCfYM5K6oSw//k8zB9afVXkG/lPoRRnsasU+tMtFwESUqpIgBaNIkoN1yVXBbp0w==
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr67981309ljh.148.1564656891433;
        Thu, 01 Aug 2019 03:54:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id l11sm13787058lfc.18.2019.08.01.03.54.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 03:54:50 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3b55a112-42a6-212b-beea-10b64d5341d9@gmail.com>
Date:   Thu, 1 Aug 2019 13:53:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.08.2019 0:04, Sowjanya Komatineni пишет:
> 
> On 7/31/19 4:11 AM, Dmitry Osipenko wrote:
>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>> This patch adds support for saving OSC clock frequency and the
>>> drive-strength during OSC clock init and creates an API to restore
>>> OSC control register value from the saved context.
>>>
>>> This API is invoked by Tegra210 clock driver during system resume
>>> to restore the  OSC clock settings.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>>>   drivers/clk/tegra/clk.h             |  1 +
>>>   2 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c
>>> b/drivers/clk/tegra/clk-tegra-fixed.c
>>> index 8d91b2b191cf..7c6c8abfcde6 100644
>>> --- a/drivers/clk/tegra/clk-tegra-fixed.c
>>> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
>>> @@ -17,6 +17,10 @@
>>>   #define OSC_CTRL            0x50
>>>   #define OSC_CTRL_OSC_FREQ_SHIFT        28
>>>   #define OSC_CTRL_PLL_REF_DIV_SHIFT    26
>>> +#define OSC_CTRL_MASK            (0x3f2 |    \
>>> +                    (0xf << OSC_CTRL_OSC_FREQ_SHIFT))
>>> +
>>> +static u32 osc_ctrl_ctx;
>>>     int __init tegra_osc_clk_init(void __iomem *clk_base, struct
>>> tegra_clk *clks,
>>>                     unsigned long *input_freqs, unsigned int num,
>>> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem
>>> *clk_base, struct tegra_clk *clks,
>>>       unsigned osc_idx;
>>>         val = readl_relaxed(clk_base + OSC_CTRL);
>>> +    osc_ctrl_ctx = val & OSC_CTRL_MASK;
>>>       osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
>>>         if (osc_idx < num)
>>> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk
>>> *tegra_clks)
>>>           *dt_clk = clk;
>>>       }
>>>   }
>>> +
>>> +void tegra_clk_osc_resume(void __iomem *clk_base)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
>>> +    val |= osc_ctrl_ctx;
>>> +    writel_relaxed(val, clk_base + OSC_CTRL);
>> Why a full raw u32 OSC_CTRL value couldn't be simply saved and restored?
> 
> Storing and restoring only required fields to avoid accidental
> misconfiguration.
> 
> OSC_CTRL register has other bits (PLL_REF_DIV) which are configured by
> BR depending on OSC_FREQ and also setting PLL_REF_DIV while PLLS are in
> use is not safe.

I'm looking at the clk-driver sources and see that none of the Tegra
drivers ever change the OSC_CTRL configuration, T30/114 even have
#defines for the OSC_CTRL that are unused.

So, this leads to a question.. does any bootloader really ever change
the OSC_CTRL such that it differs after resume from suspend in
comparison to the value at the time of kernel's booting up?
