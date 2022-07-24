Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E7657F61E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 19:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiGXRR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 13:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiGXRR4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 13:17:56 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC32810543
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 10:17:55 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A917684013;
        Sun, 24 Jul 2022 19:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658683074;
        bh=WFsQYwBMhbATg/k4IjKX+jBIibh78S36xXkw3h0FggA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fvKSpda0jhFKSWp3LsKQ8u0GZ4cpcyrTkbMycy5YZCRtNtnv/zwhdQfr+H3oAgdka
         Oi4fj5c/prmBDxMHOf86Uvihc8h9Xl9wPIQO+sLMHZjt1l812sT+bGiqwIpZwTqav6
         XaMdwTQ76QMQ9fmmuv0jdUEshMVtLA67DYSsc4Dd5Y1sPI2uBq3JrbHouKF46G6/va
         ChjxUAv4S1zBfskU+fk/AEAPeojmnEbNAtZZzGeAf+cx57L1Qh/dGsGr14Po3izH5j
         /9hin7vCo+fkfcmWhz8tp9FJCcBOEJr0o7O+D3DMxHl8gnc8zBoIJQiUzR6yaP1GG5
         EMPYj1t5Z4bgQ==
Message-ID: <27386fc5-90a5-12ed-f819-977b11de641c@denx.de>
Date:   Sun, 24 Jul 2022 19:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] gpio: mxc: Always set GPIOs used as interrupt source
 to INPUT mode
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220724023418.441899-1-marex@denx.de>
 <878roidfm9.wl-maz@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <878roidfm9.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/24/22 11:28, Marc Zyngier wrote:
> On Sun, 24 Jul 2022 03:34:18 +0100,
> Marek Vasut <marex@denx.de> wrote:
>>
>> Always configure GPIO pins which are used as interrupt source as INPUTs.
>> In case the default pin configuration is OUTPUT, or the prior stage does
>> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
>> INPUT and no interrupts are received.
>>
>> Always configure interrupt source GPIO pin as input to fix the above case.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Loic Poulain <loic.poulain@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> ---
>> V2: Actually update and clear bits in GDIR register
>> ---
>>   drivers/gpio/gpio-mxc.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
>> index c871602fc5ba9..ed58441627d92 100644
>> --- a/drivers/gpio/gpio-mxc.c
>> +++ b/drivers/gpio/gpio-mxc.c
>> @@ -147,7 +147,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>   {
>>   	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>>   	struct mxc_gpio_port *port = gc->private;
>> -	u32 bit, val;
>> +	u32 bit, val, dir;
>>   	u32 gpio_idx = d->hwirq;
>>   	int edge;
>>   	void __iomem *reg = port->base;
>> @@ -204,6 +204,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
>>   
>>   	writel(1 << gpio_idx, port->base + GPIO_ISR);
>>   
>> +	dir = readl(port->base + GPIO_GDIR);
>> +	dir &= ~BIT(gpio_idx);
>> +	writel(dir, port->base + GPIO_GDIR);
>> +
> 
> This is obviously extremely racy, as another CPU could be doing the
> same thing in parallel for a line that shares the same register.
> Looking at the driver, it is clear that it was all written at a time
> when SMP was only a pretty distant concern (i.e. the authors never
> considered it a possibility).
> 
> I'd be fine with it if there was no SMP platform using this, but there
> is at least one (imx7d).
> 
> So please fix this first (placing all RMW sequences behind a lock),
> and only then add this change.

Done in separate (new) patch for V3.
