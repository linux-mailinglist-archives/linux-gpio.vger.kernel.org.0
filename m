Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A811E3FF5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 13:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgE0L0f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 07:26:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62289 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730009AbgE0L0d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 07:26:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590578793; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=P25q6ipZ3riPqbhrRJ+PtUgnCNFkPSplK5OpM68AuG8=; b=fV7hmTw5QDMH6BhqKe0FMigoJ7XbY4kEXr7y9ABKaCm58ry2Z+0/qBza8/Bxwmt8ekhJOiuQ
 rMkOHo3FK7gyEFNWosSqPmX3YGZgGpDCK3ThFO02Wzimcy1m/Mk53TR7PMj26jdJCveYp7zw
 oEbUHtTcLni7J72/o4nRypiejhg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ece4e6037a454afcbcfe36f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 11:26:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0AF8C433B1; Wed, 27 May 2020 11:26:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.1.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AFE3C433C9;
        Wed, 27 May 2020 11:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AFE3C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org,
        mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
 <159057264232.88029.4708934729701385486@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <4e070cda-8c22-c554-610e-172320045840@codeaurora.org>
Date:   Wed, 27 May 2020 16:56:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159057264232.88029.4708934729701385486@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/27/2020 3:14 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-05-23 10:11:10)
>> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
>> overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
>> callback is implemented then genirq takes unlazy path to disable irq.
>>
>> Underlying irqchip may not want to implement irq_disable callback to lazy
>> disable irq when client drivers invokes disable_irq(). By overriding
>> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
>>
>> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
>> if irqchip implemented irq_disable. In cases where irq_disable is not
>> implemented irq_mask is overridden. Similarly override irq_enable callback
>> only if irqchip implemented irq_enable otherwise irq_unmask is overridden.
>>
>> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> This isn't a proper Fixes line. Should have quotes
>
> Fixes: 461c1a7d4733 ("gpiolib: override irq_enable/disable")
Thanks for pointing this, i will address in next revision.
>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/gpio/gpiolib.c      | 55 +++++++++++++++++++++++++++++----------------
>>   include/linux/gpio/driver.h | 13 +++++++++++
>>   2 files changed, 49 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index eaa0e20..3810cd0 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2465,32 +2465,37 @@ static void gpiochip_irq_relres(struct irq_data *d)
>>          gpiochip_relres_irq(gc, d->hwirq);
>>   }
>>   
>> +static void gpiochip_irq_mask(struct irq_data *d)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +
>> +       if (gc->irq.irq_mask)
>> +               gc->irq.irq_mask(d);
>> +       gpiochip_disable_irq(gc, d->hwirq);
> How does this work in the lazy case when I want to drive the GPIO? Say I
> have a GPIO that is also an interrupt. The code would look like
>
>   struct gpio_desc *gpio = gpiod_get(...)
>   unsigned int girq = gpiod_to_irq(gpio)
>
>   request_irq(girq, ...);
>
>   disable_irq(girq);
>   gpiod_direction_output(gpio, 1);
>
> In the lazy case genirq wouldn't call the mask function until the first
> interrupt arrived on the GPIO line. If that never happened then wouldn't
> we be blocked in gpiod_direction_output() when the test_bit() sees
> FLAG_USED_AS_IRQ? Or do we need irqs to be released before driving
> gpios?

The client driver can decide to unlazy disable IRQ with below API...

  irq_set_status_flags(girq, IRQ_DISABLE_UNLAZY);

This will immediatly invoke mask function (unlazy disable) from genirq, 
even though irq_disable is not implemented.

Thanks,
Maulik
>
>> +}
>> +
>> +static void gpiochip_irq_unmask(struct irq_data *d)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +
>> +       gpiochip_enable_irq(gc, d->hwirq);
>> +       if (gc->irq.irq_unmask)
>> +               gc->irq.irq_unmask(d);
>> +}
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

