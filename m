Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4301E79F3
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 11:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgE2J6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 05:58:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47201 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbgE2J6X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 May 2020 05:58:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590746302; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=WpevIkTJ1MbRahbSDCiGvaiXrFgelDxdUivkVyI7CxE=; b=KfL3OBQvaDTGdeOxJse8cMiwMSvDTfCNjDKGXmSS/yQ/x2Mjg+MgZ9uNeSTJzcBXJtbyu+Ej
 +KznTGj/ErniLhAhXFDqNm7uZ0QR4DvlL6pHS4AucecLP+X2OA9srfePPhvMUnFMrtcNU76W
 xwUwhng2CdvOt2rGxWf8yrrQQWY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ed0dcabcb0458693383a808 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 09:58:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA186C43395; Fri, 29 May 2020 09:58:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.129] (unknown [106.222.19.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBEA7C433C9;
        Fri, 29 May 2020 09:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBEA7C433C9
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
 <4e070cda-8c22-c554-610e-172320045840@codeaurora.org>
 <159062812628.69627.2153485337510882984@swboyd.mtv.corp.google.com>
 <948defc1-5ea0-adbb-185b-5f5a81f2e28a@codeaurora.org>
 <159070452036.69627.17850758520477366824@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <513b9bec-2a9e-3306-32d1-6cc500206645@codeaurora.org>
Date:   Fri, 29 May 2020 15:27:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159070452036.69627.17850758520477366824@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 5/29/2020 3:52 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-05-28 06:11:23)
>> Hi,
>>
>> On 5/28/2020 6:38 AM, Stephen Boyd wrote:
>>> Quoting Maulik Shah (2020-05-27 04:26:14)
>>>> On 5/27/2020 3:14 PM, Stephen Boyd wrote:
>>>>> Quoting Maulik Shah (2020-05-23 10:11:10)
>>>>>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>>>>> index eaa0e20..3810cd0 100644
>>>>>> --- a/drivers/gpio/gpiolib.c
>>>>>> +++ b/drivers/gpio/gpiolib.c
>>>>>> @@ -2465,32 +2465,37 @@ static void gpiochip_irq_relres(struct irq_data *d)
>>>>>>            gpiochip_relres_irq(gc, d->hwirq);
>>>>>>     }
>>>>>>     
>>>>>> +static void gpiochip_irq_mask(struct irq_data *d)
>>>>>> +{
>>>>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>>>>> +
>>>>>> +       if (gc->irq.irq_mask)
>>>>>> +               gc->irq.irq_mask(d);
>>>>>> +       gpiochip_disable_irq(gc, d->hwirq);
>>>>> How does this work in the lazy case when I want to drive the GPIO? Say I
>>>>> have a GPIO that is also an interrupt. The code would look like
>>>>>
>>>>>     struct gpio_desc *gpio = gpiod_get(...)
>>>>>     unsigned int girq = gpiod_to_irq(gpio)
>>>>>
>>>>>     request_irq(girq, ...);
>>>>>
>>>>>     disable_irq(girq);
>>>>>     gpiod_direction_output(gpio, 1);
>>>>>
>>>>> In the lazy case genirq wouldn't call the mask function until the first
>>>>> interrupt arrived on the GPIO line. If that never happened then wouldn't
>>>>> we be blocked in gpiod_direction_output() when the test_bit() sees
>>>>> FLAG_USED_AS_IRQ? Or do we need irqs to be released before driving
>>>>> gpios?
>>>> The client driver can decide to unlazy disable IRQ with below API...
>>>>
>>>>     irq_set_status_flags(girq, IRQ_DISABLE_UNLAZY);
>>>>
>>>> This will immediatly invoke mask function (unlazy disable) from genirq,
>>>> even though irq_disable is not implemented.
>>>>
>>> Sure a consumer can disable the lazy feature, but that shouldn't be
>>> required to make this work. The flag was introduced in commit
>>> e9849777d0e2 ("genirq: Add flag to force mask in
>>> disable_irq[_nosync]()") specifically to help devices that can't disable
>>> the interrupt in their own device avoid a double interrupt.
>> i don't think this will be a problem.
>>
>> Case 1) Client driver have locked gpio to be used as IRQ using
>> gpiochip_lock_as_irq()
>>
>> In this case, When client driver want to change the direction for a
>> gpio, they will invoke gpiod_direction_output().
>> I see it checks for two flags (pasted below), if GPIO is used as IRQ and
>> whether its enabled IRQ or not.
>>
>>          /* GPIOs used for enabled IRQs shall not be set as output */
>>           if (test_bit(FLAG_USED_AS_IRQ, &desc->flags) &&
>>               test_bit(FLAG_IRQ_IS_ENABLED, &desc->flags)) {
>>
>> The first one (FLAG_USED_AS_IRQ) is set only if client driver in past
>> have locked gpio to use as IRQ with a call to gpiochip_lock_as_irq()
>> then it never gets unlocked until clients invoke gpiochip_unlock_as_irq().
>>
>> So i presume the client driver which in past locked gpio to be used as
>> IRQ, now wants to change direction then it will
>> a. first unlock to use as IRQ
>> b. then change the direction.
> How does a client driver unlock to use as an IRQ though? I don't
> understand how that is done. gpiochip_lock_as_irq() isn't a gpio
> consumer API, it's a gpiochip/gpio provider API.

>>In the lazy case genirq wouldn't call the mask function until the first
>>interrupt arrived on the GPIO line. If that never happened then wouldn't
>>we be blocked in gpiod_direction_output() when the test_bit() sees
>>FLAG_USED_AS_IRQ?

What i was trying to explain in above two cases is..
FLAG_USED_AS_IRQ is set only when client driver locks GPIO to be used as IRQ
with gpiochip_lock_as_irq() API call.

Coming to query of test_bit() seeing this flag as set won't be a problem.
Lets take an example...

1. Client driver locks gpio to be used as IRQ gpiochip_lock_as_irq()
    This makes gpiolib set two flags..
    a. FLAG_USED_AS_IRQ
    b. FLAG_IRQ_IS_ENABLED
    
    Note that this is the only API which sets the flag (a) FLAG_USED_AS_IRQ.
    
2. During gpiochip_disable_irq() it only clears the flag (b) but the flag (a) is still set.

3. Now client driver does disable_irq()...
    With this patch, in case the irq_chip did not implement irq_disable callback then irq_mask will be overridden.
    so during first disable_irq() call, the gpiolib won't come to immediatly know that interrupt is disabled (lazy disable)
    hence both these flags are still set.

4. After disabling irq, client driver want to change the direction, so it wants to now call gpiod_direction_output()
    But before calling this, client driver knows that in step (1), client driver locked GPIO to be used only as IRQ.
    So GPIO cannot be used as any other purpose other than IRQ till the point its locked.
	
    hence before calling  gpiod_direction_output(), it has to first invoke gpiochip_unlock_as_irq().
    Calling this will clear both flags and allow GPIO to change the direction.
	
    Now client can invoke gpiod_direction_output() and the test_bit() check inside this won't complain.

Case 1) in my previous mail was where in above example client driver did step (1) which locks the gpio as IRQ then
its expected to do unlock in step (4) before changing direction.
so no issue in case 1) regarding test_bit complain.

Case 2) is where driver didn't even do step-1, so in step-4, they can directly invoke gpiod_direction_output()
client didn't lock, so the flag FLAG_USED_AS_IRQ is never set, so test_bit for this flag won't complain.
    
So in both cases it looks to be working as expected to me.
Hope that its answers your query.

Thanks,
Maulik

>> Once it unlocks in step (a), both these flags will be cleared and there
>> won't be any error in changing direction in step (b).

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

