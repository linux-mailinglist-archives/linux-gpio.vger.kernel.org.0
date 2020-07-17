Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5789B223D93
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgGQOCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:02:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38156 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726210AbgGQOCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594994559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z669p+NxuzL8CzBu8bqCOhr9SLQdYWIa1ZWZSNHCHVU=;
        b=Ne+wQQPLOAHOHePGrXAgvJHWsT/7MIT9vLmD6eBFX5SNOeCpte75rq5I48V8oUekLd6wen
        W2gD3Uz18MvZGvqKHjp7rQbd1vtF/9O80cYOwuuyEk47A8iHiAdcWS1S/NnMLWvoX0IJco
        jfwb92ypyFZelZCeWr2mfjWO9X0mTaI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-G6AZRXbXOAO4mk8dScQCvA-1; Fri, 17 Jul 2020 10:02:37 -0400
X-MC-Unique: G6AZRXbXOAO4mk8dScQCvA-1
Received: by mail-wr1-f71.google.com with SMTP id y13so8961297wrp.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z669p+NxuzL8CzBu8bqCOhr9SLQdYWIa1ZWZSNHCHVU=;
        b=I89ZwbvkSISeWzvZuM8940Mx1nKMjvUY+KOzV6hcVawUMc12IwCIgWQKO2IrOWBHcE
         8gWvN1kJzC6YsOmA+3bvR8k7NudIrdFWnT14bbnzlUmeXN+eOWRDzhDLlu14vIqk2fHs
         5022qlKo4ttvWYw49ytWn5CTUF2hed1MbsN3svqkfnAWIOnXNMKFm/niRqsNtileIr/G
         87a5NO83N1eNgdwe8kT6cvR0ajtV74BtBNAaVuqHcCbmfCL2j9JwMldPMO4L2Kfdsb8h
         KaemCaXLeDK3B4ioKS/54HPiAWK9aNZPqDqTMZEk5NbV/7p70oHyJ2+PfCK74OkSylc+
         K90A==
X-Gm-Message-State: AOAM532nFEfUEgFxY8wcQZ9cSkYJ98hRrKCJ48sE9v/EOk3Af2/l6P7P
        Np2yxoDZlRNY4+1Kapsv+TAsjcutxpJgC9NXNEwHWzWsDtd/efwoPmy1uvlcC1greJZIraZpYIl
        0FyCEYf57uEC/1vDQBLc8UA==
X-Received: by 2002:adf:80c2:: with SMTP id 60mr9593087wrl.388.1594994556595;
        Fri, 17 Jul 2020 07:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrvsXU6mTCgEojQ8zX51MPyKN+DrgkOzfZ6i7YBuhfFJVNkiV+owZfVWUcOXm4FUp81RUoNg==
X-Received: by 2002:adf:80c2:: with SMTP id 60mr9593063wrl.388.1594994556433;
        Fri, 17 Jul 2020 07:02:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y6sm14752468wrr.74.2020.07.17.07.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 07:02:35 -0700 (PDT)
Subject: Re: [PATCH] gpio: crystalcove: Use irqchip template
From:   Hans de Goede <hdegoede@redhat.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20200717112558.15960-1-linus.walleij@linaro.org>
 <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com>
Message-ID: <fb6bb42b-b657-5cd7-7a58-236e10bfb547@redhat.com>
Date:   Fri, 17 Jul 2020 16:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 7/17/20 3:59 PM, Hans de Goede wrote:
> Hi,
> 
> On 7/17/20 1:25 PM, Linus Walleij wrote:
>> This makes the driver use the irqchip template to assign
>> properties to the gpio_irq_chip instead of using the
>> explicit calls to gpiochip_irqchip_add_nested() and
>> gpiochip_set_nested_irqchip(). The irqchip is instead
>> added while adding the gpiochip.
>>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Intel folks and Hans: I hope someone can test this, I'm
>> a bit uncertain if IRQs could fire before registering
>> the chip and if we need a hw_init() in this driver to cope.
> 
> I've added this to my personal tree for testing. I will get back
> to you when I've either hit an issue, or used it for a while without
> issues :)
> 
> Hmm, testing this might be tricky, I don't think any boards
> actually use any GPIOs on the PMIC (which this driver is for)
> as interrupts...
> 
> So the best I can do is boot a machine and test there are no
> regressions I guess.

Erm, it does not even compile:

drivers/gpio/gpio-crystalcove.c: In function ‘crystalcove_gpio_probe’:
drivers/gpio/gpio-crystalcove.c:357:10: error: ‘ch’ undeclared (first use in this function); did you mean ‘cg’?
   357 |  girq = &ch->chip.irq;
       |          ^~
       |          cg
drivers/gpio/gpio-crystalcove.c:357:10: note: each undeclared identifier is reported only once for each function it appears in

I've fixed this up locally.

Regards,

Hans


>> +    girq->default_type = IRQ_TYPE_NONE;
>> +    girq->handler = handle_simple_irq;
>> +    girq->threaded = true;
>>       retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
>>                         IRQF_ONESHOT, KBUILD_MODNAME, cg);
>> @@ -370,7 +372,11 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
>>           return retval;
>>       }
>> -    gpiochip_set_nested_irqchip(&cg->chip, &crystalcove_irqchip, irq);
>> +    retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
>> +    if (retval) {
>> +        dev_warn(&pdev->dev, "add gpio chip error: %d\n", retval);
>> +        return retval;
>> +    }
>>       return 0;
>>   }
>>

