Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E7071A51
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 16:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390556AbfGWO2Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 10:28:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35581 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfGWO2Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 10:28:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id x25so41308810ljh.2;
        Tue, 23 Jul 2019 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vTUZb1HVyFeOzdcGn9tmvtpOZ/RDE9iJ1j6AeqrbJII=;
        b=EsIIDR4Q55vebn5XqOuiTRlSfDa8o1eFxchIDuCp8CfNRtqFY1DGVkFrF5J4deHOzm
         ob4huwssyJHxU+xKcHlpk3QnQG89sPtgxVpd2FnAGZ+QFQj96y3S8PB0JYAMxyHDk0Tt
         PKu2UJhgmj3Jvkbzi3fznPf9xyXz/gvFWsnAgwHG3TQwg2zlshPrK7JNITMvSilyPWUp
         cqzPzQRON4qSWSvuDT5qRahE8ojKZbmWm+JKQG0nBjz8JV+P4DiSRqoWdI9AiBeGZySm
         lh8lxPAPksvt1+JU4YeFN5Ug87jFpEZ1z4ZV1A/radye+pr8q+S6k+K/Yx9b/PiZ6ce5
         c+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vTUZb1HVyFeOzdcGn9tmvtpOZ/RDE9iJ1j6AeqrbJII=;
        b=eodMQTelBZCueHBXtNfmHI26Kwto2A6oFxuQWkvv+v+oTo5Gf6ql0TEzrRmnNKe0eG
         ASljlNHK6YMaB0BbIeLNq0lN/sObTy4mxFvgTyIjLTHCODI1J7w6hs2QxGOTpbS2q+d/
         qfNVfmd0DZxGatc5UeEw/5P7OGB5RwSKaDIH5cRkBCwsLBKKrDNAGdT5Dmwc4hY91TMm
         tzoU3Y1+0hC7haSxZEY8+tSf8xdDOLv8TGNnktjy0qfu32y3K1as4OdSzNAgq8Z68/8S
         XagvEMYMK7dDH4INppIsLWS4lf1CsyZ9iBWTD21s3pNPgAFiI7D+F+0POoAXjIfhcioj
         Hx6g==
X-Gm-Message-State: APjAAAWrEoK2GB/EjSBP/1iYPdQXL99fiVtxHmoKxzYYGitzSTCCOLjc
        UHJYv0IhFaVCDxqW5pM7yRzqrLK+
X-Google-Smtp-Source: APXvYqzdzLKFwuZZl6Aqc9eGI486jK2DbGDTVDQO3OCW3ZBU7v9/TLNB50FglJh4eytnBlftgn05uQ==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr39358762lji.57.1563892092497;
        Tue, 23 Jul 2019 07:28:12 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id t23sm8011143ljd.98.2019.07.23.07.27.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 07:28:11 -0700 (PDT)
Subject: Re: [PATCH V6 16/21] soc/tegra: pmc: Add pmc wake support for
 tegra210
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <1563738060-30213-17-git-send-email-skomatineni@nvidia.com>
 <0b3d08ea-4633-8a54-ba66-c3f3146a1ece@gmail.com>
 <ca32c2d8-d752-3ecd-3a3f-232366730c7b@gmail.com>
 <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
 <71a88a9c-a542-557a-0eaa-3c90112dee0e@nvidia.com>
 <70ad28cb-c268-cbbe-36f5-39df26617d8e@gmail.com>
 <629826f9-c453-386a-9e88-bd64d23b8eab@nvidia.com>
 <71c8cab1-bf72-c073-be30-4263c6b7c871@gmail.com>
 <97096b6c-f2f5-b82a-b172-802f4a06d1af@nvidia.com>
 <a58de350-f6ce-9308-1ae0-885e732b575d@gmail.com>
Message-ID: <a545cc66-45cd-504a-4390-8274b8b79540@gmail.com>
Date:   Tue, 23 Jul 2019 17:27:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a58de350-f6ce-9308-1ae0-885e732b575d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

23.07.2019 6:43, Dmitry Osipenko пишет:
> 23.07.2019 6:31, Sowjanya Komatineni пишет:
>>
>> On 7/22/19 8:25 PM, Dmitry Osipenko wrote:
>>> 23.07.2019 6:09, Sowjanya Komatineni пишет:
>>>> On 7/22/19 8:03 PM, Dmitry Osipenko wrote:
>>>>> 23.07.2019 4:52, Sowjanya Komatineni пишет:
>>>>>> On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
>>>>>>> 23.07.2019 4:08, Dmitry Osipenko пишет:
>>>>>>>> 23.07.2019 3:58, Dmitry Osipenko пишет:
>>>>>>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>>>>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>>>>>>>> common used RTC alarm wake event.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/soc/tegra/pmc.c | 111
>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>    1 file changed, 111 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>>>>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>>>>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>>>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>>>>>>> @@ -57,6 +57,12 @@
>>>>>>>>>>    #define  PMC_CNTRL_SYSCLK_OE        BIT(11) /* system clock
>>>>>>>>>> enable */
>>>>>>>>>>    #define  PMC_CNTRL_SYSCLK_POLARITY    BIT(10) /* sys clk
>>>>>>>>>> polarity */
>>>>>>>>>>    #define  PMC_CNTRL_MAIN_RST        BIT(4)
>>>>>>>>>> +#define  PMC_CNTRL_LATCH_WAKEUPS    BIT(5)
>>>>>>>> Please follow the TRM's bits naming.
>>>>>>>>
>>>>>>>> PMC_CNTRL_LATCHWAKE_EN
>>>>>>>>
>>>>>>>>>> +#define PMC_WAKE_MASK            0x0c
>>>>>>>>>> +#define PMC_WAKE_LEVEL            0x10
>>>>>>>>>> +#define PMC_WAKE_STATUS            0x14
>>>>>>>>>> +#define PMC_SW_WAKE_STATUS        0x18
>>>>>>>>>>      #define DPD_SAMPLE            0x020
>>>>>>>>>>    #define  DPD_SAMPLE_ENABLE        BIT(0)
>>>>>>>>>> @@ -87,6 +93,11 @@
>>>>>>>>>>      #define PMC_SCRATCH41            0x140
>>>>>>>>>>    +#define PMC_WAKE2_MASK            0x160
>>>>>>>>>> +#define PMC_WAKE2_LEVEL            0x164
>>>>>>>>>> +#define PMC_WAKE2_STATUS        0x168
>>>>>>>>>> +#define PMC_SW_WAKE2_STATUS        0x16c
>>>>>>>>>> +
>>>>>>>>>>    #define PMC_SENSOR_CTRL            0x1b0
>>>>>>>>>>    #define  PMC_SENSOR_CTRL_SCRATCH_WRITE    BIT(2)
>>>>>>>>>>    #define  PMC_SENSOR_CTRL_ENABLE_RST    BIT(1)
>>>>>>>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops
>>>>>>>>>> tegra_pmc_irq_domain_ops = {
>>>>>>>>>>        .alloc = tegra_pmc_irq_alloc,
>>>>>>>>>>    };
>>>>>>>>>>    +static int tegra210_pmc_irq_set_wake(struct irq_data *data,
>>>>>>>>>> unsigned int on)
>>>>>>>>>> +{
>>>>>>>>>> +    struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>>>>>>>> +    unsigned int offset, bit;
>>>>>>>>>> +    u32 value;
>>>>>>>>>> +
>>>>>>>>>> +    if (data->hwirq == ULONG_MAX)
>>>>>>>>>> +        return 0;
>>>>>>>>>> +
>>>>>>>>>> +    offset = data->hwirq / 32;
>>>>>>>>>> +    bit = data->hwirq % 32;
>>>>>>>>>> +
>>>>>>>>>> +    /*
>>>>>>>>>> +     * Latch wakeups to SW_WAKE_STATUS register to capture events
>>>>>>>>>> +     * that would not make it into wakeup event register during
>>>>>>>>>> LP0 exit.
>>>>>>>>>> +     */
>>>>>>>>>> +    value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>>>>> +    value |= PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>>>> +    tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>>> +    udelay(120);
>>>>>>>>> Why it takes so much time to latch the values? Shouldn't some
>>>>>>>>> status-bit
>>>>>>>>> be polled for the completion of latching?
>>>>>>>>>
>>>>>>>>> Is this register-write really getting buffered in the PMC?
>>>>>>>>>
>>>>>>>>>> +    value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>>>> +    tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>>> +    udelay(120);
>>>>>>>>> 120 usecs to remove latching, really?
>>>>>>>>>
>>>>>>>>>> +    tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>>>>>>>> +    tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>>>>>>>> +
>>>>>>>>>> +    tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>>>>>>>> +    tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>>>>>>>> +
>>>>>>>>>> +    /* enable PMC wake */
>>>>>>>>>> +    if (data->hwirq >= 32)
>>>>>>>>>> +        offset = PMC_WAKE2_MASK;
>>>>>>>>>> +    else
>>>>>>>>>> +        offset = PMC_WAKE_MASK;
>>>>>>>>>> +
>>>>>>>>>> +    value = tegra_pmc_readl(pmc, offset);
>>>>>>>>>> +
>>>>>>>>>> +    if (on)
>>>>>>>>>> +        value |= 1 << bit;
>>>>>>>>>> +    else
>>>>>>>>>> +        value &= ~(1 << bit);
>>>>>>>>>> +
>>>>>>>>>> +    tegra_pmc_writel(pmc, value, offset);
>>>>>>>>> Why the latching is done *before* writing into the WAKE registers?
>>>>>>>>> What
>>>>>>>>> it is latching then?
>>>>>>>> I'm looking at the TRM doc and it says that latching should be done
>>>>>>>> *after* writing to the WAKE_MASK / LEVEL registers.
>>>>>>>>
>>>>>>>> Secondly it says that it's enough to do:
>>>>>>>>
>>>>>>>> value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>>>>> value |= PMC_CNTRL_LATCH_WAKEUPS;
>>>>>>>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>>>>>
>>>>>>>> in order to latch. There is no need for the delay and to remove the
>>>>>>>> "LATCHWAKE_EN" bit, it should be a oneshot action.
>>>>>>> Although, no. TRM says "stops latching on transition from 1
>>>>>>> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
>>>>>>>
>>>>>>> Have you tested this code at all? I'm wondering how it happens to
>>>>>>> work
>>>>>>> without a proper latching.
>>>>>> Yes, ofcourse its tested and this sequence to do transition is
>>>>>> recommendation from Tegra designer.
>>>>>> Will check if TRM doesn't have update properly or will re-confirm
>>>>>> internally on delay time...
>>>>>>
>>>>>> On any of the wake event PMC wakeup happens and WAKE_STATUS register
>>>>>> will have bits set for all events that triggered wake.
>>>>>> After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC
>>>>>> design.
>>>>>> SW latch register added in design helps to provide a way to capture
>>>>>> those events that happen right during wakeup time and didnt make it to
>>>>>> SW_WAKE_STATUS register.
>>>>>> So before next suspend entry, latching all prior wake events into SW
>>>>>> WAKE_STATUS and then clearing them.
>>>>> I'm now wondering whether the latching cold be turned ON permanently
>>>>> during of the PMC's probe, for simplicity.
>>>> latching should be done on suspend-resume cycle as wake events gets
>>>> generates on every suspend-resume cycle.
>>> You're saying that PMC "doesn't update SW_WAKE_STATUS" after wake-up,
>>> then I don't quite understand what's the point of disabling the latching
>>> at all.
>> When latch wake enable is set, events are latched and during 1 to 0
>> transition latching is disabled.
>>
>> This is to avoid sw_wake_status and wake_status showing diff events.
> 
> Okay.
> 
>> Currently driver is not relying on SW_WAKE_STATUS but its good to latch
>> and clear so even at some point for some reason when SW_WAKE_STATUS is
>> used, this wlil not cause mismatch with wake_status.
> 
> Then the latching need to be enabled on suspend and disabled early on
> resume to get a proper WAKE status.

Actually, it will be better to simply not implement the latching until
it will become really needed. In general you shouldn't add into the
patchset anything that is unused.
