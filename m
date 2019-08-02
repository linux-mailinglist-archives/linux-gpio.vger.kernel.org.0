Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEDC801AA
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 22:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbfHBUVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 16:21:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41825 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732050AbfHBUU7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 16:20:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so73978639ljg.8;
        Fri, 02 Aug 2019 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JHnDasQIMHJfNuWtQqs5LowtIG2fXV2UYnXU9RApA7g=;
        b=dwZh/G42rwDgLdLl9WVqKWsmTKqSGDEbPPBFtctq7ZlB41qUPYlkvOOZcPPLaGFQrm
         qDSZ973BYhZWoXtnVYswKb5XCA0XNsnsnCWeheIpBXMrJRr5vDekNellH/YPLk9xe67P
         ZFCUEj81RtWDV+JaRagSkWB7H4qs+RhyKeqLj5vSIz7VWnn6DbcSrR8doWXcIpDqVb7l
         N0I0YmjTO1UhTn1YkwSg5zOuE6OD9X/g53uvelorcTJxBAssqp1wtRF8/MU5zVDJRRwm
         wgGf4Q1os2FrmfIByPblUPt2I3JUA70q1Gbradec8PhGfibWoDkGclJVDvpyKj79jhYY
         FQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JHnDasQIMHJfNuWtQqs5LowtIG2fXV2UYnXU9RApA7g=;
        b=pmrWfHzPajMVTO/VC7vSZ6Yo/+IZrbF0RsejLNjwh2j8hcqA1OnpE4zhbOcOfSsPO7
         /zrTgyMl2z5w/k9A8vkWO/uYs83xgPl/QGZFo/VSvoYqLPFozTuQEMoyKjaslyacWMWg
         DTd60acMLFBKqv7H6LkhX4nDQznQ4lp6cEE7M7XOVylrC/bFKRAagYjRWQxLTZHbVq3j
         7Mx7GuBoRPmDQhBuASA3AWzdq3SyOwp4fyEKXUnwBKOUr3N0m830octgXaAzMmZwuKUs
         0JO1xlucRho8wi1OhlYyqdSZxZKre1qiCqIVRBz03+AA7WqDh2y1EDi2QSLU1rDlG4GY
         z8dw==
X-Gm-Message-State: APjAAAUJXoovEoo2fcWXqkNRD32bJQrfIfGmy0pH/bz0EkGOQRdkyRY1
        fDOUXQEDH2iqmEwYxKbk+IQu+uJu
X-Google-Smtp-Source: APXvYqz5eUT5Dkx+w1RBzK2lsPX5zZ4AXZ7DZKK4Hlf/RFkIq0EyFIyqyPKLWXJB+jsP/3jOSB9kMw==
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr24820139ljk.4.1564777256963;
        Fri, 02 Aug 2019 13:20:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id n24sm15478055ljc.25.2019.08.02.13.20.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 13:20:56 -0700 (PDT)
Subject: Re: [PATCH v7 07/20] clk: tegra: clk-periph: Add save and restore
 support
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
 <1564532424-10449-8-git-send-email-skomatineni@nvidia.com>
 <c703b4fc-9ebb-0fd4-11de-80974b5c3842@gmail.com>
 <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <92e95688-1984-9967-d47c-57380466a0f2@gmail.com>
Date:   Fri, 2 Aug 2019 23:20:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <614e3fec-cfa2-9e49-6130-d6de253acf03@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

02.08.2019 21:43, Sowjanya Komatineni пишет:
> 
> On 8/2/19 5:32 AM, Dmitry Osipenko wrote:
>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>> This patch implements save and restore context for peripheral fixed
>>> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
>>> peripheral clock ops.
>>>
>>> During system suspend, core power goes off and looses the settings
>>> of the Tegra CAR controller registers.
>>>
>>> So during suspend entry clock and reset state of peripherals is saved
>>> and on resume they are restored to have clocks back to same rate and
>>> state as before suspend.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-periph-fixed.c | 33
>>> ++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-periph-gate.c  | 34
>>> +++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-periph.c       | 37
>>> ++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk-sdmmc-mux.c    | 28 +++++++++++++++++++++++++++
>>>   drivers/clk/tegra/clk.h              |  6 ++++++
>>>   5 files changed, 138 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-periph-fixed.c
>>> b/drivers/clk/tegra/clk-periph-fixed.c
>>> index c088e7a280df..21b24530fa00 100644
>>> --- a/drivers/clk/tegra/clk-periph-fixed.c
>>> +++ b/drivers/clk/tegra/clk-periph-fixed.c
>>> @@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw
>>> *hw,
>>>       return (unsigned long)rate;
>>>   }
>>>   +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
>>> +{
>>> +    struct tegra_clk_periph_fixed *fixed =
>>> to_tegra_clk_periph_fixed(hw);
>>> +    u32 mask = 1 << (fixed->num % 32);
>> This could be BIT(fixed->num % 32).
>>
>>> +    fixed->enb_ctx = readl_relaxed(fixed->base +
>>> fixed->regs->enb_reg) &
>>> +             mask;
>>> +    fixed->rst_ctx = readl_relaxed(fixed->base +
>>> fixed->regs->rst_reg) &
>>> +             mask;
>> The enb_ctx/rst_ctx are booleans, while you assigning an integer value
>> here. You're getting away here because bool is an 32bit unsigned int,
>> but you shouldn't rely on it and always explicitly convert to a bool.
>>
>>> +    return 0;
>>> +}
>>> +
>>> +static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
>>> +{
>>> +    struct tegra_clk_periph_fixed *fixed =
>>> to_tegra_clk_periph_fixed(hw);
>>> +    u32 mask = 1 << (fixed->num % 32);
>>> +
>>> +    if (fixed->enb_ctx)
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
>>> +    else
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
>>> +
>>> +    udelay(2);
>> Will be better to read out and compare the hardware's state with the
>> restored one, then bail out if the state is unchanged.
>>
>> Shouldn't it be fence_udelay()?
>>
>>> +    if (!fixed->rst_ctx) {
>>> +        udelay(5); /* reset propogation delay */
>> Why delaying is done before the writing to the reset register?
> 
> During SC7 exit, peripheral reset state is set to POR state. So some
> peripherals will already be in reset state and making sure of
> propagation delay before releasing from reset.
> 
> It should be rst_clr_reg. will fix in next rev
> 
>>
>>> +        writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
>> I'm not quite sure what's going on here, this looks wrong.
>>
>> 1. rst_reg points to RST_DEVICES_x
>> 2. Each bit of RST_DEVICES_x represents the reset-assertion state of
>> each individual device
>> 3. By writing to rst_reg, all (!) devices are deasserted, except the one
>> device which corresponds to the mask
>> 4. The reset is asserted for a single device, while !fixed->rst_ctx
>> means that it actually should be deasserted (?)
>>
>> Apparently you should use rst_set_reg / rst_clr_reg.
> Yes, It should be rst_clr_reg. will fix in next rev
>>> +    }
>> What about the case where rst_ctx=true?
> 
> ON SC7 exit, state of RST_DEV will be POR state where most peripherals
> will already be in reset state.
> 
> Few of them which are not in reset state in POR values are those that
> need to stay de-asserted across the boot states anyway.

Okay, sounds reasonable.

BTW, it would be nice if you could add a brief clarifying comment to the
code for each of the questions asked during of the review.
