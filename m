Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E99E70ED4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 03:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730866AbfGWBwm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 21:52:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37605 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbfGWBwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 21:52:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id z28so39513199ljn.4;
        Mon, 22 Jul 2019 18:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jUxkqjLcm9ogY/pHNxdAOjo5WMjyM33/CcwVvPRSmWQ=;
        b=Ee9PPcUM8WTjyBj/F6OgWN/LnZ1RBFXwB5eDCr/YaVrH4I3gBY++DXmAtO8jG0hVXf
         zkfTN7H1kNOKg8I+/rVKsaqt6sL2mu9CrVGrWMC11Nyzm8jhNPBJx65efdeacY1u/+ml
         VsoEJXCn/jgmVh+aqZHVE4/dSzgZIprEpaYiqArjGD7/3pbFynRdx7ZgYRXEkb3kyyGW
         y73THKhTErWFs9vSdL+LoF2JuelOsaq+rrcTfjab0CWULOj4eBfQloadTdqBXhnEoAGG
         XkPWKL4hd/VguaReo93AS4Rd4iqbtFR+VvOscYAd1W8KFIKNdRoPdAPc5VtR+k2hSiWH
         CvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jUxkqjLcm9ogY/pHNxdAOjo5WMjyM33/CcwVvPRSmWQ=;
        b=g2tEMZ3yUUwyI0GWuYxaSt3ZYp3Cf5psVsrhHc3+AFkwcdDYCjeNz+cM31hNtp47aa
         uUZOXNvTzSCYrK9XrWU7SxkYLf9qhOA5vZg//ens5BBjneTCX/3QMSnQyWNxXKK6rnPs
         lkd57K6+CwEk/rh/ARKgV4GzqOZmpE0Eq1Sm1N9YmbODo36LU5vCMBa1LCPpfRHVnR5P
         v1xkqBtON+GY5Iq4t7vZZeEfIK7h1qRKHiWy++2BtLMvj4aZJ7ZpjrdRE+nMAkjo3FKR
         vqnoK/pgn/A6zGI1dBQL4cGCi3oglLuQq2uw5rg1yKA0lj3efJ+2mFzty6dg236heAgh
         1r5A==
X-Gm-Message-State: APjAAAXS5yyD8R9juZ751eeOIoekcMvRVlmsH0Rxvy7k3HT8TyL/eO06
        CvR3OgO7JFdRLKMTpEMyXxTVgwh8
X-Google-Smtp-Source: APXvYqxEbzQ+ly3I0SDUWaV5GeAaq4bDoN4l+WddzujJo2bYAGTqZRtpTIH+K0XjyxzFHYVc8jryqA==
X-Received: by 2002:a2e:720b:: with SMTP id n11mr39025740ljc.213.1563846758113;
        Mon, 22 Jul 2019 18:52:38 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id t1sm7767003lji.52.2019.07.22.18.52.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 18:52:37 -0700 (PDT)
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
Message-ID: <66535c01-7079-0192-c992-c25a4d7cdbb9@gmail.com>
Date:   Tue, 23 Jul 2019 04:52:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b575ca93-9f34-b07a-1234-ef1ea2a6ddee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

23.07.2019 4:41, Dmitry Osipenko пишет:
> 23.07.2019 4:08, Dmitry Osipenko пишет:
>> 23.07.2019 3:58, Dmitry Osipenko пишет:
>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>> This patch implements PMC wakeup sequence for Tegra210 and defines
>>>> common used RTC alarm wake event.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 111 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>>> index 91c84d0e66ae..c556f38874e1 100644
>>>> --- a/drivers/soc/tegra/pmc.c
>>>> +++ b/drivers/soc/tegra/pmc.c
>>>> @@ -57,6 +57,12 @@
>>>>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>>>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>>>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
>>>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
>>
>> Please follow the TRM's bits naming.
>>
>> PMC_CNTRL_LATCHWAKE_EN
>>
>>>> +#define PMC_WAKE_MASK			0x0c
>>>> +#define PMC_WAKE_LEVEL			0x10
>>>> +#define PMC_WAKE_STATUS			0x14
>>>> +#define PMC_SW_WAKE_STATUS		0x18
>>>>  
>>>>  #define DPD_SAMPLE			0x020
>>>>  #define  DPD_SAMPLE_ENABLE		BIT(0)
>>>> @@ -87,6 +93,11 @@
>>>>  
>>>>  #define PMC_SCRATCH41			0x140
>>>>  
>>>> +#define PMC_WAKE2_MASK			0x160
>>>> +#define PMC_WAKE2_LEVEL			0x164
>>>> +#define PMC_WAKE2_STATUS		0x168
>>>> +#define PMC_SW_WAKE2_STATUS		0x16c
>>>> +
>>>>  #define PMC_SENSOR_CTRL			0x1b0
>>>>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>>>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>>>> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>>>  	.alloc = tegra_pmc_irq_alloc,
>>>>  };
>>>>  
>>>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>> +{
>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> +	unsigned int offset, bit;
>>>> +	u32 value;
>>>> +
>>>> +	if (data->hwirq == ULONG_MAX)
>>>> +		return 0;
>>>> +
>>>> +	offset = data->hwirq / 32;
>>>> +	bit = data->hwirq % 32;
>>>> +
>>>> +	/*
>>>> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
>>>> +	 * that would not make it into wakeup event register during LP0 exit.
>>>> +	 */
>>>> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>>> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>> +	udelay(120);
>>>
>>> Why it takes so much time to latch the values? Shouldn't some status-bit
>>> be polled for the completion of latching?
>>>
>>> Is this register-write really getting buffered in the PMC?
>>>
>>>> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>>>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>>> +	udelay(120);
>>>
>>> 120 usecs to remove latching, really?
>>>
>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>>>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>>>> +
>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>>>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>>>> +
>>>> +	/* enable PMC wake */
>>>> +	if (data->hwirq >= 32)
>>>> +		offset = PMC_WAKE2_MASK;
>>>> +	else
>>>> +		offset = PMC_WAKE_MASK;
>>>> +
>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>> +
>>>> +	if (on)
>>>> +		value |= 1 << bit;
>>>> +	else
>>>> +		value &= ~(1 << bit);
>>>> +
>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>
>>> Why the latching is done *before* writing into the WAKE registers? What
>>> it is latching then?
>>
>> I'm looking at the TRM doc and it says that latching should be done
>> *after* writing to the WAKE_MASK / LEVEL registers.
>>
>> Secondly it says that it's enough to do:
>>
>> value = tegra_pmc_readl(pmc, PMC_CNTRL);
>> value |= PMC_CNTRL_LATCH_WAKEUPS;
>> tegra_pmc_writel(pmc, value, PMC_CNTRL);
>>
>> in order to latch. There is no need for the delay and to remove the
>> "LATCHWAKE_EN" bit, it should be a oneshot action.
> 
> Although, no. TRM says "stops latching on transition from 1
> to 0 (sequence - set to 1,set to 0)", so it's not a oneshot action.
> 
> Have you tested this code at all? I'm wondering how it happens to work
> without a proper latching.

Okay, I re-read the TRM and apparently "latching" just means storing of
WAKE-event bit in the WAKE-status register if latching is enabled. Hence
the PMC_CNTRL_LATCHWAKE_EN should be enabled in tegra_pmc_suspend() and
unset in tegra_pmc_resume().

Also, apparently, on resume from suspend the interrupt should be
re-triggered in accordance to the WAKE-status, then the WAKE-status need
to be cleared.

>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>  {
>>>>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>> +{
>>>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> +	unsigned int offset, bit;
>>>> +	u32 value;
>>>> +
>>>> +	if (data->hwirq == ULONG_MAX)
>>>> +		return 0;
>>>> +
>>>> +	offset = data->hwirq / 32;
>>>> +	bit = data->hwirq % 32;
>>>> +
>>>> +	if (data->hwirq >= 32)
>>>> +		offset = PMC_WAKE2_LEVEL;
>>>> +	else
>>>> +		offset = PMC_WAKE_LEVEL;
>>>> +
>>>> +	value = tegra_pmc_readl(pmc, offset);
>>>> +
>>>> +	switch (type) {
>>>> +	case IRQ_TYPE_EDGE_RISING:
>>>> +	case IRQ_TYPE_LEVEL_HIGH:
>>>> +		value |= 1 << bit;
>>>> +		break;
>>>> +
>>>> +	case IRQ_TYPE_EDGE_FALLING:
>>>> +	case IRQ_TYPE_LEVEL_LOW:
>>>> +		value &= ~(1 << bit);
>>>> +		break;
>>>> +
>>>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>>>> +		value ^= 1 << bit;
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	tegra_pmc_writel(pmc, value, offset);
>>>
>>> Shouldn't the WAKE_LEVEL be latched as well?
>>>
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>>>  {
>>>>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>>> @@ -2540,6 +2643,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>>>>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>>>>  };
>>>>  
>>>> +static const struct tegra_wake_event tegra210_wake_events[] = {
>>>> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
>>>> +};
>>>> +
>>>>  static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>>  	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>>>>  	.powergates = tegra210_powergates,
>>>> @@ -2557,10 +2664,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>>>  	.regs = &tegra20_pmc_regs,
>>>>  	.init = tegra20_pmc_init,
>>>>  	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
>>>> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
>>>> +	.irq_set_type = tegra210_pmc_irq_set_type,
>>>>  	.reset_sources = tegra210_reset_sources,
>>>>  	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>>>>  	.reset_levels = NULL,
>>>>  	.num_reset_levels = 0,
>>>> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
>>>> +	.wake_events = tegra210_wake_events,
>>>>  };
>>>>  
>>>>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
>>>>
>>>
>>
> 

