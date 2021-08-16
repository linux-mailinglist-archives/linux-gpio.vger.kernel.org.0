Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB063ED3EE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 14:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbhHPM2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 08:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233796AbhHPM2o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Aug 2021 08:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629116893;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8J8uBMlBdBuZQDmBUgS0XJpmfufRjyMynx7EajosaWQ=;
        b=Rd0D5gld+i4RIOsIMjjalUvi8LqqKy1a8RX1t++5DQ/lV7hld7M73I6gNF3Gv9kCUodXl8
        vP4PqukWO4QiyFoc/YNg3duNYH7SqalECgTdELJhETG8vG8jItUIlv3LIsP6bCJp/nc9Jk
        bnkAPU0rwYMRwiTcDH1q6p8oJqVUqg0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Ar8_JnevOsG9M_yqFBxM7g-1; Mon, 16 Aug 2021 08:28:10 -0400
X-MC-Unique: Ar8_JnevOsG9M_yqFBxM7g-1
Received: by mail-ed1-f71.google.com with SMTP id e18-20020a0564020892b02903be9702d63eso7574455edy.17
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 05:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8J8uBMlBdBuZQDmBUgS0XJpmfufRjyMynx7EajosaWQ=;
        b=gyEan9Qk4OUjpvHZKDT+R0aJSZMfw7xGFPwLAfRqaUvLTTFcxEHoUDI8KoO+Fq1DDg
         k0J3QPHceLmSIsachYDpimGUEfE9NwAAoO8tDqa1iznDhsSH5Hq2fJ+n31gDhNJtpkMd
         jJk88y6O+tq/er29qgWmx0gHEQnLIWZohAA2EjfOlkS2nUihAgWSnftTCi5CNi+6iXkd
         yTLMs/Lp8Ux5ys6Ar7nzhngs6YnLnwy0zkTFeH2LDlZyMyd5PGY9c46xV7CcRRh5ANZN
         R43SjkxAHe5u5+ZbqRDv68AU4nKM1EJGxCmIQoMPIToMhpfqU5f6Frw4QfCrvVN5xxh9
         20+w==
X-Gm-Message-State: AOAM53141O2gFvFlJYmPoGDvXb9CCKNR+ORC0VRL5OZRYjfZHmm3T1xT
        mbPU66VoX5W+cDJ5/ptzwRKvLrr0rDYV8AHwXWyRmaijQ50Uwt+KJ007cUpBqyYBVW/S121G64G
        Q1MC1toa7u9JF7zFhvMteTQ==
X-Received: by 2002:aa7:c1c4:: with SMTP id d4mr19752500edp.301.1629116888797;
        Mon, 16 Aug 2021 05:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUmlBUHs63dKqL9LT4V4WRNxi+CMzooXe+Mwa29D+sBIDUIx5mArm48KO18Z6xhvLDCt7yJA==
X-Received: by 2002:aa7:c1c4:: with SMTP id d4mr19752482edp.301.1629116888636;
        Mon, 16 Aug 2021 05:28:08 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id c8sm3608839ejp.124.2021.08.16.05.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 05:28:08 -0700 (PDT)
Subject: Re: [PATCH regression fix v2] gpiolib: acpi: Make
 set-debounce-timeout failures non fatal
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20210816104119.75019-1-hdegoede@redhat.com>
 <YRpWxnZvM2kzjcX/@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e7c1b41a-4d11-21f4-0add-9b6dd00a8da6@redhat.com>
Date:   Mon, 16 Aug 2021 14:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRpWxnZvM2kzjcX/@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/16/21 2:15 PM, Andy Shevchenko wrote:
> On Mon, Aug 16, 2021 at 12:41:19PM +0200, Hans de Goede wrote:
>> Commit 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
>> made the gpiolib-acpi code call gpio_set_debounce_timeout() when requesting
>> GPIOs.
>>
>> This in itself is fine, but it also made gpio_set_debounce_timeout()
>> errors fatal, causing the requesting of the GPIO to fail. This is causing
>> regressions. E.g. on a HP ElitePad 1000 G2 various _AEI specified GPIO
>> ACPI event sources specify a debouncy timeout of 20 ms, but the
>> pinctrl-baytrail.c only supports certain fixed values, the closest
>> ones being 12 or 24 ms and pinctrl-baytrail.c responds with -EINVAL
>> when specified a value which is not one of the fixed values.
>>
>> This is causing the acpi_request_own_gpiod() call to fail for 3
>> ACPI event sources on the HP ElitePad 1000 G2, which in turn is causing
>> e.g. the battery charging vs discharging status to never get updated,
>> even though a charger has been plugged-in or unplugged.
>>
>> Make gpio_set_debounce_timeout() errors non fatal, warning about the
>> failure instead, to fix this regression.
>>
>> Note we should probably also fix various pinctrl drivers to just
>> pick the first bigger discrete value rather then returning -EINVAL but
>> this will need to be done on a per driver basis, where as this fix
>> at least gets us back to where things were before and thus restores
>> functionality on devices where this was lost due to
>> gpio_set_debounce_timeout() errors.
> 
> Yes, I also think that we need to choose upper debounce instead of rejecting
> the settings. And yes, I agree that for now it's not suitable as a fix.
> 
> That said,
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you.

FYI, I've prepared a patch to choose the upper debounce time for
pintctrl-baytrail . I'll test it when I'm back home tonight and
then submit it upstream.

Regards,

Hans




> 
>> Fixes: 8dcb7a15a585 ("gpiolib: acpi: Take into account debounce settings")
>> Depends-on: 2e2b496cebef ("gpiolib: acpi: Extract acpi_request_own_gpiod() helper")
>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> -Fix typo in commit msg
>> -Add Mika's Reviewed-by
>> -Add Depends-on tag
>> ---
>>  drivers/gpio/gpiolib-acpi.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
>> index 411525ac4cc4..47712b6903b5 100644
>> --- a/drivers/gpio/gpiolib-acpi.c
>> +++ b/drivers/gpio/gpiolib-acpi.c
>> @@ -313,9 +313,11 @@ static struct gpio_desc *acpi_request_own_gpiod(struct gpio_chip *chip,
>>  
>>  	ret = gpio_set_debounce_timeout(desc, agpio->debounce_timeout);
>>  	if (ret)
>> -		gpiochip_free_own_desc(desc);
>> +		dev_warn(chip->parent,
>> +			 "Failed to set debounce-timeout for pin 0x%04X, err %d\n",
>> +			 pin, ret);
>>  
>> -	return ret ? ERR_PTR(ret) : desc;
>> +	return desc;
>>  }
>>  
>>  static bool acpi_gpio_in_ignore_list(const char *controller_in, int pin_in)
>> -- 
>> 2.31.1
>>
> 

