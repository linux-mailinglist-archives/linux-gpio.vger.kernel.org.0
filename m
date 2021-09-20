Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFC1411754
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbhITOow (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232060AbhITOow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Sep 2021 10:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632149005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KO7hr0zswC9iJnE2ssKFvfS3B1qVRqj72IivbV8J83A=;
        b=b41GxVSfG7i+wu+DZq5jdXiz11O9MKK5CeKLwmzqIHWBYJgpw0H//VNpQmrR6dY4EpIO5f
        yoCeLvW9rqXa5i0S1qc0izDZz/JiH8t/OeRScm+UgprbKAGPtOkdU2+PSo7W8vigLHwOzT
        i0EFGfvwphWoKUjK3e2pnLKc0GlwvP4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-GdaYgJh1NwaoU-9HcVgXaw-1; Mon, 20 Sep 2021 10:43:24 -0400
X-MC-Unique: GdaYgJh1NwaoU-9HcVgXaw-1
Received: by mail-ed1-f69.google.com with SMTP id 14-20020a508e4e000000b003d84544f33eso4584185edx.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KO7hr0zswC9iJnE2ssKFvfS3B1qVRqj72IivbV8J83A=;
        b=O9r7z4s8HwaJeZpuMLzLdocvNzply9Z9ReFFFhgdc+th7XGOaKsCaf1lb4wZtXCs/z
         saWKc1yQH7iUHU8VQ3SsZmLsN0AEPCLGG4DfjmrjcWMdbaPESImCmrgSEWdXOEHAN7P7
         n153qMwDVUCP4GC+mpkIpquhDNebzAmuy6zIED3sW/FVv8y+IMTdu0QNxTV8M36hJYvZ
         HyBCj4m4k1p46Ulw499vBlb6kG+5rolpbwYU+UbC3rDptpOeK6oasPWY5MFxtaQHMLNA
         Es7f5F+DPegmg9cxH32QmP1nuzVjOXry5G8ltBrHx7l0bdaY1wXKZ6Zi3POwQr90q9A2
         n/DQ==
X-Gm-Message-State: AOAM530FyY0o/q/07YQVJKVSx8zEcYRPFmHTt42nRCQgx36QYle2jUBG
        1rGyQdx8SrifoxNSOimU5eSZvEdyd7LKPUT140kpx9j+ren4aSWx+NcsFxPJ4YvcZSCbrm43nGt
        f7VGtiKKJHm/cYdOF2b4IkA==
X-Received: by 2002:a05:6402:886:: with SMTP id e6mr29182306edy.41.1632149002837;
        Mon, 20 Sep 2021 07:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgC0eDCQ+X/hB5WIw82oHMsfD8H9qsWo6TaSO46Q3fzVJU9tFqKKi3w1ofn9osDRxIL2i0Rw==
X-Received: by 2002:a05:6402:886:: with SMTP id e6mr29182279edy.41.1632149002583;
        Mon, 20 Sep 2021 07:43:22 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id ky16sm5793163ejc.98.2021.09.20.07.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 07:43:22 -0700 (PDT)
Subject: Re: [PATCH regression fix v2] gpiolib: acpi: Make
 set-debounce-timeout failures non fatal
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20210816104119.75019-1-hdegoede@redhat.com>
 <YRpWxnZvM2kzjcX/@smile.fi.intel.com>
 <e7c1b41a-4d11-21f4-0add-9b6dd00a8da6@redhat.com>
Message-ID: <16df7a43-919b-5ad7-7ca7-025c669ba32f@redhat.com>
Date:   Mon, 20 Sep 2021 16:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7c1b41a-4d11-21f4-0add-9b6dd00a8da6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/16/21 2:28 PM, Hans de Goede wrote:
> Hi,
> 
> On 8/16/21 2:15 PM, Andy Shevchenko wrote:
>> On Mon, Aug 16, 2021 at 12:41:19PM +0200, Hans de Goede wrote:
>>> Commit 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
>>> made the gpiolib-acpi code call gpio_set_debounce_timeout() when requesting
>>> GPIOs.
>>>
>>> This in itself is fine, but it also made gpio_set_debounce_timeout()
>>> errors fatal, causing the requesting of the GPIO to fail. This is causing
>>> regressions. E.g. on a HP ElitePad 1000 G2 various _AEI specified GPIO
>>> ACPI event sources specify a debouncy timeout of 20 ms, but the
>>> pinctrl-baytrail.c only supports certain fixed values, the closest
>>> ones being 12 or 24 ms and pinctrl-baytrail.c responds with -EINVAL
>>> when specified a value which is not one of the fixed values.
>>>
>>> This is causing the acpi_request_own_gpiod() call to fail for 3
>>> ACPI event sources on the HP ElitePad 1000 G2, which in turn is causing
>>> e.g. the battery charging vs discharging status to never get updated,
>>> even though a charger has been plugged-in or unplugged.
>>>
>>> Make gpio_set_debounce_timeout() errors non fatal, warning about the
>>> failure instead, to fix this regression.
>>>
>>> Note we should probably also fix various pinctrl drivers to just
>>> pick the first bigger discrete value rather then returning -EINVAL but
>>> this will need to be done on a per driver basis, where as this fix
>>> at least gets us back to where things were before and thus restores
>>> functionality on devices where this was lost due to
>>> gpio_set_debounce_timeout() errors.
>>
>> Yes, I also think that we need to choose upper debounce instead of rejecting
>> the settings. And yes, I agree that for now it's not suitable as a fix.
>>
>> That said,
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thank you.
> 
> FYI, I've prepared a patch to choose the upper debounce time for
> pintctrl-baytrail . I'll test it when I'm back home tonight and
> then submit it upstream.

Ugh, I just noticed that this is still not upstream (not in v5.15-rc2), while this is
a regression fix!

Can we please get this merged and send to Linus ASAP ?

Regards,

Hans



>>> Fixes: 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
>>> Depends-on: 2e2b496cebef ("gpiolib: acpi: Extract acpi_request_own_gpiod() helper")
>>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v2:
>>> -Fix typo in commit msg
>>> -Add Mika's Reviewed-by
>>> -Add Depends-on tag
>>> ---
>>>  drivers/gpio/gpiolib-acpi.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>>> index 411525ac4cc4..47712b6903b5 100644
>>> --- a/drivers/gpio/gpiolib-acpi.c
>>> +++ b/drivers/gpio/gpiolib-acpi.c
>>> @@ -313,9 +313,11 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
>>>  
>>>  	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
>>>  	if (ret)
>>> -		gpiochip_free_own_desc(desc);
>>> +		dev_warn(chip->parent,
>>> +			 "Failed to set debounce-timeout for pin 0x%04X, err %d\n",
>>> +			 pin, ret);
>>>  
>>> -	return ret ? ERR_PTR(ret) : desc;
>>> +	return desc;
>>>  }
>>>  
>>>  static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_in)
>>> -- 
>>> 2.31.1
>>>
>>

