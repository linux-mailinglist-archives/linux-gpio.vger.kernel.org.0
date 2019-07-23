Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777F870E5C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 02:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731605AbfGWA7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 20:59:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37332 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731406AbfGWA7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 20:59:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id z28so39425370ljn.4;
        Mon, 22 Jul 2019 17:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=msmKv+diyW3ZToy5cpA1UsEEYrgAfasPnODmQX4WK/8=;
        b=gzV9aLyMYV9JtY3JdLlyRvsVeC1i+yyOa5FknnI+Fb6FK7Ig52um6Ig2oV0LaLtkb6
         WUxboo+MiO0ubljmg3ZpqkHMnXS2447E1XDjNsARclHsDJcNzKZCj8Q7AC6BdbdJ8TBQ
         44qTKw0ocwWyiiSHEEJcZIFuhUUeo3E2SwSTp7xr+3Z3PNy+WX8ZnqEgnLH4Kavztb3Z
         0Qv5qK1KgWLj+8Ifqttm/qeouV3mNEHwm3EYHWhjV377QO8RatYsqjAYi47vzZEXdp7H
         1K3PIuwv9UxF2IU5Bp+CxbfaaZhNOlZEyt8uHgQOlcnucSb0J/vl9jQjvCE7JVK5uCAz
         UX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=msmKv+diyW3ZToy5cpA1UsEEYrgAfasPnODmQX4WK/8=;
        b=BZCpFDcoQw9si/ftgDToPEqStK8biwJikdHVWKPxLOR1xP1vEmXAz1AGPHikeLDRhu
         VjI/zdbVJh4KzONHUHsehtSQ6CTj7//NQqQ4CEBsT5yZmNIWnmquGl8lNCeBszuAlWij
         sgJSBlCLAlbaEDCE5D1lrTrbElSPE/lCrJFv2sRm6upYDAQ3cK+nJg+V4jP/T18ln5fG
         VCyDRYc+81Nkarwu6QENK3w2qxSQ1qyFJSlncR6b9ymmwWH/ns8YvKGVoz53uuSLDNIU
         qIoYLshQmH8xHkkp4FdJBL5rIaeiPTWCY8gkjrVxxY5GrkqAKP6WeGrHX5uSWhQul9po
         wiIg==
X-Gm-Message-State: APjAAAVSz1vF7YUUIcOvGT4001fksPHAOqHiYBorquz9c5USrlq38Ym+
        3MTJvpFDcppV+an488oWiwOpcLb1
X-Google-Smtp-Source: APXvYqxe1m6MerGRIs/yzKqYPqUsYZQFyq3yLTG16hH6N14t2GPxfXwuhz2H2Ph7jcvSClKnPyz+0A==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr38002953ljw.73.1563843538325;
        Mon, 22 Jul 2019 17:58:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id h4sm7798802ljj.31.2019.07.22.17.58.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 17:58:57 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0b3d08ea-4633-8a54-ba66-c3f3146a1ece@gmail.com>
Date:   Tue, 23 Jul 2019 03:58:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-17-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch implements PMC wakeup sequence for Tegra210 and defines
> common used RTC alarm wake event.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 91c84d0e66ae..c556f38874e1 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -57,6 +57,12 @@
>  #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
>  #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
>  #define  PMC_CNTRL_MAIN_RST		BIT(4)
> +#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
> +
> +#define PMC_WAKE_MASK			0x0c
> +#define PMC_WAKE_LEVEL			0x10
> +#define PMC_WAKE_STATUS			0x14
> +#define PMC_SW_WAKE_STATUS		0x18
>  
>  #define DPD_SAMPLE			0x020
>  #define  DPD_SAMPLE_ENABLE		BIT(0)
> @@ -87,6 +93,11 @@
>  
>  #define PMC_SCRATCH41			0x140
>  
> +#define PMC_WAKE2_MASK			0x160
> +#define PMC_WAKE2_LEVEL			0x164
> +#define PMC_WAKE2_STATUS		0x168
> +#define PMC_SW_WAKE2_STATUS		0x16c
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -1922,6 +1933,55 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>  	.alloc = tegra_pmc_irq_alloc,
>  };
>  
> +static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +{
> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq == ULONG_MAX)
> +		return 0;
> +
> +	offset = data->hwirq / 32;
> +	bit = data->hwirq % 32;
> +
> +	/*
> +	 * Latch wakeups to SW_WAKE_STATUS register to capture events
> +	 * that would not make it into wakeup event register during LP0 exit.
> +	 */
> +	value = tegra_pmc_readl(pmc, PMC_CNTRL);
> +	value |= PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	udelay(120);

Why it takes so much time to latch the values? Shouldn't some status-bit
be polled for the completion of latching?

Is this register-write really getting buffered in the PMC?

> +	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
> +	tegra_pmc_writel(pmc, value, PMC_CNTRL);
> +	udelay(120);

120 usecs to remove latching, really?

> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
> +	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
> +
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
> +	tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
> +
> +	/* enable PMC wake */
> +	if (data->hwirq >= 32)
> +		offset = PMC_WAKE2_MASK;
> +	else
> +		offset = PMC_WAKE_MASK;
> +
> +	value = tegra_pmc_readl(pmc, offset);
> +
> +	if (on)
> +		value |= 1 << bit;
> +	else
> +		value &= ~(1 << bit);
> +
> +	tegra_pmc_writel(pmc, value, offset);

Why the latching is done *before* writing into the WAKE registers? What
it is latching then?

> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  {
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> @@ -1954,6 +2014,49 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	return 0;
>  }
>  
> +static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> +	unsigned int offset, bit;
> +	u32 value;
> +
> +	if (data->hwirq == ULONG_MAX)
> +		return 0;
> +
> +	offset = data->hwirq / 32;
> +	bit = data->hwirq % 32;
> +
> +	if (data->hwirq >= 32)
> +		offset = PMC_WAKE2_LEVEL;
> +	else
> +		offset = PMC_WAKE_LEVEL;
> +
> +	value = tegra_pmc_readl(pmc, offset);
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |= 1 << bit;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		value &= ~(1 << bit);
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
> +		value ^= 1 << bit;
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	tegra_pmc_writel(pmc, value, offset);

Shouldn't the WAKE_LEVEL be latched as well?

> +	return 0;
> +}
> +
>  static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>  {
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
> @@ -2540,6 +2643,10 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
>  	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
>  };
>  
> +static const struct tegra_wake_event tegra210_wake_events[] = {
> +	TEGRA_WAKE_IRQ("rtc", 16, 2),
> +};
> +
>  static const struct tegra_pmc_soc tegra210_pmc_soc = {
>  	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>  	.powergates = tegra210_powergates,
> @@ -2557,10 +2664,14 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>  	.regs = &tegra20_pmc_regs,
>  	.init = tegra20_pmc_init,
>  	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
> +	.irq_set_wake = tegra210_pmc_irq_set_wake,
> +	.irq_set_type = tegra210_pmc_irq_set_type,
>  	.reset_sources = tegra210_reset_sources,
>  	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
>  	.reset_levels = NULL,
>  	.num_reset_levels = 0,
> +	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
> +	.wake_events = tegra210_wake_events,
>  };
>  
>  #define TEGRA186_IO_PAD_TABLE(_pad)					     \
> 

