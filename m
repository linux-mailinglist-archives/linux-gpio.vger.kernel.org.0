Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD28A7B04FC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 15:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjI0NJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 09:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjI0NJV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 09:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC87F4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695820111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JMtD8MrtcPfWsI8Pb3A+8DQDJJzlwp0MAo/184E/vuY=;
        b=RpIRxxiXNei2Krsl90ySJZyORGsUuUHF/UZ2qksV+OCrbpf0B9eiko3Lh7brOLuige+zXo
        LPsItJ8xpXxltt0wgqQ7ASIiyQnqbY75LZpmxVtDSLsq4Zj6jcUBcY/LhvLVsUEeO3hd6J
        xmKVZVyoC+pF5XMzDSw/TB90OZGSUVk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-1bofUfSZNo20tPSfbBSJaQ-1; Wed, 27 Sep 2023 09:08:28 -0400
X-MC-Unique: 1bofUfSZNo20tPSfbBSJaQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9aa20a75780so948920266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 06:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820107; x=1696424907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMtD8MrtcPfWsI8Pb3A+8DQDJJzlwp0MAo/184E/vuY=;
        b=WyhYC1J7dRCTff3M0c+O+d+SbjKsIfBRO08HhCHyF5jfsVVn3/q/AS1gPbJlhdlpnw
         O1mwvUF7Oo0n7XlAPUWpzWqcq9j/nwahLUuMBygoXa3ZfNB4BAZbdKa5qp8pB/12QZ78
         yPFoUphVQFzflr2GlFxYnFgVBf2qhfQmJ2tSuOoEzKTVZ9PfqqOza5v2EhHJA3vlwFhG
         d7P3fq+RXbAUvpZ8O75PlUnevsnlNqe3fYDoL72Nuf5JeyXi52E5LAl7cxM2MnChCqEQ
         X+WUj8cI5HKHeXf6fX9ERJanUEEPtJNa/Ok/x3byM1hwD+PdUoqiwMKoUr5P0cyPIWEK
         quaw==
X-Gm-Message-State: AOJu0Yx6JSQqo18TtWhJ5oKQsbLijAFvXnsZnmIwJm/WqNdc0OfTpp48
        cj61/hGVTGBxALBj3yDLO0lkh/Cw8+S6BS7GkoL2gncd8zIxIKX7ArklRW1080LHyVFOeXznRfJ
        +AKwJg4gRr4s4DbiaszxxNg==
X-Received: by 2002:a17:906:53ca:b0:9b2:9e44:222e with SMTP id p10-20020a17090653ca00b009b29e44222emr2064214ejo.19.1695820107629;
        Wed, 27 Sep 2023 06:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW+9nbTuAxmWhlq1Hn8jF2mG0qkV2cmdjMgyzfNIuIJPs5L5uK2mviq3ruQfsUYqOlS0STZg==
X-Received: by 2002:a17:906:53ca:b0:9b2:9e44:222e with SMTP id p10-20020a17090653ca00b009b29e44222emr2064193ejo.19.1695820107278;
        Wed, 27 Sep 2023 06:08:27 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b0098f99048053sm9355323ejb.148.2023.09.27.06.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 06:08:26 -0700 (PDT)
Message-ID: <3f8760f8-ae8c-c0b0-19d7-76fbbf5d25de@redhat.com>
Date:   Wed, 27 Sep 2023 15:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 2/4] platform/x86: int3472: led: don't use
 gpiod_toggle_active_low()
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <20230926145943.42814-3-brgl@bgdev.pl>
 <2b5db794-c00f-e9f5-c0c9-4c5fb4df0802@redhat.com>
 <CAMRc=MeSK-ZReyt4556Dik4GwgtitD-NBgVE0swe=4i+5gBLwA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=MeSK-ZReyt4556Dik4GwgtitD-NBgVE0swe=4i+5gBLwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,

On 9/27/23 12:44, Bartosz Golaszewski wrote:
> On Wed, Sep 27, 2023 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 9/26/23 16:59, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Instead of acpi_get_and_request_gpiod() + gpiod_toggle_active_low(), use
>>> temporary lookup tables with appropriate lookup flags.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>  drivers/platform/x86/intel/int3472/led.c | 12 ++++--------
>>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
>>> index bca1ce7d0d0c..62e0cd5207a7 100644
>>> --- a/drivers/platform/x86/intel/int3472/led.c
>>> +++ b/drivers/platform/x86/intel/int3472/led.c
>>> @@ -25,18 +25,14 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472,
>>>       if (int3472->pled.classdev.dev)
>>>               return -EBUSY;
>>>
>>> -     int3472->pled.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
>>> -                                                          "int3472,privacy-led");
>>> +     int3472->pled.gpio = skl_int3472_gpiod_get_from_temp_lookup(
>>> +                             int3472->dev, path, agpio->pin_table[0],
>>> +                             "int3472,privacy-led", polarity,
>>> +                             GPIOD_OUT_LOW);
>>
>> Yeah so this is not going to work, path here is an ACPI device path, e.g.
>> on my laptop (which actually uses the INT3472 glue code) the path-s of
>> the 2 GPIO controllers are: `\_SB_.GPI0` resp `\_SB_.PC00.XHCI.RHUB.HS08.VGPO`
>>
>> Where as skl_int3472_gpiod_get_from_temp_lookup() stores the passed in path
>> in  gpiod_lookup_table.table[0].key, which is the dev_name() of the GPIO
>> controller's parent dev which are `INTC1055:00` resp. `INTC1096:00` .
>>
>> So we are going to need to add some code to INT3472 to go from path to
>> a correct value for gpiod_lookup_table.table[0].key which means partly
>> reproducing most of acpi_get_gpiod:
>>
>>         struct gpio_chip *chip;
>>         acpi_handle handle;
>>         acpi_status status;
>>
>>         status = acpi_get_handle(NULL, path, &handle);
>>         if (ACPI_FAILURE(status))
>>                 return ERR_PTR(-ENODEV);
>>
>>         chip = gpiochip_find(handle, acpi_gpiochip_find);
>>         if (!chip)
>>                 return ERR_PTR(-EPROBE_DEFER);
>>
>> And then get the key from the chip. Which means using gpiochip_find
>> in the int3472 code now, which does not sound like an improvement.
>>
>> I think that was is needed instead is adding an active_low flag
>> to acpi_get_and_request_gpiod() and then have that directly
>> set the active-low flag on the returned desc.
>>
> 
> Ultimately I'd like everyone to use gpiod_get() for getting
> descriptors but for now I get it's enough. Are you find with this
> being done in a single patch across GPIO and this driver?

Yes doing this in a single patch is fine.

Also I'm fine with merging such a patch through the gpio tree .

Regards,

Hans






>>>       if (IS_ERR(int3472->pled.gpio))
>>>               return dev_err_probe(int3472->dev, PTR_ERR(int3472->pled.gpio),
>>>                                    "getting privacy LED GPIO\n");
>>>
>>> -     if (polarity == GPIO_ACTIVE_LOW)
>>> -             gpiod_toggle_active_low(int3472->pled.gpio);
>>> -
>>> -     /* Ensure the pin is in output mode and non-active state */
>>> -     gpiod_direction_output(int3472->pled.gpio, 0);
>>> -
>>>       /* Generate the name, replacing the ':' in the ACPI devname with '_' */
>>>       snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>>>                "%s::privacy_led", acpi_dev_name(int3472->sensor));
>>
> 

