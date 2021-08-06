Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2113E2C02
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 15:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhHFNzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 09:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56186 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233195AbhHFNzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 09:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628258117;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yDGccq4EL4HUZuGNfYSKAvuqv2aWcZeIxltDgtSD4p0=;
        b=DYCMyTfzRUHgmIXLWtKFcp2hgMnTtjFLQHns5FgKjvJb4MBqMcgubefCA2JS7H1FDgWLkg
        HIheyTSN4mjehg6nhn5mdhBG61UzpD2YZqeHH22ec+VCn9755X3TPV/iomKeBGAZVjelNg
        2GXN7Y3zdJwO/5hymuu3m5CpcPO3U8I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-a12Dur1mN_mrKQDloM02Fg-1; Fri, 06 Aug 2021 09:55:16 -0400
X-MC-Unique: a12Dur1mN_mrKQDloM02Fg-1
Received: by mail-ej1-f69.google.com with SMTP id x5-20020a1709064bc5b02905305454f5d1so3124632ejv.10
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 06:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yDGccq4EL4HUZuGNfYSKAvuqv2aWcZeIxltDgtSD4p0=;
        b=ReCEgnzujPZEnL+yiMjIGBg8UjoMpZCfbmBmukMbCyDB3s852sWopB/a/jSJezOwr6
         DacWL2Q5HTyGXIw7lKqXfLkmTQwHnnFddEO7z2WFY3H+IpHHJ9RvxADjiR572O5f4NNe
         pR9iCxzWkQjZ/ii3RckrlR4p+pPQ7JITgZOxDR8cU/tdfUq30o/vrnBPabtNN+kQJvZz
         9zWmAALwk4m4aECC1B+RteoZvRVW4Og5SMCP5Xf/CK8T+cQrqB+gWn1j7NaQX1nyLjDt
         Gm0xY/h/8G5v1WuRrxqe15Op49mNtCE0706MAGgHOsGdFiaJrJFlAfu4ppCnCrqKJRoV
         2Tug==
X-Gm-Message-State: AOAM533eM6ozbAQabdWDWaYMRHdBb03hc3CNSiOfy92zF9A1f9EiTNwr
        SdPw98dTwkATv0M7j0dUAyIsdIo7ZC/oxQyWyyJPosbFzL73foc4e8MXpIPwRX3DwatG57Levcr
        V4dnARTs6TWf3PABlEbhPIA==
X-Received: by 2002:a17:906:cc57:: with SMTP id mm23mr9536512ejb.12.1628258115036;
        Fri, 06 Aug 2021 06:55:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEX6beW+Ymvpc82lCPC99uTGdZqKJGEd3vGreAUTQPHD73ncgvfzuuOvPqFMX/eXQ7xNCf4w==
X-Received: by 2002:a17:906:cc57:: with SMTP id mm23mr9536499ejb.12.1628258114894;
        Fri, 06 Aug 2021 06:55:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b15sm2900165ejv.15.2021.08.06.06.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 06:55:14 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Chris Blake <chrisrblake93@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
 <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com>
Date:   Fri, 6 Aug 2021 15:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/6/21 9:52 AM, Andy Shevchenko wrote:
> On Fri, Aug 6, 2021 at 5:47 AM Chris Blake <chrisrblake93@gmail.com> wrote:
>>
>> This adds platform support for the Cisco Meraki MX100 (Tinkerbell)
>> network appliance. This sets up the network LEDs and Reset
>> button. Note that this patch requires
> 
>> mfd: lpc_ich: Enable GPIO driver for DH89xxCC
> 
> Use standard format for the commits, and you may find its SHA in the
> repository of respective maintainer I suppose.
> 
>> which has been accepted
>> and is currently targeted for 5.15.
>>
>> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> 
>> Co-developed-by: Christian Lamparter <chunkeey@gmail.com>
> 
> Missed SoB of co-developer.
> 
> ...
> 
>> +#include <linux/gpio.h>
> 
> This is wrong. Mustn't be included in the new code.

Right I don't think you need this at all since I don't
think the code directly uses the GPIOs, but if
removing it gives issues then you will want to use:

#include <linux/gpio/consumer.h>


>> +#include <linux/gpio_keys.h>
> 
>> +#include <linux/gpio/machine.h>
> 
> Does this provide a GPIO controller driver? I don't think so.

Actually GPIO controller drivers use <linux/gpio/driver.h>
<linux/gpio/machine.h> for board files / glue code which
e.g. needs to add lookup-tables, which this code does,
so including this header is correct.

>> +#include <linux/input.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> ...
> 
>> +static struct platform_device * __init tink_create_dev(
>> +       const char *name,
>> +       const void *pdata,
>> +       size_t sz)
> 
> Use less LOCs for this...
> 
> ...
> 
>> +       pdev = platform_device_register_data(NULL,
>> +               name,
>> +               PLATFORM_DEVID_NONE,
>> +               pdata,
>> +               sz);
> 
> ...and for this (put name and sz to the respective previous lines).
> 
>> +
> 
> Unneeded blank line.
> 
>> +       if (IS_ERR(pdev))
>> +               pr_err("failed registering %s: %ld\n", name, PTR_ERR(pdev));
>> +
> 
> ...
> 
>> +       /* We need to make sure that GPIO60 isn't set to native mode as is default since it's our
>> +        * Reset Button. To do this, write to GPIO_USE_SEL2 to have GPIO60 set to GPIO mode.
>> +        * This is documented on page 1609 of the PCH datasheet, order number 327879-005US
>> +        */
> 
> /*
>  * Multi-line comment style is not
>  * for this subsystem.
>  */
> 
> ...
> 
>> +       tink_leds_pdev = tink_create_dev(
>> +               "leds-gpio",
>> +               &tink_leds_pdata,
>> +               sizeof(tink_leds_pdata));
>> +
>> +       tink_keys_pdev = tink_create_dev(
>> +               "gpio-keys-polled",
>> +               &tink_buttons_pdata,
>> +               sizeof(tink_buttons_pdata));
> 
> Again, use less LOCs.
> 
> ...
> 
>> +
> 
> Unneeded blank line, attach the below to the respective functions
> 
>> +module_init(tink_board_init);
>> +module_exit(tink_board_exit);
> 
> ...
> 
>> +MODULE_DEVICE_TABLE(dmi, tink_systems);
> Put this closer to the structure.

To clarify please put this immediately after the "};" line
terminating the id array declaration, like this:

static const struct dmi_system_id tink_systems[] __initconst = {
	{
		.matches = {
			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Cisco"),
			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MX100-HW"),
		},
	},
	{} /* Terminating entry */
};
MODULE_DEVICE_TABLE(dmi, tink_systems);

Regards,

Hans

