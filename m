Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200002B3F52
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 10:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgKPJC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 04:02:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:34438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728365AbgKPJC1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Nov 2020 04:02:27 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7571C221F9;
        Mon, 16 Nov 2020 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605517346;
        bh=xUZoMi0rvbYP7rpqozjgEpVS/n455aBvjj/2Sag7yL0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Lp7rem813l1TjJpdEn0K061sidkzGalRUFmLg1QFpK+4r9cCBpJ1LewligFs2sfQS
         5hVkgUiMm2y36NYtT/pShh14aI+pJ5hboXaez9LACtVbfIC8qhSy2CZcHwJREecNOM
         iIWy/XjpW4tqtetyPurRVS6knl4AmlYAYgxaCmnA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1keaP2-00Axbq-CD; Mon, 16 Nov 2020 09:02:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Nov 2020 09:02:24 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 2/2] RFT: gpio: tegra186: Set affinity callback to parent
In-Reply-To: <20201113214448.GA2138577@ulmo>
References: <20201111140628.24067-1-linus.walleij@linaro.org>
 <20201111140628.24067-2-linus.walleij@linaro.org>
 <20201113214448.GA2138577@ulmo>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <08147080c7af44420e0744249df6b26d@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: thierry.reding@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, treding@nvidia.com, vidyas@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus, Thierry,

On 2020-11-13 21:44, Thierry Reding wrote:
> On Wed, Nov 11, 2020 at 03:06:28PM +0100, Linus Walleij wrote:
>> This assigns the .irq_set_affinity to the parent callback.
>> I assume the Tegra186 is an SMP system so this would be
>> beneficial.
>> 
>> I used the pattern making the hirerarchy tolerant for missing
>> parent as in Marc's earlier patch.
>> 
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Vidya Sagar <vidyas@nvidia.com>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  drivers/gpio/gpio-tegra186.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/gpio/gpio-tegra186.c 
>> b/drivers/gpio/gpio-tegra186.c
>> index 9500074b1f1b..5060e81f5f49 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -444,6 +444,16 @@ static int tegra186_irq_set_wake(struct irq_data 
>> *data, unsigned int on)
>>  	return 0;
>>  }
>> 
>> +static int tegra186_irq_set_affinity(struct irq_data *data,
>> +				     const struct cpumask *dest,
>> +				     bool force)
>> +{
>> +	if (data->parent_data)
>> +		return irq_chip_set_affinity_parent(data, dest, force);
>> +
>> +	return 0;

Having come to my senses, this should definitely return an error when
there is no parent is present (i.e. we can't claim success when the
affinity hasn't changed).

>> +}
>> +
>>  static void tegra186_gpio_irq(struct irq_desc *desc)
>>  {
>>  	struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
>> @@ -690,6 +700,7 @@ static int tegra186_gpio_probe(struct 
>> platform_device *pdev)
>>  	gpio->intc.irq_unmask = tegra186_irq_unmask;
>>  	gpio->intc.irq_set_type = tegra186_irq_set_type;
>>  	gpio->intc.irq_set_wake = tegra186_irq_set_wake;
>> +	gpio->intc.irq_set_affinity = tegra186_irq_set_affinity;
>> 
>>  	irq = &gpio->gpio.irq;
>>  	irq->chip = &gpio->intc;
> 
> This does seem to mostly work, but I do get this new warning during
> boot:
> 
>     [    6.406230] genirq: irq_chip gpio did not update eff. affinity
> mask of irq 70
> 
> Any idea what that's supposed to mean? I can probably dig in some more
> early next week to see if I can track down why exactly that happens.

I can't however reproduce this on my Jetson-TX2. Can you post the 
content
of /sys/kernel/debug/irq/irqs/70?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
