Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1D61DF865
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 19:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgEWRHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 13:07:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27427 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728468AbgEWRHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 13:07:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590253641; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bROKX/djbcXfyKcI+T3w7r8zl613AlHc8MDTB/AnzJI=; b=jLxzbP6ynH6Tnp3OtTIy1HEiDHufZtcSTRn4arp44jk1bEToUoEUiCezmAjNQrn0Fu4JP/da
 E0Wo/EWA5GybqjLh5ivE1X15Vu6aLEiPM7hFw3gmudRZqrHbVHS7bfUBnxWjPExC7Ns+TnKs
 bR9gZpWA0bsnL2EELBSHKkhUekI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ec95838569a62550d6cb5ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 May 2020 17:07:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6496C43387; Sat, 23 May 2020 17:07:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.147.123])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6317FC433C6;
        Sat, 23 May 2020 17:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6317FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Marc Zyngier <maz@kernel.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        swboyd@chromium.org, evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
 <1590153569-21706-2-git-send-email-mkshah@codeaurora.org>
 <5888fc645d26b4780e9d9c6fd582374f@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e08c9f6e-0e84-5f2a-766d-7a1c45bd977a@codeaurora.org>
Date:   Sat, 23 May 2020 22:36:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5888fc645d26b4780e9d9c6fd582374f@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/23/2020 3:12 PM, Marc Zyngier wrote:
> On 2020-05-22 14:19, Maulik Shah wrote:
>> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' 
>> gpiolib
>> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
>> callback is implemented then genirq takes unlazy path to disable irq.
>>
>> Underlying irqchip may not want to implement irq_disable callback to 
>> lazy
>> disable irq when client drivers invokes disable_irq(). By overriding
>> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>>
>> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback 
>> only
>> if irqchip implemented irq_disable. In cases where irq_disable is not
>> implemented irq_mask is overridden. Similarly override irq_enable 
>> callback
>> only if irqchip implemented irq_enable otherwise irq_unmask is 
>> overridden.
>>
>> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>  drivers/gpio/gpiolib.c      | 59 
>> +++++++++++++++++++++++++++++----------------
>>  include/linux/gpio/driver.h | 13 ++++++++++
>>  2 files changed, 51 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index eaa0e20..a8fdc74 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2465,33 +2465,38 @@ static void gpiochip_irq_relres(struct 
>> irq_data *d)
>>      gpiochip_relres_irq(gc, d->hwirq);
>>  }
>>
>> +static void gpiochip_irq_mask(struct irq_data *d)
>> +{
>> +    struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>> +
>> +    if (chip->irq.irq_mask)
>> +        chip->irq.irq_mask(d);
>> +    gpiochip_disable_irq(chip, d->hwirq);
>> +}
>> +
>> +static void gpiochip_irq_unmask(struct irq_data *d)
>> +{
>> +    struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
>> +
>> +    gpiochip_enable_irq(chip, d->hwirq);
>> +    if (chip->irq.irq_unmask)
>> +        chip->irq.irq_unmask(d);
>> +}
>> +
>>  static void gpiochip_irq_enable(struct irq_data *d)
>>  {
>>      struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>
>> -    gpiochip_enable_irq(gc, d->hwirq);
>> -    if (gc->irq.irq_enable)
>> -        gc->irq.irq_enable(d);
>> -    else
>> -        gc->irq.chip->irq_unmask(d);
>> +    gpiochip_enable_irq(chip, d->hwirq);
>
> You really never compiled this, did you?
>
> I've stopped looking at this. Please send something that you will have 
> actually tested.
>
>         M.

Apologies.

I did tested out on internal devices based on kernel 5.4 as well as 
linux-next with sc7180.

While posting i somehow taken patch from kernel 5.4 and messed up this 
patch during merge conflicts.

I fixed this in v2 and posted out changes that cleanly applies on latest 
linux-next tag (next-20200521).

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

