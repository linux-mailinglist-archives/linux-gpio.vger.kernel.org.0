Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B92445A0C4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 11:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbhKWLC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 06:02:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30335 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235451AbhKWLCZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 06:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637665156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lynC94ZtmkCXQpOl6eW0sx52kbXDJIgOx2KMV9JUH8Q=;
        b=Gatl3MQnpm15PB9D+hGz1iA0u1ddewhiqyywZ+WbqQKPzavpUdXYPfX2fzIENVvcCcYpXR
        tFplSBcUT/2Bo8N/S1qfDREI9fAtUjR3qeV5a0thOn4kcruvcly9+5bTzfGUPKkxdZHilz
        bZmVmWgZPaRh/3Lg1eUeF1sMgUMLJOo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-273-jI7WvZDfMkakxROKYpx0uw-1; Tue, 23 Nov 2021 05:59:14 -0500
X-MC-Unique: jI7WvZDfMkakxROKYpx0uw-1
Received: by mail-ed1-f70.google.com with SMTP id k7-20020aa7c387000000b003e7ed87fb31so17583912edq.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 02:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lynC94ZtmkCXQpOl6eW0sx52kbXDJIgOx2KMV9JUH8Q=;
        b=CQyhw5Aie9/0Yj+XQt3ZDbExTCAtrUotXc+2WdafwpwViJRKGj1OjAaIdQGxg7uehG
         8JjFBydQs+YY6dCXXh7/j6HZ4YwvK7LqF2ioqm/2y1GUes3PILimSUvrESx8N8fFXfew
         1m7HHZaNfxsQnX4KICLiFo8CmpVGtvrnWl754W7ZJKOYduUSf9Ln1CyhShy3CmH6n392
         KDKSIRO1ZtSTle7rZHrE9aMNhFqF5c6lkujyqzH1dNAgRU5ljT85teWcspIYcG7lpNnS
         eEwtST6155d0Yc7Y6i4Op/FoCmNuhlJa0HorWMT/oueKynypEPNj5Dt24C82Co2kKLX9
         t/sA==
X-Gm-Message-State: AOAM533+ivd6IvYY74jpCuwk+BMROxI8VVTFVOU3ZiVqCP9qLaTmTO0/
        NbiuPjuca7QJ1Z1JoiwQ5+Sw55KS8VgS+5zD6tSD9hHmnKpvQ6VSFF/zKRy2ax4GVXMxv7wE6F8
        nbCw5oqREFZ1bSwptoS1CrQ==
X-Received: by 2002:a17:907:60d0:: with SMTP id hv16mr6273128ejc.425.1637665153476;
        Tue, 23 Nov 2021 02:59:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8cNI5O0wFiwzi5kKu0Zv+qGoyjQwDfk6+cMv7U+iOKAP3F22UYiDQpRALj72uVmCX03Xrag==
X-Received: by 2002:a17:907:60d0:: with SMTP id hv16mr6273104ejc.425.1637665153291;
        Tue, 23 Nov 2021 02:59:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v3sm5878815edc.69.2021.11.23.02.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 02:59:12 -0800 (PST)
Message-ID: <5afe8a56-b0aa-d063-d6a0-9ec459d138b6@redhat.com>
Date:   Tue, 23 Nov 2021 11:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] gpiolib: acpi: Do not set the IRQ type if the IRQ is
 already in use
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20211122220416.11241-1-hdegoede@redhat.com>
 <YZy2CiOrEJc+6TRz@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YZy2CiOrEJc+6TRz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/23/21 10:36, Andy Shevchenko wrote:
> On Mon, Nov 22, 2021 at 11:04:16PM +0100, Hans de Goede wrote:
>> If the IRQ is already in use, then acpi_dev_gpio_irq_get_by() really
>> should not change the type underneath the current owner.
>>
>> I specifically hit an issue with this an a Chuwi Hi8 Super (CWI509) Bay
>> Trail tablet, when the Boot OS selection in the BIOS is set to Android.
>> In this case _STA for a MAX17047 ACPI I2C device wrongly returns 0xf and
>> the _CRS resources for this device include a GpioInt pointing to a GPIO
>> already in use by an _AEI handler, with a different type then specified
>> in the _CRS for the MAX17047 device. Leading to the acpi_dev_gpio_irq_get()
>> call done by the i2c-core-acpi.c code changing the type breaking the
>> _AEI handler.
>>
>> Now this clearly is a bug in the DSDT of this tablet (in Android mode),
>> but in general calling irq_set_irq_type() on an IRQ which already is
>> in use seems like a bad idea.
> 
> I'm fine with the change, one comment below, though.
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpio/gpiolib-acpi.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index 985e8589c58b..24cd86bf2c4c 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -1056,8 +1056,12 @@ int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int ind
>>  			irq_flags = acpi_dev_get_irq_type(info.triggering,
>>  							  info.polarity);
>>  
>> -			/* Set type if specified and different than the current one */
>> -			if (irq_flags != IRQ_TYPE_NONE &&
>> +			/*
>> +			 * If the IRQ is not already in use then set type
>> +			 * if specified and different than the current one.
>> +			 */
>> +			if (can_request_irq(irq, irq_flags) &&
>> +			    irq_flags != IRQ_TYPE_NONE &&
>>  			    irq_flags != irq_get_trigger_type(irq))
>>  				irq_set_irq_type(irq, irq_flags);
> 
> What about issuing a debug (?) message
> 
> 			if (can_request_irq(irq, irq_flags) {
> 				if (irq_flags != IRQ_TYPE_NONE &&
> 				    irq_flags != irq_get_trigger_type(irq))
> 					irq_set_irq_type(irq, irq_flags);
> 			} else {
> 				dev_dbg(..., FW_BUG "IRQ %d already in use\n", irq);
> 			}
> 
> ?

That is a good idea, I would even be fine with making it a dev_warn, because it
really is a FW_BUG if we get here. If we turn out to hit this too much we
can always lower the log level later.

Shall I submit a v2 with your suggestion, but then using a dev_warn ?

Regards,

Hans

