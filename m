Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 494CA70EC2
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 03:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387824AbfGWBll (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 21:41:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42080 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfGWBll (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 21:41:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so39423444lje.9;
        Mon, 22 Jul 2019 18:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r6WZl8Tm7/Ko0gUor1hFovtnmUpos3WnCMQDZV9siKY=;
        b=sqkkhgkiz7B5qzS45rEp2JFlQiPYm0LlOQE3y47fDJkZ3OkSRSHPk47e1MO4W10sGu
         9OFScRJURdXLoIo/dhb2W7TVoKJh7S+4DkkrvwXdKuZFraGAMIEcXzlRg20PeD50ykQJ
         Q/lXSv7+z3OhFb4Ec4I4kNhs5puSUNTckZBizz3EBLECcvUj5shX1jyDCpqQLC0aTlZ6
         GVzx3hcz11WidROEAQOMdchoKlkrLMcSfCGcxFFpp/cqT+fSwOIOfMML/RkIcQjKqQwq
         scdEKXdv+FdFY0Zjn3DoMlzZ0Sd6YXi7OSVllAGmr0iIogmXtELQw+l8oEktQjtrQkfN
         D+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r6WZl8Tm7/Ko0gUor1hFovtnmUpos3WnCMQDZV9siKY=;
        b=ZMV2vrZ89vpu8oP2e+46MvPq2yi94sbYJbV0ehAXG7jtn8wyxd6SLh1IYU/lzsrq/l
         ftn0plM40H1DD1wUWqwTIVQ3h38dCoLDTnrhHn3uoXvwKyroaXY2jZNj5aBUjEHKOU1B
         Ol9GBmRy/UekgZ0TJjtNPXj+FN6poOj6ySoP7zHVe0zzyTaKS/rQgmDflYv71H1VNSlX
         4Ouh0aR3SvbHHs7BkR6V45gPSN+gPT2XGGgrjV5a9WZ3BL86n/M2rGq4MrC4NrcZE8ip
         k3jEhE1Cv7quw/PnWyX44vflW9uzJMXrUBX1yk5fWYBFUwJ3e5E1Rnj0TULbDPoNdi2D
         bkrA==
X-Gm-Message-State: APjAAAWOd1VQs6CZLAeSHHMOOP/udACsCUH4vNGG02IXeXq4tJrIHamr
        W5K+c/l5/KjE795LHLyPOH4L8TnT
X-Google-Smtp-Source: APXvYqxNRlR1w3OQG9dgkuJ4vGJ1SCVsbMKy4X/7k7kfDkJZgaqsUnNtB3W229J0uuRSlg2h46B+NQ==
X-Received: by 2002:a2e:9610:: with SMTP id v16mr37229753ljh.229.1563846097182;
        Mon, 22 Jul 2019 18:41:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id t3sm6211769lfk.59.2019.07.22.18.41.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 18:41:36 -0700 (PDT)
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
Message-ID: <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
Date:   Tue, 23 Jul 2019 04:41:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ca32c2d8-d752-3ecd-3a3f-232366730c7b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

23.07.2019 4:08, Dmitry Osipenko пишет:
> 23.07.2019 3:58, Dmitry Osipenko пишет:
>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>> common used RTC alarm wake event.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 111 insertions(+)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 91c84d0e66ae..c556f38874e1 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -57,6 +57,12 @@
>>>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
>>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> 
> Please follow the TRM's bits naming.
> 
> PMC_CNTRL_LATCHWAKE_EN
> 
>>> +#define PMC_WAKE_MASK			0x0c
>>> +#define PMC_WAKE_LEVEL			0x10
>>> +#define PMC_WAKE_STATUS			0x14
>>> +#define PMC_SW_WAKE_STATUS		0x18
>>>  
>>>  #define DPD_SAMPLE			0x020
>>>  #define  DPD_SAMPLE_ENABLE		BIT(0)
>>> @@ -87,6 +93,11 @@
>>>  
>>>  #define PMC_SCRATCH41			0x140
>>>  
>>> +#define PMC_WAKE2_MASK			0x160
>>> +#define PMC_WAKE2_LEVEL			0x164
>>> +#define PMC_WAKE2_STATUS		0x168
>>> +#define PMC_SW_WAKE2_STATUS		0x16c
>>> +
>>>  #define PMC_SENSOR_CTRL			0x1b0
>>>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>>  	.alloc = tegra_pmc_irq_alloc,
>>>  };
>>>  
>>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>> +{
>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>> +	unsigned int offset, bit;
>>> +	u32 value;
>>> +
>>> +	if (data->hwirq == ULONG_MAX)
>>> +		return 0;
>>> +
>>> +	offset = data->hwirq / 32;
>>> +	bit = data->hwirq % 32;
>>> +
>>> +	/*
>>> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
>>> +	 * that would not make it into wakeup event register during LP0 exit.
>>> +	 */
>>> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>> +	udelay(120);
>>
>> Why it takes so much time to latch the values? Shouldn't some status-bit
>> be polled for the completion of latching?
>>
>> Is this register-write really getting buffered in the PMC?
>>
>>> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>> +	udelay(120);
>>
>> 120 usecs to remove latching, really?
>>
>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>> +
>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>> +
>>> +	/* enable PMC wake */
>>> +	if (data->hwirq >= 32)
>>> +		offset = PMC_WAKE2_MASK;
>>> +	else
>>> +		offset = PMC_WAKE_MASK;
>>> +
>>> +	value = tegra_pmc_readl(pmc, offset);
>>> +
>>> +	if (on)
>>> +		value |= 1 << bit;
>>> +	else
>>> +		value &= ~(1 << bit);
>>> +
>>> +	tegra_pmc_writel(pmc, value, offset);
>>
>> Why the latching is done *before* writing into the WAKE registers? What
>> it is latching then?
> 
> I'm looking at the TRM doc and it says that latching should be done
> *after* writing to the WAKE_MASK / LEVEL registers.
> 
> Secondly it says that it's enough to do:
> 
> value = tegra_pmc_readl(pmc, PMC_CNTRL);
> value |= PMC_CNTRL_LATCH_WAKEUPS;
> tegra_pmc_writel(pmc, value, PMC_CNTRL);
> 
> in order to latch. There is no need for the delay and to remove the
> "LATCHWAKE_EN" bit, it should be a oneshot action.

Although, no. TRM says "stops latching on transition from 1
to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.

Have you tested this code at all? I'm wondering how it happens to work
without a proper latching.

>>> +	return 0;
>>> +}
>>> +
>>>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>  {
>>>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>  	return 0;
>>>  }
>>>  
>>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>> +{
>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>> +	unsigned int offset, bit;
>>> +	u32 value;
>>> +
>>> +	if (data->hwirq == ULONG_MAX)
>>> +		return 0;
>>> +
>>> +	offset = data->hwirq / 32;
>>> +	bit = data->hwirq % 32;
>>> +
>>> +	if (data->hwirq >= 32)
>>> +		offset = PMC_WAKE2_LEVEL;
>>> +	else
>>> +		offset = PMC_WAKE_LEVEL;
>>> +
>>> +	value = tegra_pmc_readl(pmc, offset);
>>> +
>>> +	switch (type) {
>>> +	case IRQ_TYPE_EDGE_RISING:
>>> +	case IRQ_TYPE_LEVEL_HIGH:
>>> +		value |= 1 << bit;
>>> +		break;
>>> +
>>> +	case IRQ_TYPE_EDGE_FALLING:
>>> +	case IRQ_TYPE_LEVEL_LOW:
>>> +		value &= ~(1 << bit);
>>> +		break;
>>> +
>>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>>> +		value ^= 1 << bit;
>>> +		break;
>>> +
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	tegra_pmc_writel(pmc, value, offset);
>>
>> Shouldn't the WAKE_LEVEL be latched as well?
>>
>>> +	return 0;
>>> +}
>>> +
>>>  static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>  {
>>>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>> @@ -2540,6 +2643,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>>>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>>>  };
>>>  
>>> +static const struct tegra_wake_event tegra210_wake_events[] = {
>>> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
>>> +};
>>> +
>>>  static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>  	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>>>  	.powergates = tegra210_powergates,
>>> @@ -2557,10 +2664,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>  	.regs = &tegra20_pmc_regs,
>>>  	.init = tegra20_pmc_init,
>>>  	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
>>> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
>>> +	.irq_set_type = tegra210_pmc_irq_set_type,
>>>  	.reset_sources = tegra210_reset_sources,
>>>  	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>>>  	.reset_levels = NULL,
>>>  	.num_reset_levels = 0,
>>> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
>>> +	.wake_events = tegra210_wake_events,
>>>  };
>>>  
>>>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
>>>
>>
> 

