Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3894210ADD0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 11:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfK0Kgq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 05:36:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47763 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726194AbfK0Kgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Nov 2019 05:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574851002;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GFzUFWMnwC3gBlsquGA1ChyUgP7oURltV+6gYlqsexE=;
        b=Z3cfmeSnOadJk2t8Z2aqRJJnsMGurMzd5NgLfKhyHQbDfVKJVb8soWFlH+RsJuur9jA3GF
        RIRMfZlLJwGhiZnDPKj61NY08jP+1MzV5oZtuZPSvIg/xCTGwv4iWfl9F3wNRxRyMlM9WX
        b9BGm8kAz712L9/Wrczqr3i0Ix1h8WM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-xiyRPjbtPNGJB1qQy-ADqA-1; Wed, 27 Nov 2019 05:36:41 -0500
Received: by mail-wm1-f69.google.com with SMTP id 199so2337647wmb.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 02:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GFzUFWMnwC3gBlsquGA1ChyUgP7oURltV+6gYlqsexE=;
        b=M6JqD92L79avMOISQtf9G2rbvnXZyDuKVHZql3SjeG0s6SPIh6AlDTuDvrBi0gOE5B
         ijZ50mjEOlrDEm9Wkf5lX81WG8nCt0vE/n2t6SRE55JTEomOD99vIdzUkZ9kDxz1CJ+K
         hpOtgGFCPYqfD6wMjZWCRQwJgI/lnsmR84h8n8NbumJaTXiWDMcoszxBr+tn+Q9ZNV4l
         ia7wqeVk1XUxtZLyTijfzdA3d25bJnHP8GHYLuAIJnTj78u6+CrIDxXJHe85q6L1k5uF
         rF+AoXN5ssoF/JKdr/5EMg7bBFBno+HYXJ3FoG3WEJEZy5juiuk/lFv5oW2WAvBv9B2E
         936w==
X-Gm-Message-State: APjAAAUexAtn4dB5VkzhyVab4O+cZ3pLcq/LfV4StIUcm16WmWG20f3f
        ZQSSBOqr+vOjjm+4qnSkiGmZvmvj5oG1QnHzPe5H/KD5QrhX1FUJaPLMnPoskxHf7DiHK+cbpM6
        IOHR6yszKEM5M7runZD+MKg==
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr3445748wma.34.1574851000377;
        Wed, 27 Nov 2019 02:36:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzY6uTJMgMV7O/H70pqSP6bPJpWu9bIbomuy8liliLdXmot/+CA0BhVghn77i9lOuM50l26A==
X-Received: by 2002:a1c:41c2:: with SMTP id o185mr3445730wma.34.1574851000149;
        Wed, 27 Nov 2019 02:36:40 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id e19sm6386483wme.6.2019.11.27.02.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2019 02:36:39 -0800 (PST)
Subject: Re: [PATCH 2/2] gpiolib: acpi: Add honor_wakeup module-option + quirk
 mechanism
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191122192334.61490-1-hdegoede@redhat.com>
 <20191122192334.61490-3-hdegoede@redhat.com>
 <20191125092539.GX32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b029fd67-c08d-5431-06b7-3a3738b26e08@redhat.com>
Date:   Wed, 27 Nov 2019 11:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191125092539.GX32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: xiyRPjbtPNGJB1qQy-ADqA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 25-11-2019 10:25, Andy Shevchenko wrote:
> On Fri, Nov 22, 2019 at 08:23:34PM +0100, Hans de Goede wrote:
>> On some laptops enabling wakeup on the GPIO interrupts used for ACPI _AEI
>> event handling causes spurious wakeups.
>>
>> This commit adds a new honor_wakeup option, defaulting to true (our current
>> behavior), which can be used to disable wakeup on troublesome hardware
>> to avoid these spurious wakeups.
>>
>> This is a workaround for an architectural problem with s2idle under Linux
>> where we do not have any mechanism to immediately go back to sleep after
>> wakeup events, other then for embedded-controller events using the standard
>> ACPI EC interface, for details see:
>> https://lore.kernel.org/linux-acpi/61450f9b-cbc6-0c09-8b3a-aff6bf9a0b3c@redhat.com/
>>
>> One series of laptops which is not able to suspend without this workaround
>> is the HP x2 10 Cherry Trail models, this commit adds a DMI based quirk
>> which makes sets honor_wakeup to false on these models.
> 
> I'm not against this approach (yeah, it seems we will always have a stream of
> quirks for BIOS enabled platforms, especially cheapest ones), though last word
> is by Rafael.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks.

> One nit below, though.
> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpio/gpiolib-acpi.c | 33 ++++++++++++++++++++++++++++++++-
>>   1 file changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index 2b47d906d536..9ce9b449ac4b 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -22,12 +22,18 @@
>>   #include "gpiolib-acpi.h"
>>   
>>   #define QUIRK_NO_EDGE_EVENTS_ON_BOOT		0x01l
>> +#define QUIRK_NO_WAKEUP				0x02l
>>   
>>   static int run_edge_events_on_boot = -1;
>>   module_param(run_edge_events_on_boot, int, 0444);
>>   MODULE_PARM_DESC(run_edge_events_on_boot,
>>   		 "Run edge _AEI event-handlers at boot: 0=no, 1=yes, -1=auto");
>>   
>> +static int honor_wakeup = -1;
>> +module_param(honor_wakeup, int, 0444);
>> +MODULE_PARM_DESC(honor_wakeup,
>> +		 "Honor the ACPI wake-capable flag: 0=no, 1=yes, -1=auto");
>> +
>>   /**
>>    * struct acpi_gpio_event - ACPI GPIO event handler data
>>    *
>> @@ -283,7 +289,8 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
>>   	event->handle = evt_handle;
>>   	event->handler = handler;
>>   	event->irq = irq;
>> -	event->irq_is_wake = agpio->wake_capable == ACPI_WAKE_CAPABLE;
> 
>> +	if (honor_wakeup)
>> +		event->irq_is_wake = agpio->wake_capable == ACPI_WAKE_CAPABLE;
> 
> Perhaps:
> 
> 	event->irq_is_wake = honor_wakeup && agpio->wake_capable == ACPI_WAKE_CAPABLE;

Yes that is better, I also noticed some typos in the comment explaining why the
quirk is necessary, I will submit a v2 fixing both.

Regards,

Hans



> (I don't care about 80 limit here)
> 
>>   	event->pin = pin;
>>   	event->desc = desc;
>>   
>> @@ -1337,6 +1344,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] = {
>>   		},
>>   		.driver_data = (void *)QUIRK_NO_EDGE_EVENTS_ON_BOOT,
>>   	},
>> +	{
>> +		/*
>> +		 * Various HP X2 10 Cherry Trail models use external
>> +		 * embedded-controller connected via I2C + a ACPI GPIO
>> +		 * event handler. The embedded controller generates various
>> +		 * spurious wakeup events when suspended. So disable wakeup
>> +		 * for its handler (it used the only ACPI GPIO event handler).
>> +		 * This breaks wakeup when opening the lid, the user needs
>> +		 * to press the power-button to wakeup the system. The
>> +		 * alternative is suspend simply not working, which is worse.
>> +		 */
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP x2 Detachable 10-p0XX"),
>> +		},
>> +		.driver_data = (void *)QUIRK_NO_WAKEUP,
>> +	},
>>   	{} /* Terminating entry */
>>   };
>>   
>> @@ -1356,6 +1380,13 @@ static int acpi_gpio_setup_params(void)
>>   			run_edge_events_on_boot = 1;
>>   	}
>>   
>> +	if (honor_wakeup < 0) {
>> +		if (quirks & QUIRK_NO_WAKEUP)
>> +			honor_wakeup = 0;
>> +		else
>> +			honor_wakeup = 1;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.23.0
>>
> 

