Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533E651868
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbfFXQVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 12:21:48 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:18242 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732017AbfFXQVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 12:21:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d10f8970001>; Mon, 24 Jun 2019 09:21:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 24 Jun 2019 09:21:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 24 Jun 2019 09:21:45 -0700
Received: from [10.2.174.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 16:21:41 +0000
Subject: Re: [PATCH V4 13/18] soc/tegra: pmc: allow support for more tegra
 wake
To:     Marc Zyngier <marc.zyngier@arm.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <linus.walleij@linaro.org>, <stefan@agner.ch>,
        <mark.rutland@arm.com>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-14-git-send-email-skomatineni@nvidia.com>
 <86d0j3pfga.wl-marc.zyngier@arm.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <dc320c81-6601-4e6d-a7a0-57df8771bd99@nvidia.com>
Date:   Mon, 24 Jun 2019 09:21:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <86d0j3pfga.wl-marc.zyngier@arm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561393303; bh=XARYCg4Be2F4cVbObRkOiXOwjOP0Mst/Yjb4BxYksk0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pEd8vglzapKb+YjH1kGdq1VvI2uMA+mEhIyqxyWrXHKcbEabHER36cmfheBuAXH/+
         vwgY3pHKBGeLWWTaPihZ7JnQckG/pIOcjGpxkG22i4HM/fv2VvmS1F751NssxwWs5q
         yB1ylptYE7DJ09259Ltst/0zXgzj5VU0voWZe3SFKU5ZnE8Yyhr/rKGTYMb+GaYgbu
         BQNNfXXuCKZElcuZOLzroNxOOAtdMv2S8BOeu/AA92VpmzH7QwZxjzqXk17B/lN5B/
         apDiv7TaS+FHvQhgcDOylFeDL7wanZT2PtbhHQECsfolUVLfW3PDzKdo/quVC0BXQm
         VYS4YczznrIJg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/24/19 1:15 AM, Marc Zyngier wrote:
> On Mon, 24 Jun 2019 04:02:54 +0100,
> Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
>> This patch allows to create separate irq_set_wake and irq_set_type
>> implementations for different tegra designs PMC that has different
>> wake models which require difference wake registers and different
>> programming sequence.
>>
>> AOWAKE model support is available for Tegra186 and Tegra194 only
>> and it resides within PMC and supports tiered wake architecture.
>>
>> Tegra210 and prior tegra designs uses PMC directly to receive wake
>> events and coordinate the wake sequence.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/soc/tegra/pmc.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index edd4fe06810f..e87f29a35fcf 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -226,6 +226,8 @@ struct tegra_pmc_soc {
>>   	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
>>   				   struct device_node *np,
>>   				   bool invert);
>> +	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
>> +	int (*irq_set_type)(struct irq_data *data, unsigned int type);
>>   
>>   	const char * const *reset_sources;
>>   	unsigned int num_reset_sources;
>> @@ -1919,7 +1921,7 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
>>   	.alloc = tegra_pmc_irq_alloc,
>>   };
>>   
>> -static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>> +static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>   	unsigned int offset, bit;
>> @@ -1951,7 +1953,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>>   	return 0;
>>   }
>>   
>> -static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>> +static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>>   {
>>   	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>>   	u32 value;
>> @@ -2005,8 +2007,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
>>   	pmc->irq.irq_unmask = irq_chip_unmask_parent;
>>   	pmc->irq.irq_eoi = irq_chip_eoi_parent;
>>   	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
>> -	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
>> -	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
>> +	if (pmc->soc->irq_set_type)
>> +		pmc->irq.irq_set_type = pmc->soc->irq_set_type;
>> +	if (pmc->soc->irq_set_wake)
>> +		pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
> I already commented on how superfluous these 'if ()' where. If you
> disagree, please let me know why.
>
> Thanks,
>
> 	M.

Sorry Marc, missed it. Will fix in next version...


Thanks

Sowjanya

