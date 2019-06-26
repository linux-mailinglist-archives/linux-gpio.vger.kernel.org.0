Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B790E56EB0
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 18:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfFZQ1e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 12:27:34 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5161 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfFZQ1e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 12:27:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d139cf20000>; Wed, 26 Jun 2019 09:27:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 09:27:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 09:27:32 -0700
Received: from [10.2.169.244] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 16:27:28 +0000
Subject: Re: [PATCH V4 14/18] soc/tegra: pmc: add pmc wake support for
 tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <marc.zyngier@arm.com>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-15-git-send-email-skomatineni@nvidia.com>
 <20190626102614.GF6362@ulmo>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <272f25b0-aa1c-eb3c-fcfe-eb4eeec3c346@nvidia.com>
Date:   Wed, 26 Jun 2019 09:27:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626102614.GF6362@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561566450; bh=7qRJA9aotziCpz0L/Yu280AftF0lT3W783QhiqlRpK0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=JRpaYLciMtPeTJNhHTK1LWZxMvmjO3wzjMqDTeHFYT+lkSALH90RyTh7wI8uFMerK
         7w/mnB6GK8o7I+xCxsC7OAl7JAk1MotXwigSq5AZE7EJQ12YPD2wTHLb5ymemKqgJX
         LvAi41tzK13MOWoACc5qPYeeTg1iO6kfW39TCCuqNTfPG2pFnZ0POiTsxf97L2srxX
         WqfdTsVBjuYde5iFyMIeZl59qqw9Ijo9F189TBMqly+UqMNYSE5HyM/MqDxhL9TiOI
         hXkqN7sYcjA7L1fEOlAbUsHGBgvQIYUvULZzAaupSvB6i4xVig1ZTU2Y6o1CtZLxDw
         AyfOHj1mfqkGw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/26/19 3:26 AM, Thierry Reding wrote:
> On Sun, Jun 23, 2019 at 08:02:55PM -0700, Sowjanya Komatineni wrote:
>> This patch implements PMC wakeup sequence for Tegra210 and defines
>> common used RTC alarm wake event.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
> One general note, and it's a really pedantic one, which means that this
> patch is plenty good already: sstart the commit subject with a capital
> letter after the prefix, and watch the capitalization of the rest of the
> line:
>
> 	soc/tegra: pmc: Add PMC wake support for Tegra210
>
> I will usually fix up these trivialities when applying, but you can save
> me a couple of seconds per patch by doing this right to begin with. =)
>
> Thanks again for the great work on this series!
>
> Thierry
Sorry Thierry. Sure will follow that from now on...
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index e87f29a35fcf..603fc3bd73f5 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -57,6 +57,12 @@
>>   #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>>   #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>>   #define  PMC_CNTRL_MAIN_RST		BIT(4)
>> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
>> +
>> +#define PMC_WAKE_MASK			0x0c
>> +#define PMC_WAKE_LEVEL			0x10
>> +#define PMC_WAKE_STATUS			0x14
>> +#define PMC_SW_WAKE_STATUS		0x18
>>   
>>   #define DPD_SAMPLE			0x020
>>   #define  DPD_SAMPLE_ENABLE		BIT(0)
>> @@ -87,6 +93,11 @@
>>   
>>   #define PMC_SCRATCH41			0x140
>>   
>> +#define PMC_WAKE2_MASK			0x160
>> +#define PMC_WAKE2_LEVEL			0x164
>> +#define PMC_WAKE2_STATUS		0x168
>> +#define PMC_SW_WAKE2_STATUS		0x16c
>> +
>>   #define PMC_SENSOR_CTRL			0x1b0
>>   #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>>   #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
>> @@ -1921,6 +1932,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>   	.alloc = tegra_pmc_irq_alloc,
>>   };
>>   
>> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>> +{
>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>> +	unsigned int offset, bit;
>> +	u32 value;
>> +
>> +	if (data->hwirq == ULONG_MAX)
>> +		return 0;
>> +
>> +	offset = data->hwirq / 32;
>> +	bit = data->hwirq % 32;
>> +
>> +	/*
>> +	 * latch wakeups to SW_WAKE_STATUS register to capture events
>> +	 * that would not make it into wakeup event register during LP0 exit.
>> +	 */
>> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>> +	udelay(120);
>> +
>> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
>> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>> +	udelay(120);
>> +
>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
>> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
>> +
>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
>> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
>> +
>> +	/* enable PMC wake */
>> +	if (data->hwirq >= 32)
>> +		offset = PMC_WAKE2_MASK;
>> +	else
>> +		offset = PMC_WAKE_MASK;
>> +
>> +	value = tegra_pmc_readl(pmc, offset);
>> +
>> +	if (on)
>> +		value |= 1 << bit;
>> +	else
>> +		value &= ~(1 << bit);
>> +
>> +	tegra_pmc_writel(pmc, value, offset);
>> +
>> +	return 0;
>> +}
>> +
>>   static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>> @@ -1953,6 +2013,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   	return 0;
>>   }
>>   
>> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>> +{
>> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>> +	unsigned int offset, bit;
>> +	u32 value;
>> +
>> +	if (data->hwirq == ULONG_MAX)
>> +		return 0;
>> +
>> +	offset = data->hwirq / 32;
>> +	bit = data->hwirq % 32;
>> +
>> +	if (data->hwirq >= 32)
>> +		offset = PMC_WAKE2_LEVEL;
>> +	else
>> +		offset = PMC_WAKE_LEVEL;
>> +
>> +	value = tegra_pmc_readl(pmc, offset);
>> +
>> +	switch (type) {
>> +	case IRQ_TYPE_EDGE_RISING:
>> +	case IRQ_TYPE_LEVEL_HIGH:
>> +		value |= 1 << bit;
>> +		break;
>> +
>> +	case IRQ_TYPE_EDGE_FALLING:
>> +	case IRQ_TYPE_LEVEL_LOW:
>> +		value &= ~(1 << bit);
>> +		break;
>> +
>> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
>> +		value ^= 1 << bit;
>> +		break;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	tegra_pmc_writel(pmc, value, offset);
>> +
>> +	return 0;
>> +}
>> +
>>   static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>> @@ -2541,6 +2644,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>>   	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>>   };
>>   
>> +static const struct tegra_wake_event tegra210_wake_events[] = {
>> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
>> +};
>> +
>>   static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>   	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>>   	.powergates = tegra210_powergates,
>> @@ -2558,10 +2665,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>>   	.regs = &tegra20_pmc_regs,
>>   	.init = tegra20_pmc_init,
>>   	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
>> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
>> +	.irq_set_type = tegra210_pmc_irq_set_type,
>>   	.reset_sources = tegra210_reset_sources,
>>   	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>>   	.reset_levels = NULL,
>>   	.num_reset_levels = 0,
>> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
>> +	.wake_events = tegra210_wake_events,
>>   };
>>   
>>   #define TEGRA186_IO_PAD_TABLE(_pad)					     \
>> -- 
>> 2.7.4
