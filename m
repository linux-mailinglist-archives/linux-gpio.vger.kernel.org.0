Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C7B70F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 05:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732299AbfGWDEC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 23:04:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36028 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729393AbfGWDEC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 23:04:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so39571715ljj.3;
        Mon, 22 Jul 2019 20:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8xbcKJy29W9G+6XFE1SC4ZEJ7ZY2qDVosxzEJUyDA3k=;
        b=dhH0Wq6jctTT0KZfsJddhvq1G1G44ETwwJwZUYIanj2xXEYbrAAAGzOiQx9XRTPg19
         KK5/aOPuox9Mpc82+wFVtl6vPFiNA3RFMK3twfyHscqP5p+QELoM3nISicyqTupMupYR
         yioRDPw9zIwc1t5MfHFB0RRavezCI+n3iimYR+Z1MqhGH+GcTKGtX0GwfyToWKkLJTRi
         ZjGD+Vk5t9T6dlK67Q6wGlFHQfn7hPn6ebs4XJj99aohtFryRVjGrcvBb8noeDYpw+WI
         Lze88rtPHrVo8yLWzVG4k5eQerAGVBOQBriuC78hGx+/pzKEIkCezt0/kMUrqsWTHs3g
         05lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8xbcKJy29W9G+6XFE1SC4ZEJ7ZY2qDVosxzEJUyDA3k=;
        b=I131ca3UuYhE7ok2mTJM2RNKd5S85UqMp4e1Yd0/32Etwk7nKnozomql6lg8thO/07
         5th4pvQ3UZWip0j14nE9M08mBV8iWMbgIuJE96QSxJzDCInje85pyYTy2nkIKL7esR8V
         ItaFIRdDN+8T0x3sWLqopJiKONUsf+cwEsRDQlsd8nW7H+SmfwRkA8jRt7GobiqUia4i
         tROz3RKkDSIt8Q+nNNK9dUQ4xJmGlV05D+TEc6YtXqJLsx6vDzIFtD5Jcfqu4JYuvYdY
         wkw7J/2HvGX1Vw6P135Hw5TVBk86HusSOEjk8lkskcu6CDZY2iU/XDSwa4EfneJCSZ+3
         6IOQ==
X-Gm-Message-State: APjAAAXsgdwktaJA8GyNh+2wUqprlGoSk7gfPf8d66S5jWoZILv7hF2x
        o5pMH1hWbTH+Y58D55Ul+t3u4vQx
X-Google-Smtp-Source: APXvYqyeyyE61yAzRlbwRkjixJ+MzgQknlzT+x38lMna/B3NIntesYyRiOe7y8U6JuyVtOoznHY7MA==
X-Received: by 2002:a2e:534a:: with SMTP id t10mr967702ljd.109.1563851037966;
        Mon, 22 Jul 2019 20:03:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id m10sm6182450lfd.32.2019.07.22.20.03.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 20:03:56 -0700 (PDT)
Subject: Re: [PATCH V6 16/21] soc/tegra: pmc: Add pmc wake support for
 tegra210
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <70ad28cb-c268-cbbe-36f5-39df26617d8e@gmail.com>
Date:   Tue, 23 Jul 2019 06:03:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <71a88a9c-a542-557a-0eaa-3c90112dee0e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

23.07.2019 4:52, Sowjanya Komatineni пишет:
> 
> On 7/22/19 6:41 PM, Dmitry Osipenko wrote:
>> 23.07.2019 4:08, Dmitry Osipenko пишет:
>>> 23.07.2019 3:58, Dmitry Osipenko пишет:
>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>>> common used RTC alarm wake event.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 111 insertions(+)
>>>>>
>>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>>> --- a/drivers/soc/tegra/pmc.c
>>>>> +++ b/drivers/soc/tegra/pmc.c
>>>>> @@ -57,6 +57,12 @@
>>>>>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>>>>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>>>>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
>>>>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
>>> Please follow the TRM's bits naming.
>>>
>>> PMC_CNTRL_LATCHWAKE_EN
>>>
>>>>> +#define PMC_WAKE_MASK			0x0c
>>>>> +#define PMC_WAKE_LEVEL			0x10
>>>>> +#define PMC_WAKE_STATUS			0x14
>>>>> +#define PMC_SW_WAKE_STATUS		0x18
>>>>>  
>>>>>  #define DPD_SAMPLE			0x020
>>>>>  #define  DPD_SAMPLE_ENABLE		BIT(0)
>>>>> @@ -87,6 +93,11 @@
>>>>>  
>>>>>  #define PMC_SCRATCH41			0x140
>>>>>  
>>>>> +#define PMC_WAKE2_MASK			0x160
>>>>> +#define PMC_WAKE2_LEVEL			0x164
>>>>> +#define PMC_WAKE2_STATUS		0x168
>>>>> +#define PMC_SW_WAKE2_STATUS		0x16c
>>>>> +
>>>>>  #define PMC_SENSOR_CTRL			0x1b0
>>>>>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>>>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>>>>  	.alloc = tegra_pmc_irq_alloc,
>>>>>  };
>>>>>  
>>>>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>> +{
>>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>>> +	unsigned int offset, bit;
>>>>> +	u32 value;
>>>>> +
>>>>> +	if (data->hwirq == ULONG_MAX)
>>>>> +		return 0;
>>>>> +
>>>>> +	offset = data->hwirq / 32;
>>>>> +	bit = data->hwirq % 32;
>>>>> +
>>>>> +	/*
>>>>> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
>>>>> +	 * that would not make it into wakeup event register during LP0 exit.
>>>>> +	 */
>>>>> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>>> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
>>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>> +	udelay(120);
>>>> Why it takes so much time to latch the values? Shouldn't some status-bit
>>>> be polled for the completion of latching?
>>>>
>>>> Is this register-write really getting buffered in the PMC?
>>>>
>>>>> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>>> +	udelay(120);
>>>> 120 usecs to remove latching, really?
>>>>
>>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>>> +
>>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>>> +
>>>>> +	/* enable PMC wake */
>>>>> +	if (data->hwirq >= 32)
>>>>> +		offset = PMC_WAKE2_MASK;
>>>>> +	else
>>>>> +		offset = PMC_WAKE_MASK;
>>>>> +
>>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>>> +
>>>>> +	if (on)
>>>>> +		value |= 1 << bit;
>>>>> +	else
>>>>> +		value &= ~(1 << bit);
>>>>> +
>>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>> Why the latching is done *before* writing into the WAKE registers? What
>>>> it is latching then?
>>> I'm looking at the TRM doc and it says that latching should be done
>>> *after* writing to the WAKE_MASK / LEVEL registers.
>>>
>>> Secondly it says that it's enough to do:
>>>
>>> value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>> value |= PMC_CNTRL_LATCH_WAKEUPS;
>>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>
>>> in order to latch. There is no need for the delay and to remove the
>>> "LATCHWAKE_EN" bit, it should be a oneshot action.
>> Although, no. TRM says "stops latching on transition from 1
>> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
>>
>> Have you tested this code at all? I'm wondering how it happens to work
>> without a proper latching.
> Yes, ofcourse its tested and this sequence to do transition is
> recommendation from Tegra designer.
> Will check if TRM doesn't have update properly or will re-confirm
> internally on delay time...
> 
> On any of the wake event PMC wakeup happens and WAKE_STATUS register
> will have bits set for all events that triggered wake.
> After wakeup PMC doesn't update SW_WAKE_STATUS register as per PMC design.
> SW latch register added in design helps to provide a way to capture
> those events that happen right during wakeup time and didnt make it to
> SW_WAKE_STATUS register.
> So before next suspend entry, latching all prior wake events into SW
> WAKE_STATUS and then clearing them.

I'm now wondering whether the latching cold be turned ON permanently
during of the PMC's probe, for simplicity.

> LATCHWAKE_EN - When set, enables latching and stops latching on
> transition from 1 to 0
> There is recommendation of min 120uSec for this transition to stop
> latching. Will double-check why 120uSec

Yes, please check.

>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>>  {
>>>>>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>>> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>>> +{
>>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>>> +	unsigned int offset, bit;
>>>>> +	u32 value;
>>>>> +
>>>>> +	if (data->hwirq == ULONG_MAX)
>>>>> +		return 0;
>>>>> +
>>>>> +	offset = data->hwirq / 32;
>>>>> +	bit = data->hwirq % 32;
>>>>> +
>>>>> +	if (data->hwirq >= 32)
>>>>> +		offset = PMC_WAKE2_LEVEL;
>>>>> +	else
>>>>> +		offset = PMC_WAKE_LEVEL;
>>>>> +
>>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>>> +
>>>>> +	switch (type) {
>>>>> +	case IRQ_TYPE_EDGE_RISING:
>>>>> +	case IRQ_TYPE_LEVEL_HIGH:
>>>>> +		value |= 1 << bit;
>>>>> +		break;
>>>>> +
>>>>> +	case IRQ_TYPE_EDGE_FALLING:
>>>>> +	case IRQ_TYPE_LEVEL_LOW:
>>>>> +		value &= ~(1 << bit);
>>>>> +		break;
>>>>> +
>>>>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>>>>> +		value ^= 1 << bit;
>>>>> +		break;
>>>>> +
>>>>> +	default:
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>> Shouldn't the WAKE_LEVEL be latched as well?
> WAKE_LEVELs dont need any latch as they are the levels SW sets for wake
> trigger and they are not status

Okay.

[snip]
