Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999ED49D19
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 11:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfFRJ0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 05:26:35 -0400
Received: from foss.arm.com ([217.140.110.172]:59236 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729233AbfFRJ0f (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 05:26:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616ED344;
        Tue, 18 Jun 2019 02:26:34 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D6923F246;
        Tue, 18 Jun 2019 02:26:27 -0700 (PDT)
Subject: Re: [PATCH V3 12/17] soc/tegra: pmc: allow support for more tegra
 wake
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        digetx@gmail.com, devicetree@vger.kernel.org
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-13-git-send-email-skomatineni@nvidia.com>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
 Z46HaNmN2hZS/oJ69c1DI5Rcww==
Organization: ARM Ltd
Message-ID: <bbbaaad7-d20d-c648-af73-ec0960a33896@arm.com>
Date:   Tue, 18 Jun 2019 10:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560843991-24123-13-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18/06/2019 08:46, Sowjanya Komatineni wrote:
> This patch allows to create separate irq_set_wake and irq_set_type
> implementations for different tegra designs PMC that has different
> wake models which require difference wake registers and different
> programming sequence.
> 
> AOWAKE model support is available for Tegra186 and Tegra194 only
> and it resides within PMC and supports tiered wake architecture.
> 
> Tegra210 and prior tegra designs uses PMC directly to receive wake
> events and coordinate the wake sequence.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index edd4fe06810f..e87f29a35fcf 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -226,6 +226,8 @@ struct tegra_pmc_soc {
>  	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>  				   struct device_node *np,
>  				   bool invert);
> +	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
> +	int (*irq_set_type)(struct irq_data *data, unsigned int type);
>  
>  	const char * const *reset_sources;
>  	unsigned int num_reset_sources;
> @@ -1919,7 +1921,7 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>  	.alloc = tegra_pmc_irq_alloc,
>  };
>  
> -static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
> +static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  {
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>  	unsigned int offset, bit;
> @@ -1951,7 +1953,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	return 0;
>  }
>  
> -static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
> +static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>  {
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>  	u32 value;
> @@ -2005,8 +2007,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>  	pmc->irq.irq_unmask = irq_chip_unmask_parent;
>  	pmc->irq.irq_eoi = irq_chip_eoi_parent;
>  	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
> -	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
> -	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
> +	if (pmc->soc->irq_set_type)
> +		pmc->irq.irq_set_type = pmc->soc->irq_set_type;
> +	if (pmc->soc->irq_set_wake)
> +		pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;

Two cases: either the value is non NULL, and we assign it, or it is
NULL, and we leave it to what it was, presumably NULL. I guess you can
drop the both ifs.

>  
>  	pmc->domain = irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
>  					       &tegra_pmc_irq_domain_ops, pmc);
> @@ -2679,6 +2683,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
>  	.regs = &tegra186_pmc_regs,
>  	.init = NULL,
>  	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
> +	.irq_set_wake = tegra186_pmc_irq_set_wake,
> +	.irq_set_type = tegra186_pmc_irq_set_type,
>  	.reset_sources = tegra186_reset_sources,
>  	.num_reset_sources = ARRAY_SIZE(tegra186_reset_sources),
>  	.reset_levels = tegra186_reset_levels,
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
